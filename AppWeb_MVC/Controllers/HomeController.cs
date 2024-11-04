using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using MySql.Data.MySqlClient;
using AppWeb_MVC.Models;

namespace AppWeb_MVC.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            Models.Main main = new Models.Main();
            Sale sale = new Sale();

            sale.hotels = main.Get_Hotels();

            return View("Index",sale);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Aplicación de prueba tecnica.";
            
            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}