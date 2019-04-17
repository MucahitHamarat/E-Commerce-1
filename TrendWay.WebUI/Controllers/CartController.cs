using Newtonsoft.Json;
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
    public class CartController : Controller
    {
        Repository<Product> repoProduct = new Repository<Product>();
        public ActionResult Index()
        {          
            List<Cart> carts = new List<Cart>();
            if (Request.Cookies["CKCart"] != null)
            {
                HttpCookie httpCookie = Request.Cookies["CKCart"];
                carts = JsonConvert.DeserializeObject<List<Cart>>(httpCookie.Value);
            }
            List<CartDetail> cartDetails = new List<CartDetail>();
            foreach (Cart hbc in carts)
            {
                cartDetails.Add(new CartDetail
                {
                    ProductID = hbc.ProductID,
                    Quantity = hbc.Quantity,
                    FPath = repoProduct.GetAll().Include(i=>i.Pictures).Where(w => w.ID == hbc.ProductID).FirstOrDefault().Pictures.FirstOrDefault(f => f.PIndex == 1).FPath,
                    Price= repoProduct.GetBy(g => g.ID == hbc.ProductID).Price,
                    ProductName = repoProduct.GetBy(g => g.ID == hbc.ProductID).Name
                }
                );
            }
            CartVM cartVM = new CartVM
            {
                CartDetails = cartDetails,
                BestSellerProducts = repoProduct.GetAll().Include(i => i.Pictures).OrderByDescending(o => o.OrderDetail.Sum(s => s.Quantity)).Take(8).ToList()
            };
            return View(cartVM);
        }
    }
}