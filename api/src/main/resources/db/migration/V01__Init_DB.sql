-- artists definition
-- Drop table
-- DROP TABLE artists;
CREATE TABLE artists (
	id uuid NOT NULL PRIMARY KEY,
	acc_id uuid UNIQUE,
	ref_code varchar(64) UNIQUE,
	"name" varchar(255) NOT NULL,
	is_verified bool,
	is_public bool NOT NULL DEFAULT false,
	real_name varchar(255),
	birth_date date,
	"description" text,
	nationality bpchar(2),
	bio text,
	thumb_img varchar(255),
	bg_img varchar(255),
	created_by varchar(255),
	updated_by varchar(255),
	created_at timestamptz NOT NULL DEFAULT current_timestamp,
	updated_at timestamptz NOT NULL DEFAULT current_timestamp
);


-- audio_track definition
-- Drop table
-- DROP TABLE audio_track;
CREATE TABLE audio_track (
	id bigserial NOT NULL PRIMARY KEY,
	audio_id uuid NOT NULL UNIQUE,
	track_id uuid NOT NULL,
	is_active bool NOT NULL DEFAULT true,
	created_by varchar(255),
	updated_by varchar(255),
	created_at timestamptz NOT NULL DEFAULT current_timestamp,
	updated_at timestamptz NOT NULL DEFAULT current_timestamp
);


-- audios definition
-- Drop table
-- DROP TABLE audios;
CREATE TABLE audios (
	id uuid NOT NULL PRIMARY KEY,
	ref_code varchar(64) NOT NULL UNIQUE,
	"url" varchar(255) NOT NULL,
	quality varchar(255) NOT NULL,
	created_by varchar(255),
	updated_by varchar(255),
	created_at timestamptz NOT NULL DEFAULT current_timestamp,
	updated_at timestamptz NOT NULL DEFAULT current_timestamp
);

-- searchs definition
-- Drop table
-- DROP TABLE searchs;
CREATE TABLE searchs (
	id uuid NOT NULL PRIMARY KEY,
	"name" varchar(255) NOT NULL,
	uri varchar(512) NOT NULL UNIQUE,
	tags text,
	"type" varchar(64) NOT NULL,
	"priority" bigint NOT NULL DEFAULT 0,
	created_by varchar(255),
	updated_by varchar(255),
	created_at timestamptz NOT NULL DEFAULT current_timestamp,
	updated_at timestamptz NOT NULL DEFAULT current_timestamp
);


-- track_artist definition
-- Drop table
-- DROP TABLE track_artist;
CREATE TABLE track_artist (
	id bigserial NOT NULL PRIMARY KEY,
	track_id uuid NOT NULL,
	artist_id uuid NOT NULL,
	is_active bool NOT NULL DEFAULT true,
	created_by varchar(255),
	updated_by varchar(255),
	created_at timestamptz NOT NULL DEFAULT current_timestamp,
	updated_at timestamptz NOT NULL DEFAULT current_timestamp
);


-- track_suggestions definition
-- Drop table
-- DROP TABLE track_suggestions;
CREATE TABLE track_suggestions (
	id uuid NOT NULL PRIMARY KEY,
	thumb_img varchar(255),
	"name" varchar(255) NOT NULL,
	"url" varchar(255) NOT NULL,
	released_date varchar(32),
	description text,
	lyrics varchar(255),
	tags varchar(255),
	track_id uuid,
	audio_ref_code varchar(64),
	status varchar(64) NOT NULL,
	created_by varchar(255),
	updated_by varchar(255),
	created_at timestamptz NOT NULL DEFAULT current_timestamp,
	updated_at timestamptz NOT NULL DEFAULT current_timestamp
);

-- tracks definition
-- Drop table
-- DROP TABLE tracks;
CREATE TABLE tracks (
	id uuid NOT NULL PRIMARY KEY,
	ref_code varchar(64) UNIQUE,
	"name" varchar(255) NOT NULL,
	is_public bool NOT NULL DEFAULT false,
	"description" text,
	released_date varchar(10),
	thumb_img varchar(255),
	tags varchar(255),
	duration_sec bigint,
	is_playable bool NOT NULL DEFAULT false,
	created_by varchar(255),
	updated_by varchar(255),
	created_at timestamptz NOT NULL DEFAULT current_timestamp,
	updated_at timestamptz NOT NULL DEFAULT current_timestamp
);


-- tracksuggestion_artist definition
-- Drop table
-- DROP TABLE tracksuggestion_artist;
CREATE TABLE tracksuggestion_artist (
	id bigserial NOT NULL PRIMARY KEY,
	tracksugg_id uuid NOT NULL,
	artist_id uuid NOT NULL,
	is_active bool NOT NULL DEFAULT true,
	created_by varchar(255),
	updated_by varchar(255),
	created_at timestamptz NOT NULL DEFAULT current_timestamp,
	updated_at timestamptz NOT NULL DEFAULT current_timestamp
);