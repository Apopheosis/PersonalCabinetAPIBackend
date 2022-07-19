SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3318 (class 1262 OID 49162)
-- Name: tickets; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE tickets WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';


ALTER DATABASE tickets OWNER TO postgres;

connect tickets

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 211 (class 1259 OID 49195)
-- Name: airline_company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.airline_company (
                                        id integer DEFAULT nextval('public.airline_company_id_seq'::regclass) NOT NULL,
                                        name character varying NOT NULL,
                                        name_en character varying NOT NULL,
                                        icao_code character varying NOT NULL,
                                        iata_code character varying NOT NULL,
                                        rf_code character varying NOT NULL,
                                        country character varying NOT NULL
);


ALTER TABLE public.airline_company OWNER TO postgres;

--
-- TOC entry 3312 (class 0 OID 49195)
-- Dependencies: 211
-- Data for Name: airline_company; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.airline_company (id, name, name_en, icao_code, iata_code, rf_code, country) VALUES (1, 'АО "Авиакомпания "Азимут"', 'Azimuth', 'AZO', 'А4', 'А4', 'Россия');
INSERT INTO public.airline_company (id, name, name_en, icao_code, iata_code, rf_code, country) VALUES (2, 'АО "Авиакомпания "Икар"', 'Ikar', 'KAR', 'EO', 'АЬ', 'Россия');
INSERT INTO public.airline_company (id, name, name_en, icao_code, iata_code, rf_code, country) VALUES (3, 'АО "Авиакомпания "Россия"', 'Rossiya', 'SDM', 'FV', 'ПЛ', 'Россия');
INSERT INTO public.airline_company (id, name, name_en, icao_code, iata_code, rf_code, country) VALUES (4, 'АО "Авиакомпания "Сибирь"', 'S7', 'SBI', 'S7', 'С7', 'Россия');
INSERT INTO public.airline_company (id, name, name_en, icao_code, iata_code, rf_code, country) VALUES (5, 'АО "Авиакомпания "Якутия"', 'Yakutia', 'SYL', 'R3', 'ЯК', 'Россия');
INSERT INTO public.airline_company (id, name, name_en, icao_code, iata_code, rf_code, country) VALUES (6, 'АО "Авиакомпания АЛРОСА"', 'Alrosa', 'DRU', '6R', 'ЯМ', 'Россия');
INSERT INTO public.airline_company (id, name, name_en, icao_code, iata_code, rf_code, country) VALUES (7, 'АО "АК "НордСтар"', 'NordStar', 'TYA', 'Y7', 'ТИ', 'Россия');
INSERT INTO public.airline_company (id, name, name_en, icao_code, iata_code, rf_code, country) VALUES (8, 'АО "АК Смартавиа"', 'Smartavia', 'AUL', '5N', '5Н', 'Россия');
INSERT INTO public.airline_company (id, name, name_en, icao_code, iata_code, rf_code, country) VALUES (9, 'АО "ИрАэро"', 'Iraero', 'IAE', 'IO', 'РД', 'Россия');
INSERT INTO public.airline_company (id, name, name_en, icao_code, iata_code, rf_code, country) VALUES (10, 'АО "Ред Вингс"', 'Red Wings', 'RWZ', 'WZ', 'ИН', 'Россия');
INSERT INTO public.airline_company (id, name, name_en, icao_code, iata_code, rf_code, country) VALUES (11, 'ОАО АК "Уральские авиалинии"', 'Ural Airlines', 'SVR', 'U6', 'У6', 'Россия');
INSERT INTO public.airline_company (id, name, name_en, icao_code, iata_code, rf_code, country) VALUES (12, 'ООО "Северный Ветер"', 'Nordwind', 'NWS', 'N4', 'КЛ', 'Россия');
INSERT INTO public.airline_company (id, name, name_en, icao_code, iata_code, rf_code, country) VALUES (13, 'ПАО "Авиакомпания "Ютэйр"', 'UTair', 'UTA', 'UT', 'ЮТ', 'Россия');
INSERT INTO public.airline_company (id, name, name_en, icao_code, iata_code, rf_code, country) VALUES (14, 'ПАО "Аэрофлот"', 'Aeroflot', 'AFL', 'SU', 'СУ', 'Россия');
INSERT INTO public.airline_company (id, name, name_en, icao_code, iata_code, rf_code, country) VALUES (15, 'АО "Авиакомпания «Ижавиа»"', 'Izhavia', 'IZA', 'I8', 'ИЖ', 'Россия');


--
-- TOC entry 3172 (class 2606 OID 49202)
-- Name: airline_company airline_company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airline_company
    ADD CONSTRAINT airline_company_pkey PRIMARY KEY (id);

