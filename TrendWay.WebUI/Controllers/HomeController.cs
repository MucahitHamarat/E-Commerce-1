using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using TrendWay.BLL.Repositories;
using TrendWay.BOL.Entities;
using TrendWay.WebUI.Helpers;
using TrendWay.WebUI.ViewModels;

namespace TrendWay.WebUI.Controllers
{
    public class HomeController : Controller
    {
        Repository<Admin> repoAdmin = new Repository<Admin>();
        Repository<Slider> repoSlider = new Repository<Slider>();
        Repository<Category> repoCategory = new Repository<Category>();
        Repository<Product> repoProduct = new Repository<Product>();
        Repository<Advertisement> repoAdvertisement = new Repository<Advertisement>();
        public ActionResult Index()
        {
            IndexVM IndexVM = new IndexVM
            {
                Sliders = repoSlider.GetAll().OrderBy(o => o.PIndex).ToList(),
                NewestProducts = repoProduct.GetAll().Include(i => i.Pictures).OrderByDescending(o => o.ID).Take(8).ToList(),
                BestSellerProducts = repoProduct.GetAll().Include(i => i.Pictures).OrderByDescending(o => o.OrderDetail.Sum(s => s.Quantity)).Take(8).ToList(),
                Advertisements = repoAdvertisement.GetAll().ToList()
            };
            return View(IndexVM);
        }
        public ActionResult Login(string ReturnUrl)
        {
            if (ReturnUrl.IndexOf("/Member") != -1) return Redirect("/Member/Index");
            else
            {
                if (User.Identity.IsAuthenticated) FormsAuthentication.SignOut();
                ViewBag.rtn = ReturnUrl;
                return View();
            }
        }
        [HttpPost, ValidateAntiForgeryToken]
        public ActionResult Login(string kullaniciAdi, string pass, string rURL)
        {
            if (!string.IsNullOrEmpty(kullaniciAdi) && !string.IsNullOrEmpty(pass))
            {
                Admin admin = repoAdmin.GetBy(a => a.UserName == kullaniciAdi && a.Password == pass);
                if (admin != null)
                {
                    FormsAuthentication.SetAuthCookie( kullaniciAdi, true);
                    Session["AdSoyad"] = admin.NameSurname;
                    if (!string.IsNullOrEmpty(rURL)) return Redirect(rURL);
                    else return Redirect("/admin");
                }
                else
                {
                    ViewBag.Hata = "Kullanıcı Adı veya Şifre Hatalı";
                }
            }
            else ViewBag.Hata = "Kullanıcı Adı ve Şifre Gerekli";
            return View();
        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Login");
        }

        public ActionResult Header()
        {
            return PartialView(repoCategory.GetAll().Include(i => i.Children));
        }

        [HttpPost]
        public void AddCart(int productID, int quantity)
        {
            CartHelper.AddCart(productID, quantity);
        }
        [HttpPost]
        public void UpdateCart(int productID, int quantity)
        {
            CartHelper.UpdateCart(productID, quantity);
        }
        [HttpPost]
        public void DeleteCart(int productID)
        {
            CartHelper.DeleteCart(productID);
        }
        public ActionResult DilDegistir(string dil,string returnURL)
        {
            HttpCookie httpCookie = new HttpCookie("CKDil");
            httpCookie.Value = dil;
            Response.Cookies.Add(httpCookie);
            return Redirect(returnURL);
        }

    }
}