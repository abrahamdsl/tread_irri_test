--- Test Repository for Agri Data (TReAD)
--- v0.1.0_alpha-release-unstable
--- Abraham Darius S. Llave | 2016-Dec-08 1350
--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
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
-- Name: TABLE country; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON TABLE country IS 'The list of countries, primarily identified by two-character representation, perhaps, from ISO-3166 standard.';


--
-- Name: COLUMN country.country_id; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN country.country_id IS 'Two-character representation of a country, perhaps ISO-3166 standard ';


--
-- Name: COLUMN country.country_shorthand; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN country.country_shorthand IS 'Popular English name of the country';


--
-- Name: COLUMN country.country_formal; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN country.country_formal IS 'Formal name of the country, ex  "Federal Republic of Germany"';


--
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
-- Name: TABLE crop; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON TABLE crop IS 'Contains crop information.';


--
-- Name: COLUMN crop.crop_id; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN crop.crop_id IS 'Common name for a crop. Use underscore instead of white space.';


--
-- Name: COLUMN crop.friendly_name; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN crop.friendly_name IS 'A more friendly name of the crop. Usually reserved for displaying on information systems.';


--
-- Name: COLUMN crop.genus; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN crop.genus IS 'Part of scientific name';


--
-- Name: COLUMN crop.species; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN crop.species IS 'Part of scientific name';


--
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
-- Name: TABLE district; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON TABLE district IS 'List district names as associated with a country';


--
-- Name: COLUMN district.district_id; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN district.district_id IS 'Internal representation of a district with respect to a country.';


--
-- Name: COLUMN district.district_str; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN district.district_str IS 'Both machine and human-friendly identifier for an entry';


--
-- Name: COLUMN district.country_id_fk; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN district.country_id_fk IS 'References entries in the country table';


--
-- Name: COLUMN district.friendly_name; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN district.friendly_name IS 'The village''s friendly name.';


--
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
-- Name: district_district_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tread_admin
--

ALTER SEQUENCE district_district_id_seq OWNED BY district.district_id;


--
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
-- Name: TABLE fn; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON TABLE fn IS 'Lists ''fn'' - perhaps person?';


--
-- Name: COLUMN fn.fn_str; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN fn.fn_str IS 'Machine-friendly ''FN'' format.';


--
-- Name: COLUMN fn.friendly_name; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN fn.friendly_name IS 'People-friendly version of the name. The one that''s being submitted to DB.';


--
-- Name: COLUMN fn.country_id_fk; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN fn.country_id_fk IS 'To reference entries in country table.';


--
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
-- Name: fn_fn_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tread_admin
--

ALTER SEQUENCE fn_fn_id_seq OWNED BY fn.fn_id;


--
-- Name: fno; Type: TABLE; Schema: public; Owner: tread_admin
--

CREATE TABLE fno (
    fno_id character(1) NOT NULL,
    fno_friendly character varying(50) NOT NULL,
    descr text
);


ALTER TABLE fno OWNER TO tread_admin;

--
-- Name: TABLE fno; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON TABLE fno IS 'Unidentified entity. Inquiry to resolve this issue effectively turned down. So far, what we know is that this should be just one uppercase character.';


--
-- Name: COLUMN fno.fno_id; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN fno.fno_id IS 'Primary key - a single character';


--
-- Name: COLUMN fno.fno_friendly; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN fno.fno_friendly IS 'Perhaps an explanation or extension of the fno_id.';


--
-- Name: record; Type: TABLE; Schema: public; Owner: tread_admin
--

CREATE TABLE record (
    record_id integer NOT NULL,
    country_id_fk character(2) NOT NULL,
    year integer NOT NULL,
    season_id_fk character varying(20) NOT NULL,
    fno character(1) NOT NULL,
    district character varying(255),
    village character varying(255),
    lat numeric(10,6) NOT NULL,
    longt numeric(10,6) NOT NULL,
    fn character varying(255) NOT NULL,
    fa numeric(10,3) NOT NULL,
    ces character varying(20) NOT NULL,
    seed_rate integer NOT NULL,
    cen_date date NOT NULL,
    ha_date date NOT NULL,
    var_name character varying(50) NOT NULL,
    pre_crop character varying(50) DEFAULT 'rice'::character varying NOT NULL,
    fallow_period integer NOT NULL,
    soil_prop_fk character varying(4) NOT NULL,
    yield numeric(10,4)
);


ALTER TABLE record OWNER TO tread_admin;

--
-- Name: TABLE record; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON TABLE record IS 'The whole row, in a (raw) spreadsheet.';


--
-- Name: COLUMN record.record_id; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN record.record_id IS 'Number denoting row number, serves as primary key';


--
-- Name: COLUMN record.country_id_fk; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN record.country_id_fk IS 'References entries in country table.';


