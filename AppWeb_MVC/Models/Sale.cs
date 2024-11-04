using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace AppWeb_MVC.Models
{
    public class Sale
    {
        public int Id { get; set; }
        [Required]
        public string customerName { get; set; }
        public int adultTotal { get; set; }
        public int childTotal { get; set; }
        public int hotelId { get; set; }
        public int roomTypeId {  get; set; }
        public DateTime arrivalDate { get; set; }
        
        public DateTime departureDate { get; set;}
        public string status { get; set; }//ENUM('confirmed', 'cancelled', 'completed')
        public Decimal total { get; set; } 

        public List<Hotel> hotels { get; set; }
        public List<RoomType> roomTypes { get; set; }
        public List<RoomPrice> roomPrice { get; set; }
        public Sale()
        {
            Id = 0;
            customerName = string.Empty;
            adultTotal = 0;
            childTotal = 0;
            hotelId = 0;
            roomTypeId = 0;
            arrivalDate = DateTime.Now.Date;
            departureDate = DateTime.Now.Date.AddDays(1);
            status = "confirmed";
            total = 0;
            hotels = new List<Hotel>();
            roomTypes = new List<RoomType>();
            roomPrice = new List<RoomPrice>();
        }
    }
}