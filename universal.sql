--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    no_objects integer DEFAULT 0,
    created_at date DEFAULT CURRENT_DATE,
    description character varying(500)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_connection; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_connection (
    galaxy_connection_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    type_id integer NOT NULL,
    type_name text NOT NULL
);


ALTER TABLE public.galaxy_connection OWNER TO freecodecamp;

--
-- Name: galaxy_connection_galaxy_connection_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_connection_galaxy_connection_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_connection_galaxy_connection_seq OWNER TO freecodecamp;

--
-- Name: galaxy_connection_galaxy_connection_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_connection_galaxy_connection_seq OWNED BY public.galaxy_connection.galaxy_connection_id;


--
-- Name: galaxy_gid_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_gid_seq OWNER TO freecodecamp;

--
-- Name: galaxy_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_gid_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    is_habitable boolean DEFAULT false,
    created_at date DEFAULT CURRENT_DATE
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_mid_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_mid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_mid_seq OWNER TO freecodecamp;

--
-- Name: moon_mid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_mid_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_spherical boolean DEFAULT false NOT NULL,
    star_id integer,
    created_at date DEFAULT CURRENT_DATE
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_pid_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_pid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_pid_seq OWNER TO freecodecamp;

--
-- Name: planet_pid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_pid_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance numeric(5,2),
    galaxy_id integer,
    created_at date DEFAULT CURRENT_DATE
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_sid_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_sid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_sid_seq OWNER TO freecodecamp;

--
-- Name: star_sid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_sid_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_gid_seq'::regclass);


--
-- Name: galaxy_connection galaxy_connection_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_connection ALTER COLUMN galaxy_connection_id SET DEFAULT nextval('public.galaxy_connection_galaxy_connection_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_mid_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_pid_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_sid_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Human', 100, '2023-07-13', NULL);
INSERT INTO public.galaxy VALUES (2, 'Gnome', 20, '2023-07-13', NULL);
INSERT INTO public.galaxy VALUES (3, 'Fairy', 152, '2023-07-13', NULL);
INSERT INTO public.galaxy VALUES (4, 'Alien', 2, '2023-07-13', NULL);
INSERT INTO public.galaxy VALUES (5, 'Demon', 1, '2023-07-13', NULL);
INSERT INTO public.galaxy VALUES (6, 'Dwarf', 22, '2023-07-13', NULL);
INSERT INTO public.galaxy VALUES (7, 'HumanA', 100, '2023-07-13', NULL);
INSERT INTO public.galaxy VALUES (8, 'GnomeA', 20, '2023-07-13', NULL);
INSERT INTO public.galaxy VALUES (9, 'FairyA', 152, '2023-07-13', NULL);
INSERT INTO public.galaxy VALUES (10, 'AlienA', 2, '2023-07-13', NULL);
INSERT INTO public.galaxy VALUES (11, 'DemonA', 1, '2023-07-13', NULL);
INSERT INTO public.galaxy VALUES (12, 'DwarfA', 22, '2023-07-13', NULL);
INSERT INTO public.galaxy VALUES (13, 'Human B', 100, '2023-07-13', NULL);
INSERT INTO public.galaxy VALUES (14, 'Gnome B', 20, '2023-07-13', NULL);
INSERT INTO public.galaxy VALUES (15, 'Fairy B', 152, '2023-07-13', NULL);
INSERT INTO public.galaxy VALUES (16, 'Alien B', 2, '2023-07-13', NULL);
INSERT INTO public.galaxy VALUES (17, 'Demon B', 1, '2023-07-13', NULL);
INSERT INTO public.galaxy VALUES (18, 'Dwarf B', 22, '2023-07-13', NULL);
INSERT INTO public.galaxy VALUES (19, 'Human C', 100, '2023-07-13', NULL);
INSERT INTO public.galaxy VALUES (20, 'Gnome C', 20, '2023-07-13', NULL);
INSERT INTO public.galaxy VALUES (21, 'Fairy C', 152, '2023-07-13', NULL);
INSERT INTO public.galaxy VALUES (22, 'Alien C', 2, '2023-07-13', NULL);
INSERT INTO public.galaxy VALUES (23, 'Demon C', 1, '2023-07-13', NULL);
INSERT INTO public.galaxy VALUES (24, 'Dwarf C', 22, '2023-07-13', NULL);


