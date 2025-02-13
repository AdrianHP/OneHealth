﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PetHealth.Core.DTOs
{
    public class AuthResultDTO
    {
        public string UserId { get; set; }
        public bool LockoutUserEnabled { get; set; }
        public bool LockoutIpEnabled { get; set; }
        public int? LockoutTimeoutInSeconds { get; set; }
        public UserDTO LoggedUser { get; set; }
        public bool IsNewBrowserLogin { get; set; }
        public List<long> PetsIds { get; set; }
    }
}