--
-- Name: COLUMN record.season_id_fk; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN record.season_id_fk IS 'Ensures refernce to entries in season table';


--
-- Name: COLUMN record.lat; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN record.lat IS 'Latitude of GPS coordinates';


--
-- Name: COLUMN record.longt; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN record.longt IS 'Longitude part of GPS coordinates.';


--
-- Name: COLUMN record.fa; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN record.fa IS 'Unknown purposes';


--
-- Name: COLUMN record.ha_date; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN record.ha_date IS 'Perhaps harvest date?';


--
-- Name: COLUMN record.var_name; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN record.var_name IS 'Link to variety table';


--
-- Name: COLUMN record.pre_crop; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN record.pre_crop IS 'Link to crop table';


--
-- Name: season; Type: TABLE; Schema: public; Owner: tread_admin
--

CREATE TABLE season (
    season_id character varying(20) NOT NULL,
    friendly_name character varying(255) NOT NULL,
    descr text
);


ALTER TABLE season OWNER TO tread_admin;

--
-- Name: TABLE season; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON TABLE season IS 'Planting seasons.';


--
-- Name: COLUMN season.season_id; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN season.season_id IS 'Identifying season';


--
-- Name: COLUMN season.friendly_name; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN season.friendly_name IS 'User-friendly name of the season concerned.';


--
-- Name: seedmethod; Type: TABLE; Schema: public; Owner: tread_admin
--

CREATE TABLE seedmethod (
    seedmethod_id character varying(20) NOT NULL,
    friendly_name character varying(255) NOT NULL,
    descr text
);


ALTER TABLE seedmethod OWNER TO tread_admin;

--
-- Name: TABLE seedmethod; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON TABLE seedmethod IS 'Planting method. Default/limited to usual suspects: Transplanted and direct-seeded';


--
-- Name: COLUMN seedmethod.seedmethod_id; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN seedmethod.seedmethod_id IS 'Identifying method';


--
-- Name: COLUMN seedmethod.friendly_name; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN seedmethod.friendly_name IS 'User-friendly name of the method concerned';


--
-- Name: soilprop; Type: TABLE; Schema: public; Owner: tread_admin
--

CREATE TABLE soilprop (
    soilprop_id character varying(4) NOT NULL,
    friendly_name character varying(20) NOT NULL,
    descr text
);


ALTER TABLE soilprop OWNER TO tread_admin;

--
-- Name: TABLE soilprop; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON TABLE soilprop IS 'Apparently, preparations in consideration to the stress conditions.';


--
-- Name: COLUMN soilprop.soilprop_id; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN soilprop.soilprop_id IS 'Primary key/machine-friendly name';


--
-- Name: COLUMN soilprop.friendly_name; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN soilprop.friendly_name IS 'User-friendly name';


--
-- Name: variety; Type: TABLE; Schema: public; Owner: tread_admin
--

CREATE TABLE variety (
    variety_id character varying(50) NOT NULL,
    crop_id_fk character varying(50) NOT NULL,
    friendly_name character varying(100) NOT NULL
);


ALTER TABLE variety OWNER TO tread_admin;

--
-- Name: TABLE variety; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON TABLE variety IS 'Lists variety names  of a plant.