--
-- Data for Name: galaxy_connection; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_connection VALUES (3, 'Apple', 1, 1, 'star');
INSERT INTO public.galaxy_connection VALUES (4, 'Moon A', 2, 1, 'moon');
INSERT INTO public.galaxy_connection VALUES (5, 'A', 3, 32, 'planet');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon A', 32, false, '2023-07-13');
INSERT INTO public.moon VALUES (2, 'Moon B', 33, false, '2023-07-13');
INSERT INTO public.moon VALUES (3, 'Moon C', 34, false, '2023-07-13');
INSERT INTO public.moon VALUES (4, 'Moon D', 35, false, '2023-07-13');
INSERT INTO public.moon VALUES (5, 'Moon E', 36, false, '2023-07-13');
INSERT INTO public.moon VALUES (6, 'Moon F', 37, false, '2023-07-13');
INSERT INTO public.moon VALUES (7, 'Moon G', 38, false, '2023-07-13');
INSERT INTO public.moon VALUES (8, 'Moon H', 39, false, '2023-07-13');
INSERT INTO public.moon VALUES (9, 'Moon I', 40, false, '2023-07-13');
INSERT INTO public.moon VALUES (10, 'Moon J', 41, false, '2023-07-13');
INSERT INTO public.moon VALUES (11, 'Moon K', 42, false, '2023-07-13');
INSERT INTO public.moon VALUES (12, 'Moon L', 43, false, '2023-07-13');
INSERT INTO public.moon VALUES (13, 'Moon M', 44, false, '2023-07-13');
INSERT INTO public.moon VALUES (14, 'Moon N', 45, false, '2023-07-13');
INSERT INTO public.moon VALUES (15, 'Moon O', 46, false, '2023-07-13');
INSERT INTO public.moon VALUES (16, 'Moon P', 47, false, '2023-07-13');
INSERT INTO public.moon VALUES (17, 'Moon Q', 48, false, '2023-07-13');
INSERT INTO public.moon VALUES (18, 'Moon R', 49, false, '2023-07-13');
INSERT INTO public.moon VALUES (19, 'Moon S', 50, false, '2023-07-13');
INSERT INTO public.moon VALUES (20, 'Moon T', 51, false, '2023-07-13');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (32, 'A', false, 1, '2023-07-13');
INSERT INTO public.planet VALUES (33, 'B', false, 2, '2023-07-13');
INSERT INTO public.planet VALUES (34, 'C', false, 3, '2023-07-13');
INSERT INTO public.planet VALUES (35, 'D', false, 4, '2023-07-13');
INSERT INTO public.planet VALUES (37, 'F', false, 6, '2023-07-13');
INSERT INTO public.planet VALUES (38, 'G', false, 13, '2023-07-13');
INSERT INTO public.planet VALUES (39, 'H', false, 14, '2023-07-13');
INSERT INTO public.planet VALUES (40, 'I', false, 15, '2023-07-13');
INSERT INTO public.planet VALUES (41, 'J', false, 16, '2023-07-13');
INSERT INTO public.planet VALUES (42, 'K', false, 17, '2023-07-13');
INSERT INTO public.planet VALUES (43, 'P', false, 18, '2023-07-13');
INSERT INTO public.planet VALUES (36, 'E', true, 5, '2023-07-13');
INSERT INTO public.planet VALUES (44, 'L', false, 19, '2023-07-13');
INSERT INTO public.planet VALUES (45, 'M', false, 20, '2023-07-13');
INSERT INTO public.planet VALUES (46, 'N', false, 21, '2023-07-13');
INSERT INTO public.planet VALUES (47, 'O', false, 22, '2023-07-13');
INSERT INTO public.planet VALUES (48, 'Q', false, 23, '2023-07-13');
INSERT INTO public.planet VALUES (49, 'R', false, 24, '2023-07-13');
INSERT INTO public.planet VALUES (50, 'S', false, 25, '2023-07-13');
INSERT INTO public.planet VALUES (51, 'T', false, 26, '2023-07-13');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Apple', 125.60, 1, '2023-07-13');
INSERT INTO public.star VALUES (2, 'Orange', 345.20, 2, '2023-07-13');
INSERT INTO public.star VALUES (3, 'Grapes', 56.90, 3, '2023-07-13');
INSERT INTO public.star VALUES (4, 'Banana', 87.20, 4, '2023-07-13');
INSERT INTO public.star VALUES (5, 'Kiwi', 86.20, 5, '2023-07-13');
INSERT INTO public.star VALUES (6, 'Strawberry', 87.50, 6, '2023-07-13');
INSERT INTO public.star VALUES (13, 'Blueberry', 125.60, 7, '2023-07-13');
INSERT INTO public.star VALUES (14, 'Avocado', 345.20, 8, '2023-07-13');
INSERT INTO public.star VALUES (15, 'Raspberry', 56.90, 9, '2023-07-13');
INSERT INTO public.star VALUES (16, 'Sour Sop', 87.20, 10, '2023-07-13');
INSERT INTO public.star VALUES (17, 'Dragon Fruit', 86.20, 11, '2023-07-13');
INSERT INTO public.star VALUES (18, 'Pineapple', 87.50, 12, '2023-07-13');
INSERT INTO public.star VALUES (19, 'Blueberry A', 125.60, 13, '2023-07-13');
INSERT INTO public.star VALUES (20, 'Avocado A', 345.20, 14, '2023-07-13');
INSERT INTO public.star VALUES (21, 'Raspberry A', 56.90, 15, '2023-07-13');
INSERT INTO public.star VALUES (22, 'Sour Sop A', 87.20, 16, '2023-07-13');
INSERT INTO public.star VALUES (23, 'Dragon Fruit A', 86.20, 17, '2023-07-13');
INSERT INTO public.star VALUES (24, 'Pineapple A', 87.50, 18, '2023-07-13');
INSERT INTO public.star VALUES (25, 'Blueberry B', 125.60, 19, '2023-07-13');
INSERT INTO public.star VALUES (26, 'Avocado B', 345.20, 20, '2023-07-13');


--
-- Name: galaxy_connection_galaxy_connection_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_connection_galaxy_connection_seq', 5, true);


--
-- Name: galaxy_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_gid_seq', 24, true);


--
-- Name: moon_mid_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_mid_seq', 20, true);


--
-- Name: planet_pid_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_pid_seq', 51, true);


--
-- Name: star_sid_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_sid_seq', 26, true);


--
-- Name: galaxy_connection galaxy_connection_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_connection
    ADD CONSTRAINT galaxy_connection_name_key UNIQUE (name);


--
-- Name: galaxy_connection galaxy_connection_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_connection
    ADD CONSTRAINT galaxy_connection_pkey PRIMARY KEY (galaxy_connection_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_planet_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_unique UNIQUE (planet_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_star_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_unique UNIQUE (star_id);


--
-- Name: star star_galaxy_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_unique UNIQUE (galaxy_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy_connection galaxy_connection_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_connection
    ADD CONSTRAINT galaxy_connection_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

