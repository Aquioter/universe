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
    description text,
    has_life boolean NOT NULL,
    age_in_millions_of_years integer,
    galaxy_type character varying(50) NOT NULL,
    distance_from_earth integer,
    num_of_stars integer
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
    planet_id integer,
    is_spherical boolean NOT NULL,
    has_life boolean NOT NULL,
    distance_from_planet numeric(10,2) NOT NULL,
    surface_temperature integer,
    orbital_distance integer
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
    star_id integer,
    planet_type character varying(50) NOT NULL,
    distance_from_star numeric(10,2) NOT NULL,
    is_habitable boolean NOT NULL,
    gravity integer,
    orbital_period integer
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer,
    mass numeric(10,2) NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_earth numeric(10,2) NOT NULL,
    age_in_millions_of_years integer,
    diameter integer
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
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Description of Andromeda', true, 10000, 'Spiral', 10000, 500);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'Description of Milky Way', false, 13000, 'Spiral', 0, 250);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Description of Triangulum', true, 8000, 'Spiral', 12000, 200);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Description of Messier 87', false, 50000, 'Elliptical', 15000, 100);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 'Description of Centaurus A', false, 20000, 'Irregular', 25000, 75);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Description of Whirlpool', true, 6000, 'Spiral', 8000, 150);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (71, 'Luna', 43, true, false, 384400.00, -20, 27);
INSERT INTO public.moon VALUES (72, 'Europa', 44, true, false, 671100.00, -160, 13);
INSERT INTO public.moon VALUES (73, 'Titan', 46, true, false, 1221870.00, -179, 76);
INSERT INTO public.moon VALUES (74, 'Ganymede', 46, true, false, 1070400.00, -163, 107);
INSERT INTO public.moon VALUES (75, 'Callisto', 46, true, false, 1882700.00, -153, 189);
INSERT INTO public.moon VALUES (76, 'Io', 46, true, false, 421700.00, -130, 42);
INSERT INTO public.moon VALUES (77, 'Enceladus', 44, true, false, 238000.00, -201, 15);
INSERT INTO public.moon VALUES (78, 'Triton', 49, true, false, 354760.00, -235, 355);
INSERT INTO public.moon VALUES (79, 'Charon', 50, true, false, 19571.00, -220, 19);
INSERT INTO public.moon VALUES (80, 'Europe', 50, true, false, 647100.00, -160, 13);
INSERT INTO public.moon VALUES (81, 'Oberon', 51, true, false, 583940.00, -203, 13);
INSERT INTO public.moon VALUES (82, 'Titania', 51, true, false, 435910.00, -209, 9);
INSERT INTO public.moon VALUES (83, 'Umbriel', 51, true, false, 266000.00, -214, 9);
INSERT INTO public.moon VALUES (84, 'Miranda', 51, true, false, 129900.00, -187, 1);
INSERT INTO public.moon VALUES (85, 'Iapetus', 52, true, false, 3561300.00, -143, 35);
INSERT INTO public.moon VALUES (86, 'Rhea', 52, true, false, 527040.00, -220, 9);
INSERT INTO public.moon VALUES (87, 'Dione', 52, true, false, 377400.00, -186, 2);
INSERT INTO public.moon VALUES (88, 'Tethys', 52, true, false, 294660.00, -187, 1);
INSERT INTO public.moon VALUES (89, 'Phoebe', 52, true, false, 12947900.00, -201, 9);
INSERT INTO public.moon VALUES (90, 'Hyperion', 52, true, false, 1481000.00, -186, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (41, 'Mercury', 1, 'Terrestrial', 0.39, false, 4, 88);
INSERT INTO public.planet VALUES (42, 'Venus', 1, 'Terrestrial', 0.72, false, 9, 225);
INSERT INTO public.planet VALUES (43, 'Earth', 1, 'Terrestrial', 1.00, true, 10, 365);
INSERT INTO public.planet VALUES (44, 'Mars', 1, 'Terrestrial', 1.52, false, 4, 687);
INSERT INTO public.planet VALUES (45, 'Jupiter', 2, 'Gas Giant', 5.20, false, 25, 4331);
INSERT INTO public.planet VALUES (46, 'Saturn', 2, 'Gas Giant', 9.58, false, 10, 10747);
INSERT INTO public.planet VALUES (47, 'Uranus', 2, 'Ice Giant', 19.22, false, 9, 30589);
INSERT INTO public.planet VALUES (48, 'Neptune', 2, 'Ice Giant', 30.05, false, 11, 59800);
INSERT INTO public.planet VALUES (49, 'Pluto', 2, 'Dwarf', 39.48, false, 1, 90560);
INSERT INTO public.planet VALUES (50, 'Kepler-186f', 3, 'Exoplanet', 0.36, true, 2, 130);
INSERT INTO public.planet VALUES (51, 'Kepler-442b', 3, 'Exoplanet', 0.35, true, 2, 112);
INSERT INTO public.planet VALUES (52, 'Gliese 581g', 4, 'Exoplanet', 0.15, true, 1, 37);
INSERT INTO public.planet VALUES (53, 'Gliese 667Cc', 4, 'Exoplanet', 0.12, true, 1, 28);
INSERT INTO public.planet VALUES (54, 'HD 40307g', 5, 'Exoplanet', 0.60, true, 2, 197);
INSERT INTO public.planet VALUES (55, 'HD 209458b', 5, 'Exoplanet', 0.05, false, 9, 4);
INSERT INTO public.planet VALUES (56, 'TRAPPIST-1e', 6, 'Exoplanet', 0.03, true, 1, 6);
INSERT INTO public.planet VALUES (57, 'TRAPPIST-1f', 6, 'Exoplanet', 0.04, true, 1, 9);
INSERT INTO public.planet VALUES (58, 'TOI 700d', 6, 'Exoplanet', 0.03, true, 1, 37);
INSERT INTO public.planet VALUES (59, 'LHS 1140b', 6, 'Exoplanet', 0.09, true, 2, 25);
INSERT INTO public.planet VALUES (60, 'Wolf 1061c', 6, 'Exoplanet', 0.08, true, 2, 18);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial', 'Planetas rocosos con una superficie sólida.');
INSERT INTO public.planet_type VALUES (2, 'Gas Giant', 'Planetas compuestos principalmente de gases como hidrógeno y helio.');
INSERT INTO public.planet_type VALUES (3, 'Ice Giant', 'Planetas compuestos principalmente de elementos volátiles como agua, amoníaco y metano.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 2, 1.98, true, 0.00, 4600, 1392684);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 2, 7.70, false, 643.00, 8600, 1183800000);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 5, 2.44, true, 4.24, 5612, 24855);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 5, 2.20, true, 4.37, 6600, 152063);
INSERT INTO public.star VALUES (5, 'Alpha Centauri B', 5, 1.60, true, 4.37, 6600, 137752);
INSERT INTO public.star VALUES (6, 'Sirius', 2, 2.02, true, 8.60, 230, 215030000);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 90, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 60, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 3, true);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

