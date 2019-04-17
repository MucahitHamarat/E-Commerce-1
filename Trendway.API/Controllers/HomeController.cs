using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using TrendWay.BLL.Repositories;
using TrendWay.BOL.Entities;

namespace Trendway.API.Controllers
{
    public class HomeController : ApiController
    {
        Repository<Brand> repoBrand = new Repository<Brand>();
        [HttpGet]
        public IEnumerable<Brand> GetBrands()
        {

            return repoBrand.GetAll().ToList();
            //webapiconfigte  routeTemplate: "api/{controller}/{id}", dediği için çalıştırdıktan sonra 
            // /api/home/MemberNameSurname demen lazım

        }

    }
}
