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
-- Name: dwarf_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.dwarf_planet (
    dwarf_planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    size_in_km integer
);


ALTER TABLE public.dwarf_planet OWNER TO freecodecamp;

--
-- Name: dwarf_planet_dwarf_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.dwarf_planet_dwarf_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dwarf_planet_dwarf_id_seq OWNER TO freecodecamp;

--
-- Name: dwarf_planet_dwarf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.dwarf_planet_dwarf_id_seq OWNED BY public.dwarf_planet.dwarf_planet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    galaxy_type character varying(20),
    description text,
    size_in_light_years integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    description text,
    size_in_km integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    moon_numbers integer NOT NULL,
    has_rings boolean,
    size_in_km integer,
    oxygen_percent numeric,
    description text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(30) NOT NULL,
    planet_id integer,
    galaxy_id integer NOT NULL,
    description text,
    size_in_km integer,
    star_id integer NOT NULL
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
-- Name: dwarf_planet dwarf_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet ALTER COLUMN dwarf_planet_id SET DEFAULT nextval('public.dwarf_planet_dwarf_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: dwarf_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.dwarf_planet VALUES (1, 'Pluto', 'It was considerated the ninth planet of our Solar System', 2376);
INSERT INTO public.dwarf_planet VALUES (2, 'Ceres', 'It is the largest object in the asteroid belt', 946);
INSERT INTO public.dwarf_planet VALUES (3, 'Eris', 'It is located in the Kuiper Belt and it has one known moon', 2326);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 1, 'Spiral', 'This is the galaxy we live in', 100000);
INSERT INTO public.galaxy VALUES ('Andromeda', 2, 'Spiral', 'The Andromeda galaxy is one of the few visible to the unaided eye', 200000);
INSERT INTO public.galaxy VALUES ('Triangulum', 3, 'Spiral', 'It is located 3 million light-years', 60000);
INSERT INTO public.galaxy VALUES ('Large Magellanic Cloud', 4, 'Irregular', 'It is a dwarf galaxy', 14000);
INSERT INTO public.galaxy VALUES ('Small Magellanic Cloud', 5, 'Irregular', 'It is a satellite galaxy of the Milky Way', 7000);
INSERT INTO public.galaxy VALUES ('Whirlpool Galaxy', 6, 'Spiral', 'It is known for its prominent spiral arms', 60000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 'Our moon', 3474);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'The larger moon of Mars', 22200);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'The smaller moon of Mars', 12400);
INSERT INTO public.moon VALUES (4, 'Io', 5, 'It is the most volcanically active object in the Solar System', 3643);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 'The surface is mostly water ice', 3121);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 'It is the only moon known to have its own magnetic field', 5268);
INSERT INTO public.moon VALUES (7, 'Calisto', 5, 'The outermost of the four Galilean moons of Jupiter', 4821);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 'It is irregularly shaped', 250);
INSERT INTO public.moon VALUES (9, 'Himalia', 5, 'A prograde irregular satellite of Jupiter', 170);
INSERT INTO public.moon VALUES (10, 'Elara', 5, 'The surface is thought to be heavily cratered', 80);
INSERT INTO public.moon VALUES (11, 'Leda', 5, 'It is probably covered with a layer of fine regolith', 20);
INSERT INTO public.moon VALUES (12, 'Metis', 5, 'A small inner satellite of Jupiter', 40);
INSERT INTO public.moon VALUES (13, 'Adrastea', 5, 'It orbits just outside of Jupiter main ring', 16);
INSERT INTO public.moon VALUES (14, 'Thebe', 5, 'An inner satellite of Jupiter', 100);
INSERT INTO public.moon VALUES (15, 'Hyperion', 6, 'It has a unique appearance, with a porous, spongy texture', 266);
INSERT INTO public.moon VALUES (16, 'Titan', 6, 'The largest moon of Saturn. It is the only moon in the Solar System with a thick atmosphere', 5149);
INSERT INTO public.moon VALUES (17, 'Enceladus', 6, 'It has a subsurface ocean that may contain the conditions necessary for life', 504);
INSERT INTO public.moon VALUES (18, 'Mimas', 6, 'Its surface is dominated by a large impact crater called Herschel', 396);
INSERT INTO public.moon VALUES (19, 'Rhea', 6, 'It is one of the largest moons of Saturn', 1529);
INSERT INTO public.moon VALUES (20, 'Miranda', 7, 'It is unique because it has one of the tallest known cliff faces if the Solar System', 471);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 0, false, 4880, 42, 'The closest planet to the sun');
INSERT INTO public.planet VALUES (2, 'Venus', false, 0, false, 12104, 0.002, 'Second planet from the sun known for its toxic atmosphere');
INSERT INTO public.planet VALUES (3, 'Earth', true, 1, false, 12742, 21, 'The only known planet with life');
INSERT INTO public.planet VALUES (4, 'Mars', false, 2, false, 6779, 0.1, 'Known as the Red Planet due to its reddish appearance');
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 79, true, 139822, 0, 'The largest planet in the solar system');
INSERT INTO public.planet VALUES (6, 'Saturn', false, 82, true, 116460, 0, 'Known for its prominent rings');
INSERT INTO public.planet VALUES (7, 'Uranus', false, 27, true, 50724, 0.4, 'Known for its unique tilt');
INSERT INTO public.planet VALUES (8, 'Neptune', false, 14, true, 49244, 0, 'Known for its deep blue color');
INSERT INTO public.planet VALUES (9, 'Kepler-438b', false, 0, false, 14271, 0, 'It orbits a red dwarf star and is considered a super-Earth due to its size and mass');
INSERT INTO public.planet VALUES (10, 'HD 209458 b', false, 0, false, 193030, 0, 'It was the first exoplanet to have its atmosphere directly detected');
INSERT INTO public.planet VALUES (11, 'WASP-12b', false, 0, false, 255940, 0, 'It has a very high temperature due to its proximity to its star');
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1d', false, 0, false, 9989, 0, 'It is considered a potentially habitable planet due to is size and distance from its star');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', NULL, 1, 'Our star', 696000, 1);
INSERT INTO public.star VALUES ('Sirius', NULL, 1, 'It is a binary star system and the brightest star in the night sky of Earth', 1700000, 2);
INSERT INTO public.star VALUES ('Betelgeuse', NULL, 1, 'It is a red supergiant star', 1234171800, 3);
INSERT INTO public.star VALUES ('Proxima Centauri', NULL, 1, 'It is a red dwarf located in Alpha Centaury system', 200000, 4);
INSERT INTO public.star VALUES ('Antares', NULL, 1, 'It is a red superstar located in the constellation Scorpion', 946150000, 5);
INSERT INTO public.star VALUES ('Vega', NULL, 1, 'It is known for its prominent role in the science fiction novel Contact by Carl Sagan', 2300000, 6);


--
-- Name: dwarf_planet_dwarf_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.dwarf_planet_dwarf_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: dwarf_planet dwarf_planet_dwarf_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_dwarf_id_key UNIQUE (dwarf_planet_id);


--
-- Name: dwarf_planet dwarf_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_pkey PRIMARY KEY (dwarf_planet_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

