--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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

DROP INDEX public.flyway_schema_history_s_idx;
ALTER TABLE ONLY public.tracksuggestion_artist DROP CONSTRAINT tracksuggestion_artist_pkey;
ALTER TABLE ONLY public.track_suggestions DROP CONSTRAINT track_suggestions_pkey;
ALTER TABLE ONLY public.resources DROP CONSTRAINT resources_urn_key;
ALTER TABLE ONLY public.resources DROP CONSTRAINT resources_pkey;
ALTER TABLE ONLY public.flyway_schema_history DROP CONSTRAINT flyway_schema_history_pk;
ALTER TABLE ONLY public.audios DROP CONSTRAINT audios_pkey;
ALTER TABLE ONLY public.audios DROP CONSTRAINT audios_code_key;
ALTER TABLE ONLY public.artists DROP CONSTRAINT artists_ref_code_key;
ALTER TABLE ONLY public.artists DROP CONSTRAINT artists_pkey;
ALTER TABLE ONLY public.artists DROP CONSTRAINT artists_acc_id_key;
ALTER TABLE public.tracksuggestion_artist ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.audios ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.tracksuggestion_artist_id_seq;
DROP TABLE public.tracksuggestion_artist;
DROP TABLE public.track_suggestions;
DROP TABLE public.resources;
DROP TABLE public.flyway_schema_history;
DROP SEQUENCE public.audios_id_seq;
DROP TABLE public.audios;
DROP TABLE public.artists;
DROP EXTENSION "uuid-ossp";
DROP EXTENSION unaccent;
-- *not* dropping schema, since initdb creates it
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: beatbuddyapidb
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO beatbuddyapidb;

--
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: artists; Type: TABLE; Schema: public; Owner: beatbuddyapidb
--

