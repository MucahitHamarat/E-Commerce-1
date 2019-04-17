using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TrendWay.BOL.Entities;

namespace TrendWay.WebUI.ViewModels
{
    public class CategoryVM
    {
        public ICollection<Category> Categories { get; set; }
        public ICollection<Brand> Brands { get; set; }
        public ICollection<Product> Products { get; set; }
    }
}