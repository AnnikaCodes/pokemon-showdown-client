--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2 (Ubuntu 12.2-4)
-- Dumped by pg_dump version 12.2 (Ubuntu 12.2-4)

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

--
-- Name: ntbb_userstatshistory_programid; Type: TYPE; Schema: public; Owner: ps
--

CREATE TYPE public.ntbb_userstatshistory_programid AS ENUM (
    'showdown',
    'po'
);


ALTER TYPE public.ntbb_userstatshistory_programid OWNER TO ps;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: friendlist; Type: TABLE; Schema: public; Owner: ps
--

CREATE TABLE public.friendlist (
    p1 character varying(255) NOT NULL,
    p2 character varying(255) NOT NULL,
    accepted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.friendlist OWNER TO ps;

--
-- Name: ladder; Type: TABLE; Schema: public; Owner: ps
--

CREATE TABLE public.ladder (
    entryid bigint NOT NULL,
    formatid character varying(63) NOT NULL,
    userid character varying(63) NOT NULL,
    username character varying(63) NOT NULL,
    w bigint DEFAULT '0'::bigint NOT NULL,
    l bigint DEFAULT '0'::bigint NOT NULL,
    t bigint DEFAULT '0'::bigint NOT NULL,
    gxe double precision DEFAULT '0'::double precision NOT NULL,
    r double precision DEFAULT '1500'::double precision NOT NULL,
    rd double precision DEFAULT '350'::double precision NOT NULL,
    sigma double precision DEFAULT '0.06'::double precision NOT NULL,
    rptime timestamp(6) with time zone NOT NULL,
    rpr double precision DEFAULT '1500'::double precision NOT NULL,
    rprd double precision DEFAULT '350'::double precision NOT NULL,
    rpsigma double precision DEFAULT '0.06'::double precision NOT NULL,
    rpdata text NOT NULL,
    elo double precision DEFAULT '1000'::double precision NOT NULL,
    col1 double precision NOT NULL
);


ALTER TABLE public.ladder OWNER TO ps;

--
-- Name: ladder_entryid_seq; Type: SEQUENCE; Schema: public; Owner: ps
--

CREATE SEQUENCE public.ladder_entryid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ladder_entryid_seq OWNER TO ps;

--
-- Name: ladder_entryid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ps
--

ALTER SEQUENCE public.ladder_entryid_seq OWNED BY public.ladder.entryid;


--
-- Name: loginthrottle; Type: TABLE; Schema: public; Owner: ps
--

CREATE TABLE public.loginthrottle (
    ip character varying(63) NOT NULL,
    count bigint NOT NULL,
    lastuserid character varying(63) NOT NULL,
    "time" timestamp(6) with time zone NOT NULL
);


ALTER TABLE public.loginthrottle OWNER TO ps;

--
-- Name: prepreplays; Type: TABLE; Schema: public; Owner: ps
--

CREATE TABLE public.prepreplays (
    id text DEFAULT ''::text NOT NULL,
    p1 character varying(45) DEFAULT ''::character varying NOT NULL,
    p2 character varying(45) NOT NULL,
    format character varying(45) NOT NULL,
    private smallint NOT NULL,
    loghash text NOT NULL,
    inputlog text,
    rating bigint DEFAULT '0'::bigint NOT NULL,
    uploadtime timestamp(6) with time zone DEFAULT '1970-01-01 00:00:00+00'::timestamp with time zone NOT NULL
);


ALTER TABLE public.prepreplays OWNER TO ps;

--
-- Name: replays; Type: TABLE; Schema: public; Owner: ps
--

CREATE TABLE public.replays (
    id text DEFAULT ''::text NOT NULL,
    p1 character varying(45) NOT NULL,
    p2 character varying(45) NOT NULL,
    format character varying(45) NOT NULL,
    log text NOT NULL,
    inputlog text,
    uploadtime timestamp(6) with time zone NOT NULL,
    views bigint DEFAULT '0'::bigint NOT NULL,
    p1id text NOT NULL,
    p2id text NOT NULL,
    formatid text NOT NULL,
    rating bigint DEFAULT '0'::bigint NOT NULL,
    private smallint NOT NULL,
    password character varying(31)
);


ALTER TABLE public.replays OWNER TO ps;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: ps
--

CREATE TABLE public.sessions (
    session bigint NOT NULL,
    sid character varying(255) NOT NULL,
    userid character varying(255) NOT NULL,
    "time" timestamp(6) with time zone NOT NULL,
    timeout timestamp(6) with time zone NOT NULL,
    ip inet NOT NULL
);


ALTER TABLE public.sessions OWNER TO ps;

--
-- Name: sessions_session_seq; Type: SEQUENCE; Schema: public; Owner: ps
--

CREATE SEQUENCE public.sessions_session_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessions_session_seq OWNER TO ps;

--
-- Name: sessions_session_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ps
--

ALTER SEQUENCE public.sessions_session_seq OWNED BY public.sessions.session;


--
-- Name: usermodlog; Type: TABLE; Schema: public; Owner: ps
--

CREATE TABLE public.usermodlog (
    entryid bigint NOT NULL,
    userid character varying(63) NOT NULL,
    actorid character varying(63) NOT NULL,
    date timestamp(6) with time zone NOT NULL,
    ip inet NOT NULL,
    entry character varying(1023) NOT NULL
);


ALTER TABLE public.usermodlog OWNER TO ps;

--
-- Name: usermodlog_entryid_seq; Type: SEQUENCE; Schema: public; Owner: ps
--

CREATE SEQUENCE public.usermodlog_entryid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usermodlog_entryid_seq OWNER TO ps;

--
-- Name: usermodlog_entryid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ps
--

ALTER SEQUENCE public.usermodlog_entryid_seq OWNED BY public.usermodlog.entryid;


--
-- Name: users; Type: TABLE; Schema: public; Owner: ps
--

CREATE TABLE public.users (
    userid text NOT NULL,
    usernum bigint NOT NULL,
    username text NOT NULL,
    password text,
    nonce text,
    passwordhash text,
    email text,
    registertime timestamp(6) with time zone NOT NULL,
    "group" bigint DEFAULT '1'::bigint NOT NULL,
    banstate bigint DEFAULT '0'::bigint NOT NULL,
    ip inet NOT NULL,
    avatar bigint DEFAULT '0'::bigint NOT NULL,
    account text,
    logintime timestamp(6) with time zone DEFAULT '1970-01-01 00:00:00+00'::timestamp with time zone NOT NULL,
    loginip inet
);


ALTER TABLE public.users OWNER TO ps;

--
-- Name: users_usernum_seq; Type: SEQUENCE; Schema: public; Owner: ps
--

CREATE SEQUENCE public.users_usernum_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_usernum_seq OWNER TO ps;

--
-- Name: users_usernum_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ps
--

ALTER SEQUENCE public.users_usernum_seq OWNED BY public.users.usernum;


--
-- Name: userstats; Type: TABLE; Schema: public; Owner: ps
--

CREATE TABLE public.userstats (
    id bigint NOT NULL,
    serverid character varying(255) NOT NULL,
    date timestamp(6) with time zone NOT NULL,
    usercount bigint NOT NULL
);


ALTER TABLE public.userstats OWNER TO ps;

--
-- Name: userstats_id_seq; Type: SEQUENCE; Schema: public; Owner: ps
--

CREATE SEQUENCE public.userstats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userstats_id_seq OWNER TO ps;

--
-- Name: userstats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ps
--

ALTER SEQUENCE public.userstats_id_seq OWNED BY public.userstats.id;


--
-- Name: userstatshistory; Type: TABLE; Schema: public; Owner: ps
--

CREATE TABLE public.userstatshistory (
    id bigint NOT NULL,
    date timestamp(6) with time zone NOT NULL,
    usercount bigint NOT NULL,
    programid public.ntbb_userstatshistory_programid DEFAULT 'showdown'::public.ntbb_userstatshistory_programid NOT NULL
);


ALTER TABLE public.userstatshistory OWNER TO ps;

--
-- Name: userstatshistory_id_seq; Type: SEQUENCE; Schema: public; Owner: ps
--

CREATE SEQUENCE public.userstatshistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userstatshistory_id_seq OWNER TO ps;

--
-- Name: userstatshistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ps
--

ALTER SEQUENCE public.userstatshistory_id_seq OWNED BY public.userstatshistory.id;


--
-- Name: ladder entryid; Type: DEFAULT; Schema: public; Owner: ps
--

ALTER TABLE ONLY public.ladder ALTER COLUMN entryid SET DEFAULT nextval('public.ladder_entryid_seq'::regclass);


--
-- Name: sessions session; Type: DEFAULT; Schema: public; Owner: ps
--

ALTER TABLE ONLY public.sessions ALTER COLUMN session SET DEFAULT nextval('public.sessions_session_seq'::regclass);


--
-- Name: usermodlog entryid; Type: DEFAULT; Schema: public; Owner: ps
--

ALTER TABLE ONLY public.usermodlog ALTER COLUMN entryid SET DEFAULT nextval('public.usermodlog_entryid_seq'::regclass);


--
-- Name: users usernum; Type: DEFAULT; Schema: public; Owner: ps
--

ALTER TABLE ONLY public.users ALTER COLUMN usernum SET DEFAULT nextval('public.users_usernum_seq'::regclass);


--
-- Name: userstats id; Type: DEFAULT; Schema: public; Owner: ps
--

ALTER TABLE ONLY public.userstats ALTER COLUMN id SET DEFAULT nextval('public.userstats_id_seq'::regclass);


--
-- Name: userstatshistory id; Type: DEFAULT; Schema: public; Owner: ps
--

ALTER TABLE ONLY public.userstatshistory ALTER COLUMN id SET DEFAULT nextval('public.userstatshistory_id_seq'::regclass);


--
-- Name: friendlist idx_24073_primary; Type: CONSTRAINT; Schema: public; Owner: ps
--

ALTER TABLE ONLY public.friendlist
    ADD CONSTRAINT idx_24073_primary PRIMARY KEY (p1, p2);


--
-- Name: ladder idx_24082_primary; Type: CONSTRAINT; Schema: public; Owner: ps
--

ALTER TABLE ONLY public.ladder
    ADD CONSTRAINT idx_24082_primary PRIMARY KEY (entryid);


--
-- Name: loginthrottle idx_24100_primary; Type: CONSTRAINT; Schema: public; Owner: ps
--

ALTER TABLE ONLY public.loginthrottle
    ADD CONSTRAINT idx_24100_primary PRIMARY KEY (ip);


--
-- Name: sessions idx_24105_primary; Type: CONSTRAINT; Schema: public; Owner: ps
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT idx_24105_primary PRIMARY KEY (session);


--
-- Name: usermodlog idx_24114_primary; Type: CONSTRAINT; Schema: public; Owner: ps
--

ALTER TABLE ONLY public.usermodlog
    ADD CONSTRAINT idx_24114_primary PRIMARY KEY (entryid);


--
-- Name: users idx_24123_primary; Type: CONSTRAINT; Schema: public; Owner: ps
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT idx_24123_primary PRIMARY KEY (userid);


--
-- Name: userstats idx_24136_primary; Type: CONSTRAINT; Schema: public; Owner: ps
--

ALTER TABLE ONLY public.userstats
    ADD CONSTRAINT idx_24136_primary PRIMARY KEY (id);


--
-- Name: userstatshistory idx_24142_primary; Type: CONSTRAINT; Schema: public; Owner: ps
--

ALTER TABLE ONLY public.userstatshistory
    ADD CONSTRAINT idx_24142_primary PRIMARY KEY (id);


--
-- Name: prepreplays idx_24147_primary; Type: CONSTRAINT; Schema: public; Owner: ps
--

ALTER TABLE ONLY public.prepreplays
    ADD CONSTRAINT idx_24147_primary PRIMARY KEY (id);


--
-- Name: replays idx_24157_primary; Type: CONSTRAINT; Schema: public; Owner: ps
--

ALTER TABLE ONLY public.replays
    ADD CONSTRAINT idx_24157_primary PRIMARY KEY (id);


--
-- Name: idx_24082_formattoplist; Type: INDEX; Schema: public; Owner: ps
--

CREATE INDEX idx_24082_formattoplist ON public.ladder USING btree (formatid, elo);


--
-- Name: idx_24082_userformats; Type: INDEX; Schema: public; Owner: ps
--

CREATE UNIQUE INDEX idx_24082_userformats ON public.ladder USING btree (userid, formatid);


--
-- Name: idx_24100_count; Type: INDEX; Schema: public; Owner: ps
--

CREATE INDEX idx_24100_count ON public.loginthrottle USING btree (count);


--
-- Name: idx_24100_time; Type: INDEX; Schema: public; Owner: ps
--

CREATE INDEX idx_24100_time ON public.loginthrottle USING btree ("time");


--
-- Name: idx_24105_sid; Type: INDEX; Schema: public; Owner: ps
--

CREATE INDEX idx_24105_sid ON public.sessions USING btree (sid);


--
-- Name: idx_24105_timeout; Type: INDEX; Schema: public; Owner: ps
--

CREATE INDEX idx_24105_timeout ON public.sessions USING btree (timeout);


--
-- Name: idx_24105_userid; Type: INDEX; Schema: public; Owner: ps
--

CREATE INDEX idx_24105_userid ON public.sessions USING btree (userid);


--
-- Name: idx_24114_actorid; Type: INDEX; Schema: public; Owner: ps
--

CREATE INDEX idx_24114_actorid ON public.usermodlog USING btree (actorid);


--
-- Name: idx_24114_ip; Type: INDEX; Schema: public; Owner: ps
--

CREATE INDEX idx_24114_ip ON public.usermodlog USING btree (ip);


--
-- Name: idx_24114_userid; Type: INDEX; Schema: public; Owner: ps
--

CREATE INDEX idx_24114_userid ON public.usermodlog USING btree (userid);


--
-- Name: idx_24123_account; Type: INDEX; Schema: public; Owner: ps
--

CREATE INDEX idx_24123_account ON public.users USING btree (account);


--
-- Name: idx_24123_ip; Type: INDEX; Schema: public; Owner: ps
--

CREATE INDEX idx_24123_ip ON public.users USING btree (ip);


--
-- Name: idx_24123_loginip; Type: INDEX; Schema: public; Owner: ps
--

CREATE INDEX idx_24123_loginip ON public.users USING btree (loginip);


--
-- Name: idx_24123_usernum; Type: INDEX; Schema: public; Owner: ps
--

CREATE UNIQUE INDEX idx_24123_usernum ON public.users USING btree (usernum);


--
-- Name: idx_24136_date; Type: INDEX; Schema: public; Owner: ps
--

CREATE INDEX idx_24136_date ON public.userstats USING btree (date);


--
-- Name: idx_24142_date; Type: INDEX; Schema: public; Owner: ps
--

CREATE INDEX idx_24142_date ON public.userstatshistory USING btree (date);


--
-- Name: idx_24142_maxusers; Type: INDEX; Schema: public; Owner: ps
--

CREATE INDEX idx_24142_maxusers ON public.userstatshistory USING btree (programid, usercount);


--
-- Name: idx_24142_programid; Type: INDEX; Schema: public; Owner: ps
--

CREATE INDEX idx_24142_programid ON public.userstatshistory USING btree (programid);


--
-- Name: idx_24142_usercount; Type: INDEX; Schema: public; Owner: ps
--

CREATE INDEX idx_24142_usercount ON public.userstatshistory USING btree (usercount);


--
-- Name: idx_24157_format; Type: INDEX; Schema: public; Owner: ps
--

CREATE INDEX idx_24157_format ON public.replays USING btree (private, formatid, uploadtime);


--
-- Name: idx_24157_p1; Type: INDEX; Schema: public; Owner: ps
--

CREATE INDEX idx_24157_p1 ON public.replays USING btree (private, p1id, uploadtime);


--
-- Name: idx_24157_p2; Type: INDEX; Schema: public; Owner: ps
--

CREATE INDEX idx_24157_p2 ON public.replays USING btree (private, p2id, uploadtime);


--
-- Name: idx_24157_recent; Type: INDEX; Schema: public; Owner: ps
--

CREATE INDEX idx_24157_recent ON public.replays USING btree (private, uploadtime);


--
-- Name: idx_24157_top; Type: INDEX; Schema: public; Owner: ps
--

CREATE INDEX idx_24157_top ON public.replays USING btree (private, formatid, rating);


--
-- PostgreSQL database dump complete
--

