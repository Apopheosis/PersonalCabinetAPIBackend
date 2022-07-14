SELECT 
       passenger_document_number, 
       surname, 
       name, 
       sender, 
       validation_status,
       to_char((((time at time zone(operation_time_timezone)::TEXT))::TIMESTAMP::TEXT)::TIMESTAMP,'DD.MM.YYYY HH:MI:SS')
           || CASE WHEN operation_time_timezone::TEXT = '0' THEN '+' ELSE '' END
           || (translate(operation_time_timezone::TEXT,'+-','-+')::TEXT) AS time, 
       type, 
       ticket_number, 
       to_char((((depart_datetime at time zone(depart_datetime_timezone)::TEXT))::TIMESTAMP::TEXT)::TIMESTAMP,'DD.MM.YYYY HH:MI:SS')
        || CASE WHEN depart_datetime_timezone::TEXT = '0' THEN '+' ELSE '' END
        || (translate(depart_datetime_timezone::TEXT,'+-','-+')::TEXT) AS depart_datetime,  
       airline_code, 
       city_from_name, 
       city_to_name 
FROM data_all 
WHERE ticket_number=@number 
ORDER BY time, ticket_number, depart_datetime, type DESC