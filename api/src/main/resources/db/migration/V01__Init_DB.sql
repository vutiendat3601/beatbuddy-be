CREATE EXTENSION IF NOT EXISTS unaccent;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Create table audios
CREATE TABLE IF NOT EXISTS audios(
    id serial8 PRIMARY KEY NOT NULL,
    code varchar(64) NOT NULL UNIQUE,
    orig_url varchar(255),
    "file" varchar(255) NOT NULL,
    hash_md5 varchar(255) NOT NULL,
    released_date date,
    created_by varchar(255),
    updated_by varchar(255),
    created_at timestamptz NOT NULL DEFAULT current_timestamp,
    updated_at timestamptz NOT NULL DEFAULT current_timestamp
);

-- Create table artists
CREATE TABLE IF NOT EXISTS artists(
    id uuid PRIMARY KEY NOT NULL,
    acc_id uuid UNIQUE,
    ref_code varchar(64) UNIQUE,
    nick_name varchar(255) NOT NULL,
    is_verified boolean,
    is_public boolean NOT NULL DEFAULT false,
    birth_date date,
    real_name varchar(255),
    "description" text,
    nationality char(2),
    bio text,
    avatar varchar(255),
    bg_img varchar(255),
    created_by varchar(255) NOT NULL,
    updated_by varchar(255) NOT NULL,
    created_at timestamptz NOT NULL DEFAULT current_timestamp,
    updated_at timestamptz NOT NULL DEFAULT current_timestamp
);

-- Create table suggest_tracks
CREATE TABLE IF NOT EXISTS track_suggestions(
    id uuid PRIMARY KEY NOT NULL,
    thumb varchar(255),
    title varchar(255) NOT NULL,
    "url" varchar(255) NOT NULL,
    released_date varchar(32),
    "description" text,
    tags varchar(255),
    tmp_audio_code varchar(64),
    audio_code varchar(64),
    "status" varchar(64) NOT NULL,
    lyrics varchar(255),
    created_by varchar(255),
    updated_by varchar(255),
    created_at timestamptz NOT NULL DEFAULT current_timestamp,
    updated_at timestamptz NOT NULL DEFAULT current_timestamp
);

-- Create table tracksuggestion_artist
CREATE TABLE IF NOT EXISTS tracksuggestion_artist(
    id serial8 PRIMARY KEY NOT NULL,
    tracksugg_id uuid NOT NULL,
    artist_id uuid NOT NULL,
    is_active boolean NOT NULL DEFAULT true,
    created_by varchar(255),
    updated_by varchar(255),
    created_at timestamptz NOT NULL DEFAULT current_timestamp,
    updated_at timestamptz NOT NULL DEFAULT current_timestamp
);

-- Create table resources
CREATE TABLE IF NOT EXISTS resources(
    id uuid PRIMARY KEY NOT NULL,
    "name" varchar(255) NOT NULL,
    urn varchar(512) UNIQUE NOT NULL,
    tags varchar(512),
    thumb varchar(255),
    "type" varchar(64) NOT NULL,
    created_by varchar(255),
    updated_by varchar(255),
    created_at timestamptz NOT NULL DEFAULT current_timestamp,
    updated_at timestamptz NOT NULL DEFAULT current_timestamp
);