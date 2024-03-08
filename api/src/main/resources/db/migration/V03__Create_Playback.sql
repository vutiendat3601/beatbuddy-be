CREATE TABLE playback_state (
	id uuid NOT NULL PRIMARY KEY,
	current_sec bigint NOT NULL DEFAULT 0,
    volume real NOT NULL DEFAULT 100,
    track_id uuid,
	created_by varchar(255),
	updated_by varchar(255),
	created_at timestamptz NOT NULL DEFAULT current_timestamp,
	updated_at timestamptz NOT NULL DEFAULT current_timestamp
);

CREATE TABLE queues (
	id uuid NOT NULL PRIMARY KEY,
	played_track_ids text NOT NULL DEFAULT 0,
    waiting_track_ids text NOT NULL DEFAULT 100,
    orig_played_track_ids text NOT NULL,
    orig_waiting_track_ids text NOT NULL,
    repeat_mode varchar(255) NOT NULL,
    is_shuffled boolean NOT NULL DEFAULT false,
	created_by varchar(255),
	updated_by varchar(255),
	created_at timestamptz NOT NULL DEFAULT current_timestamp,
	updated_at timestamptz NOT NULL DEFAULT current_timestamp
);

CREATE TABLE playbacks (
	id uuid NOT NULL PRIMARY KEY,
	state_id uuid NOT NULL,
    queue_id uuid NOT NULL,
	owner_id uuid NOT NULL,
	created_by varchar(255),
	updated_by varchar(255),
	created_at timestamptz NOT NULL DEFAULT current_timestamp,
	updated_at timestamptz NOT NULL DEFAULT current_timestamp
);