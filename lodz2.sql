--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

-- Started on 2023-03-01 13:50:09

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
-- TOC entry 221 (class 1259 OID 41016)
-- Name: ciastko; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ciastko (
    id_ciastko integer NOT NULL,
    id_cukierni integer NOT NULL,
    nazwa character varying(50) NOT NULL,
    smak character varying(40),
    cena numeric(7,2),
    typ character varying(40),
    waga numeric(3,1),
    skladniki character varying(30)[],
    alergeny character varying(30)[],
    gluten boolean,
    informacja text
);


ALTER TABLE public.ciastko OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 41015)
-- Name: ciastko_id_ciastko_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.ciastko ALTER COLUMN id_ciastko ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.ciastko_id_ciastko_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 219 (class 1259 OID 41008)
-- Name: ciasto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ciasto (
    id_ciasta integer NOT NULL,
    id_cukierni integer NOT NULL,
    nazwa character varying(50) NOT NULL,
    smak character varying(40),
    cena numeric(7,2),
    typ character varying(40),
    waga numeric(3,1),
    alergeny character varying(30)[],
    gluten boolean,
    informacja text
);


ALTER TABLE public.ciasto OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 41007)
-- Name: ciasto_id_ciasto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.ciasto ALTER COLUMN id_ciasta ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.ciasto_id_ciasto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 215 (class 1259 OID 32810)
-- Name: cukiernia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cukiernia (
    id_cukierni integer NOT NULL,
    nazwa character varying(50),
    miejscowosc character varying(50),
    ulica character varying(50),
    nr_budynku character(5),
    nr_lokalu character(5),
    kod_pocztowy character(6),
    informacja text
);


ALTER TABLE public.cukiernia OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 32809)
-- Name: cukiernia_id_cukierni_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.cukiernia ALTER COLUMN id_cukierni ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cukiernia_id_cukierni_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 227 (class 1259 OID 41036)
-- Name: group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."group" (
    id_group integer NOT NULL,
    group_name character varying(50) NOT NULL,
    id_role integer NOT NULL
);


ALTER TABLE public."group" OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 41054)
-- Name: group_has_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_has_user (
    id_group integer NOT NULL,
    id_user integer NOT NULL
);


ALTER TABLE public.group_has_user OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 41035)
-- Name: group_id_group_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."group" ALTER COLUMN id_group ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.group_id_group_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 223 (class 1259 OID 41024)
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id_role integer NOT NULL,
    role_name character varying(50) NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 41049)
-- Name: role_has_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_has_permission (
    id_permission integer NOT NULL,
    id_role integer NOT NULL
);


ALTER TABLE public.role_has_permission OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 41023)
-- Name: role_id_role_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.role ALTER COLUMN id_role ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.role_id_role_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 217 (class 1259 OID 40995)
-- Name: tort; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tort (
    id_tortu integer NOT NULL,
    id_cukierni integer NOT NULL,
    nazwa character varying(50) NOT NULL,
    smak character varying(40),
    cena numeric(7,2),
    typ character varying(40),
    waga numeric(3,1),
    alergeny character varying(30)[],
    gluten boolean,
    informacja text
);


ALTER TABLE public.tort OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 40994)
-- Name: torty_id_tortu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.tort ALTER COLUMN id_tortu ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.torty_id_tortu_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 225 (class 1259 OID 41030)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id_user integer NOT NULL,
    user_name character varying(50) NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 41044)
-- Name: user_has_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_has_role (
    id_user integer NOT NULL,
    id_role integer NOT NULL
);


ALTER TABLE public.user_has_role OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 41029)
-- Name: user_id_user_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."user" ALTER COLUMN id_user ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_id_user_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3222 (class 2606 OID 41022)
-- Name: ciastko ciastko_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ciastko
    ADD CONSTRAINT ciastko_pkey PRIMARY KEY (id_ciastko);


--
-- TOC entry 3220 (class 2606 OID 41014)
-- Name: ciasto ciasto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ciasto
    ADD CONSTRAINT ciasto_pkey PRIMARY KEY (id_ciasta);


--
-- TOC entry 3216 (class 2606 OID 32816)
-- Name: cukiernia cukiernia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cukiernia
    ADD CONSTRAINT cukiernia_pkey PRIMARY KEY (id_cukierni);


--
-- TOC entry 3234 (class 2606 OID 41058)
-- Name: group_has_user group_has_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_has_user
    ADD CONSTRAINT group_has_user_pkey PRIMARY KEY (id_group, id_user);


--
-- TOC entry 3228 (class 2606 OID 41040)
-- Name: group group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."group"
    ADD CONSTRAINT group_pkey PRIMARY KEY (id_group);


--
-- TOC entry 3232 (class 2606 OID 41053)
-- Name: role_has_permission role_has_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_has_permission
    ADD CONSTRAINT role_has_permission_pkey PRIMARY KEY (id_permission, id_role);


--
-- TOC entry 3224 (class 2606 OID 41028)
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id_role);


--
-- TOC entry 3218 (class 2606 OID 41001)
-- Name: tort torty_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tort
    ADD CONSTRAINT torty_pkey PRIMARY KEY (id_tortu);


--
-- TOC entry 3230 (class 2606 OID 41048)
-- Name: user_has_role user_has_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_has_role
    ADD CONSTRAINT user_has_role_pkey PRIMARY KEY (id_user, id_role);


--
-- TOC entry 3226 (class 2606 OID 41034)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id_user);


--
-- TOC entry 3235 (class 2606 OID 41002)
-- Name: tort fk_cukiernia_torty; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tort
    ADD CONSTRAINT fk_cukiernia_torty FOREIGN KEY (id_cukierni) REFERENCES public.cukiernia(id_cukierni) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2023-03-01 13:50:09

--
-- PostgreSQL database dump complete
--

