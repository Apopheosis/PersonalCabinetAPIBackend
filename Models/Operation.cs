using System;
using System.ComponentModel.DataAnnotations;
using System.Diagnostics.CodeAnalysis;
using System.Numerics;

public class Operation
{
    [Key]
    public long operation_id { get; set; }
    public string type { get; set; }
    public string time { get; set; }
    public string place { get; set; }
    public string sender { get; set; }
    public DateTime transaction_time { get; set; }
    public string? validation_status { get; set; }
    public long passenger_id { get; set; }
    public string surname { get; set; }
    public string name { get; set; }
    public string patronymic { get; set; }
    public string birthdate { get; set; }
    public int gender_id { get; set; }
    public long? passenger_document_id { get; set; }
    public string? passenger_document_type { get; set; }
    public string? passenger_document_number { get; set; }
    public string? passenger_document_disabled_number { get; set; }
    public string? passenger_document_large_number { get; set; }
    public int passenger_type_id { get; set; }
    public string passenger_type_name { get; set; }
    public string passenger_type_type { get; set; }
    public string ra_category { get; set; } 
    public string description { get; set; }
    public bool is_quota { get; set; }
    public long ticket_id { get; set; }
    public string ticket_number { get; set; }
    public int ticket_type { get; set; }
    public long? airline_route_id { get; set; }
    public string airline_code { get; set; }
    public string depart_place { get; set; }
    public string? depart_datetime { get; set; }
    public string arrive_place { get; set; }
    public string? arrive_datetime { get; set; }
    public string pnr_id { get; set; }
    public string? operating_airline_code { get; set; }
    public string city_from_code { get; set; }
    public string city_from_name { get; set; }
    public string airport_from_icao_code { get; set; }
    public string airport_from_rf_code { get; set; }
    public string airport_from_name { get; set; }
    public string city_to_code { get; set; }
    public string city_to_name { get; set; }
    public string airport_to_icao_code { get; set; }
    public string airport_to_rf_code { get; set; }
    public string airport_to_name { get; set; }
    public string flight_nums { get; set; }
    public string fare_code { get; set; }
    public int? fare_price { get; set; }    

}
