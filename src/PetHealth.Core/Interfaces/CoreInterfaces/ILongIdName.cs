﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PetHealth.Core.Interfaces.CoreInterfaces
{
    public interface ILongIdName
    {
        
        long Id { get; set; }
        string Name { get; set; }
    }
}
