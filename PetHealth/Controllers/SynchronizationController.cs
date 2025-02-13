﻿using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using PetHealth.Core.DTOs;
using PetHealth.Core.DTOs.EntityDTO;
using PetHealth.Core.Entities;
using PetHealth.Core.Interfaces;
using PetHealth.Core.Interfaces.CoreInterfaces;
using PetHealth.Infrastructure.Persistence.Contexts;

namespace PetHealth.Controllers
{
    [Produces("application/json")]
    [Route("api/sync"), ResponseCache(NoStore = true)]
    [ApiController]
    [Authorize]
    public class SynchronizationController : ControllerBase
    {
        private readonly PetHealthContext _dataContext;
        private readonly ISyncService _syncService;
       public SynchronizationController(ISyncService service, PetHealthContext context)
       {
           _syncService = service;
           _dataContext = context;

       }


        [HttpPost]
        [Route("set")]
        public async Task<IActionResult> SynchroniceSet([
            FromBody]SynchroDataDTO synchroDataDTO,
            CancellationToken cancellationToken = default
            )

        {
            await _syncService.SynchronizeSet(synchroDataDTO, cancellationToken);
            return Ok();
        }

        [HttpGet]
        [Route("get")]
        public async Task<IActionResult> SynchroniceGet(CancellationToken cancellationToken=default)
        {
            var userName = this.HttpContext.User.Identity.Name;
            return Ok(await _syncService.SynchronizeGet(userName, cancellationToken));
        }

        [HttpPost]
        [Route("update/pet")]
        public async Task<IActionResult> UpdatePet(
            [FromBody]PetDTO petDto,
            CancellationToken cancellationToken = default
        )
        {
            var userName = this.HttpContext.User.Identity.Name;
            return await _syncService.UpdatePet(userName, petDto, cancellationToken)? Ok(): StatusCode(404, "Pet not found.");
        }

        [HttpPut]
        [Route("set/incharge")]
        public async Task<IActionResult> SetInCharge(
            [FromQuery] string ownerId,
            [FromQuery] long petId,
            CancellationToken cancellationToken = default
                )
        {
            var userName = this.HttpContext.User.Identity.Name;
            
            return (await _syncService.SetInCharge(userName, ownerId, petId, cancellationToken))? Ok(): StatusCode(400,"Invalid Owner");
        }

        [HttpDelete]
        [Route("delete/incharge")]
        public async Task<IActionResult> DeleteInCharge(
            [FromQuery] long petId,
            CancellationToken cancellationToken = default
        )
        {
            var userName = this.HttpContext.User.Identity.Name;
            return (await _syncService.DeleteInCharge(userName, petId, cancellationToken)) ? Ok() : StatusCode(400, "This person has not the set pet");
        }

        [HttpGet]
        [Route("getStaticData")]
        public IActionResult GetStatiData()
        {
            return Ok(this._syncService.GetStaticData());
        }
    }
}
