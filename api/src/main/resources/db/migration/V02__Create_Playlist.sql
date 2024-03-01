-- playlists definition
-- Drop table
-- DROP TABLE playlists;
CREATE TABLE playlists (
	id uuid NOT NULL PRIMARY KEY,
	"name" varchar(255) NOT NULL,
    is_public boolean NOT NULL DEFAULT false,
    duration_sec bigint NOT NULL DEFAULT 0,
    "description" text,
    thumb_img varchar(255),
	created_by varchar(255),
	updated_by varchar(255),
	created_at timestamptz NOT NULL DEFAULT current_timestamp,
	updated_at timestamptz NOT NULL DEFAULT current_timestamp
);

CREATE TABLE playlist_track (
    id bigserial NOT NULL PRIMARY KEY,
	track_id uuid NOT NULL,
	playlist_id uuid NOT NULL,
	is_active bool NOT NULL DEFAULT true,
	created_by varchar(255),
	updated_by varchar(255),
	created_at timestamptz NOT NULL DEFAULT current_timestamp,
	updated_at timestamptz NOT NULL DEFAULT current_timestamp
);