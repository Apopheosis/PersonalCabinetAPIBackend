﻿SELECT
    operation_id,
    type,
    to_char((((time at time zone(operation_time_timezone)::TEXT))::TIMESTAMP::TEXT)::TIMESTAMP,'DD.MM.YYYY HH:MI:SS')
        || CASE WHEN operation_time_timezone::TEXT = '0' THEN '+' ELSE '' END
        || (translate(operation_time_timezone::TEXT,'+-','-+')::TEXT) AS time,
        place,
        sender,
       transaction_time,
       validation_status,
       operation_time_timezone,
       passenger_id,
       surname,
       name,
       patronymic,
       birthdate,
       gender_id,
       passenger_document_id,
       passenger_document_type,
       passenger_document_number,
       passenger_document_disabled_number,
       passenger_document_large_number,
       passenger_type_id,
       passenger_type_name,
       passenger_type_type,
       ra_category,
       description,
       is_quota,
       ticket_id,
       ticket_number,
       ticket_type,
       airline_route_id,
       airline_code,
       depart_place,
       to_char((((depart_datetime at time zone(depart_datetime_timezone)::TEXT))::TIMESTAMP::TEXT)::TIMESTAMP,'DD.MM.YYYY HH:MI:SS')
        || CASE WHEN depart_datetime_timezone::TEXT = '0' THEN '+' ELSE '' END
        || (translate(depart_datetime_timezone::TEXT,'+-','-+')::TEXT) AS depart_datetime,
       arrive_place,
        to_char((((arrive_datetime at time zone(arrive_datetime_timezone)::TEXT))::TIMESTAMP::TEXT)::TIMESTAMP,'DD.MM.YYYY HH:MI:SS')
        || CASE WHEN arrive_datetime_timezone::TEXT = '0' THEN '+' ELSE '' END
        || (translate(arrive_datetime_timezone::TEXT,'+-','-+')::TEXT) AS arrive_datetime,
       pnr_id,
       operating_airline_code,
       depart_datetime_timezone,
       arrive_datetime_timezone,
       city_from_code,
       city_from_name,
       airport_from_icao_code,
       airport_from_rf_code,
       airport_from_name,
       city_to_code,
       city_to_name,
       airport_to_icao_code,
       airport_to_rf_code,
       airport_to_name,
       flight_nums,
       fare_code,
       fare_price
FROM data_all 
WHERE 
      passenger_document_number=(SELECT passenger_document_number FROM data_all WHERE ticket_number=@number LIMIT 1) 
ORDER BY time, ticket_number, depart_datetime, type DESC