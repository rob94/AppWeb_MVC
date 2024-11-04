using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AppWeb_MVC.Models
{
    public class RoomPrice
    {
        public int Id { get; set; }
        public int Hotel_id { get; set; }
        public int Room_Type_id { get; set; }
        public Decimal Price { get; set; }
    }
}