using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;

namespace AppWeb_MVC.Models
{
    public class Main
    {
        public string myConection = "server=localhost; database=reservations; user=root; password=pw-1234567";

        public List<Hotel> Get_Hotels(String name = "")
        {
            List<Hotel> hotels = new List<Hotel>();
            try
            {
                using (MySqlConnection connection = new MySqlConnection(myConection))
                {
                    connection.Open();
                    MySqlCommand command = new MySqlCommand("call Get_Hotels(@name)", connection);
                    command.Parameters.AddWithValue("name", name);
                    MySqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        hotels.Add(new Hotel()
                        {
                            Id = reader.GetInt32(0),
                            Name = reader["Name"].ToString(),
                        });
                    }
                    connection.Close();
                }
            }
            catch (Exception ex)
            {

                return hotels;
            }
            return hotels;
        }

        public List<RoomType> Get_RoomsTypes(String name = "")
        {
            List<RoomType> roomsTypes = new List<RoomType>();
            try
            {
                using (MySqlConnection connection = new MySqlConnection(myConection))
                {
                    connection.Open();
                    MySqlCommand command = new MySqlCommand("select id, name from rooms_types rt ;", connection);
                    
                    MySqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        roomsTypes.Add(new RoomType()
                        {
                            Id = reader.GetInt32(0),
                            Name = reader["Name"].ToString(),
                        });
                    }
                    connection.Close();
                }
            }
            catch (Exception ex)
            {

                return roomsTypes;
            }
            return roomsTypes;
        }

        public List<RoomPrice> Get_RoomsPrice(String name = "")
        {
            List<RoomPrice> roomsPrice = new List<RoomPrice>();
            try
            {
                using (MySqlConnection connection = new MySqlConnection(myConection))
                {
                    connection.Open();
                    MySqlCommand command = new MySqlCommand("select id,hotel_id,room_type_id, price_per_night from rooms_price rt ;", connection);

                    MySqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        roomsPrice.Add(new RoomPrice()
                        {
                            Id = reader.GetInt32(0),
                            Hotel_id = reader.GetInt32(1),
                            Room_Type_id = reader.GetInt32(2),
                            Price = reader.GetDecimal(3),
                        });
                    }
                    connection.Close();
                }
            }
            catch (Exception ex)
            {

                return roomsPrice;
            }
            return roomsPrice;
        }

        public List<RoomAvailable> Get_RoomAvailable(int hotel_id,int room_type_id, DateTime arrival_date, DateTime dep_date)
        {
            List<RoomAvailable> roomsAvailable = new List<RoomAvailable>();
            string sql = "call Get_Available_Range(@hotel_id,@room_type_id,@arrival_date,@dep_date);";
            try
            {
                using (MySqlConnection connection = new MySqlConnection(myConection))
                {
                    connection.Open();
                    MySqlCommand command = new MySqlCommand(sql, connection);
                    command.Parameters.AddWithValue("@hotel_id", hotel_id);
                    command.Parameters.AddWithValue("@room_type_id", room_type_id);
                    command.Parameters.AddWithValue("@arrival_date", arrival_date);
                    command.Parameters.AddWithValue("@dep_date", dep_date);
                    MySqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        roomsAvailable.Add(new RoomAvailable()
                        {
                            ID = reader.GetInt32(0),
                            HotelID = reader.GetInt32(1),
                            RoomID = reader.GetInt32(2),
                            Available_Date = reader.GetDateTime(3),
                            Available = reader.GetInt32(4),
                        });
                    }
                    connection.Close();
                }
            }
            catch (Exception ex)
            {

                return roomsAvailable;
            }
            return roomsAvailable;
        }

        public List<RoomAvailable> Set_RoomAvailable(int hotel_id, int room_type_id, DateTime arrival_date
            , DateTime dep_date,Int32 amount)
        {
            List<RoomAvailable> roomsAvailable = new List<RoomAvailable>();
            string sql = "call Set_Available_Range(@hotel_id,@room_type_id,@arrival_date,@dep_date,@amount);";
            try
            {
                using (MySqlConnection connection = new MySqlConnection(myConection))
                {
                    connection.Open();
                    MySqlCommand command = new MySqlCommand(sql, connection);
                    command.Parameters.AddWithValue("@hotel_id", hotel_id);
                    command.Parameters.AddWithValue("@room_type_id", room_type_id);
                    command.Parameters.AddWithValue("@arrival_date", arrival_date);
                    command.Parameters.AddWithValue("@dep_date", dep_date);
                    command.Parameters.AddWithValue("@amount", amount);
                    command.ExecuteNonQuery();
                    
                    connection.Close();
                }
            }
            catch (Exception ex)
            {

                return roomsAvailable;
            }
            return roomsAvailable;
        }

        public String Set_Sale(Sale sale)
        {
            String message = "";
            String sql = "INSERT INTO reservations.sale\r\n" +
                "(customer_name, adult_total, child_total, hotel_id, room_type_id, arrival_date, departure_date, status, total)" +
                "\r\nVALUES(@customer_name, @adult_total, @child_total," +
                "@hotel_id, @room_type_id, @arrival_date, @departure_date, @status, @total);";
            try
            {
                using (MySqlConnection connection = new MySqlConnection(myConection))
                {
                    connection.Open();
                    MySqlCommand command = new MySqlCommand(sql, connection);
                    command.Parameters.AddWithValue("@customer_name",sale.customerName);
                    command.Parameters.AddWithValue("@adult_total", sale.adultTotal);
                    command.Parameters.AddWithValue("@child_total", sale.childTotal);
                    command.Parameters.AddWithValue("@hotel_id", sale.hotelId);
                    command.Parameters.AddWithValue("@room_type_id", sale.roomTypeId);
                    command.Parameters.AddWithValue("@arrival_date", sale.arrivalDate);
                    command.Parameters.AddWithValue("@departure_date", sale.departureDate);
                    command.Parameters.AddWithValue("@status", sale.status);
                    command.Parameters.AddWithValue("@total", sale.total);

                    command.ExecuteNonQuery();

                }
                    message = "Venta insertada correctamente";
            }
            catch (Exception ex)
            {

                message = ex.Message;
            }
            return message;

        }

    }
}