Assumption: We still don''t consider the scenario where different names refer to a rice-crop. i.e., like IR-64 for ''PSC Rc-64''';


--
-- Name: COLUMN variety.crop_id_fk; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN variety.crop_id_fk IS 'References entries in crop table';


--
-- Name: COLUMN variety.friendly_name; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN variety.friendly_name IS 'friendly_name of the variety';


--
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
-- Name: TABLE village; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON TABLE village IS 'List village names as associated with a country';


--
-- Name: COLUMN village.village_id; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN village.village_id IS 'Internal representation of a village with respect to a country.';


--
-- Name: COLUMN village.village_str; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN village.village_str IS 'Both machine and human-friendly identifier for an entry';


--
-- Name: COLUMN village.country_id_fk; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN village.country_id_fk IS 'References entries in the country table';


--
-- Name: COLUMN village.friendly_name; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON COLUMN village.friendly_name IS 'The village''s friendly name.';


--
-- Name: district_id; Type: DEFAULT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY district ALTER COLUMN district_id SET DEFAULT nextval('district_district_id_seq'::regclass);


--
-- Name: fn_id; Type: DEFAULT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY fn ALTER COLUMN fn_id SET DEFAULT nextval('fn_fn_id_seq'::regclass);


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: tread_admin
--

COPY country (country_id, country_shorthand, country_formal, descr) FROM stdin;
IN	India	Republic of India	\N
ID	Indonesia	Republic of Indonesia	\N
TH	Thailand	Kingdom of Thailand	\N
VN	Vietnam	Socialist Republic of Vietnam	\N
\.


--
-- Data for Name: crop; Type: TABLE DATA; Schema: public; Owner: tread_admin
--

COPY crop (crop_id, friendly_name, genus, species, descr) FROM stdin;
rice	Rice	oryza	sativa	\N
\.


--
-- Data for Name: district; Type: TABLE DATA; Schema: public; Owner: tread_admin
--

COPY district (district_id, district_str, country_id_fk, friendly_name) FROM stdin;
999000	unspecified	ID	unspecified
999001	unspecified	IN	unspecified
999002	unspecified	VN	unspecified
999003	unspecified	TH	unspecified
\.


--
-- Name: district_district_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tread_admin
--

SELECT pg_catalog.setval('district_district_id_seq', 1, false);


--
-- Data for Name: fn; Type: TABLE DATA; Schema: public; Owner: tread_admin
--

COPY fn (fn_id, fn_str, friendly_name, country_id_fk) FROM stdin;
1	acim	Acim	ID
\.


--
-- Name: fn_fn_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tread_admin
--

SELECT pg_catalog.setval('fn_fn_id_seq', 1, true);


--
-- Data for Name: fno; Type: TABLE DATA; Schema: public; Owner: tread_admin
--

COPY fno (fno_id, fno_friendly, descr) FROM stdin;
k	K	K
\.


--
-- Data for Name: record; Type: TABLE DATA; Schema: public; Owner: tread_admin
--

COPY record (record_id, country_id_fk, year, season_id_fk, fno, district, village, lat, longt, fn, fa, ces, seed_rate, cen_date, ha_date, var_name, pre_crop, fallow_period, soil_prop_fk, yield) FROM stdin;
1	ID	2013	wet	K	karawang	pulo jaya	-6.301750	107.477500	acim	4.500	transpl	800	2016-12-08	2017-03-08	ciherang	rice	3	none	10198.8413
2	ID	2015	wet	K	pulau ubin	chanhi	33.220000	23.222000	ABRAHAM	44.000	direct	434	2016-12-10	2016-12-17	ciherang	rice	98	salt	403.0000
3	ID	1900	wet	4	pulau ubin	chanhi	33.220000	181.220000	5	44.000	direct	434	2016-12-10	2016-12-10	ciherang	rice	98	subm	403.0000
\.


--
-- Data for Name: season; Type: TABLE DATA; Schema: public; Owner: tread_admin
--

COPY season (season_id, friendly_name, descr) FROM stdin;
dry	Dry Season	\N
wet	Wet season	\N
uns	Unspecified	This shouldn't be.
\.


--
-- Data for Name: seedmethod; Type: TABLE DATA; Schema: public; Owner: tread_admin
--

COPY seedmethod (seedmethod_id, friendly_name, descr) FROM stdin;
direct	Direct-seeded	\N
transpl	Transplanted	\N
\.


--
-- Data for Name: soilprop; Type: TABLE DATA; Schema: public; Owner: tread_admin
--

COPY soilprop (soilprop_id, friendly_name, descr) FROM stdin;
salt	Salinity	\N
subm	Submergence	\N
drou	Drought	\N
upld	Upland	\N
clic	Climate Change	\N
none	unspecified	\N
\.


--
-- Data for Name: variety; Type: TABLE DATA; Schema: public; Owner: tread_admin
--

COPY variety (variety_id, crop_id_fk, friendly_name) FROM stdin;
ciherang	rice	Ciherang
mekongga	rice	Mekongga
muncul	rice	Muncul
\.


--
-- Data for Name: village; Type: TABLE DATA; Schema: public; Owner: tread_admin
--

COPY village (village_id, village_str, country_id_fk, friendly_name) FROM stdin;
999000	unspecified	ID	unspecified
999001	unspecified	IN	unspecified
999002	unspecified	TH	unspecified
9999003	unspecified	VN	unspecified
\.


--
-- Name: country__formal__unique; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY country
    ADD CONSTRAINT country__formal__unique UNIQUE (country_formal);


--
-- Name: country__id__pk; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY country
    ADD CONSTRAINT country__id__pk PRIMARY KEY (country_id);


--
-- Name: CONSTRAINT country__id__pk ON country; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON CONSTRAINT country__id__pk ON country IS 'Make the two-character representation as this table''s primary key';


--
-- Name: country__shorthand__unique; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY country
    ADD CONSTRAINT country__shorthand__unique UNIQUE (country_shorthand);


--
-- Name: crop__genus-species__unique; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY crop
    ADD CONSTRAINT "crop__genus-species__unique" UNIQUE (genus, species);


--
-- Name: crop__id__pk; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY crop
    ADD CONSTRAINT crop__id__pk PRIMARY KEY (crop_id);


--
-- Name: district__id__pk; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY district
    ADD CONSTRAINT district__id__pk PRIMARY KEY (district_id);


--
-- Name: district__str_country_id_fk__uniq; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY district
    ADD CONSTRAINT district__str_country_id_fk__uniq UNIQUE (district_str, country_id_fk);


--
-- Name: CONSTRAINT district__str_country_id_fk__uniq ON district; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON CONSTRAINT district__str_country_id_fk__uniq ON district IS 'Prevents occurence of the same entries as far as machine processing is concerned.';


--
-- Name: fn__id__pk; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY fn
    ADD CONSTRAINT fn__id__pk PRIMARY KEY (fn_id);


--
-- Name: fn__str_friendlyname__unique; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY fn
    ADD CONSTRAINT fn__str_friendlyname__unique UNIQUE (country_id_fk, fn_str);


--
-- Name: fno__friendly__uniq; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY fno
    ADD CONSTRAINT fno__friendly__uniq UNIQUE (fno_friendly);


--
-- Name: fno__id__pk; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY fno
    ADD CONSTRAINT fno__id__pk PRIMARY KEY (fno_id);


--
-- Name: record__id__pk; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY record
    ADD CONSTRAINT record__id__pk PRIMARY KEY (record_id);


--
-- Name: season__friendly_name__unique; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY season
    ADD CONSTRAINT season__friendly_name__unique UNIQUE (friendly_name);


--
-- Name: season__id__pk; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY season
    ADD CONSTRAINT season__id__pk PRIMARY KEY (season_id);


--
-- Name: seedmethod__friendly_name__unique; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY seedmethod
    ADD CONSTRAINT seedmethod__friendly_name__unique UNIQUE (friendly_name);


--
-- Name: seedmethod__id__pk; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY seedmethod
    ADD CONSTRAINT seedmethod__id__pk PRIMARY KEY (seedmethod_id);


--
-- Name: soilprop__friendly_name__uniq; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY soilprop
    ADD CONSTRAINT soilprop__friendly_name__uniq UNIQUE (friendly_name);


--
-- Name: soilprop__id__pk; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY soilprop
    ADD CONSTRAINT soilprop__id__pk PRIMARY KEY (soilprop_id);


--
-- Name: variety__id__pk; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY variety
    ADD CONSTRAINT variety__id__pk PRIMARY KEY (variety_id);


--
-- Name: village__id__pk; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY village
    ADD CONSTRAINT village__id__pk PRIMARY KEY (village_id);


--
-- Name: village__str_country_id_fk__uniq; Type: CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY village
    ADD CONSTRAINT village__str_country_id_fk__uniq UNIQUE (village_str, country_id_fk);


--
-- Name: CONSTRAINT village__str_country_id_fk__uniq ON village; Type: COMMENT; Schema: public; Owner: tread_admin
--

COMMENT ON CONSTRAINT village__str_country_id_fk__uniq ON village IS 'Prevents occurence of the same entries as far as machine processing is concerned.';


--
-- Name: district__country_id__fk; Type: FK CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY district
    ADD CONSTRAINT district__country_id__fk FOREIGN KEY (country_id_fk) REFERENCES country(country_id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fn__country_id__fk; Type: FK CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY fn
    ADD CONSTRAINT fn__country_id__fk FOREIGN KEY (country_id_fk) REFERENCES country(country_id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: record__ces__fk; Type: FK CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY record
    ADD CONSTRAINT record__ces__fk FOREIGN KEY (ces) REFERENCES seedmethod(seedmethod_id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: record__country_id__fk; Type: FK CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY record
    ADD CONSTRAINT record__country_id__fk FOREIGN KEY (country_id_fk) REFERENCES country(country_id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: record__pre_crop__fk; Type: FK CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY record
    ADD CONSTRAINT record__pre_crop__fk FOREIGN KEY (pre_crop) REFERENCES crop(crop_id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: record__season_id__fk; Type: FK CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY record
    ADD CONSTRAINT record__season_id__fk FOREIGN KEY (season_id_fk) REFERENCES season(season_id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: record__soil_prop__fk; Type: FK CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY record
    ADD CONSTRAINT record__soil_prop__fk FOREIGN KEY (soil_prop_fk) REFERENCES soilprop(soilprop_id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: record__var_name__fk; Type: FK CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY record
    ADD CONSTRAINT record__var_name__fk FOREIGN KEY (var_name) REFERENCES variety(variety_id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: variety__crop_id__fk; Type: FK CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY variety
    ADD CONSTRAINT variety__crop_id__fk FOREIGN KEY (crop_id_fk) REFERENCES crop(crop_id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: village__country_id__fk; Type: FK CONSTRAINT; Schema: public; Owner: tread_admin
--

ALTER TABLE ONLY village
    ADD CONSTRAINT village__country_id__fk FOREIGN KEY (country_id_fk) REFERENCES country(country_id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

