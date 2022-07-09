using System.ComponentModel.DataAnnotations;

namespace PersonalCabinetAPI.DTO
{
    public class Airline
    {
        [Key]
        public int id { get; set; }
        public string name { get; set; }
        public string name_en { get; set; }
        public string icao_code { get; set; }
        public string iata_code { get; set; }
        public string rf_code { get; set; }
        public string country { get; set; }
    }
}