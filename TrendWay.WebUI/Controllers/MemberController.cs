using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using TrendWay.BLL.Repositories;
using TrendWay.BOL.Entities;

namespace TrendWay.WebUI.Controllers
{
    public class MemberController : Controller
    {
        Repository<Member> repoMember = new Repository<Member>();
        Repository<Address> repoAddress = new Repository<Address>();
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost, ValidateAntiForgeryToken]
        public ActionResult Login(string MailAddress, string Password)
        {
            if (!string.IsNullOrEmpty(MailAddress) && !string.IsNullOrEmpty(Password))
            {
                string sifre = FormsAuthentication.HashPasswordForStoringInConfigFile(Password, "MD5");
                Member member = repoMember.GetBy(a => a.MailAddress == MailAddress && a.Password == sifre);
                if (member != null)
                {
                    FormsAuthentication.SetAuthCookie(MailAddress, true);
                    Session["MemberID"] = member.ID;
                    Session["AdSoyad"] = member.Name + " " + member.SurName;
                    return Redirect("/");
                }
                else
                {
                    TempData["Hata"] = "Mail Adresi veya Şifre Hatalı";
                    return RedirectToAction("Index");
                }
            }
            else TempData["Hata"] = "Mail Adresi veya Şifre boş geçilemez";
            return RedirectToAction("Index");
        }
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return Redirect("/");
        }

        [HttpPost, ValidateAntiForgeryToken]
        public ActionResult NewMember(string Name, string Surname, string MailAddress, string Password, string Password2)
        {
            if (!string.IsNullOrEmpty(Name) && !string.IsNullOrEmpty(Surname) && !string.IsNullOrEmpty(Password) && !string.IsNullOrEmpty(Password2) && !string.IsNullOrEmpty(MailAddress))
            {
                if (repoMember.GetAll().Any(a => a.MailAddress == MailAddress))
                {
                    TempData["Hata"] = "Mail kullanılamaz.";
                    return Redirect("/Member/Index?t=yeni");
                }
                if (Password == Password2)
                {
                    repoMember.Add(new Member { Name = Name, SurName = Surname, MailAddress = MailAddress, Password = FormsAuthentication.HashPasswordForStoringInConfigFile(Password,"MD5"), Password2 = Password2, LastDate = Convert.ToDateTime(DateTime.Now), LastIP = Request.UserHostAddress, Role = "uye" });
                    //Member member = repoMember.GetBy(a => a.MailAddress == MailAddress && a.Password == Password);
                    FormsAuthentication.SetAuthCookie(MailAddress, true);
                    Session["AdSoyad"] = Name + " " + Surname;
                    return Redirect("/");
                }


                else
                {
                    TempData["Hata"] = "Şifreler uyuşmuyor.";
                    return Redirect("/Member/Index?t=yeni");
                }

            }
            else TempData["Hata"] = "Alanları doldurunuz.";
            return Redirect("/Member/Index?t=yeni");
        }
        [Authorize(Roles = "uye")]
        public ActionResult MemberAddress()
        {
            int memberID = Convert.ToInt32(Session["MemberID"]);
            ViewBag.Address = repoAddress.GetAll().Where(w => w.MemberID == memberID);
            return View();
        }
        [Authorize(Roles = "uye"),HttpPost]
        public ActionResult MemberAddress(Address model)
        {
            repoAddress.Add(model);
            return RedirectToAction("MemberAddress");
        }
        [Authorize(Roles = "uye")]
        public ActionResult AddressUpdate(int ID)
        {
           
            Address address = repoAddress.GetBy(g => g.ID == ID);
            ViewBag.Address = repoAddress.GetAll().Where(w => w.MemberID == address.MemberID);
            return View(address);
        }
        [Authorize(Roles = "uye"), HttpPost]
        public ActionResult AddressUpdate(Address model)
        {
            repoAddress.Update(model);
            return RedirectToAction("MemberAddress");
        }
    }
}