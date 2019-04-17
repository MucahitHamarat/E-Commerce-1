using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TrendWay.BLL.Repositories;
using TrendWay.BOL.Entities;
using TrendWay.WebUI.ViewModels;

namespace TrendWay.WebUI.Areas.admin.Controllers
{
    [Authorize(Roles = "admin")]
    public class ProductController : Controller
    {
        Repository<Product> repoProduct = new Repository<Product>();
        Repository<Category> repoCategory = new Repository<Category>();
        Repository<Brand> repoBrand = new Repository<Brand>();

        public ActionResult Index()
        {
            return View(repoProduct.GetAll());
        }
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = repoProduct.GetBy(g=>g.ID==id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }
        public ActionResult Create()
        {
            ProductVM productVM = new ProductVM {
                Product = new Product(),
                Categories= repoCategory.GetAll().ToList(),
                Brands= repoBrand.GetAll().ToList()
            };
            return View(productVM);
        }
        [HttpPost, ValidateAntiForgeryToken, ValidateInput(false)]
        public ActionResult Create(ProductVM model,List<HttpPostedFileBase> Picture)
        {           
            if (ModelState.IsValid)
            {
                foreach (var picture in Picture)
                {
                    if (picture != null)
                    {
                        if (!Directory.Exists(Server.MapPath("~/Content/img/product"))) Directory.CreateDirectory(Server.MapPath("~/Content/img/product"));
                        picture.SaveAs(Server.MapPath("~/Content/img/product/" + picture.FileName));
                        //product.Picture = "/Content/img/product/" + Picture.FileName;
                    }
                }
                repoProduct.Add(model.Product);
                return RedirectToAction("Index");
            }

            return View(model.Product);
        }

        // GET: admin/Product/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = repoProduct.GetBy(g=>g.ID==id);
            ProductVM productVM = new ProductVM
            {
                Product = product,
                Categories = repoCategory.GetAll().ToList(),
                Brands = repoBrand.GetAll().ToList()
            };
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(productVM);
        }

        // POST: admin/Product/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Product product,HttpPostedFileBase Picture)
        {
            if (ModelState.IsValid)
            {
                //if (Picture != null)
                //{
                //    if (!Directory.Exists(Server.MapPath("~/Content/img/product"))) Directory.CreateDirectory(Server.MapPath("~/Content/img/product"));
                //    Picture.SaveAs(Server.MapPath("~/Content/img/product/" + Picture.FileName));
                //    product.Picture = "/Content/img/product/" + Picture.FileName;
                //}
                repoProduct.Update(product);
                return RedirectToAction("Index");
            }
            return View(product);
        }

        // GET: admin/Product/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = repoProduct.GetBy(g=>g.ID==id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // POST: admin/Product/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Product product = repoProduct.GetBy(g => g.ID == id);
            repoProduct.Remove(product);
            return RedirectToAction("Index");
        }
    }
}
