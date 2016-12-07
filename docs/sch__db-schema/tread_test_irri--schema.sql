--- Test Repository for Agri Data (TReAD)
--- v0.0.3_revised-database-form-1
--- Abraham Darius S. Llave | 2016-Dec-08 0229
--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

-- Started on 2016-12-08 02:24:12

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE tread_irri_testdb;
--
-- TOC entry 2222 (class 1262 OID 149059)
-- Name: tread_irri_testdb; Type: DATABASE; Schema: -; Owner: tread_admin
--

CREATE DATABASE tread_irri_testdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';


ALTER DATABASE tread_irri_testdb OWNER TO tread_admin;

\connect tread_irri_testdb

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 7 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2223 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 2 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2225 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 1 (class 3079 OID 149060)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 2226 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 182 (class 1259 OID 149087)
-- Name: country; Type: TABLE; Schema: public; Owner: tread_admin
--

CREATE TABLE country (
    country_id character varying(2) NOT NULL,
    country_shorthand character varying(100),
    country_formal character varying(255),
    descr text
);


ALTER TABLE country OWNER TO tread_admin;

--
-- TOC entry 2227 (class 0 OID 0)
-- Dependencies: 182
-- Name: TABLE country; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON TABLE country IS 'The list of countries, primarily identified by two-character representation, perhaps, from ISO-3166 standard.';


--
-- TOC entry 2228 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN country.country_id; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN country.country_id IS 'Two-character representation of a country, perhaps ISO-3166 standard ';


--
-- TOC entry 2229 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN country.country_shorthand; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN country.country_shorthand IS 'Popular English name of the country';


--
-- TOC entry 2230 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN country.country_formal; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN country.country_formal IS 'Formal name of the country, ex  "Federal Republic of Germany"';


--
-- TOC entry 183 (class 1259 OID 149111)
-- Name: crop; Type: TABLE; Schema: public; Owner: tread_admin
--

CREATE TABLE crop (
    crop_id character varying(50) NOT NULL,
    friendly_name character varying(75),
    genus character varying(50),
    species character varying(50),
    descr text
);


ALTER TABLE crop OWNER TO tread_admin;

--
-- TOC entry 2231 (class 0 OID 0)
-- Dependencies: 183
-- Name: TABLE crop; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON TABLE crop IS 'Contains crop information.';


--
-- TOC entry 2232 (class 0 OID 0)
-- Dependencies: 183
-- Name: COLUMN crop.crop_id; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN crop.crop_id IS 'Common name for a crop. Use underscore instead of white space.';


--
-- TOC entry 2233 (class 0 OID 0)
-- Dependencies: 183
-- Name: COLUMN crop.friendly_name; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN crop.friendly_name IS 'A more friendly name of the crop. Usually reserved for displaying on information systems.';


--
-- TOC entry 2234 (class 0 OID 0)
-- Dependencies: 183
-- Name: COLUMN crop.genus; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN crop.genus IS 'Part of scientific name';


--
-- TOC entry 2235 (class 0 OID 0)
-- Dependencies: 183
-- Name: COLUMN crop.species; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN crop.species IS 'Part of scientific name';


--
-- TOC entry 185 (class 1259 OID 149165)
-- Name: district; Type: TABLE; Schema: public; Owner: tread_admin
--

