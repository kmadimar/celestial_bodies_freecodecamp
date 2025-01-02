--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(100) NOT NULL,
    type character varying(50),
    distance_from_earth integer,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50),
    has_planet boolean NOT NULL,
    radius integer,
    distance_from_planet double precision,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50),
    mass double precision,
    radius double precision,
    has_satellite boolean NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50),
    description text,
    planet_id integer NOT NULL
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50),
    mass bigint,
    radius double precision,
    luminosity numeric,
    age bigint,
    description text,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0, 'The galaxy containing our solar system.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2500000, 'The closest spiral galaxy to the Milky Way.');
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 'Elliptical', 55000000, 'Home to a supermassive black hole at its center.');
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 'Spiral', 3000000, 'Third-largest galaxy in the Local Group.');
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 'Elliptical', 12000000, 'A galaxy with an unusual dust lane across its center.');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Spiral', 29000000, 'Known for its distinct bulge and dust lane structure.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (27, 'Moon', 'Natural satellite', true, 1738, 384400, 1);
INSERT INTO public.moon VALUES (28, 'Phobos', 'Natural satellite', true, 11, 9378, 2);
INSERT INTO public.moon VALUES (29, 'Deimos', 'Natural satellite', true, 6, 23460, 2);
INSERT INTO public.moon VALUES (30, 'Europa', 'Natural satellite', true, 1561, 671100, 3);
INSERT INTO public.moon VALUES (31, 'Ganymede', 'Natural satellite', true, 2634, 1070400, 3);
INSERT INTO public.moon VALUES (32, 'Io', 'Natural satellite', true, 1822, 421800, 3);
INSERT INTO public.moon VALUES (33, 'Titan', 'Natural satellite', true, 2575, 1221870, 4);
INSERT INTO public.moon VALUES (34, 'Enceladus', 'Natural satellite', true, 252, 238020, 4);
INSERT INTO public.moon VALUES (35, 'Triton', 'Natural satellite', true, 1353, 354800, 5);
INSERT INTO public.moon VALUES (36, 'Charon', 'Natural satellite', true, 606, 19571, 9);
INSERT INTO public.moon VALUES (37, 'Callisto', 'Natural satellite', true, 2410, 1883000, 4);
INSERT INTO public.moon VALUES (38, 'Mimas', 'Natural satellite', true, 198, 185540, 4);
INSERT INTO public.moon VALUES (39, 'Hyperion', 'Natural satellite', true, 135, 1481000, 4);
INSERT INTO public.moon VALUES (40, 'Rhea', 'Natural satellite', true, 765, 527040, 4);
INSERT INTO public.moon VALUES (41, 'Dione', 'Natural satellite', true, 561, 377400, 4);
INSERT INTO public.moon VALUES (42, 'Ariel', 'Natural satellite', true, 579, 190000, 6);
INSERT INTO public.moon VALUES (43, 'Umbriel', 'Natural satellite', true, 585, 266000, 6);
INSERT INTO public.moon VALUES (44, 'Oberon', 'Natural satellite', true, 761, 583000, 6);
INSERT INTO public.moon VALUES (45, 'Miranda', 'Natural satellite', true, 236, 130000, 6);
INSERT INTO public.moon VALUES (46, 'Proteus', 'Natural satellite', true, 210, 117646, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', 5.97, 6371, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial', 0.642, 3390, true, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Gas giant', 1898, 69911, true, 1);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Gas giant', 568, 58232, true, 1);
INSERT INTO public.planet VALUES (5, 'Neptune', 'Ice giant', 102, 24622, true, 1);
INSERT INTO public.planet VALUES (6, 'Uranus', 'Ice giant', 86.8, 25362, true, 1);
INSERT INTO public.planet VALUES (7, 'Mercury', 'Terrestrial', 0.33, 2439.7, true, 1);
INSERT INTO public.planet VALUES (8, 'Venus', 'Terrestrial', 4.87, 6051.8, true, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf', 0.0146, 1188.3, true, 1);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 'Terrestrial', 1.85, 7880, true, 2);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 'Gas giant', 0.69, 144300, true, 2);
INSERT INTO public.planet VALUES (12, 'Kepler-62e', 'Super-Earth', 0.13, 6200, true, 2);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'Moon', 'Natural satellite', 'Earth''s only natural satellite.', 1);
INSERT INTO public.satellite VALUES (2, 'Phobos', 'Natural satellite', 'One of the two moons of Mars.', 2);
INSERT INTO public.satellite VALUES (3, 'Deimos', 'Natural satellite', 'The smaller moon of Mars.', 2);
INSERT INTO public.satellite VALUES (4, 'Europa', 'Natural satellite', 'One of Jupiter''s Galilean moons.', 3);
INSERT INTO public.satellite VALUES (5, 'Ganymede', 'Natural satellite', 'The largest moon in the Solar System.', 3);
INSERT INTO public.satellite VALUES (6, 'Io', 'Natural satellite', 'Known for its volcanic activity.', 3);
INSERT INTO public.satellite VALUES (7, 'Titan', 'Natural satellite', 'The largest moon of Saturn.', 4);
INSERT INTO public.satellite VALUES (8, 'Enceladus', 'Natural satellite', 'An icy moon of Saturn with active geysers.', 4);
INSERT INTO public.satellite VALUES (9, 'Triton', 'Natural satellite', 'Neptune''s largest moon.', 5);
INSERT INTO public.satellite VALUES (10, 'Charon', 'Natural satellite', 'Pluto''s largest moon.', 9);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-type', 1, 1, 1, 4600000000, 'The star at the center of our solar system.', 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 'G-type', 1, 1.2, 1.519, 6000000000, 'Closest star system to the Sun.', 1);
INSERT INTO public.star VALUES (3, 'Sirius', 'A-type', 2, 1.71, 25.4, 250000000, 'Brightest star in the night sky.', 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'Red supergiant', 20, 950, 95000, 10000000, 'A massive star in the constellation Orion.', 1);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 'M-type', 0, 0.15, 0.0017, 5000000000, 'Nearest known star to the Sun.', 1);
INSERT INTO public.star VALUES (6, 'Rigel', 'B-type', 23, 78.9, 120000, 10000000, 'Blue supergiant star in the constellation Orion.', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 46, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 10, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: satellite satellite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_name_key UNIQUE (name);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


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
-- Name: satellite satellite_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

