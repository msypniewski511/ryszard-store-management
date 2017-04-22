--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.6
-- Dumped by pg_dump version 9.5.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admin_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE admin_categories (
    id integer NOT NULL,
    name character varying NOT NULL,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: admin_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE admin_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admin_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE admin_categories_id_seq OWNED BY admin_categories.id;


--
-- Name: admin_companies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE admin_companies (
    id integer NOT NULL,
    name character varying NOT NULL,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: admin_companies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE admin_companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admin_companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE admin_companies_id_seq OWNED BY admin_companies.id;


--
-- Name: admin_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE admin_products (
    id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    category_id integer NOT NULL,
    subcategory_id integer NOT NULL,
    company_id integer NOT NULL,
    image_url character varying,
    price numeric(8,2),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    image_file_name character varying,
    image_content_type character varying,
    image_file_size integer,
    image_updated_at timestamp without time zone
);


--
-- Name: admin_products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE admin_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admin_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE admin_products_id_seq OWNED BY admin_products.id;


--
-- Name: admin_sub_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE admin_sub_categories (
    id integer NOT NULL,
    name character varying NOT NULL,
    description character varying,
    category_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: admin_sub_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE admin_sub_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admin_sub_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE admin_sub_categories_id_seq OWNED BY admin_sub_categories.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: calendars; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE calendars (
    id integer NOT NULL,
    month character varying,
    year integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    info character varying,
    expiry date,
    day integer,
    expiry_date_id integer
);


--
-- Name: calendars_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE calendars_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: calendars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE calendars_id_seq OWNED BY calendars.id;


--
-- Name: expiry_dates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE expiry_dates (
    id integer NOT NULL,
    product_id integer NOT NULL,
    part_number integer,
    count integer NOT NULL,
    date_added timestamp without time zone,
    date_expiry timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    time_expiry integer
);


--
-- Name: expiry_dates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE expiry_dates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: expiry_dates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE expiry_dates_id_seq OWNED BY expiry_dates.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY admin_categories ALTER COLUMN id SET DEFAULT nextval('admin_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY admin_companies ALTER COLUMN id SET DEFAULT nextval('admin_companies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY admin_products ALTER COLUMN id SET DEFAULT nextval('admin_products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY admin_sub_categories ALTER COLUMN id SET DEFAULT nextval('admin_sub_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY calendars ALTER COLUMN id SET DEFAULT nextval('calendars_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY expiry_dates ALTER COLUMN id SET DEFAULT nextval('expiry_dates_id_seq'::regclass);


--
-- Name: admin_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY admin_categories
    ADD CONSTRAINT admin_categories_pkey PRIMARY KEY (id);


--
-- Name: admin_companies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY admin_companies
    ADD CONSTRAINT admin_companies_pkey PRIMARY KEY (id);


--
-- Name: admin_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY admin_products
    ADD CONSTRAINT admin_products_pkey PRIMARY KEY (id);


--
-- Name: admin_sub_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY admin_sub_categories
    ADD CONSTRAINT admin_sub_categories_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: calendars_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY calendars
    ADD CONSTRAINT calendars_pkey PRIMARY KEY (id);


--
-- Name: expiry_dates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY expiry_dates
    ADD CONSTRAINT expiry_dates_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: index_admin_categories_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_admin_categories_on_name ON admin_categories USING btree (name);


--
-- Name: index_admin_companies_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_admin_companies_on_name ON admin_companies USING btree (name);


--
-- Name: index_admin_products_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_admin_products_on_name ON admin_products USING btree (name);


--
-- Name: index_admin_sub_categories_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_admin_sub_categories_on_name ON admin_sub_categories USING btree (name);


--
-- Name: index_expiry_dates_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_expiry_dates_on_product_id ON expiry_dates USING btree (product_id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20170322153837'),
('20170322153852'),
('20170322154033'),
('20170324100915'),
('20170326162146'),
('20170328165418'),
('20170328175736'),
('20170329125449'),
('20170402195605'),
('20170402202032'),
('20170404192342'),
('20170405063700'),
('20170417234343'),
('20170418163708'),
('20170418224636');