CREATE TABLE district (
    district_id integer NOT NULL,
    district_str character varying(50) NOT NULL,
    country_id_fk character(2) NOT NULL,
    friendly_name character varying(255) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE district OWNER TO tread_admin;

--
-- TOC entry 2236 (class 0 OID 0)
-- Dependencies: 185
-- Name: TABLE district; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON TABLE district IS 'List district names as associated with a country';


--
-- TOC entry 2237 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN district.district_id; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN district.district_id IS 'Internal representation of a district with respect to a country.';


--
-- TOC entry 2238 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN district.district_str; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN district.district_str IS 'Both machine and human-friendly identifier for an entry';


--
-- TOC entry 2239 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN district.country_id_fk; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN district.country_id_fk IS 'References entries in the country table';


--
-- TOC entry 2240 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN district.friendly_name; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN district.friendly_name IS 'The village''s friendly name.';


--
-- TOC entry 184 (class 1259 OID 149163)
-- Name: district_district_id_seq; Type: SEQUENCE; Schema: public; Owner: tread_admin
--

CREATE SEQUENCE district_district_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE district_district_id_seq OWNER TO tread_admin;

--
-- TOC entry 2241 (class 0 OID 0)
-- Dependencies: 184
-- Name: district_district_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tread_admin
--

ALTER SEQUENCE district_district_id_seq OWNED BY district.district_id;


--
-- TOC entry 188 (class 1259 OID 149207)
-- Name: fn; Type: TABLE; Schema: public; Owner: tread_admin
--

CREATE TABLE fn (
    fn_id integer NOT NULL,
    fn_str character varying(50) NOT NULL,
    friendly_name character varying(255) NOT NULL,
    country_id_fk character varying(2) NOT NULL
);


ALTER TABLE fn OWNER TO tread_admin;

--
-- TOC entry 2242 (class 0 OID 0)
-- Dependencies: 188
-- Name: TABLE fn; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON TABLE fn IS 'Lists ''fn'' - perhaps person?';


--
-- TOC entry 2243 (class 0 OID 0)
-- Dependencies: 188
-- Name: COLUMN fn.fn_str; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN fn.fn_str IS 'Machine-friendly ''FN'' format.';


--
-- TOC entry 2244 (class 0 OID 0)
-- Dependencies: 188
-- Name: COLUMN fn.friendly_name; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN fn.friendly_name IS 'People-friendly version of the name. The one that''s being submitted to DB.';


--
-- TOC entry 2245 (class 0 OID 0)
-- Dependencies: 188
-- Name: COLUMN fn.country_id_fk; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN fn.country_id_fk IS 'To reference entries in country table.';


--
-- TOC entry 187 (class 1259 OID 149205)
-- Name: fn_fn_id_seq; Type: SEQUENCE; Schema: public; Owner: tread_admin
--

CREATE SEQUENCE fn_fn_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fn_fn_id_seq OWNER TO tread_admin;

--
-- TOC entry 2246 (class 0 OID 0)
-- Dependencies: 187
-- Name: fn_fn_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tread_admin
--

ALTER SEQUENCE fn_fn_id_seq OWNED BY fn.fn_id;


--
-- TOC entry 189 (class 1259 OID 149220)
-- Name: fno; Type: TABLE; Schema: public; Owner: tread_admin
--

CREATE TABLE fno (
    fno_id character(1) NOT NULL,
    fno_friendly character varying(50) NOT NULL,
    descr text
);


ALTER TABLE fno OWNER TO tread_admin;

--
-- TOC entry 2247 (class 0 OID 0)
-- Dependencies: 189
-- Name: TABLE fno; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON TABLE fno IS 'Unidentified entity. Inquiry to resolve this issue effectively turned down. So far, what we know is that this should be just one uppercase character.';


--
-- TOC entry 2248 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN fno.fno_id; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN fno.fno_id IS 'Primary key - a single character';


--
-- TOC entry 2249 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN fno.fno_friendly; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN fno.fno_friendly IS 'Perhaps an explanation or extension of the fno_id.';


--
-- TOC entry 194 (class 1259 OID 149457)
-- Name: record; Type: TABLE; Schema: public; Owner: tread_admin
--

CREATE TABLE record (
    record_id integer NOT NULL,
    country_id_fk character(2) NOT NULL,
    year integer NOT NULL,
    season_id_fk character varying(20) NOT NULL,
    fno_id_fk character(1) NOT NULL,
    district_id_fk integer NOT NULL,
    village_id_fk integer NOT NULL,
    lat numeric(10,6) NOT NULL,
    longt numeric(10,6) NOT NULL,
    fn_id_fk integer NOT NULL,
    fa numeric(10,3) NOT NULL,
    ces character varying(20) NOT NULL,
    seed_rate integer NOT NULL,
    cen_date date NOT NULL,
    ha_date date NOT NULL,
    var_name character varying(50) NOT NULL,
    pre_crop character varying(50) NOT NULL,
    fallow_period integer NOT NULL,
    soil_prop_fk character varying(4) NOT NULL,
    yield numeric(10,4)
);


ALTER TABLE record OWNER TO tread_admin;

--
-- TOC entry 2250 (class 0 OID 0)
-- Dependencies: 194
-- Name: TABLE record; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON TABLE record IS 'The whole row, in a (raw) spreadsheet.';


--
-- TOC entry 2251 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN record.record_id; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN record.record_id IS 'Number denoting row number, serves as primary key';


--
-- TOC entry 2252 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN record.country_id_fk; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN record.country_id_fk IS 'References entries in country table.';


--
-- TOC entry 2253 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN record.season_id_fk; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN record.season_id_fk IS 'Ensures refernce to entries in season table';


--
-- TOC entry 2254 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN record.fno_id_fk; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN record.fno_id_fk IS 'Ensures reference to fno table';


--
-- TOC entry 2255 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN record.district_id_fk; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN record.district_id_fk IS 'Ensures reference to entries in district table.';


--
-- TOC entry 2256 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN record.village_id_fk; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN record.village_id_fk IS 'Ensures reference to entries in village table.';


--
-- TOC entry 2257 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN record.lat; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN record.lat IS 'Latitude of GPS coordinates';


--
-- TOC entry 2258 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN record.longt; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN record.longt IS 'Longitude part of GPS coordinates.';


--
-- TOC entry 2259 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN record.fn_id_fk; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN record.fn_id_fk IS 'Ensures reference to fn table';


--
-- TOC entry 2260 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN record.fa; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN record.fa IS 'Unknown purposes';


--
-- TOC entry 2261 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN record.ha_date; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN record.ha_date IS 'Perhaps harvest date?';


--
-- TOC entry 2262 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN record.var_name; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN record.var_name IS 'Link to variety table';


--
-- TOC entry 2263 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN record.pre_crop; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN record.pre_crop IS 'Link to crop table';


--
-- TOC entry 190 (class 1259 OID 149230)
-- Name: season; Type: TABLE; Schema: public; Owner: tread_admin
--

CREATE TABLE season (
    season_id character varying(20) NOT NULL,
    friendly_name character varying(255) NOT NULL,
    descr text
);


ALTER TABLE season OWNER TO tread_admin;

--
-- TOC entry 2264 (class 0 OID 0)
-- Dependencies: 190
-- Name: TABLE season; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON TABLE season IS 'Planting seasons.';


--
-- TOC entry 2265 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN season.season_id; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN season.season_id IS 'Identifying season';


--
-- TOC entry 2266 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN season.friendly_name; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN season.friendly_name IS 'User-friendly name of the season concerned.';


--
-- TOC entry 191 (class 1259 OID 149321)
-- Name: seedmethod; Type: TABLE; Schema: public; Owner: tread_admin
--

CREATE TABLE seedmethod (
    seedmethod_id character varying(20) NOT NULL,
    friendly_name character varying(255) NOT NULL,
    descr text
);


ALTER TABLE seedmethod OWNER TO tread_admin;

--
-- TOC entry 2267 (class 0 OID 0)
-- Dependencies: 191
-- Name: TABLE seedmethod; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON TABLE seedmethod IS 'Planting method. Default/limited to usual suspects: Transplanted and direct-seeded';


--
-- TOC entry 2268 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN seedmethod.seedmethod_id; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN seedmethod.seedmethod_id IS 'Identifying method';


--
-- TOC entry 2269 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN seedmethod.friendly_name; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN seedmethod.friendly_name IS 'User-friendly name of the method concerned';


--
-- TOC entry 192 (class 1259 OID 149331)
-- Name: soilprop; Type: TABLE; Schema: public; Owner: tread_admin
--

CREATE TABLE soilprop (
    soilprop_id character varying(4) NOT NULL,
    friendly_name character varying(20) NOT NULL,
    descr text
);


ALTER TABLE soilprop OWNER TO tread_admin;

--
-- TOC entry 2270 (class 0 OID 0)
-- Dependencies: 192
-- Name: TABLE soilprop; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON TABLE soilprop IS 'Apparently, preparations in consideration to the stress conditions.';


--
-- TOC entry 2271 (class 0 OID 0)
-- Dependencies: 192
-- Name: COLUMN soilprop.soilprop_id; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN soilprop.soilprop_id IS 'Primary key/machine-friendly name';


--
-- TOC entry 2272 (class 0 OID 0)
-- Dependencies: 192
-- Name: COLUMN soilprop.friendly_name; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN soilprop.friendly_name IS 'User-friendly name';


--
-- TOC entry 193 (class 1259 OID 149341)
-- Name: variety; Type: TABLE; Schema: public; Owner: tread_admin
--

CREATE TABLE variety (
    variety_id character varying(50) NOT NULL,
    crop_id_fk character varying(50) NOT NULL,
    friendly_name character varying(100) NOT NULL
);


ALTER TABLE variety OWNER TO tread_admin;

--
-- TOC entry 2273 (class 0 OID 0)
-- Dependencies: 193
-- Name: TABLE variety; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON TABLE variety IS 'Lists variety names  of a plant.

Assumption: We still don''t consider the scenario where different names refer to a rice-crop. i.e., like IR-64 for ''PSC Rc-64''';


--
-- TOC entry 2274 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN variety.crop_id_fk; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN variety.crop_id_fk IS 'References entries in crop table';


--
-- TOC entry 2275 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN variety.friendly_name; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN variety.friendly_name IS 'friendly_name of the variety';


--
-- TOC entry 186 (class 1259 OID 149182)
-- Name: village; Type: TABLE; Schema: public; Owner: tread_admin
--

CREATE TABLE village (
    village_id integer NOT NULL,
    village_str character varying(50) NOT NULL,
    country_id_fk character(2) NOT NULL,
    friendly_name character varying(255) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE village OWNER TO tread_admin;

--
-- TOC entry 2276 (class 0 OID 0)
-- Dependencies: 186
-- Name: TABLE village; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON TABLE village IS 'List village names as associated with a country';


--
-- TOC entry 2277 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN village.village_id; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN village.village_id IS 'Internal representation of a village with respect to a country.';


--
-- TOC entry 2278 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN village.village_str; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN village.village_str IS 'Both machine and human-friendly identifier for an entry';


--
-- TOC entry 2279 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN village.country_id_fk; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN village.country_id_fk IS 'References entries in the country table';


--
-- TOC entry 2280 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN village.friendly_name; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN village.friendly_name IS 'The village''s friendly name.';


--
-- TOC entry 2030 (class 2604 OID 149168)
-- Name: district_id; Type: DEFAULT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY district ALTER COLUMN district_id SET DEFAULT nextval('district_district_id_seq'::regclass);


--
-- TOC entry 2033 (class 2604 OID 149210)
-- Name: fn_id; Type: DEFAULT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY fn ALTER COLUMN fn_id SET DEFAULT nextval('fn_fn_id_seq'::regclass);


--
-- TOC entry 2205 (class 0 OID 149087)
-- Dependencies: 182
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: tread_admin
--

COPY country (country_id, country_shorthand, country_formal, descr) FROM stdin;
IN	India	Republic of India	\N
ID	Indonesia	Republic of Indonesia	\N
TH	Thailand	Kingdom of Thailand	\N
VN	Vietnam	Socialist Republic of Vietnam	\N
\.


--
-- TOC entry 2206 (class 0 OID 149111)
-- Dependencies: 183
-- Data for Name: crop; Type: TABLE DATA; Schema: public; Owner: tread_admin
--

COPY crop (crop_id, friendly_name, genus, species, descr) FROM stdin;
rice	Rice	oryza	sativa	\N
\.


--
-- TOC entry 2208 (class 0 OID 149165)
-- Dependencies: 185
-- Data for Name: district; Type: TABLE DATA; Schema: public; Owner: tread_admin
--

COPY district (district_id, district_str, country_id_fk, friendly_name) FROM stdin;
999000	unspecified	ID	unspecified
999001	unspecified	IN	unspecified
999002	unspecified	VN	unspecified
999003	unspecified	TH	unspecified
\.


--
-- TOC entry 2281 (class 0 OID 0)
-- Dependencies: 184
-- Name: district_district_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tread_admin
--

SELECT pg_catalog.setval('district_district_id_seq', 1, false);


--
-- TOC entry 2211 (class 0 OID 149207)
-- Dependencies: 188
-- Data for Name: fn; Type: TABLE DATA; Schema: public; Owner: tread_admin
--

COPY fn (fn_id, fn_str, friendly_name, country_id_fk) FROM stdin;
\.


--
-- TOC entry 2282 (class 0 OID 0)
-- Dependencies: 187
-- Name: fn_fn_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tread_admin
--

SELECT pg_catalog.setval('fn_fn_id_seq', 1, false);


--
-- TOC entry 2212 (class 0 OID 149220)
-- Dependencies: 189
-- Data for Name: fno; Type: TABLE DATA; Schema: public; Owner: tread_admin
--

COPY fno (fno_id, fno_friendly, descr) FROM stdin;
\.


--
-- TOC entry 2217 (class 0 OID 149457)
-- Dependencies: 194
-- Data for Name: record; Type: TABLE DATA; Schema: public; Owner: tread_admin
--

COPY record (record_id, country_id_fk, year, season_id_fk, fno_id_fk, district_id_fk, village_id_fk, lat, longt, fn_id_fk, fa, ces, seed_rate, cen_date, ha_date, var_name, pre_crop, fallow_period, soil_prop_fk, yield) FROM stdin;
\.


--
-- TOC entry 2213 (class 0 OID 149230)
-- Dependencies: 190
-- Data for Name: season; Type: TABLE DATA; Schema: public; Owner: tread_admin
--

COPY season (season_id, friendly_name, descr) FROM stdin;
dry	Dry Season	\N
wet	Wet season	\N
\.


--
-- TOC entry 2214 (class 0 OID 149321)
-- Dependencies: 191
-- Data for Name: seedmethod; Type: TABLE DATA; Schema: public; Owner: tread_admin
--

COPY seedmethod (seedmethod_id, friendly_name, descr) FROM stdin;
\.


--
-- TOC entry 2215 (class 0 OID 149331)
-- Dependencies: 192
-- Data for Name: soilprop; Type: TABLE DATA; Schema: public; Owner: tread_admin
--

COPY soilprop (soilprop_id, friendly_name, descr) FROM stdin;
salt	Salinity	\N
subm	Submergence	\N
drou	Drought	\N
upld	Upland	\N
clic	Climate Change	\N
unsp	unspecified	\N
\.


--
-- TOC entry 2216 (class 0 OID 149341)
-- Dependencies: 193
-- Data for Name: variety; Type: TABLE DATA; Schema: public; Owner: tread_admin
--

COPY variety (variety_id, crop_id_fk, friendly_name) FROM stdin;
\.


--
-- TOC entry 2209 (class 0 OID 149182)
-- Dependencies: 186
-- Data for Name: village; Type: TABLE DATA; Schema: public; Owner: tread_admin
--

COPY village (village_id, village_str, country_id_fk, friendly_name) FROM stdin;
999000	unspecified	ID	unspecified
999001	unspecified	IN	unspecified
999002	unspecified	TH	unspecified
9999003	unspecified	VN	unspecified
\.


--
-- TOC entry 2035 (class 2606 OID 149098)
-- Name: country__formal__unique; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY country
    ADD CONSTRAINT country__formal__unique UNIQUE (country_formal);


--
-- TOC entry 2037 (class 2606 OID 149100)
-- Name: country__id__pk; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY country
    ADD CONSTRAINT country__id__pk PRIMARY KEY (country_id);


--
-- TOC entry 2283 (class 0 OID 0)
-- Dependencies: 2037
-- Name: CONSTRAINT country__id__pk ON country; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON CONSTRAINT country__id__pk ON country IS 'Make the two-character representation as this table''s primary key';


--
-- TOC entry 2039 (class 2606 OID 149096)
-- Name: country__shorthand__unique; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY country
    ADD CONSTRAINT country__shorthand__unique UNIQUE (country_shorthand);


--
-- TOC entry 2041 (class 2606 OID 149120)
-- Name: crop__genus-species__unique; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY crop
    ADD CONSTRAINT "crop__genus-species__unique" UNIQUE (genus, species);


--
-- TOC entry 2043 (class 2606 OID 149118)
-- Name: crop__id__pk; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY crop
    ADD CONSTRAINT crop__id__pk PRIMARY KEY (crop_id);


--
-- TOC entry 2045 (class 2606 OID 149171)
-- Name: district__id__pk; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY district
    ADD CONSTRAINT district__id__pk PRIMARY KEY (district_id);


--
-- TOC entry 2047 (class 2606 OID 149173)
-- Name: district__str_country_id_fk__uniq; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY district
    ADD CONSTRAINT district__str_country_id_fk__uniq UNIQUE (district_str, country_id_fk);


--
-- TOC entry 2284 (class 0 OID 0)
-- Dependencies: 2047
-- Name: CONSTRAINT district__str_country_id_fk__uniq ON district; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON CONSTRAINT district__str_country_id_fk__uniq ON district IS 'Prevents occurence of the same entries as far as machine processing is concerned.';


--
-- TOC entry 2053 (class 2606 OID 149212)
-- Name: fn__id__pk; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY fn
    ADD CONSTRAINT fn__id__pk PRIMARY KEY (fn_id);


--
-- TOC entry 2055 (class 2606 OID 149214)
-- Name: fn__str_friendlyname__unique; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY fn
    ADD CONSTRAINT fn__str_friendlyname__unique UNIQUE (country_id_fk, fn_str);


--
-- TOC entry 2057 (class 2606 OID 149229)
-- Name: fno__friendly__uniq; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY fno
    ADD CONSTRAINT fno__friendly__uniq UNIQUE (fno_friendly);


--
-- TOC entry 2059 (class 2606 OID 149227)
-- Name: fno__id__pk; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY fno
    ADD CONSTRAINT fno__id__pk PRIMARY KEY (fno_id);


--
-- TOC entry 2076 (class 2606 OID 149461)
-- Name: record__id__pk; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY record
    ADD CONSTRAINT record__id__pk PRIMARY KEY (record_id);


--
-- TOC entry 2061 (class 2606 OID 149239)
-- Name: season__friendly_name__unique; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY season
    ADD CONSTRAINT season__friendly_name__unique UNIQUE (friendly_name);


--
-- TOC entry 2063 (class 2606 OID 149237)
-- Name: season__id__pk; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY season
    ADD CONSTRAINT season__id__pk PRIMARY KEY (season_id);


--
-- TOC entry 2065 (class 2606 OID 149330)
-- Name: seedmethod__friendly_name__unique; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY seedmethod
    ADD CONSTRAINT seedmethod__friendly_name__unique UNIQUE (friendly_name);


--
-- TOC entry 2067 (class 2606 OID 149328)
-- Name: seedmethod__id__pk; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY seedmethod
    ADD CONSTRAINT seedmethod__id__pk PRIMARY KEY (seedmethod_id);


--
-- TOC entry 2069 (class 2606 OID 149340)
-- Name: soilprop__friendly_name__uniq; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY soilprop
    ADD CONSTRAINT soilprop__friendly_name__uniq UNIQUE (friendly_name);


--
-- TOC entry 2071 (class 2606 OID 149338)
-- Name: soilprop__id__pk; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY soilprop
    ADD CONSTRAINT soilprop__id__pk PRIMARY KEY (soilprop_id);


--
-- TOC entry 2073 (class 2606 OID 149345)
-- Name: variety__id__pk; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY variety
    ADD CONSTRAINT variety__id__pk PRIMARY KEY (variety_id);


--
-- TOC entry 2049 (class 2606 OID 149187)
-- Name: village__id__pk; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY village
    ADD CONSTRAINT village__id__pk PRIMARY KEY (village_id);


--
-- TOC entry 2051 (class 2606 OID 149189)
-- Name: village__str_country_id_fk__uniq; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY village
    ADD CONSTRAINT village__str_country_id_fk__uniq UNIQUE (village_str, country_id_fk);


--
-- TOC entry 2285 (class 0 OID 0)
-- Dependencies: 2051
-- Name: CONSTRAINT village__str_country_id_fk__uniq ON village; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON CONSTRAINT village__str_country_id_fk__uniq ON village IS 'Prevents occurence of the same entries as far as machine processing is concerned.';


--
-- TOC entry 2074 (class 1259 OID 149512)
-- Name: fki_record__fn_id__fk; Type: INDEX; Schema: public; Owner: tread_admin
--

CREATE INDEX fki_record__fn_id__fk ON record USING btree (fn_id_fk);


--
-- TOC entry 2077 (class 2606 OID 149174)
-- Name: district__country_id__fk; Type: FK CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY district
    ADD CONSTRAINT district__country_id__fk FOREIGN KEY (country_id_fk) REFERENCES country(country_id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2079 (class 2606 OID 149215)
-- Name: fn__country_id__fk; Type: FK CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY fn
    ADD CONSTRAINT fn__country_id__fk FOREIGN KEY (country_id_fk) REFERENCES country(country_id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2082 (class 2606 OID 149462)
-- Name: record__ces__fk; Type: FK CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY record
    ADD CONSTRAINT record__ces__fk FOREIGN KEY (ces) REFERENCES seedmethod(seedmethod_id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2083 (class 2606 OID 149467)
-- Name: record__country_id__fk; Type: FK CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY record
    ADD CONSTRAINT record__country_id__fk FOREIGN KEY (country_id_fk) REFERENCES country(country_id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2084 (class 2606 OID 149472)
-- Name: record__district__fk; Type: FK CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY record
    ADD CONSTRAINT record__district__fk FOREIGN KEY (district_id_fk) REFERENCES district(district_id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2081 (class 2606 OID 149507)
-- Name: record__fn_id__fk; Type: FK CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY record
    ADD CONSTRAINT record__fn_id__fk FOREIGN KEY (fn_id_fk) REFERENCES fn(fn_id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2286 (class 0 OID 0)
-- Dependencies: 2081
-- Name: CONSTRAINT record__fn_id__fk ON record; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON CONSTRAINT record__fn_id__fk ON record IS 'Ensures reference to fn table';


--
-- TOC entry 2085 (class 2606 OID 149477)
-- Name: record__fno_id__fk; Type: FK CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY record
    ADD CONSTRAINT record__fno_id__fk FOREIGN KEY (fno_id_fk) REFERENCES fno(fno_id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2086 (class 2606 OID 149482)
-- Name: record__pre_crop__fk; Type: FK CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY record
    ADD CONSTRAINT record__pre_crop__fk FOREIGN KEY (pre_crop) REFERENCES crop(crop_id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2087 (class 2606 OID 149487)
-- Name: record__season_id__fk; Type: FK CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY record
    ADD CONSTRAINT record__season_id__fk FOREIGN KEY (season_id_fk) REFERENCES season(season_id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2088 (class 2606 OID 149492)
-- Name: record__soil_prop__fk; Type: FK CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY record
    ADD CONSTRAINT record__soil_prop__fk FOREIGN KEY (soil_prop_fk) REFERENCES soilprop(soilprop_id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2089 (class 2606 OID 149497)
-- Name: record__var_name__fk; Type: FK CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY record
    ADD CONSTRAINT record__var_name__fk FOREIGN KEY (var_name) REFERENCES variety(variety_id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2090 (class 2606 OID 149502)
-- Name: record__village_id__fk; Type: FK CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY record
    ADD CONSTRAINT record__village_id__fk FOREIGN KEY (village_id_fk) REFERENCES village(village_id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2080 (class 2606 OID 149346)
-- Name: variety__crop_id__fk; Type: FK CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY variety
    ADD CONSTRAINT variety__crop_id__fk FOREIGN KEY (crop_id_fk) REFERENCES crop(crop_id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2078 (class 2606 OID 149190)
-- Name: village__country_id__fk; Type: FK CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY village
    ADD CONSTRAINT village__country_id__fk FOREIGN KEY (country_id_fk) REFERENCES country(country_id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2224 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-12-08 02:24:13

--
-- PostgreSQL database dump complete
--

