using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AppWeb_MVC.Models
{
    public class RoomAvailable
    {
        public int ID { get; set; }
        public int HotelID { get; set; }
        public int RoomID { get; set; }
        public DateTime Available_Date { get; set; }
        public int Available { get; set; }
    }
}