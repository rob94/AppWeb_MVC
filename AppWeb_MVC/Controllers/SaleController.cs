using AppWeb_MVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AppWeb_MVC.Controllers
{
    public class SaleController : Controller
    {
        // GET: Sale
        public ActionResult Index()
        {
            Main main = new Main();
            Sale sale = new Sale();

            sale.hotels = main.Get_Hotels();
            sale.roomTypes = main.Get_RoomsTypes();
            sale.roomPrice = main.Get_RoomsPrice();

            return View("Index", sale);
        }

        [HttpPost]
        public ActionResult CalculatePrice(Sale model)
        {
            Main main = new Main();
            // Calcular el precio total
            var roomPrice = main.Get_RoomsPrice().Find(rp => rp.Hotel_id == model.hotelId && rp.Room_Type_id == model.roomTypeId);
            model.total = roomPrice.Price;

            model.hotels = main.Get_Hotels();
            model.roomTypes = main.Get_RoomsTypes();
            model.roomPrice = main.Get_RoomsPrice();

            return View("Index");
        }

        // POST: Sale/Create
        [HttpPost]
        //public ActionResult Create(FormCollection collection)
        public ActionResult Create(Sale sale)
        {
            try
            {
                // TODO: Add insert logic here
                Main main = new Main();

                Func<DateTime, DateTime, Boolean> isValidateDate = (departure, arrival) => 
                departure < arrival ? true : false;

                Func<String,Boolean> isValidateName = (name) => 
                name == string.Empty || name is null ? true : false;

                List<RoomAvailable> numAvailable = new List<RoomAvailable>();
                TimeSpan Different = new TimeSpan();
                int daysDifferent = 0;
                string result = null;

                Action<String> ErrorMessage = (message) => {
                    ViewBag.ErrorMessage = message;
                };

                if(isValidateDate(sale.departureDate, sale.arrivalDate))
                {
                    ErrorMessage("La fecha de salida no puede ser anterior a la de llegada.");
                }
                else if(isValidateName(sale.customerName))
                {
                    ErrorMessage("Debe ingresar un nombre.");
                }
                else if (sale.hotelId == 0 || sale.roomTypeId == 0)
                {
                    ErrorMessage("Hotel o Habitación vacios, favor de seleccionar el correspondiente.");
                }
                else
                {
                    numAvailable = main.Get_RoomAvailable(sale.hotelId, sale.roomTypeId, sale.arrivalDate, sale.departureDate);
                    Different = sale.departureDate - sale.arrivalDate;
                    daysDifferent = Different.Days;
                    if (numAvailable.Count!=daysDifferent)
                    {
                        ErrorMessage("No hay disponiblidad en esos días.");
                    }
                    foreach (RoomAvailable roomAvailable in numAvailable)
                    {
                        if (roomAvailable.Available - 1 <= 0)
                        {
                            ErrorMessage("No hay disponiblidad en esos días.");
                            break;
                        }
                    }
                }

                if (ModelState.IsValid)
                {
                    result = SetSale(sale);
                    if(result == null)
                    {
                        ErrorMessage("Error al guardar la venta");
                    }
                    else
                    {
                        ViewBag.Message = result;
                    }
                }

                sale = new Sale();
                sale.hotels = main.Get_Hotels();
                sale.roomTypes = main.Get_RoomsTypes();
                sale.roomPrice = main.Get_RoomsPrice();

                //return RedirectToAction("Index","Sale");
                return View("Index",sale);
            }
            catch
            {
                return View("Index");
            }
        }

        public string SetSale(Sale sale)
        {
            try
            {
                Main main = new Main();

                main.Set_Sale(sale);
                main.Set_RoomAvailable(sale.hotelId, sale.roomTypeId, sale.arrivalDate, sale.departureDate, 1);

                return $"Venta a nombre de {sale.customerName} del {sale.arrivalDate.ToString("yyyy-MM-dd")}" +
                    $"al {sale.departureDate.ToString("yyyy-MM-dd")} guardada con exito!";
            }
            catch (Exception ex)
            {

                return null;
            }
        }

    }
}
