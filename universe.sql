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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_million_years numeric(7,2),
    galaxy_type text,
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
    name character varying(50),
    has_life boolean NOT NULL,
    age_in_million_years numeric(7,2),
    description text,
    distance_from_earth integer NOT NULL,
    temperature integer,
    planet_id integer
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
    name character varying(50),
    has_life boolean NOT NULL,
    age_in_million_years numeric(7,2),
    planet_type text,
    description text,
    distance_from_earth bigint,
    temperature integer,
    star_id integer
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(100),
    age_in_million_years numeric(5,2),
    distance_from_earth integer,
    temperature integer,
    galaxy_id integer
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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'Black Hole 1', 1);
INSERT INTO public.black_hole VALUES (2, 'Black Hole 2', 2);
INSERT INTO public.black_hole VALUES (3, 'Black Hole 3', 1);
INSERT INTO public.black_hole VALUES (4, 'Black Hole 4', 3);
INSERT INTO public.black_hole VALUES (5, 'Black Hole 5', 2);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13000.00, 'Spiral', 'The Milky Way is the galaxy that contains our Solar System.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000.00, 'Spiral', 'The Andromeda Galaxy is the closest spiral galaxy to the Milky Way.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 5000.00, 'Spiral', 'The Triangulum Galaxy is a spiral galaxy approximately 3 million light-years from Earth.');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 6000.00, 'Elliptical', 'Messier 87 is a supergiant elliptical galaxy in the constellation Virgo.');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 10000.00, 'Spiral', 'The Whirlpool Galaxy is an interacting grand-design spiral galaxy in the constellation Canes Venatici.');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 9000.00, 'Spiral', 'The Sombrero Galaxy is an unbarred spiral galaxy in the constellation Virgo.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (33, 'Luna', false, 4.54, 'The only natural satellite of Earth.', 384400, -20, 1);
INSERT INTO public.moon VALUES (34, 'Phobos', false, 0.01, 'The innermost and larger of the two natural satellites of Mars.', 9377, -60, 2);
INSERT INTO public.moon VALUES (35, 'Deimos', false, 0.00, 'The smaller and outer of the two natural satellites of Mars.', 23460, -73, 2);
INSERT INTO public.moon VALUES (36, 'Ganymede', false, 4.50, 'The largest and most massive moon of Jupiter.', 1070400, -163, 3);
INSERT INTO public.moon VALUES (37, 'Titan', false, 4.50, 'The largest moon of Saturn.', 1257060, -180, 4);
INSERT INTO public.moon VALUES (38, 'Miranda', false, 4.50, 'The smallest and innermost of Uranus five round satellites.', 129390, -187, 5);
INSERT INTO public.moon VALUES (39, 'Triton', false, 4.50, 'The largest natural satellite of the planet Neptune.', 354760, -235, 6);
INSERT INTO public.moon VALUES (40, 'Callisto', false, 4.50, 'The second-largest moon of Jupiter.', 1882700, -148, 3);
INSERT INTO public.moon VALUES (41, 'Europa', false, 4.50, 'The smallest of the four Galilean moons orbiting Jupiter.', 671100, -171, 3);
INSERT INTO public.moon VALUES (42, 'Io', false, 4.50, 'The innermost of the four Galilean moons orbiting Jupiter.', 421800, -143, 3);
INSERT INTO public.moon VALUES (43, 'Enceladus', false, 4.50, 'One of Saturn innermost moons.', 238040, -201, 4);
INSERT INTO public.moon VALUES (44, 'Mimas', false, 4.50, 'A moon of Saturn which is the smallest astronomical body that is known to be rounded in shape because of self-gravitation.', 185520, -183, 4);
INSERT INTO public.moon VALUES (45, 'Iapetus', false, 4.50, 'A moon of Saturn.', 3561300, -143, 4);
INSERT INTO public.moon VALUES (46, 'Charon', false, 4.50, 'The largest of the five known natural satellites of the dwarf planet Pluto.', 19571, -229, 9);
INSERT INTO public.moon VALUES (47, 'Larissa', false, 4.50, 'The fifth-closest inner satellite of Neptune.', 117200, -208, 7);
INSERT INTO public.moon VALUES (48, 'Proteus', false, 4.50, 'The second-largest Neptunian moon.', 117647, -215, 7);
INSERT INTO public.moon VALUES (49, 'Moon20', false, 4.50, 'Description20', 20000, -50, 1);
INSERT INTO public.moon VALUES (50, 'Moon21', false, 4.50, 'Description21', 21000, -55, 2);
INSERT INTO public.moon VALUES (51, 'Moon22', false, 4.50, 'Description22', 22000, -60, 3);
INSERT INTO public.moon VALUES (52, 'Moon23', false, 4.50, 'Description23', 23000, -65, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 4.54, 'Terrestrial', 'The third planet from the Sun and the only astronomical object known to harbor life.', 149600000, 15, 1);
INSERT INTO public.planet VALUES (2, 'Mars', false, 4.60, 'Terrestrial', 'The fourth planet from the Sun and the second-smallest planet in the Solar System.', 227900000, -65, 1);
INSERT INTO public.planet VALUES (3, 'Venus', false, 4.50, 'Terrestrial', 'The second planet from the Sun and the hottest planet in the Solar System.', 108200000, 462, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', false, 4.50, 'Gas Giant', 'The fifth planet from the Sun and the largest in the Solar System.', 778300000, -145, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', false, 4.50, 'Gas Giant', 'The sixth planet from the Sun and the second-largest in the Solar System.', 1427000000, -178, 1);
INSERT INTO public.planet VALUES (6, 'Uranus', false, 4.50, 'Ice Giant', 'The seventh planet from the Sun.', 2871000000, -224, 1);
INSERT INTO public.planet VALUES (7, 'Neptune', false, 4.50, 'Ice Giant', 'The eighth and farthest-known Solar planet.', 4497100000, -218, 1);
INSERT INTO public.planet VALUES (8, 'Mercury', false, 4.60, 'Terrestrial', 'The smallest planet in the Solar System and the closest to the Sun.', 57910000, 167, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', false, 4.60, 'Dwarf Planet', 'The ninth-largest and tenth-most-massive known object directly orbiting the Sun.', 5906400000, -225, 1);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', true, 1.20, 'Exoplanet', 'The first known Earth-sized planet to lie within the habitable zone of a star beyond the Solar System.', NULL, NULL, 2);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', true, 0.04, 'Exoplanet', 'An exoplanet orbiting within the habitable zone of the red dwarf star Proxima Centauri.', NULL, NULL, 5);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', false, 0.45, 'Exoplanet', 'An exoplanet that orbits the solar analog star HD 209458.', NULL, NULL, 1);
INSERT INTO public.planet VALUES (14, 'Methuselah', false, 14.50, 'Gas Giant', 'Methuselah is a gas giant located in the outer region of the galaxy.', 1500000000, -200, 3);
INSERT INTO public.planet VALUES (15, 'Pandora', false, 2.50, 'Terrestrial', 'Pandora is a terrestrial planet with a diverse ecosystem and rich biodiversity.', 72000000, 25, 4);
INSERT INTO public.planet VALUES (16, 'Avalon', true, 4.00, 'Terrestrial', 'Avalon is a terrestrial planet with lush forests, vast oceans, and abundant wildlife.', 55000000, 18, 2);
INSERT INTO public.planet VALUES (17, 'Tartarus', false, 6.80, 'Gas Giant', 'Tartarus is a gas giant known for its turbulent atmosphere and intense storms.', 950000000, -180, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of the Solar System', 4.60, 0, 5778, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'The brightest star in the night sky', 8.60, 9, 9940, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 'The primary star in the Alpha Centauri system', 6.30, 4, 5790, 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 'The secondary star in the Alpha Centauri system', 6.30, 4, 5260, 1);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 'The closest known star to the Solar System', 4.85, 4, 3042, 1);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 'A red supergiant in the constellation of Orion', 8.20, 643, 3600, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 52, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 17, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


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
-- Name: black_hole ref_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT ref_pkey PRIMARY KEY (black_hole_id);


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
-- Name: black_hole black_hole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

