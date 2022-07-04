using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using System.Xml;
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage;
using Microsoft.Extensions.Configuration;
using Npgsql;
using NpgsqlTypes;
using PersonalCabinetAPI.DTO;

namespace PersonalCabinetAPI.Service
{
    public class OperationService: IOperationService
    {
        private const int timeout = 180000;
        private readonly IMapper _mapper;
        private readonly DatabaseContext _context;
        private readonly IConfiguration _config;

        private const string sqlQueryEntriesAllTickets =
            "SELECT passenger_document_number, surname, name, sender, validation_status, time, type, ticket_number, depart_datetime, airline_code, city_from_name, city_to_name FROM data_all WHERE passenger_document_number=(SELECT passenger_document_number FROM data_all WHERE ticket_number=@number LIMIT 1)";

        private const string sqlQueryEntriesNotAllTickets =
            "SELECT passenger_document_number, surname, name, sender, validation_status, time, type, ticket_number, depart_datetime, airline_code, city_from_name, city_to_name FROM data_all WHERE ticket_number=@number";

        private const string sqlQueryOperationsNotAllTickets =
            "SELECT * FROM data_all WHERE airline_code=@code AND ticket_number=@number";

        private const string sqlQueryOperationsAllTickets =
            "SELECT * FROM data_all WHERE airline_code=@code AND passenger_document_number=(SELECT passenger_document_number FROM data_all WHERE ticket_number=@number LIMIT 1)";

        public OperationService(DatabaseContext context, IMapper mapper, IConfiguration config)
        {
            _mapper = mapper;
            _context = context;
            _config = config;
        }
        public async Task<IEnumerable<Entry>> GetEntriesByDocNumberTransaction(string number)
        {
            var con = _config.GetConnectionString("DatabaseContext");
            await using var conn = new NpgsqlConnection(con);
            await conn.OpenAsync();
            await using var cmd = new NpgsqlCommand("SELECT passenger_document_number, surname, name, sender, validation_status, time, type, ticket_number, depart_datetime, airline_code, city_from_name, city_to_name FROM data_all WHERE passenger_document_number=@number", conn)
            {
            };
            cmd.Parameters.Add("@number", NpgsqlDbType.Varchar);
            cmd.Parameters["@number"].Value = number;
            await using var reader = await cmd.ExecuteReaderAsync();
            List<Entry> entries = new List<Entry>();
            while (reader.Read())
            {
                Entry entry = new Entry();
                entry.passenger_document_number = reader.GetString(0);
                entry.surname = reader.GetString(1);
                entry.name = reader.GetString(2);
                entry.sender = reader.GetString(3);
                entry.validation_status = reader.GetValue(4).ToString();
                entry.time = reader.GetDateTime(5);
                entry.type = reader.GetString(6);
                entry.ticket_number = reader.GetString(7);
                entry.depart_datetime= reader.GetDateTime(8);
                entry.airline_code = reader.GetString(9);
                entry.city_from_name = reader.GetString(10);
                entry.city_to_name = reader.GetString(11);

                entries.Add(entry);
            }
            await conn.CloseAsync();
            return entries;
        }
        
        public async Task<IEnumerable<Entry>> GetEntriesByTicketNumberTransaction(Request req)
        {
            var number = req.number;
            var SqlQuery = "";
            if (req.isAllTickets)
            {
                SqlQuery = sqlQueryEntriesAllTickets;
            }
            else
            {
                SqlQuery = sqlQueryEntriesNotAllTickets;
            }
            var con = _config.GetConnectionString("DatabaseContext");
            await using var conn = new NpgsqlConnection(con);
            await conn.OpenAsync();
            await using var cmd = new NpgsqlCommand(SqlQuery, conn)
            {
            };
            cmd.Parameters.Add("@number", NpgsqlDbType.Varchar);
            cmd.Parameters["@number"].Value = number;
            await using var reader = await cmd.ExecuteReaderAsync();
            List<Entry> entries = new List<Entry>();
            while (reader.Read())
            {
                Entry entry = new Entry();
                entry.passenger_document_number = reader.GetString(0);
                entry.surname = reader.GetString(1);
                entry.name = reader.GetString(2);
                entry.sender = reader.GetString(3);
                entry.validation_status = reader.GetValue(4).ToString();
                entry.time = reader.GetDateTime(5);
                entry.type = reader.GetString(6);
                entry.ticket_number = reader.GetString(7);
                entry.depart_datetime= reader.GetDateTime(8);
                entry.airline_code = reader.GetString(9);
                entry.city_from_name = reader.GetString(10);
                entry.city_to_name = reader.GetString(11);
                entries.Add(entry);
            }
            await conn.CloseAsync();
            return entries;
        }

