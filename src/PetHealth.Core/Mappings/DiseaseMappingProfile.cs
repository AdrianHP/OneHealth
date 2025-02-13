﻿using AutoMapper;
using PetHealth.Core.DTOs;
using PetHealth.Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PetHealth.Core.Mappings
{
    public class DiseaseMappingProfile: Profile
    {
        public DiseaseMappingProfile()
        {
            CreateMap<LongIdNameDTO, Disease>()
                .ForMember(src => src.Id, opt => opt.MapFrom(dto => dto.Id))
                .ForMember(src => src.Name, opt => opt.MapFrom(dto => dto.Name))
                .ForMember(src => src.CreatedOnDBDate, opt => opt.Ignore())
                .ReverseMap();
        }
    }
}
