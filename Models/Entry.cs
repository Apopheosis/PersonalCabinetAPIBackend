using System;
using System.ComponentModel.DataAnnotations;

namespace PersonalCabinetAPI.DTO
{
    public class Entry
    {
        public string passenger_document_number { get; set; }
        public string surname { get; set; }
        public string name { get; set; }
        public string sender { get; set; }
        public string validation_status { get; set; }
        public DateTimeOffset time { get; set; }
        public string type { get; set; }
        public string ticket_number { get; set; }
        public DateTimeOffset depart_datetime { get; set; }
        public string airline_code { get; set; }
        public string city_from_name { get; set; }
        public string city_to_name { get; set; }

    }
}