CREATE TABLE public.artists (
    id uuid NOT NULL,
    acc_id uuid,
    ref_code character varying(64),
    nick_name character varying(255) NOT NULL,
    is_verified boolean,
    is_public boolean DEFAULT false NOT NULL,
    birth_date date,
    real_name character varying(255),
    description text,
    nationality character(2),
    bio text,
    avatar character varying(255),
    bg_img character varying(255),
    created_by character varying(255) NOT NULL,
    updated_by character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.artists OWNER TO beatbuddyapidb;

--
-- Name: audios; Type: TABLE; Schema: public; Owner: beatbuddyapidb
--

CREATE TABLE public.audios (
    id bigint NOT NULL,
    code character varying(64) NOT NULL,
    orig_url character varying(255),
    file character varying(255) NOT NULL,
    hash_md5 character varying(255) NOT NULL,
    released_date date,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.audios OWNER TO beatbuddyapidb;

--
-- Name: audios_id_seq; Type: SEQUENCE; Schema: public; Owner: beatbuddyapidb
--

CREATE SEQUENCE public.audios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.audios_id_seq OWNER TO beatbuddyapidb;

--
-- Name: audios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beatbuddyapidb
--

ALTER SEQUENCE public.audios_id_seq OWNED BY public.audios.id;


--
-- Name: flyway_schema_history; Type: TABLE; Schema: public; Owner: beatbuddyapidb
--

CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE public.flyway_schema_history OWNER TO beatbuddyapidb;

--
-- Name: resources; Type: TABLE; Schema: public; Owner: beatbuddyapidb
--

CREATE TABLE public.resources (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    urn character varying(512) NOT NULL,
    tags character varying(512),
    thumb character varying(255),
    type character varying(64) NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.resources OWNER TO beatbuddyapidb;

--
-- Name: track_suggestions; Type: TABLE; Schema: public; Owner: beatbuddyapidb
--

CREATE TABLE public.track_suggestions (
    id uuid NOT NULL,
    thumb character varying(255),
    title character varying(255) NOT NULL,
    url character varying(255) NOT NULL,
    released_date character varying(32),
    description text,
    tags character varying(255),
    tmp_audio_code character varying(64),
    audio_code character varying(64),
    status character varying(64) NOT NULL,
    lyrics character varying(255),
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.track_suggestions OWNER TO beatbuddyapidb;

--
-- Name: tracksuggestion_artist; Type: TABLE; Schema: public; Owner: beatbuddyapidb
--

CREATE TABLE public.tracksuggestion_artist (
    id bigint NOT NULL,
    tracksugg_id uuid NOT NULL,
    artist_id uuid NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.tracksuggestion_artist OWNER TO beatbuddyapidb;

--
-- Name: tracksuggestion_artist_id_seq; Type: SEQUENCE; Schema: public; Owner: beatbuddyapidb
--

CREATE SEQUENCE public.tracksuggestion_artist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tracksuggestion_artist_id_seq OWNER TO beatbuddyapidb;

--
-- Name: tracksuggestion_artist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beatbuddyapidb
--

ALTER SEQUENCE public.tracksuggestion_artist_id_seq OWNED BY public.tracksuggestion_artist.id;


--
-- Name: audios id; Type: DEFAULT; Schema: public; Owner: beatbuddyapidb
--

ALTER TABLE ONLY public.audios ALTER COLUMN id SET DEFAULT nextval('public.audios_id_seq'::regclass);


--
-- Name: tracksuggestion_artist id; Type: DEFAULT; Schema: public; Owner: beatbuddyapidb
--

ALTER TABLE ONLY public.tracksuggestion_artist ALTER COLUMN id SET DEFAULT nextval('public.tracksuggestion_artist_id_seq'::regclass);


--
-- Data for Name: artists; Type: TABLE DATA; Schema: public; Owner: beatbuddyapidb
--

COPY public.artists (id, acc_id, ref_code, nick_name, is_verified, is_public, birth_date, real_name, description, nationality, bio, avatar, bg_img, created_by, updated_by, created_at, updated_at) FROM stdin;
076f4df9-61ac-4bfe-ac2e-75d82e915ba6	\N	spt_4iFNiWhODcMZdmpNkxsTFp	Wowy	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb805a46e981dff62380813e26	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
56a47280-2444-4808-bc8e-31b27b1b51e0	\N	spt_2Fc5cGXai8xzLhGyltp4tT	Suboi	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb518371670c75754203839ac5	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
a7a5684f-8add-4665-8032-020ef4446b2e	\N	spt_3EPkqJFzEGSJWtGsu1Xwqt	Kay Trần	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb0c915218b67de3265b6430a1	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
26591325-95a5-4716-8a82-bad9c2f573cf	\N	spt_3Tehj7YghQc7zH0I1faGc6	BigDaddy	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebeb864b5f2426b9a60b0003f3	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
63d1a84b-569a-401f-bc00-0b6c60adad2b	\N	spt_4grjJqg7iwQ8RKHs8d9Snh	Andree Right Hand	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb3dea3ddb7a950a6df930f5dc	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
9da5a71e-75cc-4e01-9622-e2906899dbcc	\N	spt_4jQZaxfgwiUJFQagCyZNV4	Ricky Star	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebe7012a07d44b58b0d2812c5b	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
cbdbc854-c78c-4826-8c40-093946a7cc26	\N	spt_40JnMfFlpwqBnWitkL96g4	Isaac	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebcb44ea77e9b885b05ea60e8a	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
dbe3d4f5-b94f-4082-a43f-e8793a1cfe09	\N	spt_4e5LAUvM35jleGg8gElTsP	Miu Lê	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb2fc3ef8a80c35243e5e899b8	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
a5bcd3bc-36c8-4fa4-8235-41979450023d	\N	spt_5GBXwBVQufRCmwI1bNRIUo	Only C	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebc7c8ae4ffa1d7f3bfd4aadfa	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
8ade9837-8063-4bdf-9e44-01c217f919f5	\N	spt_7H9jPV9qWyp6V629038aXU	Lynk Lee	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebbbc1060f99c7a2bb88161a74	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
ad758d87-841e-46bf-98f2-d796860febb7	\N	spt_7LLfmKhGZI11XO0dO4xDI7	Anh Tú	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb72bf46375d15e81cc801f4c4	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
fd1b2423-7f35-4e00-9f83-448e7d61363b	\N	spt_75Ki5hBCOpDtKGoFyTvLxP	Lou Hoàng	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb2687636627de1c3063701325	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
097e7474-5771-409c-9d74-200fe5be3aa7	\N	spt_5UNWQJdUbO8Gbg9Qn3r52M	Touliver	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebd1791a8797ebb54224bbe240	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
e61980e1-b536-48e7-80da-7b3e32132e79	\N	spt_0gGd4WhPXBSgDX6fdOHcOw	Rhymastic	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb0e62e694576ab6f8e56db3d8	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
e04a23bc-0240-432b-b008-b88a328556de	\N	spt_1WvNgEoB66jmHodcj15Zi9	B Ray	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eba69580618d4cb782c49f6c7b	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
5d7a46f8-5b7c-4bf0-bb3b-c61be90246b3	\N	spt_6S0JgJU2l6ds1EhZUJMQFk	LK	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b273eb3522af6312545527136a30	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
967ff74e-63c7-407b-9eea-5b28e1e68967	\N	spt_5U1dINFKjJlYNOSdMrHlRh	16 Typh	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb926ea7f4eb9e0b1764aec0a7	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
20e13630-0f6e-4383-af48-aa56ff8ca914	\N	spt_3oB1lv9FWDKbNOUvdTw75Q	Bình Gold	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb076887518c36920395d20876	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
fd0d3e1a-c801-402e-9f62-779ea6e3b767	\N	spt_3rjcQ5VIWCN4q7UFetzdeO	JustaTee	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebde3d3210433dd11c07678420	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
1fd3cdfc-0b2c-4d02-82e8-63440db83b15	\N	spt_3BWBxpXDxofgji3RKZPIz8	Hoà Minzy	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebc5ca014c7d8a729016b3b5f0	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
e0e5050e-b919-4bb5-9bb4-f28271bb71fc	\N	spt_5Kh0ta0UY4uJ4g2CIdq9V9	Phương Ly	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb34002425b245333433f3cf32	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
2004c280-9e8d-48b8-81a2-ebc5fdd597af	\N	spt_2Bwp23pD4UVsSkchHDZw4F	Karik	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb3e1b16e263e182dc85f2b7c3	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
5ccfd128-e6df-4abe-90d2-dc6d106a917e	\N	spt_6CGGvCBHWqQ4HXtn5aLhbh	SOOBIN	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb1735d4771ec48d60d2e3dbe5	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
deb42036-9e5c-4676-b52c-3ebc648cc42f	\N	spt_2nSO7JYDbJrYbJmP39qUzj	Binz	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebcbc6b072aec429273fdbd53b	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
29831c29-dedd-44e3-8664-0e1108d1d62f	\N	spt_6zUWZmyi5MLOEynQ5wCI5f	Da LAB	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb82055f0d7880dc8c73edc5a0	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
ac5b215f-0ca3-4be4-8f59-ad438b32db03	\N	spt_3nGqUwkJHiLPDECMVrX1Sq	Masew	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb3384ebf481862099a35cecaa	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
736490ce-95ae-460d-b842-978fe97f3a3c	\N	spt_23jUmiOyAG9Dzq6Ayp9LUG	SPACESPEAKERS	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb6dfbadcc2bc0747b31c75d96	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
81805f97-6023-4a95-9e21-4ba2b13673a0	\N	spt_4x1fUORHa2EsxrQ6ZzAoQ0	Suni Hạ Linh	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb9411b12f482f50f4b8895367	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
7c6ed720-d316-4f6c-950f-a91f59244ee0	\N	spt_6sJBvMCAi9NuNCxI9RDYDW	Osad	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebbf16ee82152417ee3afb34aa	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
2e797150-6f85-456f-ba72-6ab463c85d91	\N	spt_0UzTVrRT0KTsJDxmlcGfQG	Tiên Cookie	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb43b90fca5f4242d4400f68c1	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
ae472bbf-a6d7-4aeb-aec5-182c2430b8bf	\N	spt_0IdAjS2LRieBR3gzoazdAw	MIN	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb9fbf4d041c3512612974d7e8	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
4646ca20-ce5e-41cc-ba06-11eb2c71ba89	\N	spt_6OzE2OdvV2tGAxSBsBuZ74	Hoàng Dũng	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb63bf6330c331d0a1ec425700	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
05afc4f0-875a-4239-aa8a-14a844b4ed20	\N	spt_3Z1ArowingijWbVesn0aON	Pink Frog	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b273e87eb168c33c88a10a57a4e4	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
f907bf6f-9454-4719-8b39-0e19f6ffcd44	\N	spt_0zn7lYLmKeTdAva9gucVJG	Chủ Tịch Kim	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb86453182fe194c95f2c2561b	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
8b2baef9-7952-4433-9140-ab6567ab92db	\N	spt_4NfuHLESitkh66LOZeyzsu	Minh Đinh	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebc40bbd734166cc0afcb0c4a1	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
65b0bc9f-51b9-45be-8acd-0b677a7fa382	\N	spt_5h0cBKxBX54CqPaQU6tJhk	Haisam	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb73a027903d940d06e5c58d96	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
3062fa60-0113-4f39-a4fe-43be2a86a839	\N	spt_4s1DRFQAYnDvXmKYFBUcYa	Thành Luke	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb4e23da4bfe6bd99382d2bf30	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
6f14ad5e-568f-4380-8b51-82cd3148cafa	\N	spt_1TdtsDVivxc6PpkQdNuXdR	Tùng	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebfab2ca1d5bd836f07236688f	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
62e37eb1-562c-4d8f-a02b-60b3456333a4	\N	spt_5j5vJBQTJARLJspItqVyvE	Kiên Trịnh	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb4dc628c94be65240f6d79357	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
46b2cd72-05a3-48dd-81dd-d31be15aa0c4	\N	spt_1fQjpmcx8iNIy1gKRelTD2	The Cassette	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebd2ee619259b94165619ce1ea	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
a844bc41-7f4c-40a6-8bf7-b368ede1b843	\N	spt_2knyDFP4xw9wZEWA98JX6b	TRANG	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebe28057e8f67ce8071d58bb35	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
f5f99ea5-e526-4b44-8b8f-64a40f221ab4	\N	spt_5SrlFeZhl6SkP8gzRcFa0n	Thành Đồng	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebd2172d72e9012f874a9b5f25	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
b355f749-e40f-4203-ad75-73d0ad69f071	\N	spt_7hLz2ZikFy4ZwDZS12Z77n	Lê Cát Trọng Lý	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b2735510b8caaaf5e61a89cc2798	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
9220fdce-cf9a-4900-849d-7fb5abf9243a	\N	spt_0u5ikKYYDO2XGyYjNGQRGf	The Flob	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb634807fde9de6b1e19dee172	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
d9ae8157-7768-45ae-b252-e7cd98af3a2d	\N	spt_6IBIzIFj0W756sS7OITld5	The Sheep	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebf4f30e19c1e8a15cef0f659f	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
b93819c4-ce35-4975-9485-3f6172bb1746	\N	spt_5ptgjFDE2abY6Xwo4ytufN	Vũ Thanh Vân	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebdd2fd98b7e94a15a4a15bdb6	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
65a39990-e75c-4558-a6c9-bf50bcea9db9	\N	spt_3UjpgK0RqZLxsJqa4akrNn	Những Đứa Trẻ	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb38ca109add87b0ea9c1b5e7e	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
4ed5e898-7d4c-43ab-8177-467b5f664379	\N	spt_2WpCywRd9h3riGjldGWHIB	Thoại 004	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eba580a18b4de7dd8a5da8978e	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
82d3a4ca-1ef0-48ef-88bd-1a94d2db2753	\N	spt_0gKFZe906MNldE7Pdhb1c2	Tùng	t	t	\N	\N	\N	vn	\N	\N	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
9009fdae-af8e-4b75-9a86-041232fc1b62	\N	spt_1pKJ2DU2i3uu6a23ngLUby	Gác Mái	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b2735892aed18cec2ea9cb46fdc5	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
20bf4ab7-4dc0-4fb4-9d0a-fc8fb61c67cf	\N	spt_0RzxSfLRSQmRJ3fFabRMsT	MINH	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb8fde680c4d9b89e5782390ac	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
72d4e2a1-7184-4bb4-8295-b9a1bf00410a	\N	spt_4uqZAHbX45ygzxhxkRwTwR	Bệt Band	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebf9a8e3bc0988b424583e3d4d	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
ea687223-6908-4757-8b3a-22b07dd06c9b	\N	spt_2BAhRYk5QrGfs5KNo9gHr4	Đá Số Tới	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb993a22c7eddc313d0ab1768b	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
3ff4fa3f-dafb-4137-bfca-9b70cb93ec60	\N	spt_77b4s2pD9ezxA8EVti2cJw	DÍNH	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb71d9ebf76fdf6a679ad2375c	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
7aed95c7-9863-4182-b2f8-c21bb6931320	\N	spt_4HGrrevENLsGCTS9bwqUrm	Jaigon Orchestra	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb21e71bf74b6c5553a7fc43a6	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
0c9330b5-930d-4fbd-aff8-509324b65418	\N	spt_4IiJbbRn328Zxw8mtHb7bo	Cam	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebdcb3c69c3fb0aba0ceb1da9b	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
ac7b3645-b1b8-484d-8a13-d80dd3e0dc00	\N	spt_1984OVQ0KnJW80MiZYOrFF	Mèow Lạc	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebadb54f7879966d8cae581357	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
6b2377e6-f4d8-4678-8514-c8e504193001	\N	spt_0Gdbr9myXctE3u0jKahkFo	Chuột Sấm Sét	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebbf4e33169cb6bd8751285655	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
8f5b4472-7ea2-45ed-a593-ada047afbf4e	\N	spt_2j3AXmye1FJXoGOXr6tufj	Cá Hồi Hoang	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb2e1835960ece8454ec87ef6a	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
2ad4072f-ab26-4c34-be8c-924d3a076035	\N	spt_39NXoiwWy5aJFeC76TzW9v	Giấy Gấp	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebd026a9acc97be74aee16f289	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
5df4a96f-9a3b-43e7-a1c6-2e7dcc511a77	\N	spt_3B3UoHY8tKJ6zmyYZhkDSZ	HuyR	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebfe295858003be8336111ec4c	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
4d66f00b-59a6-49ef-b24c-823ce8624272	\N	spt_3FZ4GX2mWNn7XElse3fQWd	Khói	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb4d19b6fba8aee38207c35101	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
d4f86525-7a92-43be-a46a-53cf3631c15a	\N	spt_4R3mugkUqCALXgkwSptTbg	Đạt G	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb02ab539ac376b8e099010802	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
5f4f0210-5daa-4944-a8e0-13ca16cc3e99	\N	spt_3S2k1UZ8n1KpMrOaImOif3	DatG	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b273aa1791472efa0debafc30182	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
6240c28f-ba37-410f-8736-8cd1814e238b	\N	spt_1L1VfizWn4DkFt602yD80U	ERIK	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb63ba7b9441e542f3b2938b83	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
c5090b9d-42dd-4381-bc83-5d4681ef2529	\N	spt_4co1OIKlUOsNNVJFSZzO9N	Trịnh Thăng Bình	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eba8734b9d20f8467af95ab662	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
ea2fcd1b-c7a1-4f54-8d81-2d4d67af23a2	\N	spt_7luDDYsfkSivBsoTz3BKMq	Khắc Việt	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebd9afe5d7a1e42a1ee17cd193	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
0c8b9413-62f8-4047-bbb0-c6289d0127af	\N	spt_6JTiPLdbZD2e0tDsN15U1s	Đông Nhi	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebe90ee6acf05599eeeab1beca	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
f6944749-aa48-45f3-a240-a2418d930486	\N	spt_6jFvKq4gMkQ50joURHPGXO	Charmy Pham	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb5deb7423a9f3391044b2a505	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
6374626b-f07e-4d00-b709-c53875b7c840	\N	spt_2Gvp79Cmni6PX13CAlSGex	Bùi Anh Tuấn	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebf2db4875c81f4d103aefc81a	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
98b37282-a366-497c-a0a2-9f6bccf4c9b9	\N	spt_3x6FwiNj93pnxxMDNRA1IR	Hồ Quang Hiếu	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebc8e6821e8e05fbd6e3a01f72	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
a55cb444-3bc4-4b60-8a8f-1110f80668ad	\N	spt_5Cf9nBDNc99UFkq9Yqap7Q	Trung Quân	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb99e937ca54656d4d09474420	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
587d6434-70c5-4a1e-a1e9-38613919a8cb	\N	spt_4fCHhderLwLacsIOIKgu3J	Bảo Anh	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebc8a99b7d4971c74cd6dc0eaa	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
1e876f05-dbbf-43ea-b797-2578ab2de390	\N	spt_604MsLiPn50AblFYzOg1RD	Chi Dân	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb7a8dde3871698647183c29f0	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
36315318-ef4b-42fa-ab3d-48d4f1397368	\N	spt_4ZSYaCMxF2k6maN3KTP17F	JayKii	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb0c1f7a270cf63a9bdbec9d10	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
3e19cb17-1b02-4a1e-8600-d7e9f9f6cbf6	\N	spt_78TTKBLrw5XIRty0KnyftQ	Minh Vương M4U	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b2734e722171d22c52cf279a0da6	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
f0037fc6-541f-4cbf-a3e3-a1db6dab202a	\N	spt_24Wn81dwdDeTCuB1BWGoVJ	Hồ Ngọc Hà	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb9804f7d7085ca1773b86142c	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
cb7a48a3-f8ce-4848-883b-080c9597e14d	\N	spt_4YkqEuVf1Jf2x2XDqJ2CvC	Tóc Tiên	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebe51f475c32e7e8f34faf95c5	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
be01a09c-7b7c-4f29-a2ce-1ce25c57b593	\N	spt_3JkGKNawown8MgcJsDw1WT	Duongg	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb752458cad38f928d3939c64d	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
0ca4a8e6-a4db-4e60-875d-a7f8cdc862f8	\N	spt_1OXwJdOOL0Mio8zgA01OFB	D Empty	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebc170d1f88492bcc9e0e36142	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
6c8546f4-1a44-413b-bd23-e49f3898018d	\N	spt_6hnfLIkvDl6pjlAe1YRGXY	Bon Nghiêm	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebd53692a1a18b4007e28c5fbe	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
79c36afc-5579-4fb3-91f1-8923cf375056	\N	spt_3euFcFd5Dc7JAz6t7oKg7m	BMZ	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb72ee71305a5799765ff63db4	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
fc434983-48ad-45d2-8ebb-c62c6277064e	\N	spt_2bGV8Wgh1Kb4LPk1jyEnbg	GoAllDay	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebfbb6c2ad028f85a7e4162caa	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
4ce1fd99-fd08-4587-af52-0a0bd5f56f72	\N	spt_1MTANbmLhUqJXlLuqADGE7	NIT	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb2ffafab41d3017a9255fe8a1	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
5bd5297d-94cf-4edb-bf80-17b99e94600c	\N	spt_2RTF7MrLWGQJQRwVzg0fDz	Đỗ Nguyên Phúc	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebfe1723ef3e57cab6437f71aa	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
f70e8b08-99eb-4103-a0fa-4cc6d20665e2	\N	spt_0FflNqUFk4ODtAZuVuqgou	Nguyenn	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebf834e488ce584b57fe4bc292	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
873fd648-a6c8-4c1b-a5a7-3a2fafb14c00	\N	spt_2v14NO80QYditUms7sbEIZ	Trung Trần	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eba5e4e822cd4b6096aec8e57a	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
9936b02f-28c3-44dc-b3bd-4ba22c737ce2	\N	spt_0CkuQCslREF7yuvAqJXVuz	Sáo	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb7f1bca865e22e2cca6956722	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
449e6426-858c-430e-8ecb-f255402b226b	\N	spt_1xNqmjTeWon7iX8kbPKpZz	Sean	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebc989313245e768049acfe97f	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
97c0e51e-37e7-4e71-adea-4dbd026b6f1e	\N	spt_6fCJf6pkYTHfW1XPc1d4vO	PhucXp	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb96b54ba7b675722988528307	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
c457126f-0878-47b5-aed4-4e7a9dd33f0d	\N	spt_4APrfmUo8KRrjCVuyoKvwY	O.lew	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb28ccce8c6a092aa7f6c1a698	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
fcf3356f-de80-4b0e-9bcf-8717797322d2	\N	spt_0wATZebE9ZNj7fTjTdwiJB	Kewtiie	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb0accc319a3cd4eff28b242a4	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
18e48719-1bf0-4fb9-849d-3edacc4913b2	\N	spt_3HD3V1nGFPwepBO7064Ij0	PC	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb70bb4d5e160a5bfa5f848f1a	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
4263fa8f-973e-40e7-8f66-aaf352dbb1bd	\N	spt_0dBcEvEklr1jx4uZuhFX5e	Ronboogz	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb52e4f3bc88ce00be25c5f747	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
2b2e8280-119a-4e9f-a5c5-34c151008d73	\N	spt_3E6LGptA8lBEXPHAQCE3vr	Kai Đinh	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb2745dabc439f240f5e4e4a62	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
44538e43-0d96-417e-b964-710f815afad4	\N	spt_2SWNzbf1maA3oR4x56Uv9W	Tùng TeA	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb13f97c503ae98961f29a05d1	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
ced22733-7791-4cc7-8f2f-fea476b2efe6	\N	spt_6mshB4wc19nPYxpdbtWkz9	kis	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebdefdfdb67e3fad3647632e6e	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
c18b76c7-c1bb-4f66-abc4-5e64e940379e	\N	spt_7JRDlOAUMJuLKmapm6H2VG	D Blue	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb5b361dcfb4ea82891c46365e	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
e53a7ab0-139f-42cd-9800-d0dee12f8e62	\N	spt_2DTVCDYfT6Uo8NugnHNRsg	Đỗ Hoàng Dương	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebcfbda65e78ab7b1101094369	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
f6db2fda-8df4-4d60-bb73-5e8455e8cef9	\N	spt_6Ca5ccx9CM1kd0LBz1T83U	Pham Dinh Thai Ngan	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb3562f17b61ecb859bcd63e6b	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
7550f2f0-d0a2-4158-8bdc-367eaa20980a	\N	spt_76nos2JmvLyYGZ28ribrf7	MiiNa	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb48ee822a8a983523d4020c80	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
3f452182-f44c-4432-91cd-d660b387e4d0	\N	spt_4RPhZ2g5GYff0hKNBlZKXh	Ali Hoàng Dương	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b2730a0d6d2111493d8583474c00	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
40209763-a759-416a-a810-045eb193495d	\N	spt_6bLRsp9AAj3St5Ai70PPVm	Biển Của Hy Vọng	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b273cd96c10aeee9a07bf7f3c457	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
8dbeed09-82dd-4b78-bf6f-7ac821cf2baf	\N	spt_1L2VD3TPgcbUod5IID06xJ	Hương Giang	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb813f1953da358f0e68a42b5c	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
09e929a6-a380-4f41-bd24-da3072e2c318	\N	spt_5k5vCzAmH0dcRda22U9Hut	Ái Phương	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb17fd5339ef48dc8a0efaca6f	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
29918c5b-e3c6-4969-a05f-f249adb1e0bb	\N	spt_6InVt9jASvsJY7qA60AGzf	RIN9	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b2734dede92b91210191f74021c8	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
a7fcdaa0-d039-4364-9aba-9722b22818dd	\N	spt_7AjrzSwNXDH9bZjjCKR8kA	Bảo Uyên	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebfa43027190bdfa32569e118a	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
a0e3026a-ed9b-419b-80ab-f24fca6d2509	\N	spt_1fTWz0OemWveF9AMkRPJKi	Forest Studio	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b273d4e27f52c4d13ecc13a9fadf	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
cb5ebfb6-469e-4c69-852c-9e9465d300c3	\N	spt_44ZNcW1ZSGB9oqX1ALnriH	Xesi	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eba7a94977c8f3421a416769ab	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
ce368add-6dbe-4e1d-8d21-75725ebc996d	\N	spt_1OnnVNvbz0OsApDXHUX2bM	Phí Phương Anh	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebc83cdeaef9edd1301538fc00	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
22a3a6cf-cdf0-4ab2-b45b-35486acbea86	\N	spt_2UK55AFshflMYHdBySyVoC	CARA	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebcb8a77aefd6e7129fe863d99	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
6d32736c-7fe7-4cb4-8227-5454cb0354a3	\N	spt_6oqtpFuvCTISMPeGv6P2sj	Bùi Công Nam	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb30b06e8ef75d11396d495259	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
2dbd0fc8-b477-4822-a695-ee9fb16a63f6	\N	spt_3y0Tmt0epaxAHy6L89dGGC	Ngô Lan Hương	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebcb6b0722d8b3d6b81395a9e1	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
d7eef7c9-b7b0-4478-99d5-3d85575a9db5	\N	spt_6RUfMGubOnHT1p3nfeXpBl	Thiều Bảo Trâm	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eba752ad41626e9ef96e470ac6	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
a27e4d3f-7b4f-4f34-bf07-463a99c2a256	\N	spt_4QC9UUJeYEo4wnbTvuOHLo	VAnh	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb7913301ddca91d0bb45defc8	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
5823efb9-73c8-47cf-9c91-0501f9d33862	\N	spt_1KLRO4UHKmiwS0grGzFdgT	Dế Choắt (DC)	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebfec09bd196e896f20125e9ae	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
5a5147d4-7b31-4ca6-81a0-365e7461674e	\N	spt_1Vc9oJC8vSXfirygPAL2Du	Huỳnh James	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb8bf9d51445275a7428ef8715	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
ca75b0ed-f361-4037-a72f-bbb8c1955fdd	\N	spt_0JggLWdYe1p6oHZoHpyPSD	Blacka	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b27341b1bbc9c36881f93a764a69	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
b10e9ae2-38d9-439e-b710-24d97571443d	\N	spt_6kFhNMq6O8P5QKdqlGMUVW	Tage	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebb43b6febe7bc0a4041081179	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
d8967b8d-98fb-4741-9f20-a2d8b9dfc3f8	\N	spt_2RmVHHCdiQb8yGa0eRhQjP	King Of Rap	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b27377bb519c5749624d1a1871b4	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
57a6b83b-bc07-40bf-8779-fff031e80a1e	\N	spt_6UiKZD9yB7Gxjol62s431k	Seachains	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb8970471e4c583e41a7e22ad0	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
c327779f-e0ae-4794-8b2f-1f5389b14db5	\N	spt_4w5vfLTFKwpd16ZzmYwcXA	Kimmese	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb284ebfe23fc2858155917007	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
c817a7b7-5142-4724-9dee-950be91418db	\N	spt_56su1iNcOlGUPEtBoOoJ5D	Datmaniac	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb9b15d1aa00b4d451fe27a455	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
b7d7fc24-9b38-433c-abb6-8c143c315c70	\N	spt_5kooMseQPNPTz5y1UCM5UR	Pjpo	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb455e8dbc116f4c3286f7ac3e	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
6f5b8878-ff9a-4e90-81b3-65ea2fda48ff	\N	spt_3Wj34lTDJnPp70u4YCl4jz	Lil Wuyn	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb70cb097c71b1b2bab9f1c69a	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
135cb14b-24a0-499a-80be-1d51b8c22544	\N	spt_5ELPejPzr90MkvmpQEr3RU	Phuong Linh	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b273bd48f3fbedddb23ed66f860a	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
e02618f3-1019-4758-81bb-c2d9d2997ff2	\N	spt_7cmcZaAbbTZIKiqIBJ2ycu	Mỹ Linh	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b273b75c39ac354fab2634ab856e	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
be89066a-86b7-45be-bf12-579d5c57775a	\N	spt_0DxYes5zk3LMaliyhYdXHN	Trần Thu Hà	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b2733f2e0852b231e3449e6ca7c2	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
56c16dcb-aea9-4e62-8bc8-d616423f0d94	\N	spt_4mzMFxVZNS2uCVNdsVFoj5	Thu Minh	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb04226ec6af8b00f7baf9ce07	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
00642c1e-32ed-4c43-9e4d-9bf931831a59	\N	spt_3EP4RX5LSuwDVy4mDeF1rl	Hồ Quỳnh Hương	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb2078804f132212eb2a5ef9e5	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
ed6cde4f-1d84-47a1-bd93-f61a40a549dc	\N	spt_5A81GkfzRSHiNQrge5m9gv	Phương Vy	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eba4d7eb1fa612780685703c79	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
5930b2d7-b7ca-4488-af15-ce7087e25371	\N	spt_3LsIDqxwDjcEKbK3D1IrDk	Thu Phương	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b273247019fcf88d8bc34f38eb4b	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
7210b797-a34a-4a3b-bc44-1b7b668d55db	\N	spt_2xyztcPkhFKucM2ghmSme2	Quốc Thiên	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb84d49624a92df1306e394efe	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
36f3dea1-2560-48d8-beb8-a93f16d29fea	\N	spt_5MibVKlWvof8lLAkOaaDmi	Hồng Nhung	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b273cdad076c010df4a5f07c16ac	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
2d539377-6481-4f20-b67f-526117f2c906	\N	spt_63SNH9m8M034lCGELVC1dm	Văn Mai Hương	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb449f96a16500b2b75e1c9234	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
920cd915-52ef-4108-ab29-48f1c6cbb794	\N	spt_6xQUSqDu9uizDib9Ww47yO	Hien Thuc	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b2738e4fe651cc63bcf65021522b	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
f4dcafe2-0bcc-49a4-9937-97169eb04437	\N	spt_5Ib3D8UtLdYZjhVNWzwfoH	Nguyên Hà	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb0950190306b49542f6f68b58	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
b9e3d772-a2fc-4e47-ab4b-6f0f3bbe94b1	\N	spt_5tPrBvEiBBbSyMFz2u2ZMi	Lam Truong	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eba61c5c97b1b318f1b04fcd97	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
f791838c-fba6-4da6-86c3-e7341671c74e	\N	spt_0l3YAI1xmZKCZBzduST5ft	Thùy Chi	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb907bbd0b2531b8e793ebd242	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
29422f6f-a432-49d3-86bb-d211a8fc2de5	\N	spt_4F5jaYapI8RtTpqwaYs4IF	Lệ Quyên	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebea9b15c80810bae0bb0e87ad	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
ffe2f28c-f2f8-43e9-9613-e7b861a8aa18	\N	spt_5kG9gxVkkdrskVLhfblCjT	Thanh Lam	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b273c240eac154c820d5214db661	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
dfc8d17e-a539-4950-b495-cb4153541a9d	\N	spt_4sOvsEM0ooH149joyEm7Wg	Lê Hiếu	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b273caa7ef3c1e269ce6b12f6b3e	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
4772af49-1e58-4513-8259-3cfd3858e748	\N	spt_0KWdVd7ZYhtlm0CLHIFBya	Bằng Kiều	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb004ae448e0ac5f697c71d654	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
0f3d4c3b-8352-401b-be7b-c0f4bfad8991	\N	spt_2xvW7dgL1640K8exTcRMS4	Chillies	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebae678a70cd3899b2167026ea	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
481452f3-5cf7-4d95-b2a4-48842ea9f4d4	\N	spt_4bPYvyUn1mWwUwIW57oST2	Emcee L (Da LAB)	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb92dc4a2cbffbddb59f825fe0	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
b5f2c07a-cd5a-408d-8783-3beef866dbe7	\N	spt_0tBmmwc8j8zbJxISwdsvjA	Andiez	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebd6430dfeef182fc1eaa9b105	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
8ba7a1bf-0ee0-463c-ba09-5990a8dded84	\N	spt_2xK6qcvfXuFFbU0NL95aeo	Thịnh Suy	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb34dca195e6f7b02580155565	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
4c9ec05e-0765-4d9c-8fe0-8189f5be2da4	\N	spt_5OvCh1Nin8AGw7OkxYinBe	Tiên Tiên	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb367ac417cc3e77ffb8362e0a	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
15e4f4a0-98eb-4310-a8b7-aeaeb46b4cb3	\N	spt_2CLdtsyD2NsTOBBOVr7fi8	MONSTAR	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb670d1bbea09cde81f7a7893c	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
35177e13-fa8d-44d6-83e3-256616d1114a	\N	spt_1OIYKbmhG0RxPXvVPNj3NN	Madihu	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb3bcc23d31e8962897b7d3e2c	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
df3b6fb2-85eb-441c-9804-ef41202587a5	\N	spt_57g2v7gJZepcwsuwssIfZs	Vũ.	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebbbb15879256a5443ef7d87b4	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
94b717a8-58f9-4512-ac3f-82230df7bc29	\N	spt_0V2DfUrZvBuUReS1LFo5ZI	Ngọt	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb66e0a040a53996e8bf19f9b5	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
664a0821-f03d-49f5-9e9d-210492bf8581	\N	spt_5lAfakPZgxFKgiJD6xAF1G	Orange	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebd4050562a6008252b169801c	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
11eaada2-6df0-4739-aeb1-51c8602de036	\N	spt_7yquVKfxBuNFJbG9cy2R8A	Vũ Cát Tường	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb15b9b2263a70180260b4cf97	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
817f9a2f-9b88-4ac3-93c5-6fe3e57ac23f	\N	spt_5fa13NJjmn2uQ3dxZDi2Ge	Bích Phương	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb2de300e8eb56aac83abfdb4f	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
4c635a30-d220-4460-9db6-22f532029997	\N	spt_3mibIJiduF0MVLLAvHZAxw	Noo Phước Thịnh	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebda93c541daefd806b8992302	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
22844ec3-e606-4385-8797-59c591336e91	\N	spt_1dmaHHd1Xbd85cT1egYb4w	Trúc Nhân	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eba7f28bd3ad5ef4a868151ee7	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
22916d15-3d29-4298-9995-16099fcdc4b3	\N	spt_7lq25uVNvzRoAJgr4CYr8e	Thái Đinh	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb1b6e674679f24d11a7446228	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
bcf7967e-e426-4d73-983c-bd2f712c479f	\N	spt_6ZmHJcmCcc9X2sAyz6cHng	Hiền Hồ	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb033a1f97b67ac32e69b2de3d	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
e69691f9-32d5-4cca-9a36-d4f93b134448	\N	spt_0y8J897IGMESNbBqCpHXH9	NHA	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb50f98a4f68dfdbaa85ff51d1	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
698fffa4-36c0-4f9a-b404-b8ae1f831534	\N	spt_23xCr75lKvnFvKi8ImHE7S	Táo	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb3edad601de71d029b73c620c	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
36e233ce-4733-4a9d-b505-c58cf6a9d6de	\N	spt_5ayWRfrcpObgDDlzheJ2Gr	TaynguyenSound	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb422664c8cf0c99b3219ffd7b	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
328b3712-15bb-4d49-9d33-62bf7809cceb	\N	spt_0Ux2qIQbEeqvv7uYLgHhDH	tofutns	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb1aca7b0563eda380d70ac51e	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
8023e797-8da6-4383-90c3-653d9ae815a3	\N	spt_49lqmGqzQjQCQvAqGIevkN	BCTM	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b273ccf5eb1e7d1452b932f9f06f	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
3571dacf-5f20-42ab-abcf-946913118c15	\N	spt_5yE1xvNIbuEB2kkopCuCVY	PAR SG	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb107697fde71a1ac4b328a140	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
7064e6bb-d9f4-4bed-9a6b-51f5eb698c49	\N	spt_2dIQYQOIZ3CNxRUNVwr8dW	Huỳnh Tú	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb74687b378b5eece194d2f4ff	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
63410196-27f9-40f1-bfdc-e0bd60145a6b	\N	spt_7oOFsgF6y3Z9wI7fgJTbFk	Châu Đăng Khoa	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebd1bc9d9682c9c9e57a24e8f6	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
15a47c31-f0f8-4917-badd-42a22a47fd11	\N	spt_6wZ01tGqWDyJ6vykbeaIFA	Kidz	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb7afe8f2cb69b581d8d359bb4	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
8f56c112-73bf-4306-bf3c-580058b1a854	\N	spt_30eFAXoU2kTjJPf2cq80B8	WEAN	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb1e980099699211bd0dd694ad	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
34649ec8-a84b-4889-a247-0ed223fb53f3	\N	spt_5FWPIKz9czXWaiNtw45KQs	Đức Phúc	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eba7e82b4fbe3605c71aed9fee	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
b728b899-f4cd-44a9-bd2a-491ad46662f9	\N	spt_1oD9fKbb7qQ2nhn9JJC24F	Thắng	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebc196ed35d9425d0abe9d2f63	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
8eafced9-5db4-4630-ad23-6fa55ac3644d	\N	spt_2rVYwIYNEsMxtt8j5yemHb	T.R.I	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebbe00f37f2dd2c594bb336f85	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
f8a8c312-a6a6-4b31-b536-e5bee34ffe14	\N	spt_6tWaQSIL7reD85PKStNk28	Kha	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb4053b425a789aa1a60436ff8	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
d66ef922-8f4a-407a-840f-fb752320d8c6	\N	spt_4RGBKkUyyvsim9vdBKCCkc	Ngơ	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb6994e627c5b26909bc8ba813	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
52250d02-c25d-4cbe-a13d-5cb87ac4117f	\N	spt_6d0dLenjy5CnR5ZMn2agiV	GREY D	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb2109b4c3915dce9b4fb60c38	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
3e021804-88b8-4878-a3d8-e67721267170	\N	spt_7Cp2hGcriAaDUAWpXnSEwm	buitruonglinh	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb6fa9203f46889b95e081d2ec	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
06cf6811-df36-459a-be25-b843c81e6f2e	\N	spt_2aMo0CYbTieTisS0BlWc59	VSTRA	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb4003ce478669b0b238ebbc85	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
19ceeeb2-b4f9-4327-a4b9-68678a5e9d2b	\N	spt_6TITnFVRcl0AcZ4syE7Toe	Low G	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb00ece52e50b41c7d6192cc26	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
45a74d50-b8e5-44e2-93a0-22b7173c0f6d	\N	spt_03RW9nhAyt03K42HHHLuus	Đĩa Than Hồng	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b273b5cd6a220f9eca6d7fe335c5	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
00fab4f7-4853-4f08-98b7-1550ef0b30e8	\N	spt_033tY0EKEVdDtzoeEMMCJC	Phạm Quỳnh Anh	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebad6d5adbda5caa0ac7d844ee	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
05dee7eb-f0c4-4d97-9069-5c368873a46a	\N	spt_51wGpVg4Z3lv1IjuZAQjXn	Juky San	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebd6512c92f2182bed4bb645b8	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
82988eb8-dd8e-42e8-bbc8-e8f683aa77da	\N	spt_3LbBKYlyMaATS8IIe7HJ0d	Hoàng Duyên	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb882b9406aea0290f59023516	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
82c1465e-07de-4f4e-a8da-76243c369285	\N	spt_4POahBr8YCPNKGErIiofyx	Lyly	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebd626667b97f1e52c16856e7c	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
38136f28-b22f-4e45-b29e-17ac7b4a055e	\N	spt_3Ufoo4BPShhahtCSjgpBLP	Hứa Kim Tuyền	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eba42e0a19eabe7885296b4a69	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
05b260e0-15a1-49a4-a005-41d78d9bae49	\N	spt_62D1qvKkvUCvXEtY1xwRfo	Anh Tú Atus	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb8f47b8f7d070919fff02059b	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
0765c8c7-dc07-495d-956f-693a7dc41b3b	\N	spt_7sI2avJ3MyFstC9oKNM7py	Han Sara	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb8b97863b6de2d6604be13da1	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
1fb41750-348f-4d9a-9376-25160091ff38	\N	spt_6QfCxUkMNgOYA4dswW2ZWN	Reddy	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb31a448e758e54c27a55bb3c5	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
e64cfca2-c02d-4e69-b0e3-8fd3b1669b39	\N	spt_1yNjtowTJs05S2Xp2g7stg	Freak D	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb33c7544b842b01854aa6cf7c	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
2041b235-838b-4bec-83ff-8ba2a616228e	\N	spt_5TPzMTLOTGx95E7pizHYkP	Bozitt	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eba61a00543862d101022460ae	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
5a98369b-2a8e-438e-9e8c-506383df5221	\N	spt_0zo8kCJVktn7oPnzpkbC2p	14 Casper	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb075837f4fc4fc2383d961084	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
0811f60b-8064-407b-a692-5f210cd0f841	\N	spt_1nX1HVIUo1Zfs3e2v3lFb9	Changg	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb0b844603bdca767ef4346616	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
dd05cbae-215e-40fa-a4ce-255ae4da484b	\N	spt_6EybZ5zwPNEtEngfrEMevN	JSOL	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb8c6467d786f314c9284fc9ec	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
ee30acab-a517-4be7-aa97-4b69024422a5	\N	spt_0axAywC6N1oXIqe4HQL2Gw	Nguyên	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb6ff5ccaefba3405215986a7e	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
c9a2c98e-e737-43f9-ae6c-7432505ce6c4	\N	spt_0T8DkuhhFhdWAMN0bdeLL7	Lil Zpoet	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb0366ff2d7340b2868f2ad533	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
fa1a8210-34e0-4c37-ab39-85e0935eb236	\N	spt_3JlzPlR5FYYa402qPCCaAm	Freaky	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb709a8c25748ea0905f91ed4b	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
00871213-0a4e-4256-89c5-36c944b24fc4	\N	spt_2Xlia1jlI7JDki4Xa42uyK	Phạm Nguyên Ngọc	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb9947613368a5dff45d44e8a5	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
c73ffdcc-2064-470f-acfc-be1f34ad08b7	\N	spt_71Cy7nzbfpuGJAS5FGxm93	Khoi Vu	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb2653bba2bdcf714f5d34ec9a	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
aa37518c-77b5-4b1b-b9d7-b4779928a3b6	\N	spt_5ehbiyqYPwIDaUY4AxrhVq	Mademoiselle	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebb61036387219e1b58ff0b847	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
69fc7c26-23e8-4699-9104-f576980f5b64	\N	spt_23Gbd21nBxC1kCtcG2Cd0C	Phùng Khánh Linh	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebe0cc6ce0814f6c5cecad0bf7	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
30eaecbd-2477-4890-8b1b-37ca66fd1d9b	\N	spt_1Dd0DajYMxzu1Q6kuXLyJ3	Hoàng Yến Chibi	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb405fac74511648f8852c8d9c	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
935ab433-4bab-4c6a-9e8e-e6ce0abdc1f5	\N	spt_6jRD85dsXJYn5vv73rqSGi	Chi Pu	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebe3e352b996bd16e5f423a1d5	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
31b50870-9dc8-4493-87a8-a9a8b8995d1e	\N	spt_0slOzRzTQb1RBBVJbvRITP	Quang Hùng MasterD	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb68a40843cf335ef94c68bade	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
b8391bcb-81af-4a70-a7cd-611784c656bb	\N	spt_5G3xTFJKwRceJK9SBNCk2f	CHOCO	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b2732887ba875ba1f70088b66be8	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
7754339d-21b9-4ee0-90e3-20d1c876504e	\N	spt_1E72X1mbS5SmNvVKa3N5G5	Cara	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b273a7f014626d700e05c1688b89	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
b36f906a-7002-4449-8aea-930ca64ec10a	\N	spt_0wqus4nTxIoJvLZLwBt8Df	Rapital	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb589525f3dc7f5caac9f88f12	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
e18baeed-6296-4bbb-9a0c-587d8d8d2fc9	\N	spt_4LuFOXq87Tg0JSl5U7yxFZ	QNT	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebc29f15a5b9b46fed41a0f2af	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
126348a9-8a0c-45e4-ba10-eda59b69cc44	\N	spt_4hksJgKaus2VEhQO2Umee9	Sol7	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebcc911aa2866d62f7bd5e5894	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
77a23e00-8583-4489-a717-895430d12bfb	\N	spt_7mFCX07lzCFLpHm72R93oB	NÂN	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb99878ec25021eb657f982522	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
27d1f991-83bc-4ae0-a6c1-20a0eb8e0f7b	\N	spt_22MX8BG5870DGzpNricY7q	VSOUL	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eba573a7f30ae3296818aeb51a	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
76082fae-ed1a-451d-9f26-63f62f5637a4	\N	spt_0ZbgKh0FgPYeFP38nVaEGp	Obito	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eba385bd3e0f67945f277792c2	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
e73903cb-024b-4989-b33d-87d0b765e7c0	\N	spt_6Zx90B1VRgR4TB01S87duQ	Anh Phan	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb2d6fade2273bd13062501d60	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
c1d2fa99-8d42-4309-bb60-a82b763baa2d	\N	spt_1Jmkhzve9TuXHUUWGmpANw	Wxrdie	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb0b5e421f393e1d4f790418f9	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
e8054f7f-7fce-4055-847d-d432d9e33279	\N	spt_1zSv9qZANOWB4HRE8sxeTL	RPT MCK	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebb97791c136d7354ad7792555	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
a45cdea8-c3c7-44a3-9915-e6030abbda23	\N	spt_401ikVSob52311M6Fwnunt	Coldzy	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb4a42ba988102dc5b7221a7d1	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
7057a480-14fa-4288-a5ea-c089a469a4c7	\N	spt_3JWIaDWHJq11w1xPqJStEv	Hustlang Robber	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eba95938560cec466e19c4734d	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
f9513121-ae5e-47cf-98bd-b4efc2b1b18f	\N	spt_5M3ffmRiOX9Q8Y4jNeR5wu	Wren Evans	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb8a7f4082ee51f9b63374a419	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
91123b33-5cf2-4b6a-af7e-ec1e632d0b7d	\N	spt_0XtC2d9ZVigYA7iMy5YkW0	2pillz	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebb0e8ef2d28b9487d7af47d75	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
d6460c0a-5b6e-40b8-a84b-2a9aad063aa4	\N	spt_3diftVOq7aEIebXKkC34oR	tlinh	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb2bcb72091c46d935e195aa87	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
74163245-ea11-4ebc-a915-6f7dd5971778	\N	spt_0wJWawRvX8K9joiK9QqkX5	SIVAN	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebad323baf9852dd3b29112cdc	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
ec47010e-ac17-4e33-8946-139a69548d43	\N	spt_6fIF1TzV4K21TUWPXoQDAj	UMIE	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eba55696b11839ce028bee8721	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
13ef1caa-f095-4a95-b6f8-54db2b2b8d30	\N	spt_2aQnC3DbZB9GbauvhAw7ve	AMEE	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebb69fbf5081cca8aaa587267b	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
0507a68a-37e7-43dd-87ad-aa5b0238e761	\N	spt_2NRcG7E1j2sSi8vnUzCcpi	Quân A.P	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb916d46fa6ab17246f55a00f7	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
e4c5ad66-d1af-4f3f-bf98-3e615c3f3884	\N	spt_2FzQt1F2hU6M2h0w9AZ6kT	Rum	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebaa7d93582fa28d02b42b818c	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
6741572e-e274-48cb-97d2-eb4a06e71848	\N	spt_4jQE4LkOgSBdX0iZkPupTn	Daa Major	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebdc069a1bd65393df59727578	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
8451018d-5dc2-4f88-9d0d-2c384a0e6da6	\N	spt_70qFKCLRLE0xLgnznMtRDp	UNI5	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb93b035f1ae60caa66c5c4eb1	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
2b2867f8-2300-4dc3-b42f-6e01731dc593	\N	spt_2bperdA9iBmjKVzb1Q2QhR	Fanny	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b2733ebff0f38773a68583a57ad8	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
48ec3155-ac2a-4910-affa-30d2f345e958	\N	spt_5CmaKrKVwzQ6iQnJx2cGAm	Vũ Thịnh	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b2733ebff0f38773a68583a57ad8	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
8718fee3-d968-4091-af29-cdc8842393c0	\N	spt_2lO09fiftClNTHLdr9W5oB	Đức Ứng	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b27326c9eb12f778a26aa51cb47e	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
84db7ce4-623e-4689-ad2f-15b8c803bda4	\N	spt_7MtgS1BXZAtslgSSTpdikk	CODYNAMVO	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb91d228e18e2fd71f046fcb87	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
11d0c9fc-aa04-4d4b-a3c6-973766246e25	\N	spt_5d2RwPuuWdToK3ZeJEjHLM	Min.T	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b2732d1e445e079e50b094100797	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
415f8eaa-fead-4179-940c-953e2a771051	\N	spt_1JjEGhZENWaxmk5Ymf43Ss	Đức Anh	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b273b66cb85ad8a53cbdacacc42c	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
67461a8d-4ce2-4ebe-a746-34c7fadb2b19	\N	spt_3FwYnbtGNt8hJfjNuOfpeG	Hà Anh Tuấn	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb99649a8a989bcacb12960591	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
4ee11667-61d2-4fac-bb00-e2e018ad3164	\N	spt_1LEtM3AleYg1xabW6CRkpi	Đen	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb91d2d39877c13427a2651af5	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
b1e03741-1c3c-4e8b-aa58-8b5c50fc658f	\N	spt_25JRC8aMGIGBIJ5KiINv3l	RPT Orijinn	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb6ad583d5630432f21d0bbf6d	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
0da67a00-851b-4193-ad00-7da469bf1d2b	\N	spt_0qkGQFUrj8ERPAZcdpa79j	Phuc Du	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb7b5ea67e176a1ee8dddaf261	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
512c41dc-c0d6-4bfa-8c9d-96221ac9bf8d	\N	spt_41o2x1AJ6KzUiz6JxYtCtJ	Hào	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eba5a1f9dda5b92344ee2083b3	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
3c12751b-2c9a-4228-abb4-3893651a93b1	\N	spt_14W31zJumZnGDgZuPXclTJ	Thanh Hưng	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb4fbc0b223448392ea15c4b9b	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
60c4da0c-6c7a-4c13-8dcc-49e0f3bbc6d7	\N	spt_5akggz3MdneiFGBlJrZM6O	Nguyen Huong Ly	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b273063529aa7e3f2d3cc79c7c21	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
f97efe08-a8db-4c07-96ed-77078e55dfc7	\N	spt_3OeYidiG0MAcGmiSwTHZf6	Vương Anh Tú	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb2e9250894b1d5b8a003d9f66	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
17b1c5f4-ea4c-42eb-b7b6-7ca077dd77b7	\N	spt_6yzbDKj9tQCYUyhAvrDNHW	JUUN D	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebe2f7135e53d9f7d8421e7a45	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
bad49cc9-86a8-46ef-86fd-c3cdf8252588	\N	spt_74qKyXT7meuJ49jbtCXk7s	Hari Won	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb72da52d9cc654013e851cf1a	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
e61be076-3be3-4361-8e0e-18b8e4d50215	\N	spt_38QautgC2LNYKiu10BB0sF	Nau	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b273511ee8238356bdec9cbbc153	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
c1bd9718-c6f1-4fdb-97eb-f526e59108f1	\N	spt_4NkJ2ST54TN8b1Mpp1d0Kh	Lynk Nguyen	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb83c71affc945534658579f13	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
06b9c99e-d34d-45ca-a78f-306253abe97b	\N	spt_5KgfCQ5I4KSpdbEkKsPlTW	Hoài Thanh	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b27319d22d59dcbdec75d26b8cfb	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
0ffbc615-7efb-440b-a925-48f6dd6a2b77	\N	spt_2YJjdbWUlFUPMyveMVft5k	Khải	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb4390b6faa27a7315c26a9289	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
59d74f9d-51f5-40e1-911d-e7c905f6211b	\N	spt_25M5YMbLCbYDSFPhQXYE8c	Onionn.	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb78acc69f189aa5dc006e92f1	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
c6819388-e94f-496c-8274-3f4215f1ad70	\N	spt_4WxO9PBJlzYXOmtln97gnT	Lena	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebe03335c6bd0f021ec610b653	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
48f390db-c530-404c-9d74-f9197fe8df20	\N	spt_2rKtPYcwYmevNcaqzJOwvf	MANBO	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb05b53a159ea379e4c1a2fbbc	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
a6045a98-0a92-4cc3-8ccf-a01b6bcb4d2a	\N	spt_6xRZoWlE9twEkMC5NW4Z9f	Hoàng Tôn	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eba007c9eab281900e0c920efc	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
d30dfd67-97e4-4df1-8355-067144b7bb0e	\N	spt_73jYB754ez8rGnHM79YeuE	Trinh Dinh Quang	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebb858c081931a127af5dab1a7	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
1ce2c68f-c5e5-4b15-8db8-536f3c51f104	\N	spt_1gjeO7nm4QagscrFBbHiSZ	Nguyễn Đình Vũ	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b273ba04a283feafea0dc06b2683	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
1032a1e5-49d1-4376-9ac1-f18ca3ae3596	\N	spt_7BWNm2hXOL9wEuinNnWpxy	7UPPERCUTS	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb4505f1a0bb9eeff73a99496b	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
e9bd44b2-1978-420b-b35d-b20eda0b6f5c	\N	spt_5vtj3YSI4fJyb67YYzLaA0	Huy Lê	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb0639abb8361121429174f921	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
b031b3a8-1534-4a0a-96d0-073af769a8da	\N	spt_15BdWDB7smcW5zPsl26u44	Ngô Anh Đạt	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b273f80377955d7486d52709d433	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
4f314917-1240-4c8c-800e-3ca17ed6d2d0	\N	spt_2rDOa0khaLnzba0zxlwjIX	mối	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebca349c86c29238c0fe9a2d06	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
926358ae-1e36-4508-9311-f589047c8bac	\N	spt_53hbIxngriO3apa2SXrS29	Trung Tâm Băng Đĩa Lậu Hải Ngoại	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebd5000caaf7f7e56a2a650dad	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
5a473482-89cd-44f8-9650-f96c0e34cfd5	\N	spt_64vIV4nGYnWdHeioX3kIdA	Nam Cường	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b27351af3bdbc84adf79d0792908	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
9dbfaa60-af8b-4c3c-9411-38cb1782d468	\N	spt_26NyVPtPZVaLKTuHhEKHQR	Lâm Chấn Khang	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b2732b5943bdaeaa444285e35733	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
887327c5-a27c-47cb-bc30-97fa06c2d5a4	\N	spt_2Toc6VK22Fh0kV09xFF60J	Akira Phan	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b2737a8043304e2470589a2ea39b	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
f4b282cf-bfcd-4615-913b-fc155809c917	\N	spt_3bUUOjtOa3iJ0b7dQBvpnp	Nhat Tinh Anh	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b2737c3b7d75452bd473cbc78ee2	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
db1017f2-b3db-41ef-a5f9-f61738bdda71	\N	spt_2O80TFPHgMkNQ3Unwa401Y	Chu Bin	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb8233e1cb046cefe8b15dd57a	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
406307a2-d825-4b95-a151-8d6a13304c40	\N	spt_2hQhwewANVvoJkH7SHEdEs	Vĩnh Thuyên Kim	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b273480f43b3c999065a04a9d87f	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
220be0dd-eb5a-4a9d-99b6-a607176a6318	\N	spt_0XOHQOteNO7pqYk5hWs9TX	Hồ Việt Trung	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebf673e6b925d0abf304d53497	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
97faf233-59ab-40f8-af29-d8c4405aeb89	\N	spt_2VXGxxVL7SU8wbYziQKMlE	Bằng Cường	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebccd7069c21d653ae5e316a1f	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
417268ea-4075-4c90-aaba-7e731fe74e70	\N	spt_2LV7OpzgkWJ6aK6TTmD1oV	HKT	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b27344767105d23c1ca5a85f429f	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
5fb6c110-b323-46be-8a5a-2b8bea55c328	\N	spt_5gxYs21La8IcjUoMoSPwCN	Lâm Chấn Huy	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebad0d8e668eb25f0bc442e118	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
3b1d8c8b-bc74-416e-85e5-c9b56597a98b	\N	spt_6Sz9jchJpz8HyBTtkPvYDT	Khánh Phương	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb7e28657ebcdce6d16e08301e	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
4160504d-75bc-4adb-badb-b156fc370b1f	\N	spt_3rbFpJkaR60h3KtE4YSZWd	Phan Đinh Tùng	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb4dcde69629bd8a750fb685f8	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
93eabbf5-1c57-4bf0-801e-1a533a66bf4e	\N	spt_1RZSSA978w2tUKtXqC6XGZ	Châu Khải Phong	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb812757741d1ab6edc8a208c5	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
deef578d-b4b6-4ac0-acbc-0500136d6386	\N	spt_5OSU5tRR0M59TppFcvl4s8	Quang Hà	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb8ccfdc9234e2521f7ec75e8f	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
10ad8217-3662-4b38-aac0-ed8bd6d8e3fe	\N	spt_06SicyiJaPtTdRWR015ZKw	Saka Trương Tuyền	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb64f94def2b5c27a24ffaf9b5	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
23d0776a-76c3-4221-b815-0a9a708a95aa	\N	spt_46U2ia2nGNHbjUZmKcZB8w	Luu Chi Vy	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b2735f38d4591318aded563328a8	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
cd5b6de0-ad4f-43f6-b325-2d10d7b6ec99	\N	spt_2VUAd7F7SCWs7gYMGAQVxK	Cao Thái Sơn	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eba5d2e45ed9ebe6c67b70fb59	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
5549ad6b-9085-4331-90eb-fe230606e51d	\N	spt_6kdtnZgdQbt9OH0RxQoSof	Nhật Kim Anh	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb3fe1d313c796bf631366121e	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
97641a24-886f-4f77-822b-e105b7a8436f	\N	spt_5q98qLG6fV1rRb3jGRHDBu	Lý Hải	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b273e00281f3b6527a67376d03b3	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
bd6b26c0-982f-46d2-875a-daa7828912eb	\N	spt_1S0Bsmjx0UHR7oz0JsZ3G4	Lương Gia Huy	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b273099020e1ed835c3b3b133ff7	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
cdc18f5f-f067-4ff2-bd86-835a1cd11909	\N	spt_2KUMXzsDcJqXZW0CRh07zP	Uyên Linh	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb75d3d01a573c0bfa031fff94	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
4e9ccc52-ed1d-49b8-a0f9-e49986db003f	\N	spt_7l7DZWQaVIS13zFgSf7eb4	Tuấn Hưng	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b273b6bb57d2b5bfb71ebf8b1434	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
4243d41c-7c78-42bc-9b4e-197d5ce01682	\N	spt_1gcRVXmxLnwzd7EJn5dLGD	Quang Dũng	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb380b20bffad8c5cab7decf75	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
2accfdfe-de59-4ed1-aa79-5fabc9a58b2c	\N	spt_4HyBLptfM7nZhrcss4if7x	Ưng Hoàng Phúc	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb35f415bab3858b097d45f79d	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
db038f5d-f609-4cb4-bcf8-f5dd798356fd	\N	spt_4DPEUF2kY7kVrbXX4Zgu7S	Bảo Thy	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebab3d294af601d3afa868d94d	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
64d07631-9341-43d7-bdba-88c1193c30e0	\N	spt_3fM2WF0qY1Ip9ffVvOzhjo	Hoàng Thống	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb88b45905cd2808fda018f7d5	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
7133a5e7-ec89-4355-a83d-36ebaaae6991	\N	spt_1f3aY4gX0O9B59iQyZXY0I	DREAMeR	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b27344becb55b0036ea5718e1d8b	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
75ef8f7c-5007-4afc-a1e5-8cf1b3d1fd5b	\N	spt_56vNGG0GJtL6p8ltx7cLvj	Cầm	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebf4f6c616f3c4fb9266d89969	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
8cbbfa12-71a2-4868-8a40-3a48431ddede	\N	spt_6gXUsziOuoRCgmtm62Nrny	Linh Ka	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb0204b800ca53db37d7bf82fa	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
28983646-44db-4a34-88bf-d417f1de6d18	\N	spt_7at0gkjCnhOBrxwQlJPJ4s	Ngô Kiến Huy	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb9d08f9969fa8715fe5286823	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
2b6bf860-e063-497c-9c2f-18dc2a4e0210	\N	spt_4zRG1PU5uAC6ah9yeuxfFi	Khởi My	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebc5f2f35ad84305911252a703	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
673af119-843a-493d-8e24-208391b1f866	\N	spt_3NckpPMWZSEus6PyV6LoVc	Hương Ly	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb70bdf5ee4faf43c480e5b3c9	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
58057f5b-6a31-4d15-8f7e-38f2f4216ffa	\N	spt_5The4SDhYdHvfRNamb6Qix	Raditori	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b2731f3fdd8024fe3a1c19814b12	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
897947c2-2b42-4de6-a93a-5e4f50ed928a	\N	spt_27RoKwun6jKycKbH2iYUFU	Minh Tốc & Lam	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb198fa3549f92cb09872922ea	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
ff32b519-63b7-4a07-93df-16af9cecfcfc	\N	spt_2YANklqRg4ryct41X5NCVY	THEMÈO	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb9962d296313eaffc830a9923	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
4e31b485-3bd2-4a17-afc2-bc44f6d5d686	\N	spt_0wByIFp6P5D4QnZ6uNPAoT	Quai Vat Ti Hon	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b27398836498d600c7edfd662821	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
c972b1c4-13cc-4d82-8255-dd121e1eeb8b	\N	spt_0Y9KzsdFByEI4bigKF1htd	Myra Trần	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eba860c38d434ffdb9630544f2	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
4a98cb6d-9e64-4a25-a255-28abd4925e91	\N	spt_3XOuN4VDN4EL0GjKov5mWL	Hà Nhi	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb10e24b509ad2113c6ff9eed9	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
9c670b05-18a0-469e-9118-54083881fa70	\N	spt_0aNyWetkjBvIdZvJY00yEa	Phan Mạnh Quỳnh	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebf3ac22c53b34150b407c3410	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
16eeff8e-484d-4651-b7e9-d7e7c9ed2310	\N	spt_1CWwyDPjCowRTO4p6A7r6g	Mỹ Tâm	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb5d4a6001ce67c78aa3873c6a	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
2c5c12c9-7df8-42f4-bf23-8b6d824c5fb7	\N	spt_5TSjLaWHQ69GaALubAM7gR	Tăng Phúc	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebdafaa833e1027a6791342e33	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
63cf9e7a-b57d-4229-8125-33adac9a8bc4	\N	spt_2dlC6p7Q75wnfhudwTEpxW	Hoài Lâm	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb795f9f9f5f28dfd90a473754	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
3616be09-b355-4c4a-a46c-e0136fab4fce	\N	spt_0r5KtuhT32hmawS8dj6jFm	Anh Khoa	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b27367293f2840ed53cb0e38a384	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
d7d0d876-1746-4449-8379-36fbe60fdba5	\N	spt_0IBUlucigx80io4qV5fQ34	An Vũ	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb10960fba0227590ef82a7a2a	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
8f40a566-7313-42a0-ab29-339492a64907	\N	spt_2U7kaq9BBq7eG2Vyn1D3Ab	Lê Thiện Hiếu	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb8f6dc73534caa985ba551736	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
d9dac4c2-d79a-439f-a407-d7e2418b6a01	\N	spt_4R2engiAed6QeIV63PDAz0	Đức Trường	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebadc1203b02d47881dd3c543a	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
72112de6-6741-4aa0-9f69-6dffd253d6eb	\N	spt_5udW05zLTeswVyS7fTHdlc	Huyền Tâm Môn	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb30362170c3eb27d23f7fb329	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
d84e7687-3bc8-4637-ba6f-c14825a39462	\N	spt_5n4HPFtb9AUMQMAw8asZu6	Southalid	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb2d4647e2a62ff129652da563	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
52d83e7e-ac6f-48d9-8ab8-fc130d7c0e4a	\N	spt_2OkxNsNz7QXCBwlME0fSsk	TGSN	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb93c2882a77ede2e43aa3868f	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
6af507a2-8a7c-444b-b71d-e2894877d7c8	\N	spt_6kkA6laUMR0hzML9YY98CQ	kidsai	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb08441ac62a53701439a72214	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
7c0601f2-f878-47f1-81a8-bb4c6ed97ee4	\N	spt_3C9BZr3AmjZ89zzcOdkA4i	My Anh	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebd367d123642c3b2bf217afae	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
f030ab2f-0228-4a80-a0f6-cf745dec94ef	\N	spt_23UOCFmQtFKvx2mFufMoJB	Winno	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb308d5fe18bb94b6dbef17256	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
4ccd5f88-2577-493b-a5f5-e040e19f0ddc	\N	spt_6TlRNO0KxvT6Dqk5nCVNtG	Cody Uni5	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b27330f53020d330ba5c136b411e	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
47f132ff-5c06-41d3-8c25-f524a704309e	\N	spt_2WWCSXKQuDEJtQjMlA0fsg	Tùng Maru	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb00631973ac91414fd96fec05	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
56c4b530-5652-4310-9992-7772ce946ee2	\N	spt_7tRkypqswDC2uWg9g9H0Vs	Hannie	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b2739a7a2f0b89e6ddf9d30bf749	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
ba4c4101-d4c8-413c-9ea6-91cd9d3039d6	\N	spt_1Y0gKRCGK65KjhRU4CeDAn	Luna	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b27326c9eb12f778a26aa51cb47e	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
fe66efbd-1036-4d7c-9d78-d77ed2ef2ee5	\N	spt_4bvfBwk7P6u7mvXkaKu1Hy	Quinn	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb7e1e772ca8733c790d562ed3	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
145668ec-d423-471b-9897-935a541c61e8	\N	spt_5jTFNkoZebPnX90CbB3F2A	MONO	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb08b7a0d0eb811827b0af36e1	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
5368b093-620c-4047-bf42-d8877db146f1	\N	spt_5HZtdKfC4xU0wvhEyYDWiY	HIEUTHUHAI	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebe1cbc9e7ba8fbc5d7738ea51	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
c079c9f8-a70a-4f2e-a967-e1d8e750db0b	\N	spt_1cPpd989kghzlZqfpP4KwL	RAP VIỆT	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebeebd6e77e92be554a077fba7	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
1f687043-2864-47f5-82ea-e52613bb6c87	\N	spt_35HU1GT1q797EwZsP8uduO	Mr.Siro	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb4371fb198b011bb666a3bfde	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
717fec90-127f-45bc-8a0e-af547a394c28	\N	spt_6VLN4hTrGOZ5Le1TVTwDTg	Ngọc Dolil	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb5c8390033da4f8e9e9fc746f	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
657ba02e-667a-4e2d-b462-7e874e1cc388	\N	spt_6NF9Oa4ThQWCj6mogFSrVD	W/N	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb316c0f0bc6cf3a29c203ab1e	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
90070d47-11e8-4853-8349-86cf8d89a3ed	\N	spt_2mx5AAdmlMxMcrcd7AQh1j	Khắc Hưng	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb37e01567a89005eb0feb38d2	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
05915ffc-ada3-43bd-aeef-81bc95825a00	\N	spt_6PGrOInW15jh2LN7adx718	PHÚC	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb2afde6ca5639d0dd36f3ef41	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
22e9bc3c-0b0b-4204-807f-3519e686ba63	\N	spt_1Qia4CTwh6x0CZbD0079zi	CoolKid	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb4701f6bdeeded194cf20376e	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
a2a380a2-7316-4bdc-b8ca-eaed17f3b808	\N	spt_0hy8mfXxfD8kQ6MRQkDVrn	itsnk	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb215ae0e47da5791516c7aaff	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
c395c147-c5ec-456d-bf82-0274b23dff10	\N	spt_2liSd71HdTJbIfyWEKHnWV	dubbie	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b27326e49dc3fb51f27972db5c2c	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
7bcaa399-5d6a-4070-b286-14cfd49600b3	\N	spt_1W2pigH6UYwuTuFbwoSfVZ	RHYDER	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb7930fac4aae6d581d9f49e1b	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
24292a12-e17d-4f31-8c64-e51dc57698c6	\N	spt_6kuERXgoQuYGDs0onogMvZ	ICM	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb65eaa6be40f84e6182d69383	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
4d083492-31be-4612-9da3-fe7ccb5d4dd9	\N	spt_2dC1IBU9NOD9xsQJ5RE7j7	Puppy	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb12b2ad3bacec1ca71265fba9	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
40fe3e60-888d-419b-ace9-50aaf00ecb29	\N	spt_1jLYYT9QNuDI4zz4Ky9fyq	TINLE	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebbabf6021b5c856cac35d5d75	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
a415394a-5512-49dd-8090-68304049737c	\N	spt_56YvnYcOAPPIuSwoZ6uoBP	DT Tập Rap	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb59395cb9c275f4766c8b4942	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
4196a918-93ca-487c-a9f2-05e4e67ac4a4	\N	spt_70ULEgr5A3zBL12foM4bnj	Vũ Phụng Tiên	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebc5db34d157c879b2e627303c	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
a5ee79b5-9f33-44c7-9092-0eaceb57c5cf	\N	spt_3Ib80uqrBka6P4ncx6vJRF	Gonzo	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb2146b7722363c9a2e9d11113	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
c748260c-c83e-4b09-b8dc-57e35450e2c6	\N	spt_5ulyphh5uJrH4Gb1JpSMkV	HURRYKNG	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eba4d09d3f8fdffcbca0a581f2	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
694d2b15-2d7c-40a7-bb4b-2dbf8b87065e	\N	spt_0gsqfuR0OFF5SSai7lsPrj	Drum7	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb3726249f70081314b2a42654	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
d6211326-ce41-425d-b8dd-455c0915e7fd	\N	spt_5NTaNiqKj5W38izmUj435H	Huỳnh Văn	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebd740fae83296f353ae17452f	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
f9bc7a5d-b7ce-4ccf-a460-3d296c967ede	\N	spt_2XKlSkrslCs0egLOvSB4Ul	Emily	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb87e3e671d06e2d8af3bf16c0	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
a6019fda-9d7e-44b7-8168-e6656471c200	\N	spt_5dfZ5uSmzR7VQK0udbAVpf	Sơn Tùng M-TP	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb51b32111f5bc456525313d89	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
be2765ca-351d-4336-8a5f-686c00ca1248	\N	spt_3VkWfwJgAO5qikm4hFccO6	Mr.A	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebeef9778c3af31091a4625a9e	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
e9a3d645-21e7-43f6-8cba-9c41648b83a8	\N	spt_2pVj9lekGlRPbYvDjTMQ6O	Mr. T	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebec0a3c468e866451cd75c7d6	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
381da055-c898-4865-9435-60a8ad95b2c6	\N	spt_7pCB93rz0fL0KvmnuN8AI3	NAOMI	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb73502f1fa544cb818dcacd99	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
4481e867-83f8-4624-bbfd-7fbd1abfb574	\N	spt_4fg8aMZ23d2bxKz7r2vt9v	Negav	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb1e08fed86b807a8553ee4911	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
7d3793d0-7347-4413-ae22-8278fd149b77	\N	spt_0r63ReVRjxrS4ATbLrdcrL	Hoàng Thùy Linh	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5ebe7b7fa8d03a2e3b6a800bdb4	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
10cab80c-4066-4686-9f16-5150ace49a6d	\N	spt_57VqUzd3qVMPCzqZblwz7b	WanBi Tuấn Anh	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b2735b3ae331a08e2d68efbe79e1	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
e7f6c4a1-e028-4fa9-9901-4df7894bbf88	\N	spt_58d1SL5uQRtaqr4ZgM7LDr	Pham Truong	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b27321f5bfafd1fc8fb54732ad33	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
b4ffc477-8441-4e41-9ec8-a9809dca72b7	\N	spt_2Dqd1HqXNuDhsdR7BGT590	Trương Thế Vinh	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab67616d0000b2730e96dbfa97961513fcf37bd8	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
12cad057-06b5-4122-8f14-70884ad8b6c3	\N	spt_53LVvmM09CnWWAYz79HpCR	The Men	t	t	\N	\N	\N	vn	\N	https://i.scdn.co/image/ab6761610000e5eb84f1b35b8755a8dc7c2f83ff	\N	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
\.


--
-- Data for Name: audios; Type: TABLE DATA; Schema: public; Owner: beatbuddyapidb
--

COPY public.audios (id, code, orig_url, file, hash_md5, released_date, created_by, updated_by, created_at, updated_at) FROM stdin;
2	ytb_FN7ALfpGxiI	https://youtu.be/FN7ALfpGxiI?si=leyOT0r4JbF9r1h_	/audio/1bd34072b0396d65400bbcce1b6fbcc0.mp3	1bd34072b0396d65400bbcce1b6fbcc0	2017-02-13	\N	\N	2023-12-28 08:55:29.229133+00	2023-12-28 08:55:29.229133+00
\.


--
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: beatbuddyapidb
--

COPY public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
1	01	Init DB	SQL	V01__Init_DB.sql	1042332075	beatbuddyapidb	2023-12-28 07:48:25.862512	1475	t
\.


--
-- Data for Name: resources; Type: TABLE DATA; Schema: public; Owner: beatbuddyapidb
--

COPY public.resources (id, name, urn, tags, thumb, type, created_by, updated_by, created_at, updated_at) FROM stdin;
dfd9859a-c41b-4f5e-8b57-cc0a4ccacd76	Wowy	artist:076f4df9-61ac-4bfe-ac2e-75d82e915ba6		https://i.scdn.co/image/ab6761610000e5eb805a46e981dff62380813e26	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
1ca0d1c4-4e02-4b6c-abbb-60e2a8c14fce	Suboi	artist:56a47280-2444-4808-bc8e-31b27b1b51e0		https://i.scdn.co/image/ab6761610000e5eb518371670c75754203839ac5	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
dfb504d7-c8af-42ba-afc4-d99536c795f3	Kay Trần	artist:a7a5684f-8add-4665-8032-020ef4446b2e		https://i.scdn.co/image/ab6761610000e5eb0c915218b67de3265b6430a1	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
bc0715f6-5d5a-4fec-a5e7-63b791e0e731	BigDaddy	artist:26591325-95a5-4716-8a82-bad9c2f573cf		https://i.scdn.co/image/ab6761610000e5ebeb864b5f2426b9a60b0003f3	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
165ee15b-3c5d-47a7-9bab-26347cfa6021	Andree Right Hand	artist:63d1a84b-569a-401f-bc00-0b6c60adad2b		https://i.scdn.co/image/ab6761610000e5eb3dea3ddb7a950a6df930f5dc	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
5d54979a-2063-4504-a0a6-2024d36d5329	Ricky Star	artist:9da5a71e-75cc-4e01-9622-e2906899dbcc		https://i.scdn.co/image/ab6761610000e5ebe7012a07d44b58b0d2812c5b	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
a1237c0c-3ec7-4bf4-a874-1983c75bdf2b	Isaac	artist:cbdbc854-c78c-4826-8c40-093946a7cc26		https://i.scdn.co/image/ab6761610000e5ebcb44ea77e9b885b05ea60e8a	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
aeb74321-3770-4f26-bf06-3264145f6091	Miu Lê	artist:dbe3d4f5-b94f-4082-a43f-e8793a1cfe09		https://i.scdn.co/image/ab6761610000e5eb2fc3ef8a80c35243e5e899b8	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
06e34ccb-a28e-4c6d-a6e0-b54dd3c4900b	Only C	artist:a5bcd3bc-36c8-4fa4-8235-41979450023d		https://i.scdn.co/image/ab6761610000e5ebc7c8ae4ffa1d7f3bfd4aadfa	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
f4ebce42-175c-4902-8b83-f41872aa99cf	Lynk Lee	artist:8ade9837-8063-4bdf-9e44-01c217f919f5		https://i.scdn.co/image/ab6761610000e5ebbbc1060f99c7a2bb88161a74	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
7db6e1ba-9a92-4964-8737-71651769243d	Anh Tú	artist:ad758d87-841e-46bf-98f2-d796860febb7		https://i.scdn.co/image/ab6761610000e5eb72bf46375d15e81cc801f4c4	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
48c513d1-ac2b-4398-839c-bb14111a436d	Lou Hoàng	artist:fd1b2423-7f35-4e00-9f83-448e7d61363b		https://i.scdn.co/image/ab6761610000e5eb2687636627de1c3063701325	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
d31f396e-6dcd-4787-b2d0-c2021b6c66db	Touliver	artist:097e7474-5771-409c-9d74-200fe5be3aa7		https://i.scdn.co/image/ab6761610000e5ebd1791a8797ebb54224bbe240	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
9db33d2b-d098-4370-ac95-01ca7ca29e73	Rhymastic	artist:e61980e1-b536-48e7-80da-7b3e32132e79		https://i.scdn.co/image/ab6761610000e5eb0e62e694576ab6f8e56db3d8	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
33625372-3651-41eb-9dc5-3f5201b122b2	B Ray	artist:e04a23bc-0240-432b-b008-b88a328556de		https://i.scdn.co/image/ab6761610000e5eba69580618d4cb782c49f6c7b	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
c093de3a-46fa-4d9f-a338-d20bfafb4fa2	LK	artist:5d7a46f8-5b7c-4bf0-bb3b-c61be90246b3		https://i.scdn.co/image/ab67616d0000b273eb3522af6312545527136a30	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
ca591fce-9039-4076-b695-2197a007e304	16 Typh	artist:967ff74e-63c7-407b-9eea-5b28e1e68967		https://i.scdn.co/image/ab6761610000e5eb926ea7f4eb9e0b1764aec0a7	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
bb1ad0c4-789d-4f88-8221-92a90fc86264	Bình Gold	artist:20e13630-0f6e-4383-af48-aa56ff8ca914		https://i.scdn.co/image/ab6761610000e5eb076887518c36920395d20876	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
f71fffef-876d-4bb2-9275-fd88c01ac480	JustaTee	artist:fd0d3e1a-c801-402e-9f62-779ea6e3b767		https://i.scdn.co/image/ab6761610000e5ebde3d3210433dd11c07678420	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
2efd800b-ef19-4616-810e-8de4f870949f	Hoà Minzy	artist:1fd3cdfc-0b2c-4d02-82e8-63440db83b15		https://i.scdn.co/image/ab6761610000e5ebc5ca014c7d8a729016b3b5f0	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
2b869aee-c78b-4ff1-83d3-81bf3e774fe4	Phương Ly	artist:e0e5050e-b919-4bb5-9bb4-f28271bb71fc		https://i.scdn.co/image/ab6761610000e5eb34002425b245333433f3cf32	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
80df4487-343b-427b-9695-6221f6b4220b	Karik	artist:2004c280-9e8d-48b8-81a2-ebc5fdd597af		https://i.scdn.co/image/ab6761610000e5eb3e1b16e263e182dc85f2b7c3	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
99568195-614c-461b-ad55-350d3d4ec39d	SOOBIN	artist:5ccfd128-e6df-4abe-90d2-dc6d106a917e		https://i.scdn.co/image/ab6761610000e5eb1735d4771ec48d60d2e3dbe5	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
0b733a1c-092d-4b78-b5d2-f1afa1dd8624	Binz	artist:deb42036-9e5c-4676-b52c-3ebc648cc42f		https://i.scdn.co/image/ab6761610000e5ebcbc6b072aec429273fdbd53b	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
2bb0dabb-d1b8-4e6b-a736-3af2b56fb63d	Da LAB	artist:29831c29-dedd-44e3-8664-0e1108d1d62f		https://i.scdn.co/image/ab6761610000e5eb82055f0d7880dc8c73edc5a0	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
101ecc71-6b82-4b61-b01a-01c2c3f306ae	Masew	artist:ac5b215f-0ca3-4be4-8f59-ad438b32db03		https://i.scdn.co/image/ab6761610000e5eb3384ebf481862099a35cecaa	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
3af1a511-12a7-414b-9f15-cf334976d7ca	SPACESPEAKERS	artist:736490ce-95ae-460d-b842-978fe97f3a3c		https://i.scdn.co/image/ab6761610000e5eb6dfbadcc2bc0747b31c75d96	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
219ef9b8-e694-4cc0-be32-7c58ed086226	Suni Hạ Linh	artist:81805f97-6023-4a95-9e21-4ba2b13673a0		https://i.scdn.co/image/ab6761610000e5eb9411b12f482f50f4b8895367	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
5a4f1ccc-59bc-4163-8fbc-fd1c49e2e301	Osad	artist:7c6ed720-d316-4f6c-950f-a91f59244ee0		https://i.scdn.co/image/ab6761610000e5ebbf16ee82152417ee3afb34aa	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
716cfd6a-242e-4dc0-b414-3632705a506b	Tiên Cookie	artist:2e797150-6f85-456f-ba72-6ab463c85d91		https://i.scdn.co/image/ab6761610000e5eb43b90fca5f4242d4400f68c1	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
5d3811ea-5888-4639-bf03-3b86d1c3f88a	MIN	artist:ae472bbf-a6d7-4aeb-aec5-182c2430b8bf		https://i.scdn.co/image/ab6761610000e5eb9fbf4d041c3512612974d7e8	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
3d3c032d-a58b-4b25-b79a-870fb93a9fa8	Hoàng Dũng	artist:4646ca20-ce5e-41cc-ba06-11eb2c71ba89		https://i.scdn.co/image/ab6761610000e5eb63bf6330c331d0a1ec425700	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
86519032-88b6-4ebb-ab52-1b01863f5c64	Pink Frog	artist:05afc4f0-875a-4239-aa8a-14a844b4ed20		https://i.scdn.co/image/ab67616d0000b273e87eb168c33c88a10a57a4e4	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
d29c8225-ad06-4ff8-b8a2-2f0e693e756d	Chủ Tịch Kim	artist:f907bf6f-9454-4719-8b39-0e19f6ffcd44		https://i.scdn.co/image/ab6761610000e5eb86453182fe194c95f2c2561b	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
db44f7fe-b563-4546-ac3f-e7df60aea8cf	Minh Đinh	artist:8b2baef9-7952-4433-9140-ab6567ab92db		https://i.scdn.co/image/ab6761610000e5ebc40bbd734166cc0afcb0c4a1	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
888d1165-1ab3-4561-be94-15eb3003f7a7	Haisam	artist:65b0bc9f-51b9-45be-8acd-0b677a7fa382		https://i.scdn.co/image/ab6761610000e5eb73a027903d940d06e5c58d96	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
da071df2-7ec5-4d8b-a762-28257cc5628e	Thành Luke	artist:3062fa60-0113-4f39-a4fe-43be2a86a839		https://i.scdn.co/image/ab6761610000e5eb4e23da4bfe6bd99382d2bf30	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
083dfdb5-1872-4f32-8800-b41a5d815562	Tùng	artist:6f14ad5e-568f-4380-8b51-82cd3148cafa		https://i.scdn.co/image/ab6761610000e5ebfab2ca1d5bd836f07236688f	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
b3af25f1-2239-44c3-932f-4c9854f16766	Kiên Trịnh	artist:62e37eb1-562c-4d8f-a02b-60b3456333a4		https://i.scdn.co/image/ab6761610000e5eb4dc628c94be65240f6d79357	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
05363e9d-16ca-43dc-99f3-ac05d5c0faed	The Cassette	artist:46b2cd72-05a3-48dd-81dd-d31be15aa0c4		https://i.scdn.co/image/ab6761610000e5ebd2ee619259b94165619ce1ea	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
2091929b-feb1-4192-9bc8-7cbab3c477f0	TRANG	artist:a844bc41-7f4c-40a6-8bf7-b368ede1b843		https://i.scdn.co/image/ab6761610000e5ebe28057e8f67ce8071d58bb35	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
a6a16dee-ef5c-4436-87ed-c9b80715351c	Thành Đồng	artist:f5f99ea5-e526-4b44-8b8f-64a40f221ab4		https://i.scdn.co/image/ab6761610000e5ebd2172d72e9012f874a9b5f25	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
8fec32dd-065b-42ee-9953-61c343f1fd95	Lê Cát Trọng Lý	artist:b355f749-e40f-4203-ad75-73d0ad69f071		https://i.scdn.co/image/ab67616d0000b2735510b8caaaf5e61a89cc2798	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
59fc11e5-83d1-41b2-ab55-53a7f45c23dc	The Flob	artist:9220fdce-cf9a-4900-849d-7fb5abf9243a		https://i.scdn.co/image/ab6761610000e5eb634807fde9de6b1e19dee172	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
f9ae2907-700c-4eb4-a711-d5ad852f32ce	The Sheep	artist:d9ae8157-7768-45ae-b252-e7cd98af3a2d		https://i.scdn.co/image/ab6761610000e5ebf4f30e19c1e8a15cef0f659f	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
024d2052-0704-419d-8e23-f35ea453bb5d	Vũ Thanh Vân	artist:b93819c4-ce35-4975-9485-3f6172bb1746		https://i.scdn.co/image/ab6761610000e5ebdd2fd98b7e94a15a4a15bdb6	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
00cd2b0b-567a-4c56-a82d-c87efd36e2b1	Những Đứa Trẻ	artist:65a39990-e75c-4558-a6c9-bf50bcea9db9		https://i.scdn.co/image/ab6761610000e5eb38ca109add87b0ea9c1b5e7e	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
f9a23161-9b2f-4995-a047-a4183c2c8897	Thoại 004	artist:4ed5e898-7d4c-43ab-8177-467b5f664379		https://i.scdn.co/image/ab6761610000e5eba580a18b4de7dd8a5da8978e	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
a5e09550-c7bc-41d5-8978-7b17fc2622d9	Tùng	artist:82d3a4ca-1ef0-48ef-88bd-1a94d2db2753		\N	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
4cd34e06-88bd-4a97-863a-828dbded05e8	Gác Mái	artist:9009fdae-af8e-4b75-9a86-041232fc1b62		https://i.scdn.co/image/ab67616d0000b2735892aed18cec2ea9cb46fdc5	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
6c9b4ab9-0800-4f26-8969-887aa64ad4b0	MINH	artist:20bf4ab7-4dc0-4fb4-9d0a-fc8fb61c67cf		https://i.scdn.co/image/ab6761610000e5eb8fde680c4d9b89e5782390ac	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
d3ccfe02-93b0-4e11-aaca-9ea7a2f45c89	Bệt Band	artist:72d4e2a1-7184-4bb4-8295-b9a1bf00410a		https://i.scdn.co/image/ab6761610000e5ebf9a8e3bc0988b424583e3d4d	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
489c04d1-bb73-40d1-ad77-fe85250c647e	Đá Số Tới	artist:ea687223-6908-4757-8b3a-22b07dd06c9b		https://i.scdn.co/image/ab6761610000e5eb993a22c7eddc313d0ab1768b	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
122d0d8b-6fa8-4be3-a9ee-bd3c5c95c6bc	DÍNH	artist:3ff4fa3f-dafb-4137-bfca-9b70cb93ec60		https://i.scdn.co/image/ab6761610000e5eb71d9ebf76fdf6a679ad2375c	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
eb9cd65e-7035-4ff4-b5ff-8c8c3e8d3e02	Jaigon Orchestra	artist:7aed95c7-9863-4182-b2f8-c21bb6931320		https://i.scdn.co/image/ab6761610000e5eb21e71bf74b6c5553a7fc43a6	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
780c1005-6d38-4e86-9a89-2e0b9d46c336	Cam	artist:0c9330b5-930d-4fbd-aff8-509324b65418		https://i.scdn.co/image/ab6761610000e5ebdcb3c69c3fb0aba0ceb1da9b	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
39edd9f5-2889-4852-bf2b-06dba5a40152	Mèow Lạc	artist:ac7b3645-b1b8-484d-8a13-d80dd3e0dc00		https://i.scdn.co/image/ab6761610000e5ebadb54f7879966d8cae581357	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
f176d973-a02c-4fc1-a2d5-04195277d2ba	Chuột Sấm Sét	artist:6b2377e6-f4d8-4678-8514-c8e504193001		https://i.scdn.co/image/ab6761610000e5ebbf4e33169cb6bd8751285655	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
60255150-f7f5-4669-b4f9-da14db6c238b	Cá Hồi Hoang	artist:8f5b4472-7ea2-45ed-a593-ada047afbf4e		https://i.scdn.co/image/ab6761610000e5eb2e1835960ece8454ec87ef6a	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
aee8a5df-e80c-438e-aef8-a9822a9b12d2	Giấy Gấp	artist:2ad4072f-ab26-4c34-be8c-924d3a076035		https://i.scdn.co/image/ab6761610000e5ebd026a9acc97be74aee16f289	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
ded02d55-1c21-475b-b52a-44d66d8a1f3e	HuyR	artist:5df4a96f-9a3b-43e7-a1c6-2e7dcc511a77		https://i.scdn.co/image/ab6761610000e5ebfe295858003be8336111ec4c	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
6bf6211b-c955-4a2e-bff0-27c2e18027ec	Khói	artist:4d66f00b-59a6-49ef-b24c-823ce8624272		https://i.scdn.co/image/ab6761610000e5eb4d19b6fba8aee38207c35101	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
98df49c9-325d-4657-844d-a963061494de	Đạt G	artist:d4f86525-7a92-43be-a46a-53cf3631c15a		https://i.scdn.co/image/ab6761610000e5eb02ab539ac376b8e099010802	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
ea35ddeb-a4ee-4795-b5d3-b03c1f40af53	DatG	artist:5f4f0210-5daa-4944-a8e0-13ca16cc3e99		https://i.scdn.co/image/ab67616d0000b273aa1791472efa0debafc30182	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
8899713f-991b-4054-8bf5-0087fd291062	ERIK	artist:6240c28f-ba37-410f-8736-8cd1814e238b		https://i.scdn.co/image/ab6761610000e5eb63ba7b9441e542f3b2938b83	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
ef394d74-5c33-475e-af9c-74eeaab7d011	Trịnh Thăng Bình	artist:c5090b9d-42dd-4381-bc83-5d4681ef2529		https://i.scdn.co/image/ab6761610000e5eba8734b9d20f8467af95ab662	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
07b59409-536e-4076-8655-4eadcb1ca803	Khắc Việt	artist:ea2fcd1b-c7a1-4f54-8d81-2d4d67af23a2		https://i.scdn.co/image/ab6761610000e5ebd9afe5d7a1e42a1ee17cd193	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
3909a364-2593-44eb-849c-8ec9c1bb1cd6	Đông Nhi	artist:0c8b9413-62f8-4047-bbb0-c6289d0127af		https://i.scdn.co/image/ab6761610000e5ebe90ee6acf05599eeeab1beca	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
1073bf0a-1902-4659-bf57-556f639f1618	Charmy Pham	artist:f6944749-aa48-45f3-a240-a2418d930486		https://i.scdn.co/image/ab6761610000e5eb5deb7423a9f3391044b2a505	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
6e13c63d-abb0-4ec4-986e-54a0df64145e	Bùi Anh Tuấn	artist:6374626b-f07e-4d00-b709-c53875b7c840		https://i.scdn.co/image/ab6761610000e5ebf2db4875c81f4d103aefc81a	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
78cf2aa6-2b3a-4706-b9af-85b2ec51c297	Hồ Quang Hiếu	artist:98b37282-a366-497c-a0a2-9f6bccf4c9b9		https://i.scdn.co/image/ab6761610000e5ebc8e6821e8e05fbd6e3a01f72	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
905fa16c-674b-4efb-914b-a020b97c75ca	Trung Quân	artist:a55cb444-3bc4-4b60-8a8f-1110f80668ad		https://i.scdn.co/image/ab6761610000e5eb99e937ca54656d4d09474420	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
420a580f-e038-4c52-9c68-2f5cfc642ac2	Bảo Anh	artist:587d6434-70c5-4a1e-a1e9-38613919a8cb		https://i.scdn.co/image/ab6761610000e5ebc8a99b7d4971c74cd6dc0eaa	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
b2b983e8-794d-4357-a41a-4878aa2f163d	Chi Dân	artist:1e876f05-dbbf-43ea-b797-2578ab2de390		https://i.scdn.co/image/ab6761610000e5eb7a8dde3871698647183c29f0	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
954424ee-2464-44e4-829d-07bd45615331	JayKii	artist:36315318-ef4b-42fa-ab3d-48d4f1397368		https://i.scdn.co/image/ab6761610000e5eb0c1f7a270cf63a9bdbec9d10	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
6593b8c7-d689-42aa-80b4-a29dce776157	Minh Vương M4U	artist:3e19cb17-1b02-4a1e-8600-d7e9f9f6cbf6		https://i.scdn.co/image/ab67616d0000b2734e722171d22c52cf279a0da6	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
d1413ed6-0ed2-4248-bc9b-ac3458264ea1	Hồ Ngọc Hà	artist:f0037fc6-541f-4cbf-a3e3-a1db6dab202a		https://i.scdn.co/image/ab6761610000e5eb9804f7d7085ca1773b86142c	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
68c194b0-1445-420a-9577-8b2a947abf8e	Tóc Tiên	artist:cb7a48a3-f8ce-4848-883b-080c9597e14d		https://i.scdn.co/image/ab6761610000e5ebe51f475c32e7e8f34faf95c5	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
39e73a66-68e1-4306-a160-a352560ce07e	Duongg	artist:be01a09c-7b7c-4f29-a2ce-1ce25c57b593		https://i.scdn.co/image/ab6761610000e5eb752458cad38f928d3939c64d	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
ff0a6739-9a4e-4ceb-9f6d-227426eba3d2	D Empty	artist:0ca4a8e6-a4db-4e60-875d-a7f8cdc862f8		https://i.scdn.co/image/ab6761610000e5ebc170d1f88492bcc9e0e36142	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
d6d8ee39-309a-4d0b-94da-27a7fec811db	Bon Nghiêm	artist:6c8546f4-1a44-413b-bd23-e49f3898018d		https://i.scdn.co/image/ab6761610000e5ebd53692a1a18b4007e28c5fbe	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
6da22aaf-cf39-4f86-93a0-f09e7a4e0ba2	BMZ	artist:79c36afc-5579-4fb3-91f1-8923cf375056		https://i.scdn.co/image/ab6761610000e5eb72ee71305a5799765ff63db4	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
a1281f79-217a-4336-a631-6a471be99f6e	GoAllDay	artist:fc434983-48ad-45d2-8ebb-c62c6277064e		https://i.scdn.co/image/ab6761610000e5ebfbb6c2ad028f85a7e4162caa	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
e0700e43-9e68-4c10-a26c-cbbbdacad86e	NIT	artist:4ce1fd99-fd08-4587-af52-0a0bd5f56f72		https://i.scdn.co/image/ab6761610000e5eb2ffafab41d3017a9255fe8a1	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
42978231-ddf3-4ebc-8b52-98d40729f0c4	Đỗ Nguyên Phúc	artist:5bd5297d-94cf-4edb-bf80-17b99e94600c		https://i.scdn.co/image/ab6761610000e5ebfe1723ef3e57cab6437f71aa	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
32c8fd4d-03ea-4204-8f7f-b77dbff14048	Nguyenn	artist:f70e8b08-99eb-4103-a0fa-4cc6d20665e2		https://i.scdn.co/image/ab6761610000e5ebf834e488ce584b57fe4bc292	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
10adca9b-1c53-4b22-a0e6-ab200c37f386	Trung Trần	artist:873fd648-a6c8-4c1b-a5a7-3a2fafb14c00		https://i.scdn.co/image/ab6761610000e5eba5e4e822cd4b6096aec8e57a	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
7e130f50-f1e9-4c19-803a-82aada924f6a	Sáo	artist:9936b02f-28c3-44dc-b3bd-4ba22c737ce2		https://i.scdn.co/image/ab6761610000e5eb7f1bca865e22e2cca6956722	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
8b8c4a97-2155-4fdf-8f05-b06c986412be	Sean	artist:449e6426-858c-430e-8ecb-f255402b226b		https://i.scdn.co/image/ab6761610000e5ebc989313245e768049acfe97f	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
f3e7613c-429a-4def-8960-5ede508c211c	PhucXp	artist:97c0e51e-37e7-4e71-adea-4dbd026b6f1e		https://i.scdn.co/image/ab6761610000e5eb96b54ba7b675722988528307	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
d3898644-7b19-48db-b7be-3309d31aeb4f	O.lew	artist:c457126f-0878-47b5-aed4-4e7a9dd33f0d		https://i.scdn.co/image/ab6761610000e5eb28ccce8c6a092aa7f6c1a698	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
cac76c8b-8028-4f41-960e-1ecbfaf06cbd	Kewtiie	artist:fcf3356f-de80-4b0e-9bcf-8717797322d2		https://i.scdn.co/image/ab6761610000e5eb0accc319a3cd4eff28b242a4	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
aa8de50a-9bc5-4497-a15b-c2f8753110ff	PC	artist:18e48719-1bf0-4fb9-849d-3edacc4913b2		https://i.scdn.co/image/ab6761610000e5eb70bb4d5e160a5bfa5f848f1a	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
1f021b71-ce61-4984-8a0b-34dbbdc83dd8	Ronboogz	artist:4263fa8f-973e-40e7-8f66-aaf352dbb1bd		https://i.scdn.co/image/ab6761610000e5eb52e4f3bc88ce00be25c5f747	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
4e0d72e5-0245-45a7-bb7c-03f496c722bc	Kai Đinh	artist:2b2e8280-119a-4e9f-a5c5-34c151008d73		https://i.scdn.co/image/ab6761610000e5eb2745dabc439f240f5e4e4a62	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
4d7c4989-ebd4-4da0-a600-07e324d64b04	Tùng TeA	artist:44538e43-0d96-417e-b964-710f815afad4		https://i.scdn.co/image/ab6761610000e5eb13f97c503ae98961f29a05d1	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
ec00710a-b4a2-4a8b-b531-18f78f5c287e	kis	artist:ced22733-7791-4cc7-8f2f-fea476b2efe6		https://i.scdn.co/image/ab6761610000e5ebdefdfdb67e3fad3647632e6e	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
3c0b58f1-7b9a-4be5-b1e2-3f2e2701d77b	D Blue	artist:c18b76c7-c1bb-4f66-abc4-5e64e940379e		https://i.scdn.co/image/ab6761610000e5eb5b361dcfb4ea82891c46365e	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
91e37aba-95f2-444e-a348-33aba791a2ef	Đỗ Hoàng Dương	artist:e53a7ab0-139f-42cd-9800-d0dee12f8e62		https://i.scdn.co/image/ab6761610000e5ebcfbda65e78ab7b1101094369	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
696cd577-ea76-4770-b73b-99b7a7d445b1	Pham Dinh Thai Ngan	artist:f6db2fda-8df4-4d60-bb73-5e8455e8cef9		https://i.scdn.co/image/ab6761610000e5eb3562f17b61ecb859bcd63e6b	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
ccc53630-5a61-4d0e-91f1-b925bba5f5fa	MiiNa	artist:7550f2f0-d0a2-4158-8bdc-367eaa20980a		https://i.scdn.co/image/ab6761610000e5eb48ee822a8a983523d4020c80	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
196727bd-a8f9-4328-9d9e-5148eeb74426	Ali Hoàng Dương	artist:3f452182-f44c-4432-91cd-d660b387e4d0		https://i.scdn.co/image/ab67616d0000b2730a0d6d2111493d8583474c00	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
5ea6fa0f-2015-4d7a-9bb1-4d765cd6fab9	Biển Của Hy Vọng	artist:40209763-a759-416a-a810-045eb193495d		https://i.scdn.co/image/ab67616d0000b273cd96c10aeee9a07bf7f3c457	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
f725db9c-9ab2-476c-bee4-58230f79d32a	Hương Giang	artist:8dbeed09-82dd-4b78-bf6f-7ac821cf2baf		https://i.scdn.co/image/ab6761610000e5eb813f1953da358f0e68a42b5c	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
c5184010-47dd-41a0-a42b-971c3942b620	Ái Phương	artist:09e929a6-a380-4f41-bd24-da3072e2c318		https://i.scdn.co/image/ab6761610000e5eb17fd5339ef48dc8a0efaca6f	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
7f19ec91-90e3-4ac9-94c5-5d1cb71b410c	RIN9	artist:29918c5b-e3c6-4969-a05f-f249adb1e0bb		https://i.scdn.co/image/ab67616d0000b2734dede92b91210191f74021c8	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
dbad4998-7b6f-430b-904e-3ed307925d95	Bảo Uyên	artist:a7fcdaa0-d039-4364-9aba-9722b22818dd		https://i.scdn.co/image/ab6761610000e5ebfa43027190bdfa32569e118a	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
5cb88f74-a9b8-4bf4-a9d0-3a1539132ad6	Forest Studio	artist:a0e3026a-ed9b-419b-80ab-f24fca6d2509		https://i.scdn.co/image/ab67616d0000b273d4e27f52c4d13ecc13a9fadf	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
2a9e7337-d833-4215-af63-54214b431c30	Xesi	artist:cb5ebfb6-469e-4c69-852c-9e9465d300c3		https://i.scdn.co/image/ab6761610000e5eba7a94977c8f3421a416769ab	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
95131be4-d2e3-4482-99b9-4bf5ca7779cd	Phí Phương Anh	artist:ce368add-6dbe-4e1d-8d21-75725ebc996d		https://i.scdn.co/image/ab6761610000e5ebc83cdeaef9edd1301538fc00	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
28dffd3f-e2a1-44de-867e-cf60ada17c2a	CARA	artist:22a3a6cf-cdf0-4ab2-b45b-35486acbea86		https://i.scdn.co/image/ab6761610000e5ebcb8a77aefd6e7129fe863d99	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
f426b43f-eb84-4a40-92b4-e58d45b52852	Bùi Công Nam	artist:6d32736c-7fe7-4cb4-8227-5454cb0354a3		https://i.scdn.co/image/ab6761610000e5eb30b06e8ef75d11396d495259	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
8cb0bd50-47aa-4fcf-9418-7e8989104c25	Ngô Lan Hương	artist:2dbd0fc8-b477-4822-a695-ee9fb16a63f6		https://i.scdn.co/image/ab6761610000e5ebcb6b0722d8b3d6b81395a9e1	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
d2bc1a41-e373-49b6-98f7-0c5a9416297a	Thiều Bảo Trâm	artist:d7eef7c9-b7b0-4478-99d5-3d85575a9db5		https://i.scdn.co/image/ab6761610000e5eba752ad41626e9ef96e470ac6	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
0ac5199b-d068-457e-bb16-6916c1edc9f8	VAnh	artist:a27e4d3f-7b4f-4f34-bf07-463a99c2a256		https://i.scdn.co/image/ab6761610000e5eb7913301ddca91d0bb45defc8	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
50b7ea32-9d93-4a4c-83fe-cb3298f75997	Dế Choắt (DC)	artist:5823efb9-73c8-47cf-9c91-0501f9d33862		https://i.scdn.co/image/ab6761610000e5ebfec09bd196e896f20125e9ae	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
983e9f37-a815-453b-8fd2-e4b703cf15ec	Huỳnh James	artist:5a5147d4-7b31-4ca6-81a0-365e7461674e		https://i.scdn.co/image/ab6761610000e5eb8bf9d51445275a7428ef8715	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
aa71fdd0-032a-4832-bb00-198e56489311	Blacka	artist:ca75b0ed-f361-4037-a72f-bbb8c1955fdd		https://i.scdn.co/image/ab67616d0000b27341b1bbc9c36881f93a764a69	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
9180fa45-de0f-41a5-91dd-c43bfb84f137	Tage	artist:b10e9ae2-38d9-439e-b710-24d97571443d		https://i.scdn.co/image/ab6761610000e5ebb43b6febe7bc0a4041081179	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
685a25df-4d2b-4857-a746-3d3893307461	King Of Rap	artist:d8967b8d-98fb-4741-9f20-a2d8b9dfc3f8		https://i.scdn.co/image/ab67616d0000b27377bb519c5749624d1a1871b4	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
467dccea-5350-4c26-8d93-0c481c241fa6	Seachains	artist:57a6b83b-bc07-40bf-8779-fff031e80a1e		https://i.scdn.co/image/ab6761610000e5eb8970471e4c583e41a7e22ad0	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
b1eb537e-1b41-448b-9008-379309fc4fdf	Kimmese	artist:c327779f-e0ae-4794-8b2f-1f5389b14db5		https://i.scdn.co/image/ab6761610000e5eb284ebfe23fc2858155917007	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
adf26eab-4cf5-4f35-8f9d-a92c7c59eed4	Datmaniac	artist:c817a7b7-5142-4724-9dee-950be91418db		https://i.scdn.co/image/ab6761610000e5eb9b15d1aa00b4d451fe27a455	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
9ef844bf-5a13-4ed1-bb14-f8c1bf7e09e1	Pjpo	artist:b7d7fc24-9b38-433c-abb6-8c143c315c70		https://i.scdn.co/image/ab6761610000e5eb455e8dbc116f4c3286f7ac3e	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
0b4a7393-5998-42f4-b447-fb31d1b32b73	Lil Wuyn	artist:6f5b8878-ff9a-4e90-81b3-65ea2fda48ff		https://i.scdn.co/image/ab6761610000e5eb70cb097c71b1b2bab9f1c69a	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
68c010c4-836f-4af7-a1f4-5509f66ac135	Phuong Linh	artist:135cb14b-24a0-499a-80be-1d51b8c22544		https://i.scdn.co/image/ab67616d0000b273bd48f3fbedddb23ed66f860a	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
76b4f2fa-2293-464f-9e83-33b809cea3ff	Mỹ Linh	artist:e02618f3-1019-4758-81bb-c2d9d2997ff2		https://i.scdn.co/image/ab67616d0000b273b75c39ac354fab2634ab856e	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
1e056c65-94f3-4a7d-9c76-43bc8890a545	Trần Thu Hà	artist:be89066a-86b7-45be-bf12-579d5c57775a		https://i.scdn.co/image/ab67616d0000b2733f2e0852b231e3449e6ca7c2	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
9e165fa5-473a-40c7-93dc-e98dbcee9d8c	Thu Minh	artist:56c16dcb-aea9-4e62-8bc8-d616423f0d94		https://i.scdn.co/image/ab6761610000e5eb04226ec6af8b00f7baf9ce07	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
138c20c6-9f4d-4e7c-a113-83fa12082574	Hồ Quỳnh Hương	artist:00642c1e-32ed-4c43-9e4d-9bf931831a59		https://i.scdn.co/image/ab6761610000e5eb2078804f132212eb2a5ef9e5	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
06d51b58-44fa-42aa-86b7-d1b44a38fbd0	Phương Vy	artist:ed6cde4f-1d84-47a1-bd93-f61a40a549dc		https://i.scdn.co/image/ab6761610000e5eba4d7eb1fa612780685703c79	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
7854a56b-e4a1-4b3a-81b1-df50b4f8c574	Thu Phương	artist:5930b2d7-b7ca-4488-af15-ce7087e25371		https://i.scdn.co/image/ab67616d0000b273247019fcf88d8bc34f38eb4b	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
c585f45b-152f-4443-9d88-8fa13ef4799a	Quốc Thiên	artist:7210b797-a34a-4a3b-bc44-1b7b668d55db		https://i.scdn.co/image/ab6761610000e5eb84d49624a92df1306e394efe	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
32145967-8742-48f2-b32b-0d94f1df5c9a	Hồng Nhung	artist:36f3dea1-2560-48d8-beb8-a93f16d29fea		https://i.scdn.co/image/ab67616d0000b273cdad076c010df4a5f07c16ac	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
35e4731a-2346-4f1b-99a1-924e74752c12	Văn Mai Hương	artist:2d539377-6481-4f20-b67f-526117f2c906		https://i.scdn.co/image/ab6761610000e5eb449f96a16500b2b75e1c9234	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
0fb9d036-431a-4860-85c7-00a9bd842bf1	Hien Thuc	artist:920cd915-52ef-4108-ab29-48f1c6cbb794		https://i.scdn.co/image/ab67616d0000b2738e4fe651cc63bcf65021522b	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
dcfcc4fe-7025-47fb-9140-cef41750f56f	Nguyên Hà	artist:f4dcafe2-0bcc-49a4-9937-97169eb04437		https://i.scdn.co/image/ab6761610000e5eb0950190306b49542f6f68b58	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
45d6c4ec-a0b7-49c5-9cfb-3f94a5659929	Lam Truong	artist:b9e3d772-a2fc-4e47-ab4b-6f0f3bbe94b1		https://i.scdn.co/image/ab6761610000e5eba61c5c97b1b318f1b04fcd97	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
7a95bcca-4460-4137-ba0d-61cf6b0ba1a4	Thùy Chi	artist:f791838c-fba6-4da6-86c3-e7341671c74e		https://i.scdn.co/image/ab6761610000e5eb907bbd0b2531b8e793ebd242	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
afa8a08b-61b0-436c-8845-b9efb91aeff6	Lệ Quyên	artist:29422f6f-a432-49d3-86bb-d211a8fc2de5		https://i.scdn.co/image/ab6761610000e5ebea9b15c80810bae0bb0e87ad	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
32e168fd-f4ff-4181-9f21-dfd43cf2f395	Thanh Lam	artist:ffe2f28c-f2f8-43e9-9613-e7b861a8aa18		https://i.scdn.co/image/ab67616d0000b273c240eac154c820d5214db661	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
47d2fa5f-c3e5-4b6c-bb28-f06ad871b0b7	Lê Hiếu	artist:dfc8d17e-a539-4950-b495-cb4153541a9d		https://i.scdn.co/image/ab67616d0000b273caa7ef3c1e269ce6b12f6b3e	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
de24c6a1-1ebe-417f-a910-68ec1b4f351f	Bằng Kiều	artist:4772af49-1e58-4513-8259-3cfd3858e748		https://i.scdn.co/image/ab6761610000e5eb004ae448e0ac5f697c71d654	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
98099631-d325-4c2d-92cf-5a5de6b9518e	Chillies	artist:0f3d4c3b-8352-401b-be7b-c0f4bfad8991		https://i.scdn.co/image/ab6761610000e5ebae678a70cd3899b2167026ea	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
203fa3bb-a6ac-4ea4-8224-688a0184ef80	Emcee L (Da LAB)	artist:481452f3-5cf7-4d95-b2a4-48842ea9f4d4		https://i.scdn.co/image/ab6761610000e5eb92dc4a2cbffbddb59f825fe0	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
895d853d-2d6a-4881-a97a-6422b74f15e2	Andiez	artist:b5f2c07a-cd5a-408d-8783-3beef866dbe7		https://i.scdn.co/image/ab6761610000e5ebd6430dfeef182fc1eaa9b105	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
dae9e7a3-122d-4699-a3ca-895ef4774766	Thịnh Suy	artist:8ba7a1bf-0ee0-463c-ba09-5990a8dded84		https://i.scdn.co/image/ab6761610000e5eb34dca195e6f7b02580155565	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
fa273631-a56c-445a-a04d-1b649ab7ecf9	Tiên Tiên	artist:4c9ec05e-0765-4d9c-8fe0-8189f5be2da4		https://i.scdn.co/image/ab6761610000e5eb367ac417cc3e77ffb8362e0a	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
859a0541-abbc-4767-917f-d51344dfd9d3	MONSTAR	artist:15e4f4a0-98eb-4310-a8b7-aeaeb46b4cb3		https://i.scdn.co/image/ab6761610000e5eb670d1bbea09cde81f7a7893c	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
f2c84d07-9f58-45e7-aeb1-5d9f8dc8318d	Madihu	artist:35177e13-fa8d-44d6-83e3-256616d1114a		https://i.scdn.co/image/ab6761610000e5eb3bcc23d31e8962897b7d3e2c	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
8aa94b14-7b66-4e5a-b72a-03686a40b875	Vũ.	artist:df3b6fb2-85eb-441c-9804-ef41202587a5		https://i.scdn.co/image/ab6761610000e5ebbbb15879256a5443ef7d87b4	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
ade34e3f-9f70-4c88-9031-0021a6e31237	Ngọt	artist:94b717a8-58f9-4512-ac3f-82230df7bc29		https://i.scdn.co/image/ab6761610000e5eb66e0a040a53996e8bf19f9b5	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
6ee78918-65e2-4318-9751-d2bec6ee42a7	Orange	artist:664a0821-f03d-49f5-9e9d-210492bf8581		https://i.scdn.co/image/ab6761610000e5ebd4050562a6008252b169801c	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
aa81abce-62b4-4955-80eb-4ee1bb930348	Vũ Cát Tường	artist:11eaada2-6df0-4739-aeb1-51c8602de036		https://i.scdn.co/image/ab6761610000e5eb15b9b2263a70180260b4cf97	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
99beb632-8d5d-4dc7-81ed-9ee2ef4fa68c	Bích Phương	artist:817f9a2f-9b88-4ac3-93c5-6fe3e57ac23f		https://i.scdn.co/image/ab6761610000e5eb2de300e8eb56aac83abfdb4f	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
6543a49a-353e-4947-a261-54e289866118	Noo Phước Thịnh	artist:4c635a30-d220-4460-9db6-22f532029997		https://i.scdn.co/image/ab6761610000e5ebda93c541daefd806b8992302	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
5d19762f-86fd-4234-9a68-f856e34b9b2f	Trúc Nhân	artist:22844ec3-e606-4385-8797-59c591336e91		https://i.scdn.co/image/ab6761610000e5eba7f28bd3ad5ef4a868151ee7	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
a9dd5936-5b14-4627-963d-9bc52fcd8bcc	Thái Đinh	artist:22916d15-3d29-4298-9995-16099fcdc4b3		https://i.scdn.co/image/ab6761610000e5eb1b6e674679f24d11a7446228	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
dbba16cd-3566-4e88-b85b-ccada28513a3	Hiền Hồ	artist:bcf7967e-e426-4d73-983c-bd2f712c479f		https://i.scdn.co/image/ab6761610000e5eb033a1f97b67ac32e69b2de3d	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
26f92bb5-31f8-4f41-8501-0ff3aa5a9f37	NHA	artist:e69691f9-32d5-4cca-9a36-d4f93b134448		https://i.scdn.co/image/ab6761610000e5eb50f98a4f68dfdbaa85ff51d1	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
d24fea23-a891-45d3-9f9d-2ee960a8270a	Táo	artist:698fffa4-36c0-4f9a-b404-b8ae1f831534		https://i.scdn.co/image/ab6761610000e5eb3edad601de71d029b73c620c	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
e9a29164-3b33-4c53-bc7d-3bc792abdc1b	TaynguyenSound	artist:36e233ce-4733-4a9d-b505-c58cf6a9d6de		https://i.scdn.co/image/ab6761610000e5eb422664c8cf0c99b3219ffd7b	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
00d28f6f-2fcf-4e55-849e-612cf133306d	tofutns	artist:328b3712-15bb-4d49-9d33-62bf7809cceb		https://i.scdn.co/image/ab6761610000e5eb1aca7b0563eda380d70ac51e	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
634016f9-47f0-4609-8838-9f6f325a2699	BCTM	artist:8023e797-8da6-4383-90c3-653d9ae815a3		https://i.scdn.co/image/ab67616d0000b273ccf5eb1e7d1452b932f9f06f	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
0268891d-ee40-475f-a3a5-4704ca0dc299	PAR SG	artist:3571dacf-5f20-42ab-abcf-946913118c15		https://i.scdn.co/image/ab6761610000e5eb107697fde71a1ac4b328a140	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
402a10cf-f87d-4cd8-a4f7-389e4e0fc757	Huỳnh Tú	artist:7064e6bb-d9f4-4bed-9a6b-51f5eb698c49		https://i.scdn.co/image/ab6761610000e5eb74687b378b5eece194d2f4ff	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
3653e43a-3322-4c59-a1db-7393a7bc4c62	Châu Đăng Khoa	artist:63410196-27f9-40f1-bfdc-e0bd60145a6b		https://i.scdn.co/image/ab6761610000e5ebd1bc9d9682c9c9e57a24e8f6	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
4f2d17ee-2bde-4268-8535-5130cc931f13	Kidz	artist:15a47c31-f0f8-4917-badd-42a22a47fd11		https://i.scdn.co/image/ab6761610000e5eb7afe8f2cb69b581d8d359bb4	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
5d07fcfa-e632-429c-bf4e-e4defd89190f	WEAN	artist:8f56c112-73bf-4306-bf3c-580058b1a854		https://i.scdn.co/image/ab6761610000e5eb1e980099699211bd0dd694ad	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
4cb20b4b-71b1-4cf6-a461-04d1edd85863	Đức Phúc	artist:34649ec8-a84b-4889-a247-0ed223fb53f3		https://i.scdn.co/image/ab6761610000e5eba7e82b4fbe3605c71aed9fee	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
d8eeae83-cb8a-48ec-abf1-8d041e136c74	Thắng	artist:b728b899-f4cd-44a9-bd2a-491ad46662f9		https://i.scdn.co/image/ab6761610000e5ebc196ed35d9425d0abe9d2f63	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
c3d2abfa-ad56-4621-8d1a-75cf0cd02cb1	T.R.I	artist:8eafced9-5db4-4630-ad23-6fa55ac3644d		https://i.scdn.co/image/ab6761610000e5ebbe00f37f2dd2c594bb336f85	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
3664859c-fe56-4722-bff5-823d2b633840	Kha	artist:f8a8c312-a6a6-4b31-b536-e5bee34ffe14		https://i.scdn.co/image/ab6761610000e5eb4053b425a789aa1a60436ff8	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
5e5c3df5-d026-4916-ad49-32fe4b1e835d	Ngơ	artist:d66ef922-8f4a-407a-840f-fb752320d8c6		https://i.scdn.co/image/ab6761610000e5eb6994e627c5b26909bc8ba813	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
e0b96819-b5bc-4f7c-bdc9-51a6a84c217d	GREY D	artist:52250d02-c25d-4cbe-a13d-5cb87ac4117f		https://i.scdn.co/image/ab6761610000e5eb2109b4c3915dce9b4fb60c38	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
67dfff4f-275e-489c-acd4-7b907340487e	buitruonglinh	artist:3e021804-88b8-4878-a3d8-e67721267170		https://i.scdn.co/image/ab6761610000e5eb6fa9203f46889b95e081d2ec	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
a0829e2e-0f29-4903-8df7-b42c1a2a63b7	VSTRA	artist:06cf6811-df36-459a-be25-b843c81e6f2e		https://i.scdn.co/image/ab6761610000e5eb4003ce478669b0b238ebbc85	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
a49680f7-30bf-4716-87ca-c6545ff9eba7	Low G	artist:19ceeeb2-b4f9-4327-a4b9-68678a5e9d2b		https://i.scdn.co/image/ab6761610000e5eb00ece52e50b41c7d6192cc26	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
9bf68331-d6ae-4ab4-b1f6-ccbcce354abb	Đĩa Than Hồng	artist:45a74d50-b8e5-44e2-93a0-22b7173c0f6d		https://i.scdn.co/image/ab67616d0000b273b5cd6a220f9eca6d7fe335c5	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
acfbd527-89b0-406e-a797-ca8b2e5cceb9	Phạm Quỳnh Anh	artist:00fab4f7-4853-4f08-98b7-1550ef0b30e8		https://i.scdn.co/image/ab6761610000e5ebad6d5adbda5caa0ac7d844ee	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
2a2af512-0a85-4fa0-bc48-5f81ea3b6c24	Juky San	artist:05dee7eb-f0c4-4d97-9069-5c368873a46a		https://i.scdn.co/image/ab6761610000e5ebd6512c92f2182bed4bb645b8	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
5b779179-dbbb-43dd-bc34-f25a6de341a5	Hoàng Duyên	artist:82988eb8-dd8e-42e8-bbc8-e8f683aa77da		https://i.scdn.co/image/ab6761610000e5eb882b9406aea0290f59023516	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
7130661a-895f-4322-8429-ef1dfc4b2763	Lyly	artist:82c1465e-07de-4f4e-a8da-76243c369285		https://i.scdn.co/image/ab6761610000e5ebd626667b97f1e52c16856e7c	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
3cae6182-7f83-42eb-a822-4409d8b658d2	Hứa Kim Tuyền	artist:38136f28-b22f-4e45-b29e-17ac7b4a055e		https://i.scdn.co/image/ab6761610000e5eba42e0a19eabe7885296b4a69	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
17ba4f27-4950-4e58-8c25-9a6730fcdfe2	Anh Tú Atus	artist:05b260e0-15a1-49a4-a005-41d78d9bae49		https://i.scdn.co/image/ab6761610000e5eb8f47b8f7d070919fff02059b	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
31e2c14b-9b64-4718-8d53-11fe7ccddbe4	Han Sara	artist:0765c8c7-dc07-495d-956f-693a7dc41b3b		https://i.scdn.co/image/ab6761610000e5eb8b97863b6de2d6604be13da1	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
b0874308-72da-4d76-9775-290ba7a1dc6a	Reddy	artist:1fb41750-348f-4d9a-9376-25160091ff38		https://i.scdn.co/image/ab6761610000e5eb31a448e758e54c27a55bb3c5	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
882b9d4d-0564-46b9-ae91-4071fb09e6dd	Freak D	artist:e64cfca2-c02d-4e69-b0e3-8fd3b1669b39		https://i.scdn.co/image/ab6761610000e5eb33c7544b842b01854aa6cf7c	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
47685ad9-fdaf-49f0-8ea2-1bc04d3e732f	Bozitt	artist:2041b235-838b-4bec-83ff-8ba2a616228e		https://i.scdn.co/image/ab6761610000e5eba61a00543862d101022460ae	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
2d415581-c314-4c69-b06f-f302ba9edeff	14 Casper	artist:5a98369b-2a8e-438e-9e8c-506383df5221		https://i.scdn.co/image/ab6761610000e5eb075837f4fc4fc2383d961084	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
f11fda6f-3e5a-4314-b4a5-d1c3904c95bc	Changg	artist:0811f60b-8064-407b-a692-5f210cd0f841		https://i.scdn.co/image/ab6761610000e5eb0b844603bdca767ef4346616	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
d0ef0e1e-ca1e-4bb7-b3e4-e20ccce95385	JSOL	artist:dd05cbae-215e-40fa-a4ce-255ae4da484b		https://i.scdn.co/image/ab6761610000e5eb8c6467d786f314c9284fc9ec	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
2bc0e3b3-f4d4-4b81-9d65-4a7815e23b25	Nguyên	artist:ee30acab-a517-4be7-aa97-4b69024422a5		https://i.scdn.co/image/ab6761610000e5eb6ff5ccaefba3405215986a7e	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
2109400c-60ba-46dc-a92a-816d33cb057d	Lil Zpoet	artist:c9a2c98e-e737-43f9-ae6c-7432505ce6c4		https://i.scdn.co/image/ab6761610000e5eb0366ff2d7340b2868f2ad533	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
8eb298bf-153f-48d1-82d9-e19b6a0f87a4	Freaky	artist:fa1a8210-34e0-4c37-ab39-85e0935eb236		https://i.scdn.co/image/ab6761610000e5eb709a8c25748ea0905f91ed4b	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
2cc1eaeb-8a8f-4e4e-8c4e-535045c290c5	Phạm Nguyên Ngọc	artist:00871213-0a4e-4256-89c5-36c944b24fc4		https://i.scdn.co/image/ab6761610000e5eb9947613368a5dff45d44e8a5	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
fd74e9db-3749-440c-b018-ea4a8af21d8e	Khoi Vu	artist:c73ffdcc-2064-470f-acfc-be1f34ad08b7		https://i.scdn.co/image/ab6761610000e5eb2653bba2bdcf714f5d34ec9a	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
0bc0d85b-8652-47d6-af4f-16d6a8f2283a	Mademoiselle	artist:aa37518c-77b5-4b1b-b9d7-b4779928a3b6		https://i.scdn.co/image/ab6761610000e5ebb61036387219e1b58ff0b847	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
82862983-1b76-42aa-91e8-93d08197325d	Phùng Khánh Linh	artist:69fc7c26-23e8-4699-9104-f576980f5b64		https://i.scdn.co/image/ab6761610000e5ebe0cc6ce0814f6c5cecad0bf7	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
bb1a478c-6e52-4c84-9198-cf0594853a43	Hoàng Yến Chibi	artist:30eaecbd-2477-4890-8b1b-37ca66fd1d9b		https://i.scdn.co/image/ab6761610000e5eb405fac74511648f8852c8d9c	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
a3ddcc46-1599-45c1-9e91-88500683479f	Chi Pu	artist:935ab433-4bab-4c6a-9e8e-e6ce0abdc1f5		https://i.scdn.co/image/ab6761610000e5ebe3e352b996bd16e5f423a1d5	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
d129686e-aa22-42c4-b76a-1f5141bb4411	Quang Hùng MasterD	artist:31b50870-9dc8-4493-87a8-a9a8b8995d1e		https://i.scdn.co/image/ab6761610000e5eb68a40843cf335ef94c68bade	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
dcbd37fb-297d-416f-8674-5c51accafc39	CHOCO	artist:b8391bcb-81af-4a70-a7cd-611784c656bb		https://i.scdn.co/image/ab67616d0000b2732887ba875ba1f70088b66be8	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
12b79951-a31b-4f4d-8d0b-11496960bd27	Cara	artist:7754339d-21b9-4ee0-90e3-20d1c876504e		https://i.scdn.co/image/ab67616d0000b273a7f014626d700e05c1688b89	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
5d90de2b-c31e-477d-89bf-f1cbeefc19d7	Rapital	artist:b36f906a-7002-4449-8aea-930ca64ec10a		https://i.scdn.co/image/ab6761610000e5eb589525f3dc7f5caac9f88f12	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
acff2ff6-1f82-4e2a-a28b-2f7dcb44d277	QNT	artist:e18baeed-6296-4bbb-9a0c-587d8d8d2fc9		https://i.scdn.co/image/ab6761610000e5ebc29f15a5b9b46fed41a0f2af	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
597fa8b1-a90b-429c-9f80-0cf5ad28f0bc	Sol7	artist:126348a9-8a0c-45e4-ba10-eda59b69cc44		https://i.scdn.co/image/ab6761610000e5ebcc911aa2866d62f7bd5e5894	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
6c48338c-1b43-437a-b3e5-a90d733d32af	NÂN	artist:77a23e00-8583-4489-a717-895430d12bfb		https://i.scdn.co/image/ab6761610000e5eb99878ec25021eb657f982522	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
5a52fb65-4dac-43e4-900b-4241b61689c9	VSOUL	artist:27d1f991-83bc-4ae0-a6c1-20a0eb8e0f7b		https://i.scdn.co/image/ab6761610000e5eba573a7f30ae3296818aeb51a	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
828010a8-abd5-4fba-97d5-0c70e8244eb6	Obito	artist:76082fae-ed1a-451d-9f26-63f62f5637a4		https://i.scdn.co/image/ab6761610000e5eba385bd3e0f67945f277792c2	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
997ac615-84cd-4bca-af60-38eb2b199808	Anh Phan	artist:e73903cb-024b-4989-b33d-87d0b765e7c0		https://i.scdn.co/image/ab6761610000e5eb2d6fade2273bd13062501d60	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
b21e7978-7434-4b8c-9140-7c7a36dc94bd	Wxrdie	artist:c1d2fa99-8d42-4309-bb60-a82b763baa2d		https://i.scdn.co/image/ab6761610000e5eb0b5e421f393e1d4f790418f9	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
ad14f750-3b21-49b5-819d-0604106a2c13	RPT MCK	artist:e8054f7f-7fce-4055-847d-d432d9e33279		https://i.scdn.co/image/ab6761610000e5ebb97791c136d7354ad7792555	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
acb3ef7c-1a32-4007-b19a-d37ac43b39f5	Coldzy	artist:a45cdea8-c3c7-44a3-9915-e6030abbda23		https://i.scdn.co/image/ab6761610000e5eb4a42ba988102dc5b7221a7d1	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
d76937a7-4f46-489b-ae78-3c17c2d14dcb	Hustlang Robber	artist:7057a480-14fa-4288-a5ea-c089a469a4c7		https://i.scdn.co/image/ab6761610000e5eba95938560cec466e19c4734d	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
7eafb282-c8f6-4957-9604-677104b4a1a6	Wren Evans	artist:f9513121-ae5e-47cf-98bd-b4efc2b1b18f		https://i.scdn.co/image/ab6761610000e5eb8a7f4082ee51f9b63374a419	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
d2a4b7a3-0b8c-4df6-a286-5fc3eadc14f2	2pillz	artist:91123b33-5cf2-4b6a-af7e-ec1e632d0b7d		https://i.scdn.co/image/ab6761610000e5ebb0e8ef2d28b9487d7af47d75	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
4fc26e05-baee-490c-8387-4f2adbce0caf	tlinh	artist:d6460c0a-5b6e-40b8-a84b-2a9aad063aa4		https://i.scdn.co/image/ab6761610000e5eb2bcb72091c46d935e195aa87	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
f9158bea-738b-41f1-acee-3de580d439e7	SIVAN	artist:74163245-ea11-4ebc-a915-6f7dd5971778		https://i.scdn.co/image/ab6761610000e5ebad323baf9852dd3b29112cdc	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
144aacf1-2f35-4858-b319-861579d93e70	UMIE	artist:ec47010e-ac17-4e33-8946-139a69548d43		https://i.scdn.co/image/ab6761610000e5eba55696b11839ce028bee8721	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
326fd17e-09fd-49c9-be7e-9f396e688f8c	AMEE	artist:13ef1caa-f095-4a95-b6f8-54db2b2b8d30		https://i.scdn.co/image/ab6761610000e5ebb69fbf5081cca8aaa587267b	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
93690beb-0b5c-4356-80c2-c84fb7610d48	Quân A.P	artist:0507a68a-37e7-43dd-87ad-aa5b0238e761		https://i.scdn.co/image/ab6761610000e5eb916d46fa6ab17246f55a00f7	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
efff3051-707d-4642-bd93-c87ccf787325	Rum	artist:e4c5ad66-d1af-4f3f-bf98-3e615c3f3884		https://i.scdn.co/image/ab6761610000e5ebaa7d93582fa28d02b42b818c	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
7fcf8860-38ff-4d72-83e5-004ae41ab6d2	Daa Major	artist:6741572e-e274-48cb-97d2-eb4a06e71848		https://i.scdn.co/image/ab6761610000e5ebdc069a1bd65393df59727578	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
810c9a9c-cf7c-48b7-baba-a17c5959ff86	UNI5	artist:8451018d-5dc2-4f88-9d0d-2c384a0e6da6		https://i.scdn.co/image/ab6761610000e5eb93b035f1ae60caa66c5c4eb1	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
8a7d7f7c-21e1-438b-a10e-625d5b6506ba	Fanny	artist:2b2867f8-2300-4dc3-b42f-6e01731dc593		https://i.scdn.co/image/ab67616d0000b2733ebff0f38773a68583a57ad8	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
430323f2-a4f4-46ae-8787-540d7be3fd9c	Vũ Thịnh	artist:48ec3155-ac2a-4910-affa-30d2f345e958		https://i.scdn.co/image/ab67616d0000b2733ebff0f38773a68583a57ad8	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
a95d9904-e86e-4c43-bd1c-649bc1475cc6	Đức Ứng	artist:8718fee3-d968-4091-af29-cdc8842393c0		https://i.scdn.co/image/ab67616d0000b27326c9eb12f778a26aa51cb47e	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
1b6c4155-f85c-4b11-9726-8560b71d6e1d	CODYNAMVO	artist:84db7ce4-623e-4689-ad2f-15b8c803bda4		https://i.scdn.co/image/ab6761610000e5eb91d228e18e2fd71f046fcb87	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
cf438750-e4fa-4ba5-b713-123219c55a2b	Min.T	artist:11d0c9fc-aa04-4d4b-a3c6-973766246e25		https://i.scdn.co/image/ab67616d0000b2732d1e445e079e50b094100797	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
0dfc7603-d36c-4fff-9322-5118b2ee7ed4	Đức Anh	artist:415f8eaa-fead-4179-940c-953e2a771051		https://i.scdn.co/image/ab67616d0000b273b66cb85ad8a53cbdacacc42c	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
556bd963-1b36-431f-8596-23d5801cbb76	Hà Anh Tuấn	artist:67461a8d-4ce2-4ebe-a746-34c7fadb2b19		https://i.scdn.co/image/ab6761610000e5eb99649a8a989bcacb12960591	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
366b71d8-47fe-4557-b725-4e1852699d55	Đen	artist:4ee11667-61d2-4fac-bb00-e2e018ad3164		https://i.scdn.co/image/ab6761610000e5eb91d2d39877c13427a2651af5	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
6b09542f-61f8-4245-8c06-cc743e28200d	RPT Orijinn	artist:b1e03741-1c3c-4e8b-aa58-8b5c50fc658f		https://i.scdn.co/image/ab6761610000e5eb6ad583d5630432f21d0bbf6d	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
e5328163-3176-4469-aa9f-1fd0f488e3bf	Phuc Du	artist:0da67a00-851b-4193-ad00-7da469bf1d2b		https://i.scdn.co/image/ab6761610000e5eb7b5ea67e176a1ee8dddaf261	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
b67e804f-702a-49f0-90da-51409e5da6ae	Hào	artist:512c41dc-c0d6-4bfa-8c9d-96221ac9bf8d		https://i.scdn.co/image/ab6761610000e5eba5a1f9dda5b92344ee2083b3	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
2df11435-65be-4d3d-887f-eb42fbf2dbd6	Thanh Hưng	artist:3c12751b-2c9a-4228-abb4-3893651a93b1		https://i.scdn.co/image/ab6761610000e5eb4fbc0b223448392ea15c4b9b	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
595536f3-84d4-4c82-8932-934bf9a6b432	Nguyen Huong Ly	artist:60c4da0c-6c7a-4c13-8dcc-49e0f3bbc6d7		https://i.scdn.co/image/ab67616d0000b273063529aa7e3f2d3cc79c7c21	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
e7c97731-156c-4fa5-90da-4e81f51424d2	Vương Anh Tú	artist:f97efe08-a8db-4c07-96ed-77078e55dfc7		https://i.scdn.co/image/ab6761610000e5eb2e9250894b1d5b8a003d9f66	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
cd091983-e6a9-4d0a-aca4-43e3042d0fb3	JUUN D	artist:17b1c5f4-ea4c-42eb-b7b6-7ca077dd77b7		https://i.scdn.co/image/ab6761610000e5ebe2f7135e53d9f7d8421e7a45	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
41327802-1b12-4592-ba7d-0e2be4f87ae3	Hari Won	artist:bad49cc9-86a8-46ef-86fd-c3cdf8252588		https://i.scdn.co/image/ab6761610000e5eb72da52d9cc654013e851cf1a	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
e6318abd-dd1a-4eed-b6e5-3d65ae011797	Nau	artist:e61be076-3be3-4361-8e0e-18b8e4d50215		https://i.scdn.co/image/ab67616d0000b273511ee8238356bdec9cbbc153	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
264db89d-9aa7-4a21-864b-0b578b192a8f	Lynk Nguyen	artist:c1bd9718-c6f1-4fdb-97eb-f526e59108f1		https://i.scdn.co/image/ab6761610000e5eb83c71affc945534658579f13	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
87cb7338-2105-4f20-9dae-ca559568a42d	Hoài Thanh	artist:06b9c99e-d34d-45ca-a78f-306253abe97b		https://i.scdn.co/image/ab67616d0000b27319d22d59dcbdec75d26b8cfb	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
456ec25d-eb2c-4017-8850-37d6a293348d	Khải	artist:0ffbc615-7efb-440b-a925-48f6dd6a2b77		https://i.scdn.co/image/ab6761610000e5eb4390b6faa27a7315c26a9289	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
fae77b47-22f7-4eba-8760-519137efbf85	Onionn.	artist:59d74f9d-51f5-40e1-911d-e7c905f6211b		https://i.scdn.co/image/ab6761610000e5eb78acc69f189aa5dc006e92f1	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
0822d974-4953-4317-b7f5-57d45692b94e	Lena	artist:c6819388-e94f-496c-8274-3f4215f1ad70		https://i.scdn.co/image/ab6761610000e5ebe03335c6bd0f021ec610b653	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
0d7c276f-28f5-47ca-9cbe-ebe9c50758af	MANBO	artist:48f390db-c530-404c-9d74-f9197fe8df20		https://i.scdn.co/image/ab6761610000e5eb05b53a159ea379e4c1a2fbbc	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
eab58083-de82-43c5-af02-81f0029e537b	Hoàng Tôn	artist:a6045a98-0a92-4cc3-8ccf-a01b6bcb4d2a		https://i.scdn.co/image/ab6761610000e5eba007c9eab281900e0c920efc	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
acd04594-9ea8-4b6c-8c22-a24b538fe282	Trinh Dinh Quang	artist:d30dfd67-97e4-4df1-8355-067144b7bb0e		https://i.scdn.co/image/ab6761610000e5ebb858c081931a127af5dab1a7	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
61a9d691-5d77-4f27-ae39-da95a3bb9538	Nguyễn Đình Vũ	artist:1ce2c68f-c5e5-4b15-8db8-536f3c51f104		https://i.scdn.co/image/ab67616d0000b273ba04a283feafea0dc06b2683	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
14ba5094-1cf9-4c9c-a5af-f21ddae2ae00	7UPPERCUTS	artist:1032a1e5-49d1-4376-9ac1-f18ca3ae3596		https://i.scdn.co/image/ab6761610000e5eb4505f1a0bb9eeff73a99496b	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
f029558a-6c4d-4f7f-9a5e-3ed8365cea84	Huy Lê	artist:e9bd44b2-1978-420b-b35d-b20eda0b6f5c		https://i.scdn.co/image/ab6761610000e5eb0639abb8361121429174f921	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
ef2a718b-6810-4074-90bf-4c381c9976f4	Ngô Anh Đạt	artist:b031b3a8-1534-4a0a-96d0-073af769a8da		https://i.scdn.co/image/ab67616d0000b273f80377955d7486d52709d433	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
27f1e009-f4ea-471f-9c49-5d39f55d53dd	mối	artist:4f314917-1240-4c8c-800e-3ca17ed6d2d0		https://i.scdn.co/image/ab6761610000e5ebca349c86c29238c0fe9a2d06	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
a6fab2b8-aa59-47f6-8e07-1d1cc6ce0634	Trung Tâm Băng Đĩa Lậu Hải Ngoại	artist:926358ae-1e36-4508-9311-f589047c8bac		https://i.scdn.co/image/ab6761610000e5ebd5000caaf7f7e56a2a650dad	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
35160f31-6f4c-4cd2-a12f-a676bf096cfe	Nam Cường	artist:5a473482-89cd-44f8-9650-f96c0e34cfd5		https://i.scdn.co/image/ab67616d0000b27351af3bdbc84adf79d0792908	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
fbd010f0-88d2-4629-9eff-576b6477d49e	Lâm Chấn Khang	artist:9dbfaa60-af8b-4c3c-9411-38cb1782d468		https://i.scdn.co/image/ab67616d0000b2732b5943bdaeaa444285e35733	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
55683b0f-ae18-4215-a834-c62918761646	Akira Phan	artist:887327c5-a27c-47cb-bc30-97fa06c2d5a4		https://i.scdn.co/image/ab67616d0000b2737a8043304e2470589a2ea39b	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
a83419f7-8ca8-49c1-95ae-753678e7c74a	Nhat Tinh Anh	artist:f4b282cf-bfcd-4615-913b-fc155809c917		https://i.scdn.co/image/ab67616d0000b2737c3b7d75452bd473cbc78ee2	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
f7d31e2f-f67a-460d-a927-ba45f498feda	Chu Bin	artist:db1017f2-b3db-41ef-a5f9-f61738bdda71		https://i.scdn.co/image/ab6761610000e5eb8233e1cb046cefe8b15dd57a	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
e14519eb-1347-4a5e-bcad-65b65bd1aafd	Vĩnh Thuyên Kim	artist:406307a2-d825-4b95-a151-8d6a13304c40		https://i.scdn.co/image/ab67616d0000b273480f43b3c999065a04a9d87f	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
1521ce62-2956-4152-9dc1-b40c72e59998	Hồ Việt Trung	artist:220be0dd-eb5a-4a9d-99b6-a607176a6318		https://i.scdn.co/image/ab6761610000e5ebf673e6b925d0abf304d53497	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
084a40f7-1bcd-4a1b-8e14-136348b1f66b	Bằng Cường	artist:97faf233-59ab-40f8-af29-d8c4405aeb89		https://i.scdn.co/image/ab6761610000e5ebccd7069c21d653ae5e316a1f	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
8927c634-5c95-43e8-9583-9d29e42e5f2b	HKT	artist:417268ea-4075-4c90-aaba-7e731fe74e70		https://i.scdn.co/image/ab67616d0000b27344767105d23c1ca5a85f429f	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
de5bdcb1-d559-40d1-aeb9-7b14e5e424fb	Lâm Chấn Huy	artist:5fb6c110-b323-46be-8a5a-2b8bea55c328		https://i.scdn.co/image/ab6761610000e5ebad0d8e668eb25f0bc442e118	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
dd3b4c7c-524d-4093-925e-683038ce1733	Khánh Phương	artist:3b1d8c8b-bc74-416e-85e5-c9b56597a98b		https://i.scdn.co/image/ab6761610000e5eb7e28657ebcdce6d16e08301e	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
0717a1d2-64ad-4c9a-982e-72e7ce30f4d2	Phan Đinh Tùng	artist:4160504d-75bc-4adb-badb-b156fc370b1f		https://i.scdn.co/image/ab6761610000e5eb4dcde69629bd8a750fb685f8	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
c750cc72-4017-4164-b55a-79671678f135	Châu Khải Phong	artist:93eabbf5-1c57-4bf0-801e-1a533a66bf4e		https://i.scdn.co/image/ab6761610000e5eb812757741d1ab6edc8a208c5	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
a8c7c6c6-eaea-4e99-9447-4ed6536de0e1	Quang Hà	artist:deef578d-b4b6-4ac0-acbc-0500136d6386		https://i.scdn.co/image/ab6761610000e5eb8ccfdc9234e2521f7ec75e8f	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
74fa043c-fd42-4873-8d0e-4765b7616b06	Saka Trương Tuyền	artist:10ad8217-3662-4b38-aac0-ed8bd6d8e3fe		https://i.scdn.co/image/ab6761610000e5eb64f94def2b5c27a24ffaf9b5	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
60545867-132d-48cd-b865-d9c1b52914bf	Luu Chi Vy	artist:23d0776a-76c3-4221-b815-0a9a708a95aa		https://i.scdn.co/image/ab67616d0000b2735f38d4591318aded563328a8	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
e1e6915e-03ec-4d56-b6aa-9ad1bc2a8060	Cao Thái Sơn	artist:cd5b6de0-ad4f-43f6-b325-2d10d7b6ec99		https://i.scdn.co/image/ab6761610000e5eba5d2e45ed9ebe6c67b70fb59	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
b1ef0416-8b1c-4740-b4e8-12625bd66bd6	Nhật Kim Anh	artist:5549ad6b-9085-4331-90eb-fe230606e51d		https://i.scdn.co/image/ab6761610000e5eb3fe1d313c796bf631366121e	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
b874d72b-becf-41fc-9225-d9a19ade7748	Lý Hải	artist:97641a24-886f-4f77-822b-e105b7a8436f		https://i.scdn.co/image/ab67616d0000b273e00281f3b6527a67376d03b3	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
1ed08d0c-d91d-4109-b609-33ae5a1c60ce	Lương Gia Huy	artist:bd6b26c0-982f-46d2-875a-daa7828912eb		https://i.scdn.co/image/ab67616d0000b273099020e1ed835c3b3b133ff7	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
12e22f40-cbb9-4dec-9089-0e71e2de5702	Uyên Linh	artist:cdc18f5f-f067-4ff2-bd86-835a1cd11909		https://i.scdn.co/image/ab6761610000e5eb75d3d01a573c0bfa031fff94	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
81c34d3e-d9c1-466a-b580-9b1c797f7b36	Tuấn Hưng	artist:4e9ccc52-ed1d-49b8-a0f9-e49986db003f		https://i.scdn.co/image/ab67616d0000b273b6bb57d2b5bfb71ebf8b1434	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
200910c0-c48b-4dc8-9832-b6aa88cca4fc	Quang Dũng	artist:4243d41c-7c78-42bc-9b4e-197d5ce01682		https://i.scdn.co/image/ab6761610000e5eb380b20bffad8c5cab7decf75	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
53fb2040-82d4-4e30-bca2-399b98022981	Ưng Hoàng Phúc	artist:2accfdfe-de59-4ed1-aa79-5fabc9a58b2c		https://i.scdn.co/image/ab6761610000e5eb35f415bab3858b097d45f79d	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
d8de4824-f8be-4c6a-b3b3-9b38c53bf119	Bảo Thy	artist:db038f5d-f609-4cb4-bcf8-f5dd798356fd		https://i.scdn.co/image/ab6761610000e5ebab3d294af601d3afa868d94d	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
d4572669-52e2-4eef-90a3-4cc610bdda7b	Hoàng Thống	artist:64d07631-9341-43d7-bdba-88c1193c30e0		https://i.scdn.co/image/ab6761610000e5eb88b45905cd2808fda018f7d5	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
5b10cb3e-5846-4e7b-bf47-8533d41b192c	DREAMeR	artist:7133a5e7-ec89-4355-a83d-36ebaaae6991		https://i.scdn.co/image/ab67616d0000b27344becb55b0036ea5718e1d8b	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
77458022-1d56-4a5d-92b4-4140e4ad4668	Cầm	artist:75ef8f7c-5007-4afc-a1e5-8cf1b3d1fd5b		https://i.scdn.co/image/ab6761610000e5ebf4f6c616f3c4fb9266d89969	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
d8694df6-f4cc-4275-999c-2f0a2f1196ee	Linh Ka	artist:8cbbfa12-71a2-4868-8a40-3a48431ddede		https://i.scdn.co/image/ab6761610000e5eb0204b800ca53db37d7bf82fa	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
6089513f-4ea6-438c-b745-508a0d293956	Ngô Kiến Huy	artist:28983646-44db-4a34-88bf-d417f1de6d18		https://i.scdn.co/image/ab6761610000e5eb9d08f9969fa8715fe5286823	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
b0d8e089-6e34-4fd1-ad30-d45ce9daa1e1	Khởi My	artist:2b6bf860-e063-497c-9c2f-18dc2a4e0210		https://i.scdn.co/image/ab6761610000e5ebc5f2f35ad84305911252a703	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
73d750c9-1325-4f82-a903-452a259bd104	Hương Ly	artist:673af119-843a-493d-8e24-208391b1f866		https://i.scdn.co/image/ab6761610000e5eb70bdf5ee4faf43c480e5b3c9	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
a1f9ba24-f29c-49ed-9f45-2dc5aa066d6b	Raditori	artist:58057f5b-6a31-4d15-8f7e-38f2f4216ffa		https://i.scdn.co/image/ab67616d0000b2731f3fdd8024fe3a1c19814b12	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
afd78a23-4d64-4cbe-882a-c0c7d49513e7	Minh Tốc & Lam	artist:897947c2-2b42-4de6-a93a-5e4f50ed928a		https://i.scdn.co/image/ab6761610000e5eb198fa3549f92cb09872922ea	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
a5fe3b87-c1f4-4c93-9b73-f7d3e9fe024a	THEMÈO	artist:ff32b519-63b7-4a07-93df-16af9cecfcfc		https://i.scdn.co/image/ab6761610000e5eb9962d296313eaffc830a9923	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
7cdbf480-eb0b-4e68-95d1-6579ddc4b592	Quai Vat Ti Hon	artist:4e31b485-3bd2-4a17-afc2-bc44f6d5d686		https://i.scdn.co/image/ab67616d0000b27398836498d600c7edfd662821	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
ca4963d7-9e42-4eba-99ab-e7a89c2deaaf	Myra Trần	artist:c972b1c4-13cc-4d82-8255-dd121e1eeb8b		https://i.scdn.co/image/ab6761610000e5eba860c38d434ffdb9630544f2	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
1f828892-a2b9-47c2-823c-d17611042790	Hà Nhi	artist:4a98cb6d-9e64-4a25-a255-28abd4925e91		https://i.scdn.co/image/ab6761610000e5eb10e24b509ad2113c6ff9eed9	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
e9ab1a13-089f-4784-97db-e168b9b997b9	Phan Mạnh Quỳnh	artist:9c670b05-18a0-469e-9118-54083881fa70		https://i.scdn.co/image/ab6761610000e5ebf3ac22c53b34150b407c3410	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
c1a5ce60-c317-49fb-923d-0b45a66ecc95	Mỹ Tâm	artist:16eeff8e-484d-4651-b7e9-d7e7c9ed2310		https://i.scdn.co/image/ab6761610000e5eb5d4a6001ce67c78aa3873c6a	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
fbc4feeb-8473-416a-b0a2-49263ba42fc2	Tăng Phúc	artist:2c5c12c9-7df8-42f4-bf23-8b6d824c5fb7		https://i.scdn.co/image/ab6761610000e5ebdafaa833e1027a6791342e33	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
19d21b11-8030-40af-bc6e-22cbed38a063	Hoài Lâm	artist:63cf9e7a-b57d-4229-8125-33adac9a8bc4		https://i.scdn.co/image/ab6761610000e5eb795f9f9f5f28dfd90a473754	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
e51ca428-95d2-4d53-bc12-2c5866e559ae	Anh Khoa	artist:3616be09-b355-4c4a-a46c-e0136fab4fce		https://i.scdn.co/image/ab67616d0000b27367293f2840ed53cb0e38a384	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
4080b5c7-db45-4f54-9a4d-f791d22c4ad3	An Vũ	artist:d7d0d876-1746-4449-8379-36fbe60fdba5		https://i.scdn.co/image/ab6761610000e5eb10960fba0227590ef82a7a2a	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
2e81364a-971b-4474-8b3d-0103bbba1058	Lê Thiện Hiếu	artist:8f40a566-7313-42a0-ab29-339492a64907		https://i.scdn.co/image/ab6761610000e5eb8f6dc73534caa985ba551736	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
32cbfe1f-e5f6-4e47-af83-f92b301c4a40	Đức Trường	artist:d9dac4c2-d79a-439f-a407-d7e2418b6a01		https://i.scdn.co/image/ab6761610000e5ebadc1203b02d47881dd3c543a	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
3f826efa-f80e-4cca-8735-ea2549f1161a	Huyền Tâm Môn	artist:72112de6-6741-4aa0-9f69-6dffd253d6eb		https://i.scdn.co/image/ab6761610000e5eb30362170c3eb27d23f7fb329	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
35ec121a-3bc8-4bcb-a2da-e8cd9c6f813e	Southalid	artist:d84e7687-3bc8-4637-ba6f-c14825a39462		https://i.scdn.co/image/ab6761610000e5eb2d4647e2a62ff129652da563	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
95c87dea-4184-4c48-9766-12eb81800725	TGSN	artist:52d83e7e-ac6f-48d9-8ab8-fc130d7c0e4a		https://i.scdn.co/image/ab6761610000e5eb93c2882a77ede2e43aa3868f	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
6b8b2bc6-57fe-4150-9efe-e3d5b097c88f	kidsai	artist:6af507a2-8a7c-444b-b71d-e2894877d7c8		https://i.scdn.co/image/ab6761610000e5eb08441ac62a53701439a72214	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
c591f685-f4bd-4d7f-bcf9-c2ebcc41bdff	My Anh	artist:7c0601f2-f878-47f1-81a8-bb4c6ed97ee4		https://i.scdn.co/image/ab6761610000e5ebd367d123642c3b2bf217afae	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
09122c6b-53a8-4c5a-acdc-49ee2428460b	Winno	artist:f030ab2f-0228-4a80-a0f6-cf745dec94ef		https://i.scdn.co/image/ab6761610000e5eb308d5fe18bb94b6dbef17256	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
0b6a7f3a-76e0-4215-abad-7c9c939758b9	Cody Uni5	artist:4ccd5f88-2577-493b-a5f5-e040e19f0ddc		https://i.scdn.co/image/ab67616d0000b27330f53020d330ba5c136b411e	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
5f17a829-8e33-4fbc-b63e-8b501ded845c	Tùng Maru	artist:47f132ff-5c06-41d3-8c25-f524a704309e		https://i.scdn.co/image/ab6761610000e5eb00631973ac91414fd96fec05	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
caa8edd3-0f48-4092-b126-a3980660ee6b	Hannie	artist:56c4b530-5652-4310-9992-7772ce946ee2		https://i.scdn.co/image/ab67616d0000b2739a7a2f0b89e6ddf9d30bf749	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
dd48dff1-be60-4d53-9e9e-989a3d534258	Luna	artist:ba4c4101-d4c8-413c-9ea6-91cd9d3039d6		https://i.scdn.co/image/ab67616d0000b27326c9eb12f778a26aa51cb47e	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
91ba9b0a-392e-4467-a0c4-dfd5f970ea4b	Quinn	artist:fe66efbd-1036-4d7c-9d78-d77ed2ef2ee5		https://i.scdn.co/image/ab6761610000e5eb7e1e772ca8733c790d562ed3	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
989ad55f-289b-4ede-92a2-1f5bc56eaaac	MONO	artist:145668ec-d423-471b-9897-935a541c61e8		https://i.scdn.co/image/ab6761610000e5eb08b7a0d0eb811827b0af36e1	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
ffd9e0cd-f29a-43e1-9cba-34f48146c63a	HIEUTHUHAI	artist:5368b093-620c-4047-bf42-d8877db146f1		https://i.scdn.co/image/ab6761610000e5ebe1cbc9e7ba8fbc5d7738ea51	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
f77c8e7a-f13f-473c-bd91-1b72af16adb2	RAP VIỆT	artist:c079c9f8-a70a-4f2e-a967-e1d8e750db0b		https://i.scdn.co/image/ab6761610000e5ebeebd6e77e92be554a077fba7	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
d404fc77-3e10-4aff-8086-d227e9d27147	Mr.Siro	artist:1f687043-2864-47f5-82ea-e52613bb6c87		https://i.scdn.co/image/ab6761610000e5eb4371fb198b011bb666a3bfde	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
e5c8e3a5-aec6-454d-ac0c-c24885a40ba7	Ngọc Dolil	artist:717fec90-127f-45bc-8a0e-af547a394c28		https://i.scdn.co/image/ab6761610000e5eb5c8390033da4f8e9e9fc746f	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
9b3e463e-3f87-4a47-b2dc-2d87ea441fa0	W/N	artist:657ba02e-667a-4e2d-b462-7e874e1cc388		https://i.scdn.co/image/ab6761610000e5eb316c0f0bc6cf3a29c203ab1e	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
8a77e5a6-8b53-4a30-8eef-417f4654d3f3	Khắc Hưng	artist:90070d47-11e8-4853-8349-86cf8d89a3ed		https://i.scdn.co/image/ab6761610000e5eb37e01567a89005eb0feb38d2	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
f237b95b-b2ff-4ec7-b4e3-9ad2011a75f6	PHÚC	artist:05915ffc-ada3-43bd-aeef-81bc95825a00		https://i.scdn.co/image/ab6761610000e5eb2afde6ca5639d0dd36f3ef41	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
42d4ad61-0e24-4244-a64d-75ecf5be3e77	CoolKid	artist:22e9bc3c-0b0b-4204-807f-3519e686ba63		https://i.scdn.co/image/ab6761610000e5eb4701f6bdeeded194cf20376e	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
ced9e439-8f26-4fd8-bf90-c3e2ea2c40a2	itsnk	artist:a2a380a2-7316-4bdc-b8ca-eaed17f3b808		https://i.scdn.co/image/ab6761610000e5eb215ae0e47da5791516c7aaff	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
c886f2ec-34b4-4b49-8cc4-4fdc17768739	dubbie	artist:c395c147-c5ec-456d-bf82-0274b23dff10		https://i.scdn.co/image/ab67616d0000b27326e49dc3fb51f27972db5c2c	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
61a92ea9-951c-4505-a73b-f22b0faefe71	RHYDER	artist:7bcaa399-5d6a-4070-b286-14cfd49600b3		https://i.scdn.co/image/ab6761610000e5eb7930fac4aae6d581d9f49e1b	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
83431fba-304c-400b-8f55-a0c2d5a38e97	ICM	artist:24292a12-e17d-4f31-8c64-e51dc57698c6		https://i.scdn.co/image/ab6761610000e5eb65eaa6be40f84e6182d69383	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
a746e4f0-41ec-4978-8f32-38c9e3327649	Puppy	artist:4d083492-31be-4612-9da3-fe7ccb5d4dd9		https://i.scdn.co/image/ab6761610000e5eb12b2ad3bacec1ca71265fba9	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
b5d3ad7b-949a-4f00-9622-2344548a965a	TINLE	artist:40fe3e60-888d-419b-ace9-50aaf00ecb29		https://i.scdn.co/image/ab6761610000e5ebbabf6021b5c856cac35d5d75	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
23f90eb6-9e67-40e9-bbea-b8d8ae4bcd1a	DT Tập Rap	artist:a415394a-5512-49dd-8090-68304049737c		https://i.scdn.co/image/ab6761610000e5eb59395cb9c275f4766c8b4942	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
f45a96ac-808f-4493-a64b-ac700d00543a	Vũ Phụng Tiên	artist:4196a918-93ca-487c-a9f2-05e4e67ac4a4		https://i.scdn.co/image/ab6761610000e5ebc5db34d157c879b2e627303c	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
a00ddc6a-8f68-486f-9450-6ad7427a260a	Gonzo	artist:a5ee79b5-9f33-44c7-9092-0eaceb57c5cf		https://i.scdn.co/image/ab6761610000e5eb2146b7722363c9a2e9d11113	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
88a65d77-8dd7-4e8a-a862-d91725e5dae5	HURRYKNG	artist:c748260c-c83e-4b09-b8dc-57e35450e2c6		https://i.scdn.co/image/ab6761610000e5eba4d09d3f8fdffcbca0a581f2	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
84861f42-4144-4a2b-9fd1-26a50b874ec4	Drum7	artist:694d2b15-2d7c-40a7-bb4b-2dbf8b87065e		https://i.scdn.co/image/ab6761610000e5eb3726249f70081314b2a42654	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
f6f44549-9d5d-4939-9ed8-dab0fa9e05ae	Huỳnh Văn	artist:d6211326-ce41-425d-b8dd-455c0915e7fd		https://i.scdn.co/image/ab6761610000e5ebd740fae83296f353ae17452f	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
c4b72717-0319-4989-959e-cfc7a718cb07	Emily	artist:f9bc7a5d-b7ce-4ccf-a460-3d296c967ede		https://i.scdn.co/image/ab6761610000e5eb87e3e671d06e2d8af3bf16c0	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
46f1aca2-d5e4-40c4-8e58-3f168b9f771f	Sơn Tùng M-TP	artist:a6019fda-9d7e-44b7-8168-e6656471c200		https://i.scdn.co/image/ab6761610000e5eb51b32111f5bc456525313d89	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
55af38a1-2314-4815-a65c-1065114d03d7	Mr.A	artist:be2765ca-351d-4336-8a5f-686c00ca1248		https://i.scdn.co/image/ab6761610000e5ebeef9778c3af31091a4625a9e	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
a028547b-2110-49ff-81ff-696321ba6bdb	Mr. T	artist:e9a3d645-21e7-43f6-8cba-9c41648b83a8		https://i.scdn.co/image/ab6761610000e5ebec0a3c468e866451cd75c7d6	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
9752fc84-5146-4bbb-83f5-006f099f3f7a	NAOMI	artist:381da055-c898-4865-9435-60a8ad95b2c6		https://i.scdn.co/image/ab6761610000e5eb73502f1fa544cb818dcacd99	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
05260bfd-8cbd-426d-a2ca-ae2ea94ba1c7	Negav	artist:4481e867-83f8-4624-bbfd-7fbd1abfb574		https://i.scdn.co/image/ab6761610000e5eb1e08fed86b807a8553ee4911	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
7b0259df-3f07-4a2d-a7d9-a8afc762436f	Hoàng Thùy Linh	artist:7d3793d0-7347-4413-ae22-8278fd149b77		https://i.scdn.co/image/ab6761610000e5ebe7b7fa8d03a2e3b6a800bdb4	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
da6c654f-c250-4865-b996-3029577c1e99	WanBi Tuấn Anh	artist:10cab80c-4066-4686-9f16-5150ace49a6d		https://i.scdn.co/image/ab67616d0000b2735b3ae331a08e2d68efbe79e1	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
50104ab8-c6a7-4fcf-b4e8-9522860ef939	Pham Truong	artist:e7f6c4a1-e028-4fa9-9901-4df7894bbf88		https://i.scdn.co/image/ab67616d0000b27321f5bfafd1fc8fb54732ad33	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
924f85ea-3aa9-48d9-ac1f-44b913d7119e	Trương Thế Vinh	artist:b4ffc477-8441-4e41-9ec8-a9809dca72b7		https://i.scdn.co/image/ab67616d0000b2730e96dbfa97961513fcf37bd8	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
08f6d812-d4c7-4262-beb6-8bc296caf8f6	The Men	artist:12cad057-06b5-4122-8f14-70884ad8b6c3		https://i.scdn.co/image/ab6761610000e5eb84f1b35b8755a8dc7c2f83ff	artist	admin	admin	2023-12-28 08:30:23.798233+00	2023-12-28 08:30:23.798233+00
\.


--
-- Data for Name: track_suggestions; Type: TABLE DATA; Schema: public; Owner: beatbuddyapidb
--

COPY public.track_suggestions (id, thumb, title, url, released_date, description, tags, tmp_audio_code, audio_code, status, lyrics, created_by, updated_by, created_at, updated_at) FROM stdin;
3e77be4c-7be8-4cf2-ad95-75820d2fe68a	\N	Nơi Này Có Anh	https://youtu.be/FN7ALfpGxiI?si=leyOT0r4JbF9r1h_	\N		Sơn Tùng M-TP,	ytb_FN7ALfpGxiI	\N	pending	\N	moderator	moderator	2023-12-28 08:54:32.499846+00	2023-12-28 08:54:32.499846+00
\.


--
-- Data for Name: tracksuggestion_artist; Type: TABLE DATA; Schema: public; Owner: beatbuddyapidb
--

COPY public.tracksuggestion_artist (id, tracksugg_id, artist_id, is_active, created_by, updated_by, created_at, updated_at) FROM stdin;
1	3e77be4c-7be8-4cf2-ad95-75820d2fe68a	a6019fda-9d7e-44b7-8168-e6656471c200	t	moderator	moderator	2023-12-28 08:54:32.544816+00	2023-12-28 08:54:32.544816+00
\.


--
-- Name: audios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beatbuddyapidb
--

SELECT pg_catalog.setval('public.audios_id_seq', 2, true);


--
-- Name: tracksuggestion_artist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beatbuddyapidb
--

SELECT pg_catalog.setval('public.tracksuggestion_artist_id_seq', 1, true);


--
-- Name: artists artists_acc_id_key; Type: CONSTRAINT; Schema: public; Owner: beatbuddyapidb
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_acc_id_key UNIQUE (acc_id);


--
-- Name: artists artists_pkey; Type: CONSTRAINT; Schema: public; Owner: beatbuddyapidb
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (id);


--
-- Name: artists artists_ref_code_key; Type: CONSTRAINT; Schema: public; Owner: beatbuddyapidb
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_ref_code_key UNIQUE (ref_code);


--
-- Name: audios audios_code_key; Type: CONSTRAINT; Schema: public; Owner: beatbuddyapidb
--

ALTER TABLE ONLY public.audios
    ADD CONSTRAINT audios_code_key UNIQUE (code);


--
-- Name: audios audios_pkey; Type: CONSTRAINT; Schema: public; Owner: beatbuddyapidb
--

ALTER TABLE ONLY public.audios
    ADD CONSTRAINT audios_pkey PRIMARY KEY (id);


--
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: beatbuddyapidb
--

ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- Name: resources resources_pkey; Type: CONSTRAINT; Schema: public; Owner: beatbuddyapidb
--

ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_pkey PRIMARY KEY (id);


--
-- Name: resources resources_urn_key; Type: CONSTRAINT; Schema: public; Owner: beatbuddyapidb
--

ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_urn_key UNIQUE (urn);


--
-- Name: track_suggestions track_suggestions_pkey; Type: CONSTRAINT; Schema: public; Owner: beatbuddyapidb
--

ALTER TABLE ONLY public.track_suggestions
    ADD CONSTRAINT track_suggestions_pkey PRIMARY KEY (id);


--
-- Name: tracksuggestion_artist tracksuggestion_artist_pkey; Type: CONSTRAINT; Schema: public; Owner: beatbuddyapidb
--

ALTER TABLE ONLY public.tracksuggestion_artist
    ADD CONSTRAINT tracksuggestion_artist_pkey PRIMARY KEY (id);


--
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: beatbuddyapidb
--

CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);


--
-- PostgreSQL database dump complete
--

