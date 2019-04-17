using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TrendWay.BLL.Repositories;
using TrendWay.BOL.Entities;
using TrendWay.WebUI.ViewModels;

namespace TrendWay.WebUI.Controllers
{
    public class CategoryController : Controller
    {
        Repository<Category> repoCategory = new Repository<Category>();
        Repository<Brand> repoBrand = new Repository<Brand>();
        Repository<Product> repoProduct = new Repository<Product>();
        public ActionResult Index()
        {
            CategoryVM categoryVM = new CategoryVM
            {
                Categories = repoCategory.GetAll().Include(i => i.Children).Include(i => i.Products).ToList(),
                Brands = repoBrand.GetAll().Include(i => i.Products).ToList(),
                Products = repoProduct.GetAll().Include(i => i.Pictures).ToList()
            };
            return View(categoryVM);
        }

        public ActionResult Filter(int? CatID, int? ParentID, int? BrandID,string Price)
        {
            List<Category> categories = repoCategory.GetAll().Include(i => i.Children).Include(i => i.Products).ToList();
            List<Brand> brands = repoBrand.GetAll().Include(i => i.Products).ToList();
            List<Product> products = repoProduct.GetAll().Include(i => i.Pictures).ToList();

            if (ParentID.HasValue)
            {
                Category parentCategory = repoCategory.GetAll().Include(i => i.Children).FirstOrDefault(f => f.ID == ParentID);
                if (parentCategory.Children.Any()) products = products.Where(w => parentCategory.Children.Select(s => s.ID).Contains(w.CategoryID)).ToList();
                else products = products.Where(w => w.CategoryID == ParentID).ToList();
            }
            if (CatID.HasValue)
            {
                products = products.Where(w => w.CategoryID == CatID).ToList();
            }
            if (BrandID.HasValue)
            {
                products = products.Where(w => w.BrandID == BrandID).ToList();
            }
            if (!string.IsNullOrEmpty(Price))
            {
                string[] prices = Price.Replace("₺","").Replace(" ","").Split('_');
                decimal price1 = Convert.ToDecimal(prices[0]);
                decimal price2 = Convert.ToDecimal(prices[1]);
                products = products.Where(w => w.Price>=price1 && w.Price<=price2).ToList();
            }
            CategoryVM categoryVM = new CategoryVM();
            categoryVM.Categories = categories;
            categoryVM.Brands = brands;
            categoryVM.Products = products;

            //CategoryVM categoryVM = new CategoryVM
            //{
            //    Categories = repoCategory.GetAll().Include(i => i.Children).Include(i => i.Products).ToList(),
            //    Brands = repoBrand.GetAll().Include(i => i.Products).ToList(),
            //    Products = repoProduct.GetAll().Where(w=>w.CategoryID==CatID).Include(i => i.Pictures).ToList()
            //};
            return View("Index", categoryVM);
        }
    }
}