CREATE TABLE public.data_all (
                                 operation_id bigint,
                                 type character varying,
                                 "time" timestamp without time zone,
                                 place character varying,
                                 sender character varying,
                                 transaction_time timestamp with time zone,
                                 validation_status character varying,
                                 operation_time_timezone smallint,
                                 passenger_id bigint,
                                 surname character varying,
                                 name character varying,
                                 patronymic character varying,
                                 birthdate character varying,
                                 gender_id numeric(1,0),
                                 passenger_document_id bigint,
                                 passenger_document_type character varying,
                                 passenger_document_number character varying,
                                 passenger_document_disabled_number character varying,
                                 passenger_document_large_number character varying,
                                 passenger_type_id numeric(2,0),
                                 passenger_type_name character varying,
                                 passenger_type_type character varying,
                                 ra_category character varying,
                                 description character varying,
                                 is_quota boolean,
                                 ticket_id bigint,
                                 ticket_number character varying,
                                 ticket_type numeric(1,0),
                                 airline_route_id bigint,
                                 airline_code character varying,
                                 depart_place character varying,
                                 depart_datetime timestamp without time zone,
                                 arrive_place character varying,
                                 arrive_datetime timestamp without time zone,
                                 pnr_id character varying,
                                 operating_airline_code character varying,
                                 depart_datetime_timezone smallint,
                                 arrive_datetime_timezone smallint,
                                 city_from_code character varying,
                                 city_from_name character varying,
                                 airport_from_icao_code character varying,
                                 airport_from_rf_code character varying,
                                 airport_from_name character varying,
                                 city_to_code character varying,
                                 city_to_name character varying,
                                 airport_to_icao_code character varying,
                                 airport_to_rf_code character varying,
                                 airport_to_name character varying,
                                 flight_nums text,
                                 fare_code character varying,
                                 fare_price integer
);


ALTER TABLE public.data_all OWNER TO postgres;

