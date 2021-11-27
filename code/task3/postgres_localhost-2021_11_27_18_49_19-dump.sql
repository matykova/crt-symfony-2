--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1 (Debian 14.1-1.pgdg110+1)
-- Dumped by pg_dump version 14.1

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
-- Name: animal_classes; Type: TABLE; Schema: public; Owner: pguser
--

CREATE TABLE public.animal_classes (
    id integer NOT NULL,
    name text,
    can_flying boolean
);


ALTER TABLE public.animal_classes OWNER TO pguser;

--
-- Name: animal_classes_id_seq; Type: SEQUENCE; Schema: public; Owner: pguser
--

CREATE SEQUENCE public.animal_classes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.animal_classes_id_seq OWNER TO pguser;

--
-- Name: animal_classes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pguser
--

ALTER SEQUENCE public.animal_classes_id_seq OWNED BY public.animal_classes.id;


--
-- Name: animals; Type: TABLE; Schema: public; Owner: pguser
--

CREATE TABLE public.animals (
    id integer NOT NULL,
    name text,
    can_flying boolean,
    legs_count integer,
    class_id integer
);


ALTER TABLE public.animals OWNER TO pguser;

--
-- Name: animals_id_seq; Type: SEQUENCE; Schema: public; Owner: pguser
--

CREATE SEQUENCE public.animals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.animals_id_seq OWNER TO pguser;

--
-- Name: animals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pguser
--

ALTER SEQUENCE public.animals_id_seq OWNED BY public.animals.id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: pguser
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    name character varying(255),
    founded_at date,
    country_id integer
);


ALTER TABLE public.cities OWNER TO pguser;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: pguser
--

CREATE SEQUENCE public.cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_id_seq OWNER TO pguser;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pguser
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: pguser
--

CREATE TABLE public.countries (
    id integer NOT NULL,
    name text,
    code character varying(3)
);


ALTER TABLE public.countries OWNER TO pguser;

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: pguser
--

CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.countries_id_seq OWNER TO pguser;

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pguser
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- Name: animal_classes id; Type: DEFAULT; Schema: public; Owner: pguser
--

ALTER TABLE ONLY public.animal_classes ALTER COLUMN id SET DEFAULT nextval('public.animal_classes_id_seq'::regclass);


--
-- Name: animals id; Type: DEFAULT; Schema: public; Owner: pguser
--

ALTER TABLE ONLY public.animals ALTER COLUMN id SET DEFAULT nextval('public.animals_id_seq'::regclass);


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: pguser
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: pguser
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- Data for Name: animal_classes; Type: TABLE DATA; Schema: public; Owner: pguser
--

COPY public.animal_classes (id, name, can_flying) FROM stdin;
1	Млекопитающие	t
2	Рыбы	f
3	Земноводные	f
\.


--
-- Data for Name: animals; Type: TABLE DATA; Schema: public; Owner: pguser
--

COPY public.animals (id, name, can_flying, legs_count, class_id) FROM stdin;
1	Кот	f	4	1
2	Летучая мышь	t	4	1
3	Карась	f	0	2
4	Лягушка	f	4	3
\.


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: pguser
--

COPY public.cities (id, name, founded_at, country_id) FROM stdin;
2	Москва	1147-04-11	1
3	Лондон	0050-01-01	2
4	Берлин	1237-10-28	3
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: pguser
--

COPY public.countries (id, name, code) FROM stdin;
1	Россия	643
2	Великобритания	826
3	Германия	276
\.


--
-- Name: animal_classes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pguser
--

SELECT pg_catalog.setval('public.animal_classes_id_seq', 1, false);


--
-- Name: animals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pguser
--

SELECT pg_catalog.setval('public.animals_id_seq', 1, false);


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pguser
--

SELECT pg_catalog.setval('public.cities_id_seq', 1, false);


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pguser
--

SELECT pg_catalog.setval('public.countries_id_seq', 1, false);


--
-- Name: animal_classes animal_classes_pk; Type: CONSTRAINT; Schema: public; Owner: pguser
--

ALTER TABLE ONLY public.animal_classes
    ADD CONSTRAINT animal_classes_pk PRIMARY KEY (id);


--
-- Name: animals animals_pk; Type: CONSTRAINT; Schema: public; Owner: pguser
--

ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_pk PRIMARY KEY (id);


--
-- Name: cities cities_pk; Type: CONSTRAINT; Schema: public; Owner: pguser
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pk PRIMARY KEY (id);


--
-- Name: countries countries_pk; Type: CONSTRAINT; Schema: public; Owner: pguser
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pk PRIMARY KEY (id);


--
-- Name: animals animals_animal_classes_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: pguser
--

ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_animal_classes_id_fk FOREIGN KEY (class_id) REFERENCES public.animal_classes(id);


--
-- Name: cities cities_countries_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: pguser
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_countries_id_fk FOREIGN KEY (country_id) REFERENCES public.countries(id);


--
-- PostgreSQL database dump complete
--

