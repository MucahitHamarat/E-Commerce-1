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
    public class CheckoutController : Controller
    {
        Repository<Product> repoProduct = new Repository<Product>();
        Repository<Address> repoAddress = new Repository<Address>();
        // GET: Checkout
        public ActionResult Index()
        {
            CartVM cartVM = new CartVM();

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
                    FPath = repoProduct.GetAll().Include(i => i.Pictures).Where(w => w.ID == hbc.ProductID).FirstOrDefault().Pictures.FirstOrDefault(f => f.PIndex == 1).FPath,
                    Price = repoProduct.GetBy(g => g.ID == hbc.ProductID).Price,
                    ProductName = repoProduct.GetBy(g => g.ID == hbc.ProductID).Name

                }
                );
            }
            cartVM.CartDetails = cartDetails;
            int memberID = Convert.ToInt32(Session["MemberID"]);
            cartVM.Addresses = repoAddress.GetAll().Where(w => w.MemberID == memberID).ToList();
            return View(cartVM);
        }
        public ActionResult GetAddress(int addressID)
        {
            return Json(repoAddress.GetBy(g => g.ID == addressID), JsonRequestBehavior.AllowGet);
        }
    }
}