--
-- TOC entry 3309 (class 0 OID 49163)
-- Dependencies: 209
-- Data for Name: data_all; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.data_all (operation_id, type, "time", place, sender, transaction_time, validation_status, operation_time_timezone, passenger_id, surname, name, patronymic, birthdate, gender_id, passenger_document_id, passenger_document_type, passenger_document_number, passenger_document_disabled_number, passenger_document_large_number, passenger_type_id, passenger_type_name, passenger_type_type, ra_category, description, is_quota, ticket_id, ticket_number, ticket_type, airline_route_id, airline_code, depart_place, depart_datetime, arrive_place, arrive_datetime, pnr_id, operating_airline_code, depart_datetime_timezone, arrive_datetime_timezone, city_from_code, city_from_name, airport_from_icao_code, airport_from_rf_code, airport_from_name, city_to_code, city_to_name, airport_to_icao_code, airport_to_rf_code, airport_to_name, flight_nums, fare_code, fare_price) VALUES (104333, 'issued', '2022-06-23 03:25:00', 'AVIA CENTER LLC (MOSCOW)', 'dev_code', '2022-03-30 12:12:11.400732+03', 'invalid_operation_time', -3, 25688, 'Ivanov', 'Ivan', 'Ivanovich', '2001-08-16', 0, 25688, '00', '2215123123', NULL, NULL, 4, 'пенсионер', 'elderly', 'ПНС', 'Мужчины от 60 лет, Женщины от 55 лет', true, 73611, '5552139254234', 1, 1880, 'SU', 'SVO', '2022-03-01 13:10:00', 'VVO', '2022-03-01 21:40:00', 'THALSZ', NULL, 0, 0, 'MOW', 'Москва', 'UUEE', 'ШРМ', 'Шереметьево', 'VVO', 'Владивосток', 'UHWW', 'ВВО', 'Владивосток', 'SU1700, SU1712', 'PZZSOC', 740000);
INSERT INTO public.data_all (operation_id, type, "time", place, sender, transaction_time, validation_status, operation_time_timezone, passenger_id, surname, name, patronymic, birthdate, gender_id, passenger_document_id, passenger_document_type, passenger_document_number, passenger_document_disabled_number, passenger_document_large_number, passenger_type_id, passenger_type_name, passenger_type_type, ra_category, description, is_quota, ticket_id, ticket_number, ticket_type, airline_route_id, airline_code, depart_place, depart_datetime, arrive_place, arrive_datetime, pnr_id, operating_airline_code, depart_datetime_timezone, arrive_datetime_timezone, city_from_code, city_from_name, airport_from_icao_code, airport_from_rf_code, airport_from_name, city_to_code, city_to_name, airport_to_icao_code, airport_to_rf_code, airport_to_name, flight_nums, fare_code, fare_price) VALUES (104333, 'issued', '2022-06-23 03:25:00', 'AVIA CENTER LLC (MOSCOW)', 'dev_code', '2022-03-30 12:12:11.400732+03', 'invalid_operation_time', -3, 25688, 'Ivanov', 'Ivan', 'Ivanovich', '2001-08-16', 0, 25688, '00', '2215123123', NULL, NULL, 4, 'пенсионер', 'elderly', 'ПНС', 'Мужчины от 60 лет, Женщины от 55 лет', true, 73611, '5552139254234', 1, 1879, 'SU', 'VVO', '2022-02-22 23:20:00', 'SVO', '2022-02-23 08:25:00', 'THALSZ', NULL, 0, 0, 'VVO', 'Владивосток', 'UHWW', 'ВВО', 'Владивосток', 'MOW', 'Москва', 'UUEE', 'ШРМ', 'Шереметьево', 'SU1701, SU1711', 'PZZSOC', 740000);
INSERT INTO public.data_all (operation_id, type, "time", place, sender, transaction_time, validation_status, operation_time_timezone, passenger_id, surname, name, patronymic, birthdate, gender_id, passenger_document_id, passenger_document_type, passenger_document_number, passenger_document_disabled_number, passenger_document_large_number, passenger_type_id, passenger_type_name, passenger_type_type, ra_category, description, is_quota, ticket_id, ticket_number, ticket_type, airline_route_id, airline_code, depart_place, depart_datetime, arrive_place, arrive_datetime, pnr_id, operating_airline_code, depart_datetime_timezone, arrive_datetime_timezone, city_from_code, city_from_name, airport_from_icao_code, airport_from_rf_code, airport_from_name, city_to_code, city_to_name, airport_to_icao_code, airport_to_rf_code, airport_to_name, flight_nums, fare_code, fare_price) VALUES (104327, 'issued', '2022-06-23 03:25:00', 'AVIA CENTER LLC (MOSCOW)', 'dev_code', '2022-03-30 12:11:23.935504+03', 'invalid_operation_time', -3, 25688, 'Ivanov', 'Ivan', 'Ivanovich', '2001-08-16', 0, 25688, '00', '2215123123', NULL, NULL, 4, 'пенсионер', 'elderly', 'ПНС', 'Мужчины от 60 лет, Женщины от 55 лет', true, 73605, '5552139254232', 1, 1880, 'SU', 'SVO', '2022-03-01 13:10:00', 'VVO', '2022-03-01 21:40:00', 'THALSZ', NULL, 0, 0, 'MOW', 'Москва', 'UUEE', 'ШРМ', 'Шереметьево', 'VVO', 'Владивосток', 'UHWW', 'ВВО', 'Владивосток', 'SU1700, SU1712', 'PZZSOC', 740000);
INSERT INTO public.data_all (operation_id, type, "time", place, sender, transaction_time, validation_status, operation_time_timezone, passenger_id, surname, name, patronymic, birthdate, gender_id, passenger_document_id, passenger_document_type, passenger_document_number, passenger_document_disabled_number, passenger_document_large_number, passenger_type_id, passenger_type_name, passenger_type_type, ra_category, description, is_quota, ticket_id, ticket_number, ticket_type, airline_route_id, airline_code, depart_place, depart_datetime, arrive_place, arrive_datetime, pnr_id, operating_airline_code, depart_datetime_timezone, arrive_datetime_timezone, city_from_code, city_from_name, airport_from_icao_code, airport_from_rf_code, airport_from_name, city_to_code, city_to_name, airport_to_icao_code, airport_to_rf_code, airport_to_name, flight_nums, fare_code, fare_price) VALUES (104327, 'issued', '2022-06-23 03:25:00', 'AVIA CENTER LLC (MOSCOW)', 'dev_code', '2022-03-30 12:11:23.935504+03', 'invalid_operation_time', -3, 25688, 'Ivanov', 'Ivan', 'Ivanovich', '2001-08-16', 0, 25688, '00', '2215123123', NULL, NULL, 4, 'пенсионер', 'elderly', 'ПНС', 'Мужчины от 60 лет, Женщины от 55 лет', true, 73605, '5552139254232', 1, 1879, 'SU', 'VVO', '2022-02-22 23:20:00', 'SVO', '2022-02-23 08:25:00', 'THALSZ', NULL, 0, 0, 'VVO', 'Владивосток', 'UHWW', 'ВВО', 'Владивосток', 'MOW', 'Москва', 'UUEE', 'ШРМ', 'Шереметьево', 'SU1701, SU1711', 'PZZSOC', 740000);
INSERT INTO public.data_all (operation_id, type, "time", place, sender, transaction_time, validation_status, operation_time_timezone, passenger_id, surname, name, patronymic, birthdate, gender_id, passenger_document_id, passenger_document_type, passenger_document_number, passenger_document_disabled_number, passenger_document_large_number, passenger_type_id, passenger_type_name, passenger_type_type, ra_category, description, is_quota, ticket_id, ticket_number, ticket_type, airline_route_id, airline_code, depart_place, depart_datetime, arrive_place, arrive_datetime, pnr_id, operating_airline_code, depart_datetime_timezone, arrive_datetime_timezone, city_from_code, city_from_name, airport_from_icao_code, airport_from_rf_code, airport_from_name, city_to_code, city_to_name, airport_to_icao_code, airport_to_rf_code, airport_to_name, flight_nums, fare_code, fare_price) VALUES (104310, 'issued', '2022-04-23 00:25:00', 'AVIA CENTER LLC', '', '2022-03-11 10:57:35.700013+03', NULL, 0, 30695, 'Ivanov', 'Ivan', 'Ivanovich', '2015-08-16', 0, 30703, '04', '2215123123', 'MSE-2009N1065334', NULL, 8, 'ребенок инвалид от 0-12 лет', 'invalid_child', 'ИНВ-PБ', 'Ребенок инвалид от 0-12 лет с предоставлением места', true, 73592, '67A2183740555', 1, 1911, 'SU', 'VVO', '2022-05-23 03:45:00', 'SVO', '2022-05-23 08:25:00', 'THALSZ', 'FV', 0, 0, 'VVO', 'Владивосток', 'UHWW', 'ВВО', 'Владивосток', 'MOW', 'Москва', 'UUEE', 'ШРМ', 'Шереметьево', 'SU1710(FV6290)', 'PZZSOC', 740000);
INSERT INTO public.data_all (operation_id, type, "time", place, sender, transaction_time, validation_status, operation_time_timezone, passenger_id, surname, name, patronymic, birthdate, gender_id, passenger_document_id, passenger_document_type, passenger_document_number, passenger_document_disabled_number, passenger_document_large_number, passenger_type_id, passenger_type_name, passenger_type_type, ra_category, description, is_quota, ticket_id, ticket_number, ticket_type, airline_route_id, airline_code, depart_place, depart_datetime, arrive_place, arrive_datetime, pnr_id, operating_airline_code, depart_datetime_timezone, arrive_datetime_timezone, city_from_code, city_from_name, airport_from_icao_code, airport_from_rf_code, airport_from_name, city_to_code, city_to_name, airport_to_icao_code, airport_to_rf_code, airport_to_name, flight_nums, fare_code, fare_price) VALUES (104312, 'issued', '2022-04-23 00:25:00', 'AVIA CENTER LLC', '', '2022-03-11 11:01:31.201693+03', NULL, 0, 30695, 'Ivanov', 'Ivan', 'Ivanovich', '2015-08-16', 0, 30703, '04', '2215123123', 'MSE-2009N1065334', NULL, 8, 'ребенок инвалид от 0-12 лет', 'invalid_child', 'ИНВ-PБ', 'Ребенок инвалид от 0-12 лет с предоставлением места', true, 73594, '67A2183740556', 1, 1911, 'SU', 'VVO', '2022-05-23 03:45:00', 'SVO', '2022-05-23 08:25:00', 'THALSZ', 'FV', 0, 0, 'VVO', 'Владивосток', 'UHWW', 'ВВО', 'Владивосток', 'MOW', 'Москва', 'UUEE', 'ШРМ', 'Шереметьево', 'SU1710(FV6290)', 'PZZSOC', 740000);
INSERT INTO public.data_all (operation_id, type, "time", place, sender, transaction_time, validation_status, operation_time_timezone, passenger_id, surname, name, patronymic, birthdate, gender_id, passenger_document_id, passenger_document_type, passenger_document_number, passenger_document_disabled_number, passenger_document_large_number, passenger_type_id, passenger_type_name, passenger_type_type, ra_category, description, is_quota, ticket_id, ticket_number, ticket_type, airline_route_id, airline_code, depart_place, depart_datetime, arrive_place, arrive_datetime, pnr_id, operating_airline_code, depart_datetime_timezone, arrive_datetime_timezone, city_from_code, city_from_name, airport_from_icao_code, airport_from_rf_code, airport_from_name, city_to_code, city_to_name, airport_to_icao_code, airport_to_rf_code, airport_to_name, flight_nums, fare_code, fare_price) VALUES (104163, 'issued', '2022-01-23 03:25:00', 'AVIA CENTER LLC (MOSCOW)', 'dev_code', '2022-03-02 17:34:08.383779+03', NULL, 0, 25688, 'Ivanov', 'Ivan', 'Ivanovich', '2001-08-16', 0, 25688, '00', '2215123123', NULL, NULL, 3, 'молодежь', 'youth', 'МЛД', 'Гражданин в возрасте от 12 до 23 лет', true, 73471, '5552139254239', 1, 1852, 'SU', 'SVO', '2022-03-01 16:10:00', 'VVO', '2022-03-02 07:40:00', 'THALSZ', NULL, 0, 0, 'MOW', 'Москва', 'UUEE', 'ШРМ', 'Шереметьево', 'VVO', 'Владивосток', 'UHWW', 'ВВО', 'Владивосток', 'SU1700', 'PZZSOC', 740000);
INSERT INTO public.data_all (operation_id, type, "time", place, sender, transaction_time, validation_status, operation_time_timezone, passenger_id, surname, name, patronymic, birthdate, gender_id, passenger_document_id, passenger_document_type, passenger_document_number, passenger_document_disabled_number, passenger_document_large_number, passenger_type_id, passenger_type_name, passenger_type_type, ra_category, description, is_quota, ticket_id, ticket_number, ticket_type, airline_route_id, airline_code, depart_place, depart_datetime, arrive_place, arrive_datetime, pnr_id, operating_airline_code, depart_datetime_timezone, arrive_datetime_timezone, city_from_code, city_from_name, airport_from_icao_code, airport_from_rf_code, airport_from_name, city_to_code, city_to_name, airport_to_icao_code, airport_to_rf_code, airport_to_name, flight_nums, fare_code, fare_price) VALUES (104163, 'issued', '2022-01-23 03:25:00', 'AVIA CENTER LLC (MOSCOW)', 'dev_code', '2022-03-02 17:34:08.383779+03', NULL, 0, 25688, 'Ivanov', 'Ivan', 'Ivanovich', '2001-08-16', 0, 25688, '00', '2215123123', NULL, NULL, 3, 'молодежь', 'youth', 'МЛД', 'Гражданин в возрасте от 12 до 23 лет', true, 73471, '5552139254239', 1, 1851, 'SU', 'VVO', '2022-02-23 09:20:00', 'SVO', '2022-02-23 11:25:00', 'THALSZ', NULL, 0, 0, 'VVO', 'Владивосток', 'UHWW', 'ВВО', 'Владивосток', 'MOW', 'Москва', 'UUEE', 'ШРМ', 'Шереметьево', 'SU1701, SU1505', 'PZZSOC', 740000);
INSERT INTO public.data_all (operation_id, type, "time", place, sender, transaction_time, validation_status, operation_time_timezone, passenger_id, surname, name, patronymic, birthdate, gender_id, passenger_document_id, passenger_document_type, passenger_document_number, passenger_document_disabled_number, passenger_document_large_number, passenger_type_id, passenger_type_name, passenger_type_type, ra_category, description, is_quota, ticket_id, ticket_number, ticket_type, airline_route_id, airline_code, depart_place, depart_datetime, arrive_place, arrive_datetime, pnr_id, operating_airline_code, depart_datetime_timezone, arrive_datetime_timezone, city_from_code, city_from_name, airport_from_icao_code, airport_from_rf_code, airport_from_name, city_to_code, city_to_name, airport_to_icao_code, airport_to_rf_code, airport_to_name, flight_nums, fare_code, fare_price) VALUES (104210, 'issued', '2022-02-23 03:25:00', 'AVIA CENTER LLC (MOSCOW)', 'dev_code', '2022-03-04 12:15:06.720005+03', 'invalid_ticket', 0, 30695, 'Ivanov', 'Ivan', 'Ivanovich', '2015-08-16', 0, 30703, '04', '2215123123', 'MSE-2009N1065334', NULL, 8, 'ребенок инвалид от 0-12 лет', 'invalid_child', 'ИНВ-PБ', 'Ребенок инвалид от 0-12 лет с предоставлением места', true, 73508, '5552139254500', 1, 1858, 'SU', 'DYR', '2022-03-23 12:45:00', 'DME', '2022-03-23 11:25:00', 'THALSZ', 'FV', 0, 0, 'DYR', 'Анадырь', 'UHMA', 'АНЫ', 'Анадырь', 'MOW', 'Москва', 'UUDD', 'ДМД', 'Домодедово', 'SU1710(FV6290)', 'PZZSOC', 740000);
INSERT INTO public.data_all (operation_id, type, "time", place, sender, transaction_time, validation_status, operation_time_timezone, passenger_id, surname, name, patronymic, birthdate, gender_id, passenger_document_id, passenger_document_type, passenger_document_number, passenger_document_disabled_number, passenger_document_large_number, passenger_type_id, passenger_type_name, passenger_type_type, ra_category, description, is_quota, ticket_id, ticket_number, ticket_type, airline_route_id, airline_code, depart_place, depart_datetime, arrive_place, arrive_datetime, pnr_id, operating_airline_code, depart_datetime_timezone, arrive_datetime_timezone, city_from_code, city_from_name, airport_from_icao_code, airport_from_rf_code, airport_from_name, city_to_code, city_to_name, airport_to_icao_code, airport_to_rf_code, airport_to_name, flight_nums, fare_code, fare_price) VALUES (104329, 'used', '2022-06-23 03:25:00', 'AVIA CENTER LLC (MOSCOW)', 'dev_code', '2022-03-30 12:11:34.119476+03', NULL, -3, 25688, 'Ivanov', 'Ivan', 'Ivanovich', '2001-08-16', 0, 25688, '00', '2215123123', NULL, NULL, 4, 'пенсионер', 'elderly', 'ПНС', 'Мужчины от 60 лет, Женщины от 55 лет', true, 73607, '5552139254232', 1, 1880, 'SU', 'SVO', '2022-03-01 13:10:00', 'VVO', '2022-03-01 21:40:00', 'THALSZ', NULL, 0, 0, 'MOW', 'Москва', 'UUEE', 'ШРМ', 'Шереметьево', 'VVO', 'Владивосток', 'UHWW', 'ВВО', 'Владивосток', 'SU1700, SU1712', 'PZZSOC', 740000);
INSERT INTO public.data_all (operation_id, type, "time", place, sender, transaction_time, validation_status, operation_time_timezone, passenger_id, surname, name, patronymic, birthdate, gender_id, passenger_document_id, passenger_document_type, passenger_document_number, passenger_document_disabled_number, passenger_document_large_number, passenger_type_id, passenger_type_name, passenger_type_type, ra_category, description, is_quota, ticket_id, ticket_number, ticket_type, airline_route_id, airline_code, depart_place, depart_datetime, arrive_place, arrive_datetime, pnr_id, operating_airline_code, depart_datetime_timezone, arrive_datetime_timezone, city_from_code, city_from_name, airport_from_icao_code, airport_from_rf_code, airport_from_name, city_to_code, city_to_name, airport_to_icao_code, airport_to_rf_code, airport_to_name, flight_nums, fare_code, fare_price) VALUES (104329, 'used', '2022-06-23 03:25:00', 'AVIA CENTER LLC (MOSCOW)', 'dev_code', '2022-03-30 12:11:34.119476+03', NULL, -3, 25688, 'Ivanov', 'Ivan', 'Ivanovich', '2001-08-16', 0, 25688, '00', '2215123123', NULL, NULL, 4, 'пенсионер', 'elderly', 'ПНС', 'Мужчины от 60 лет, Женщины от 55 лет', true, 73607, '5552139254232', 1, 1879, 'SU', 'VVO', '2022-02-22 23:20:00', 'SVO', '2022-02-23 08:25:00', 'THALSZ', NULL, 0, 0, 'VVO', 'Владивосток', 'UHWW', 'ВВО', 'Владивосток', 'MOW', 'Москва', 'UUEE', 'ШРМ', 'Шереметьево', 'SU1701, SU1711', 'PZZSOC', 740000);
INSERT INTO public.data_all (operation_id, type, "time", place, sender, transaction_time, validation_status, operation_time_timezone, passenger_id, surname, name, patronymic, birthdate, gender_id, passenger_document_id, passenger_document_type, passenger_document_number, passenger_document_disabled_number, passenger_document_large_number, passenger_type_id, passenger_type_name, passenger_type_type, ra_category, description, is_quota, ticket_id, ticket_number, ticket_type, airline_route_id, airline_code, depart_place, depart_datetime, arrive_place, arrive_datetime, pnr_id, operating_airline_code, depart_datetime_timezone, arrive_datetime_timezone, city_from_code, city_from_name, airport_from_icao_code, airport_from_rf_code, airport_from_name, city_to_code, city_to_name, airport_to_icao_code, airport_to_rf_code, airport_to_name, flight_nums, fare_code, fare_price) VALUES (104335, 'issued', '2022-06-23 03:25:00', 'AVIA CENTER LLC (MOSCOW)', 'dev_code', '2022-03-30 12:12:25.181211+03', 'invalid_operation_time', -3, 25688, 'Ivanov', 'Ivan', 'Ivanovich', '2001-08-16', 0, 25688, '00', '2215123123', NULL, NULL, 4, 'пенсионер', 'elderly', 'ПНС', 'Мужчины от 60 лет, Женщины от 55 лет', true, 73613, '5552139254210', 1, 1880, 'SU', 'SVO', '2022-03-01 13:10:00', 'VVO', '2022-03-01 21:40:00', 'THALSZ', NULL, 0, 0, 'MOW', 'Москва', 'UUEE', 'ШРМ', 'Шереметьево', 'VVO', 'Владивосток', 'UHWW', 'ВВО', 'Владивосток', 'SU1700, SU1712', 'PZZSOC', 740000);
INSERT INTO public.data_all (operation_id, type, "time", place, sender, transaction_time, validation_status, operation_time_timezone, passenger_id, surname, name, patronymic, birthdate, gender_id, passenger_document_id, passenger_document_type, passenger_document_number, passenger_document_disabled_number, passenger_document_large_number, passenger_type_id, passenger_type_name, passenger_type_type, ra_category, description, is_quota, ticket_id, ticket_number, ticket_type, airline_route_id, airline_code, depart_place, depart_datetime, arrive_place, arrive_datetime, pnr_id, operating_airline_code, depart_datetime_timezone, arrive_datetime_timezone, city_from_code, city_from_name, airport_from_icao_code, airport_from_rf_code, airport_from_name, city_to_code, city_to_name, airport_to_icao_code, airport_to_rf_code, airport_to_name, flight_nums, fare_code, fare_price) VALUES (104335, 'issued', '2022-06-23 03:25:00', 'AVIA CENTER LLC (MOSCOW)', 'dev_code', '2022-03-30 12:12:25.181211+03', 'invalid_operation_time', -3, 25688, 'Ivanov', 'Ivan', 'Ivanovich', '2001-08-16', 0, 25688, '00', '2215123123', NULL, NULL, 4, 'пенсионер', 'elderly', 'ПНС', 'Мужчины от 60 лет, Женщины от 55 лет', true, 73613, '5552139254210', 1, 1879, 'SU', 'VVO', '2022-02-22 23:20:00', 'SVO', '2022-02-23 08:25:00', 'THALSZ', NULL, 0, 0, 'VVO', 'Владивосток', 'UHWW', 'ВВО', 'Владивосток', 'MOW', 'Москва', 'UUEE', 'ШРМ', 'Шереметьево', 'SU1701, SU1711', 'PZZSOC', 740000);
INSERT INTO public.data_all (operation_id, type, "time", place, sender, transaction_time, validation_status, operation_time_timezone, passenger_id, surname, name, patronymic, birthdate, gender_id, passenger_document_id, passenger_document_type, passenger_document_number, passenger_document_disabled_number, passenger_document_large_number, passenger_type_id, passenger_type_name, passenger_type_type, ra_category, description, is_quota, ticket_id, ticket_number, ticket_type, airline_route_id, airline_code, depart_place, depart_datetime, arrive_place, arrive_datetime, pnr_id, operating_airline_code, depart_datetime_timezone, arrive_datetime_timezone, city_from_code, city_from_name, airport_from_icao_code, airport_from_rf_code, airport_from_name, city_to_code, city_to_name, airport_to_icao_code, airport_to_rf_code, airport_to_name, flight_nums, fare_code, fare_price) VALUES (104170, 'used', '2022-03-23 03:25:00', 'AVIA CENTER LLC (MOSCOW)', '', '2022-03-03 13:30:33.212388+03', NULL, 0, 30695, 'Ivanov', 'Ivan', 'Ivanovich', '2015-08-16', 0, 30703, '04', '2215123123', 'MSE-2009N1065334', NULL, 8, 'ребенок инвалид от 0-12 лет', 'invalid_child', 'ИНВ-PБ', 'Ребенок инвалид от 0-12 лет с предоставлением места', true, 73475, '5552139254500', 1, 1858, 'SU', 'DYR', '2022-03-23 12:45:00', 'DME', '2022-03-23 11:25:00', 'THALSZ', 'FV', 0, 0, 'DYR', 'Анадырь', 'UHMA', 'АНЫ', 'Анадырь', 'MOW', 'Москва', 'UUDD', 'ДМД', 'Домодедово', 'SU1710(FV6290)', 'PZZSOC', 740000);
INSERT INTO public.data_all (operation_id, type, "time", place, sender, transaction_time, validation_status, operation_time_timezone, passenger_id, surname, name, patronymic, birthdate, gender_id, passenger_document_id, passenger_document_type, passenger_document_number, passenger_document_disabled_number, passenger_document_large_number, passenger_type_id, passenger_type_name, passenger_type_type, ra_category, description, is_quota, ticket_id, ticket_number, ticket_type, airline_route_id, airline_code, depart_place, depart_datetime, arrive_place, arrive_datetime, pnr_id, operating_airline_code, depart_datetime_timezone, arrive_datetime_timezone, city_from_code, city_from_name, airport_from_icao_code, airport_from_rf_code, airport_from_name, city_to_code, city_to_name, airport_to_icao_code, airport_to_rf_code, airport_to_name, flight_nums, fare_code, fare_price) VALUES (104331, 'issued', '2022-06-23 03:25:00', 'AVIA CENTER LLC (MOSCOW)', 'dev_code', '2022-03-30 12:11:59.506889+03', 'invalid_operation_time', -3, 25688, 'Ivanov', 'Ivan', 'Ivanovich', '2001-08-16', 0, 25688, '00', '2215123123', NULL, NULL, 4, 'пенсионер', 'elderly', 'ПНС', 'Мужчины от 60 лет, Женщины от 55 лет', true, 73609, '5552139254233', 1, 1880, 'SU', 'SVO', '2022-03-01 13:10:00', 'VVO', '2022-03-01 21:40:00', 'THALSZ', NULL, 0, 0, 'MOW', 'Москва', 'UUEE', 'ШРМ', 'Шереметьево', 'VVO', 'Владивосток', 'UHWW', 'ВВО', 'Владивосток', 'SU1700, SU1712', 'PZZSOC', 740000);
INSERT INTO public.data_all (operation_id, type, "time", place, sender, transaction_time, validation_status, operation_time_timezone, passenger_id, surname, name, patronymic, birthdate, gender_id, passenger_document_id, passenger_document_type, passenger_document_number, passenger_document_disabled_number, passenger_document_large_number, passenger_type_id, passenger_type_name, passenger_type_type, ra_category, description, is_quota, ticket_id, ticket_number, ticket_type, airline_route_id, airline_code, depart_place, depart_datetime, arrive_place, arrive_datetime, pnr_id, operating_airline_code, depart_datetime_timezone, arrive_datetime_timezone, city_from_code, city_from_name, airport_from_icao_code, airport_from_rf_code, airport_from_name, city_to_code, city_to_name, airport_to_icao_code, airport_to_rf_code, airport_to_name, flight_nums, fare_code, fare_price) VALUES (104331, 'issued', '2022-06-23 03:25:00', 'AVIA CENTER LLC (MOSCOW)', 'dev_code', '2022-03-30 12:11:59.506889+03', 'invalid_operation_time', -3, 25688, 'Ivanov', 'Ivan', 'Ivanovich', '2001-08-16', 0, 25688, '00', '2215123123', NULL, NULL, 4, 'пенсионер', 'elderly', 'ПНС', 'Мужчины от 60 лет, Женщины от 55 лет', true, 73609, '5552139254233', 1, 1879, 'SU', 'VVO', '2022-02-22 23:20:00', 'SVO', '2022-02-23 08:25:00', 'THALSZ', NULL, 0, 0, 'VVO', 'Владивосток', 'UHWW', 'ВВО', 'Владивосток', 'MOW', 'Москва', 'UUEE', 'ШРМ', 'Шереметьево', 'SU1701, SU1711', 'PZZSOC', 740000);
INSERT INTO public.data_all (operation_id, type, "time", place, sender, transaction_time, validation_status, operation_time_timezone, passenger_id, surname, name, patronymic, birthdate, gender_id, passenger_document_id, passenger_document_type, passenger_document_number, passenger_document_disabled_number, passenger_document_large_number, passenger_type_id, passenger_type_name, passenger_type_type, ra_category, description, is_quota, ticket_id, ticket_number, ticket_type, airline_route_id, airline_code, depart_place, depart_datetime, arrive_place, arrive_datetime, pnr_id, operating_airline_code, depart_datetime_timezone, arrive_datetime_timezone, city_from_code, city_from_name, airport_from_icao_code, airport_from_rf_code, airport_from_name, city_to_code, city_to_name, airport_to_icao_code, airport_to_rf_code, airport_to_name, flight_nums, fare_code, fare_price) VALUES (104337, 'issued', '2022-06-23 03:25:00', 'AVIA CENTER LLC (MOSCOW)', 'dev_code', '2022-03-30 12:14:52.991758+03', 'invalid_ticket', -3, 25688, 'Ivanov', 'Ivan', 'Ivanovich', '2001-08-16', 0, 25688, '00', '2215123123', NULL, NULL, 4, 'пенсионер', 'elderly', 'ПНС', 'Мужчины от 60 лет, Женщины от 55 лет', true, 73615, '5552139254210', 1, 1880, 'SU', 'SVO', '2022-03-01 13:10:00', 'VVO', '2022-03-01 21:40:00', 'THALSZ', NULL, 0, 0, 'MOW', 'Москва', 'UUEE', 'ШРМ', 'Шереметьево', 'VVO', 'Владивосток', 'UHWW', 'ВВО', 'Владивосток', 'SU1700, SU1712', 'PZZSOC', 740000);
INSERT INTO public.data_all (operation_id, type, "time", place, sender, transaction_time, validation_status, operation_time_timezone, passenger_id, surname, name, patronymic, birthdate, gender_id, passenger_document_id, passenger_document_type, passenger_document_number, passenger_document_disabled_number, passenger_document_large_number, passenger_type_id, passenger_type_name, passenger_type_type, ra_category, description, is_quota, ticket_id, ticket_number, ticket_type, airline_route_id, airline_code, depart_place, depart_datetime, arrive_place, arrive_datetime, pnr_id, operating_airline_code, depart_datetime_timezone, arrive_datetime_timezone, city_from_code, city_from_name, airport_from_icao_code, airport_from_rf_code, airport_from_name, city_to_code, city_to_name, airport_to_icao_code, airport_to_rf_code, airport_to_name, flight_nums, fare_code, fare_price) VALUES (104337, 'issued', '2022-06-23 03:25:00', 'AVIA CENTER LLC (MOSCOW)', 'dev_code', '2022-03-30 12:14:52.991758+03', 'invalid_ticket', -3, 25688, 'Ivanov', 'Ivan', 'Ivanovich', '2001-08-16', 0, 25688, '00', '2215123123', NULL, NULL, 4, 'пенсионер', 'elderly', 'ПНС', 'Мужчины от 60 лет, Женщины от 55 лет', true, 73615, '5552139254210', 1, 1879, 'SU', 'VVO', '2022-02-22 23:20:00', 'SVO', '2022-02-23 08:25:00', 'THALSZ', NULL, 0, 0, 'VVO', 'Владивосток', 'UHWW', 'ВВО', 'Владивосток', 'MOW', 'Москва', 'UUEE', 'ШРМ', 'Шереметьево', 'SU1701, SU1711', 'PZZSOC', 740000);
INSERT INTO public.data_all (operation_id, type, "time", place, sender, transaction_time, validation_status, operation_time_timezone, passenger_id, surname, name, patronymic, birthdate, gender_id, passenger_document_id, passenger_document_type, passenger_document_number, passenger_document_disabled_number, passenger_document_large_number, passenger_type_id, passenger_type_name, passenger_type_type, ra_category, description, is_quota, ticket_id, ticket_number, ticket_type, airline_route_id, airline_code, depart_place, depart_datetime, arrive_place, arrive_datetime, pnr_id, operating_airline_code, depart_datetime_timezone, arrive_datetime_timezone, city_from_code, city_from_name, airport_from_icao_code, airport_from_rf_code, airport_from_name, city_to_code, city_to_name, airport_to_icao_code, airport_to_rf_code, airport_to_name, flight_nums, fare_code, fare_price) VALUES (104325, 'issued', '2022-06-23 03:25:00', 'AVIA CENTER LLC (MOSCOW)', 'dev_code', '2022-03-30 11:13:51.395024+03', 'invalid_operation_time', -3, 25688, 'Ivanov', 'Ivan', 'Ivanovich', '2001-08-16', 0, 25688, '00', '2215123123', NULL, NULL, 4, 'пенсионер', 'elderly', 'ПНС', 'Мужчины от 60 лет, Женщины от 55 лет', true, 73603, '5552139254231', 1, 1880, 'SU', 'SVO', '2022-03-01 13:10:00', 'VVO', '2022-03-01 21:40:00', 'THALSZ', NULL, 0, 0, 'MOW', 'Москва', 'UUEE', 'ШРМ', 'Шереметьево', 'VVO', 'Владивосток', 'UHWW', 'ВВО', 'Владивосток', 'SU1700, SU1712', 'PZZSOC', 740000);
INSERT INTO public.data_all (operation_id, type, "time", place, sender, transaction_time, validation_status, operation_time_timezone, passenger_id, surname, name, patronymic, birthdate, gender_id, passenger_document_id, passenger_document_type, passenger_document_number, passenger_document_disabled_number, passenger_document_large_number, passenger_type_id, passenger_type_name, passenger_type_type, ra_category, description, is_quota, ticket_id, ticket_number, ticket_type, airline_route_id, airline_code, depart_place, depart_datetime, arrive_place, arrive_datetime, pnr_id, operating_airline_code, depart_datetime_timezone, arrive_datetime_timezone, city_from_code, city_from_name, airport_from_icao_code, airport_from_rf_code, airport_from_name, city_to_code, city_to_name, airport_to_icao_code, airport_to_rf_code, airport_to_name, flight_nums, fare_code, fare_price) VALUES (104325, 'issued', '2022-06-23 03:25:00', 'AVIA CENTER LLC (MOSCOW)', 'dev_code', '2022-03-30 11:13:51.395024+03', 'invalid_operation_time', -3, 25688, 'Ivanov', 'Ivan', 'Ivanovich', '2001-08-16', 0, 25688, '00', '2215123123', NULL, NULL, 4, 'пенсионер', 'elderly', 'ПНС', 'Мужчины от 60 лет, Женщины от 55 лет', true, 73603, '5552139254231', 1, 1879, 'SU', 'VVO', '2022-02-22 23:20:00', 'SVO', '2022-02-23 08:25:00', 'THALSZ', NULL, 0, 0, 'VVO', 'Владивосток', 'UHWW', 'ВВО', 'Владивосток', 'MOW', 'Москва', 'UUEE', 'ШРМ', 'Шереметьево', 'SU1701, SU1711', 'PZZSOC', 740000);

