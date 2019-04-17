using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TrendWay.BLL.Repositories;
using TrendWay.BOL.Entities;

namespace TrendWay.WebUI.Controllers
{
    public class ProductController : Controller
    {
        Repository<Product> repoProduct = new Repository<Product>();
        public ActionResult Index()
        {
            return View(repoProduct.GetAll().ToList());
        }
        public ActionResult Detail(int ID)
        {
            Product product = repoProduct.GetAll().Include(i => i.Pictures).Where(w => w.ID == ID).FirstOrDefault();
            ViewBag.BenzerUrunler = repoProduct.GetAll().Include(i => i.Pictures).Where(w => w.CategoryID == product.CategoryID && w.ID != product.ID).Take(8);
            return View(product);
        }
    }
}