        public async Task<IEnumerable<Operation>> GetOperationsByAirlineCodeDocNumber(string code, string number)
        {
            var con = _config.GetConnectionString("DatabaseContext");
            await using var conn = new NpgsqlConnection(con);
            await conn.OpenAsync();
            await using var cmd = new NpgsqlCommand("SELECT * FROM data_all WHERE airline_code=@code AND passenger_document_number=@number", conn)
            {
            };
            cmd.Parameters.Add("@code", NpgsqlDbType.Varchar);
            cmd.Parameters["@code"].Value = code;
            cmd.Parameters.Add("@number", NpgsqlDbType.Varchar);
            cmd.Parameters["@number"].Value = number;
            await using var reader = await cmd.ExecuteReaderAsync();
            List<Operation> operations = new List<Operation>();
            while (reader.Read())
            {
                Operation op = new Operation();
                op.operation_id = reader.GetInt64(0);
                op.type = reader.GetString(1);
                op.time = reader.GetDateTime(2);
                op.place = "";
                op.sender = "";
                op.transaction_time = reader.GetDateTime(5);
                op.validation_status = reader.GetValue(6).ToString();
                op.passenger_id = reader.GetInt64(8);
                op.surname = reader.GetString(9);
                op.name= reader.GetString(10);
                op.patronymic = reader.GetString(11);
                op.birthdate = reader.GetString(12);
                op.gender_id = reader.GetInt32(13);
                op.passenger_document_id = reader.GetInt64(14);
                op.passenger_document_type = reader.GetString(15);
                op.passenger_document_number = reader.GetString(16);
                op.passenger_document_disabled_number = reader.GetValue(17).ToString();
                op.passenger_document_large_number = reader.GetValue(18).ToString();
                op.passenger_type_id = reader.GetInt32(19);
                op.passenger_type_name = reader.GetString(20);
                op.passenger_type_type = reader.GetString(21);
                op.ra_category = reader.GetString(22);
                op.description = reader.GetString(23);
                op.is_quota = reader.GetBoolean(24);
                op.ticket_id = reader.GetInt64(25);
                op.ticket_number = "******" + reader.GetString(26).Substring(7);
                op.ticket_type = reader.GetInt32(27);
                op.airline_route_id = 0;
                op.airline_code = "";
                op.depart_place = "";
                op.depart_datetime = reader.GetDateTime(31);
                op.arrive_place = "";
                op.arrive_datetime = null;
                op.pnr_id = "";
                op.operating_airline_code = "";
                op.city_from_code = "";
                op.city_from_name = "";
                op.airport_from_icao_code = "";
                op.airport_from_rf_code = "";
                op.airport_to_name = "";
                op.flight_nums = "";
                op.fare_code = "";
                op.fare_price = 0;
                operations.Add(op);
            }
            await conn.CloseAsync();
            return operations;
        }
        
        public async Task<IEnumerable<Operation>> GetOperationsByAirlineCodeTicketNumber(AirlineRequest req)
        {
            var code = req.code;
            var number = req.number;
            var sqlQuery = "";
            if (req.isAllTickets)
            {
                sqlQuery = sqlQueryOperationsAllTickets;
            }
            else
            {
                sqlQuery = sqlQueryOperationsNotAllTickets;
            }

            var con = _config.GetConnectionString("DatabaseContext");
            await using var conn = new NpgsqlConnection(con);
            await conn.OpenAsync();
            await using var cmd = new NpgsqlCommand(sqlQuery, conn);
            {
            };
            cmd.Parameters.Add("@code", NpgsqlDbType.Varchar);
            cmd.Parameters["@code"].Value = code;
            cmd.Parameters.Add("@number", NpgsqlDbType.Varchar);
            cmd.Parameters["@number"].Value = number;
            await using var reader = await cmd.ExecuteReaderAsync();
            List<Operation> operations = new List<Operation>();
            while (reader.Read())
            {
                Operation op = new Operation();
                op.operation_id = reader.GetInt64(0);
                op.type = reader.GetString(1);
                op.time = reader.GetDateTime(2);
                op.place = "";
                op.sender = "";
                op.transaction_time = reader.GetDateTime(5);
                op.validation_status = reader.GetValue(6).ToString();
                op.passenger_id = reader.GetInt64(8);
                op.surname = reader.GetString(9);
                op.name= reader.GetString(10);
                op.patronymic = reader.GetString(11);
                op.birthdate = reader.GetString(12);
                op.gender_id = reader.GetInt32(13);
                op.passenger_document_id = reader.GetInt64(14);
                op.passenger_document_type = reader.GetString(15);
                op.passenger_document_number = reader.GetString(16);
                op.passenger_document_disabled_number = reader.GetValue(17).ToString();
                op.passenger_document_large_number = reader.GetValue(18).ToString();
                op.passenger_type_id = reader.GetInt32(19);
                op.passenger_type_name = reader.GetString(20);
                op.passenger_type_type = reader.GetString(21);
                op.ra_category = reader.GetString(22);
                op.description = reader.GetString(23);
                op.is_quota = reader.GetBoolean(24);
                op.ticket_id = reader.GetInt64(25);
                op.ticket_number = "******" + reader.GetString(26).Substring(7);
                op.ticket_type = reader.GetInt32(27);
                op.airline_route_id = 0;
                op.airline_code = "";
                op.depart_place = "";
                op.depart_datetime = reader.GetDateTime(31);
                op.arrive_place = "";
                op.arrive_datetime = null;
                op.pnr_id = "";
                op.operating_airline_code = "";
                op.city_from_code = "";
                op.city_from_name = "";
                op.airport_from_icao_code = "";
                op.airport_from_rf_code = "";
                op.airport_to_name = "";
                op.flight_nums = "";
                op.fare_code = "";
                op.fare_price = 0;
                operations.Add(op);
            }
            await conn.CloseAsync();
            return operations;
        }
    }
}