CREATE TABLE public.accounts (
                                 account_id integer NOT NULL,
                                 login character varying NOT NULL,
                                 password character varying NOT NULL
);


ALTER TABLE public.accounts OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 57363)
-- Name: accounts_account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.accounts ALTER COLUMN account_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.accounts_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3312 (class 0 OID 57364)
-- Dependencies: 213
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.accounts (account_id, login, password) OVERRIDING SYSTEM VALUE VALUES (8, 'admin', '8C6976E5B5410415BDE908BD4DEE15DFB167A9C873FC4BB8A81F6F2AB448A918');
INSERT INTO public.accounts (account_id, login, password) OVERRIDING SYSTEM VALUE VALUES (9, 'root', '4813494D137E1631BBA301D5ACAB6E7BB7AA74CE1185D456565EF51D737677B2');
INSERT INTO public.accounts (account_id, login, password) OVERRIDING SYSTEM VALUE VALUES (10, 'login', '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D8');
INSERT INTO public.accounts (account_id, login, password) OVERRIDING SYSTEM VALUE VALUES (14, 'd', '18AC3E7343F016890C510E93F935261169D9E3F565436429830FAF0934F4F8E4');
INSERT INTO public.accounts (account_id, login, password) OVERRIDING SYSTEM VALUE VALUES (15, 'daniil', '64D184125AF92674D26B8C578102BEC5AC2EC8F618045780DC7D841103397F93');


--
-- TOC entry 3319 (class 0 OID 0)
-- Dependencies: 212
-- Name: accounts_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_account_id_seq', 15, true);


--
-- TOC entry 3171 (class 2606 OID 57370)
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (account_id);