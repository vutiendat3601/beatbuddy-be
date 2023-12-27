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
ALTER TABLE ONLY public.tracksuggestion_artist DROP CONSTRAINT suggesttrack_artist_pkey;
ALTER TABLE ONLY public.track_suggestions DROP CONSTRAINT suggest_tracks_pkey;
ALTER TABLE ONLY public.resources DROP CONSTRAINT resources_urn_key;
ALTER TABLE ONLY public.resources DROP CONSTRAINT resources_pkey;
ALTER TABLE ONLY public.flyway_schema_history DROP CONSTRAINT flyway_schema_history_pk;
ALTER TABLE ONLY public.audios DROP CONSTRAINT audios_pkey;
ALTER TABLE ONLY public.audios DROP CONSTRAINT audios_code_key;
ALTER TABLE ONLY public.artists DROP CONSTRAINT artists_pkey;
ALTER TABLE ONLY public.artists DROP CONSTRAINT artists_acc_id_key;
ALTER TABLE public.tracksuggestion_artist ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.audios ALTER COLUMN id DROP DEFAULT;
DROP TABLE public.track_suggestions;
DROP SEQUENCE public.suggesttrack_artist_id_seq;
DROP TABLE public.tracksuggestion_artist;
DROP TABLE public.resources;
DROP TABLE public.flyway_schema_history;
DROP SEQUENCE public.audios_id_seq;
DROP TABLE public.audios;
DROP TABLE public.artists;
DROP EXTENSION "uuid-ossp";
DROP EXTENSION unaccent;
-- *not* dropping schema, since initdb creates it
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: beatbuddy
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO beatbuddy;

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
-- Name: artists; Type: TABLE; Schema: public; Owner: beatbuddy
--

CREATE TABLE public.artists (
    id uuid NOT NULL,
    acc_id uuid,
    real_name character varying(255),
    nick_name character varying(255) NOT NULL,
    birth_date date,
    description text,
    bio text,
    is_verified boolean NOT NULL,
    is_public boolean NOT NULL,
    nationality character(2) NOT NULL,
    avatar character varying(255),
    bg_img character varying(255),
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.artists OWNER TO beatbuddy;

--
-- Name: audios; Type: TABLE; Schema: public; Owner: beatbuddy
--

CREATE TABLE public.audios (
    id bigint NOT NULL,
    code character varying(64) NOT NULL,
    orig_url character varying(255),
    file character varying(255) NOT NULL,
    hash_md5 character varying(255),
    released_date character varying(32),
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.audios OWNER TO beatbuddy;

--
-- Name: audios_id_seq; Type: SEQUENCE; Schema: public; Owner: beatbuddy
--

CREATE SEQUENCE public.audios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.audios_id_seq OWNER TO beatbuddy;

--
-- Name: audios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beatbuddy
--

ALTER SEQUENCE public.audios_id_seq OWNED BY public.audios.id;


--
-- Name: flyway_schema_history; Type: TABLE; Schema: public; Owner: beatbuddy
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


ALTER TABLE public.flyway_schema_history OWNER TO beatbuddy;

--
-- Name: resources; Type: TABLE; Schema: public; Owner: beatbuddy
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


ALTER TABLE public.resources OWNER TO beatbuddy;

--
-- Name: tracksuggestion_artist; Type: TABLE; Schema: public; Owner: beatbuddy
--

CREATE TABLE public.tracksuggestion_artist (
    id bigint NOT NULL,
    tracksugg_id uuid NOT NULL,
    artist_id uuid NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


ALTER TABLE public.tracksuggestion_artist OWNER TO beatbuddy;

--
-- Name: suggesttrack_artist_id_seq; Type: SEQUENCE; Schema: public; Owner: beatbuddy
--

CREATE SEQUENCE public.suggesttrack_artist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.suggesttrack_artist_id_seq OWNER TO beatbuddy;

--
-- Name: suggesttrack_artist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beatbuddy
--

ALTER SEQUENCE public.suggesttrack_artist_id_seq OWNED BY public.tracksuggestion_artist.id;


--
-- Name: track_suggestions; Type: TABLE; Schema: public; Owner: beatbuddy
--

CREATE TABLE public.track_suggestions (
    id uuid NOT NULL,
    thumb character varying(255),
    title character varying(255) NOT NULL,
    url character varying(255) NOT NULL,
    released_date character varying(32),
    description text,
    tmp_audio_code character varying(64),
    audio_code character varying(64),
    status character varying(64),
    lyrics character varying(255),
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    tags character varying(255)
);


ALTER TABLE public.track_suggestions OWNER TO beatbuddy;

--
-- Name: audios id; Type: DEFAULT; Schema: public; Owner: beatbuddy
--

ALTER TABLE ONLY public.audios ALTER COLUMN id SET DEFAULT nextval('public.audios_id_seq'::regclass);


--
-- Name: tracksuggestion_artist id; Type: DEFAULT; Schema: public; Owner: beatbuddy
--

ALTER TABLE ONLY public.tracksuggestion_artist ALTER COLUMN id SET DEFAULT nextval('public.suggesttrack_artist_id_seq'::regclass);


--
-- Data for Name: artists; Type: TABLE DATA; Schema: public; Owner: beatbuddy
--

COPY public.artists (id, acc_id, real_name, nick_name, birth_date, description, bio, is_verified, is_public, nationality, avatar, bg_img, created_by, updated_by, created_at, updated_at) FROM stdin;
0499178f-93b5-492c-9443-41861bd3c15e	\N	Nguyễn Thanh Tuấn	JustaTee	1991-11-01		Là thành viên cũ của Click Click Boom, đang là thành viên trong Joker's Rule và LadyKillah Proz\nKhả năng: Composer, singer, mixer, beatzmaker\nKinh nghiệm : Sáng tác và hát hơn 5 năm\nChất giọng: Smooth\nThể loại: R'nB everystyle\nHiện đang là Music Producer của LadyKillah Proz - Nhóm các Rappers/Singers hàng đầu VN như Lil'Knight, Emily, Mr.T, Yanbi,Mr.A, Bueno, Phúc Bồ, TmT, Big Daddy.....\nChất giọng: Smooth\nThể loại : R&B/Hiphop\nPhong cách ăn mặc : Original\nLà 1 ca sỹ đi lên từ Underground với mức cảm nhạc khác người, họ nói anh là người đầu tiên mang đến định nghĩa thực về dòng nhạc R&B, khi mà trước đó chỉ là những bài hát Pop ngộ nhận, và đến bây giờ cũng chưa có nhiều người nhận thức đúng về dòng nhạc này\n\nTiểu sử :\nBắt đầu sáng tác từ năm 2004 với nick name JayTee, sau này được đổi thành JustaTee\n2005 - 2008 : Là Rapper/Singer/Music producer trong nhóm Click Click Boom - nhóm nhạc rap đa thành viên đầu tiên tại Việt Nam\n2008 : Bắt đầu đánh dấu sự nghiệp R&B\n2010 : Cùng Lil' Knight đồng sáng lập nên LadyKillah với sự điều hành của Mr.J ( Jan Saker ) làm nên website R&B/Hiphop lớn mạnh nhất hiện nay\n20/08/2010: Ra mắt mini album JUST-A-TEE đánh dấu tên tuổi mình trên nền nhạc R&B của nước nhà .\nCa khúc Sau tất cả, với sự góp giọng của JustaTee và BigDaddy đã trở thành bài hit đình đám trong thế giới nhạc Việt. Trong chương trình The Remix - Hòa âm ánh sáng 2016, cặp bài trùng này lại tiếp tục có màn phối hợp ăn ý trong ca khúc Về nhà ăn tết, ca khúc này đã trở thành bản hit trong những ngày đầu năm mới 2016. Trong năm 2016, cặp bài trùng này tiếp tục hợp tác trong single Dù anh có đứng lại, một ca khúc mạng đậm cá tính của cả hai giọng ca, khiến khán giả phát cuồng về sự mới lạ trong phong cách.\nNhững bài hát mang lại tên tuổi JustaTee : Người Lạ Nơi Cuối Đường, Imma HeartBreaker, K part 2, Không Tin 1 Sớm Mai Bình Yên REMIX, Call Me The Liar...	t	t	vn	image/ded746c67b273a869e0611ce0db3f717.jpg	\N	moderator	moderator	2023-12-21 22:35:29.923412+00	2023-12-21 22:35:29.924091+00
7091e078-be34-47f8-8fff-d2774f5c196c	\N	Nguyễn Đức Cường	Đen Vâu	1989-05-13		Năm 2014, anh ra mắt "Đưa Nhau Đi Trốn" cùng Linh Cáo. Bài hát nhanh chóng trở thành hit. Tiếp nối thành công, cả hai tiếp tục kết hợp trong "Ta cứ Đi Cùng Nhau".\nNăm 2018, Đen liên tiếp ra mắt các sản phẩm mới nhưng đến "Anh Đếch Cần Gì Nhiều Ngoài Em" thì Đen trở thành hiện tượng xã hội.\nNăm 2019 là một năm thành công cùa Đen với những bản hit nổi tiếng như "Mười Năm" (cùng Ngọc Linh) kỷ niệm hành trình 10 năm theo rap, "Bài Này Chill Phết" cùng Min, "Hai Triệu Năm" (cùng Biên), "Lối Nhỏ" (cùng Phương Anh Đào) và "Cảm Ơn" (cùng Biên). Liveshow đầu tiên của mang tên "Show của Đen" được tổ chức vào tháng 11.\nĐầu năm 2020, Đen Vâu ra mắt "Một Triệu Like" kết hợp với Thành Đồng.	t	t	vn	image/b8bac58c105e141aece4ecd35be01fa4.jpg	\N	moderator	moderator	2023-12-21 22:38:02.138891+00	2023-12-21 22:38:02.139103+00
5cd60495-5693-413a-9dbc-fa70459ac70a	\N	Hứa Kim Tuyền	Hứa Kim Tuyền	1995-01-08		- Top 5 team Giáng Son, chương trình Sing My Song mùa đầu tiên.\n- Là tác giả của các ca khúc như Hôm nay tôi cô đơn quá, Không ai hơn em đâu\nanh (Tóc Tiên), Một ngày hay trăm năm (Văn Mai Hương), Cứ yêu đi (Đức Phúc ft.\nHòa Minzy), Người ta có thương mình đâu (Trúc Nhân), Muốn (Miu Lê)…	t	t	vn	image/fd464c953f3708b0af1876d5d737280e.jpg	\N	moderator	moderator	2023-12-21 22:40:02.873102+00	2023-12-21 22:40:02.873616+00
8684cbe4-5c0d-4188-ba0b-290e2ff4e4eb	\N	Khương Hoàn Mỹ	Orange	1997-02-15		Là ca sĩ có chất giọng đầy nội lực cùng gu âm nhạc trẻ trung được đông đảo khán giả trẻ yêu thích sau ca khúc debut “Người Lạ Ơi”. Hiện Orange là một trong số nữ ca sĩ có khả năng sáng tác tốt thuộc thế hệ Gen Z nổi bật tại Việt Nam với loạt hot hit: Khi Em Lớn (ft Hoàng Dũng), Em Hát Ai Nghe do cô chấp bút đã chạm tới trái tim công chúng.\n\nNgoài ra, Orange còn là giọng hát được các nhà làm phim yêu thích khi sở hữu 2 bài nhạc phim triệu view và trở thành bài hát hiện tượng trên mạng xã hội.\n\nNăm 2022, giọng hát của Orange liên tục ghi dấu ấn trong lòng người nghe qua các chương trình âm nhạc chất lượng như “Hương Mùa Hè”, “Xuân Hạ Thu Đông Rồi Lại Xuân 2”.	t	t	vn	image/1409817c35f62cf6de9710fa1731e464.jpg	\N	moderator	moderator	2023-12-21 22:42:20.840037+00	2023-12-21 22:42:20.840671+00
19d99de3-fd09-4507-b0bf-5c9dbe6d3311	\N		BOMATELA	\N			t	t	vn	\N	\N	moderator	moderator	2023-12-21 22:45:25.356499+00	2023-12-21 22:45:25.357022+00
14146d68-542e-4191-9466-b13f678fe09d	\N	Phạm Hoàng Khoa	Karik	1989-04-12		Karik tham gia nhóm nhảy Freestyle năm 2006 nhưng 2008 phải nghỉ vì chấn thương. Anh chuyển sang Rap để giải tỏa cảm xúc.\nBan đầu, Karik tự mình mày mò từ flow, lyrics và beat cho đến cách tự thu âm và dần dần được cộng đồng Underground công nhận sau cuối năm 2009.\nNăm 2012 anh vinh dự là nghệ sĩ nhạc Rap đầu tiên đoạt giải MTV Việt Nam.\nCác bài hát phát hành sau đó đều được khán giả yêu thích như: "Anh Không Đòi Quà", "Ế", "Rắc Rối"...\nNăm 2018 Karik kết hợp cùng Orange trong bài hát "Người Lạ Ơi", bài hát trở thành hiện tượng của năm. Sau đó, cả hai còn hợp tác trong "Mình Từng Yêu Như Thế" và "Vô Thường".\nĐầu năm 2019, Karik tung ra sản phẩm đậm chất cá nhân mang tên "Anh Em Tao".	t	t	vn	\N	\N	moderator	moderator	2023-12-23 02:49:24.428377+00	2023-12-23 02:49:24.428377+00
18bf78c7-5e15-4df2-98af-a240fe53e1c6	\N	Nguyễn Thanh Tùng	Sơn Tùng M-TP	1994-07-05		Thanh Tùng bắt đầu chơi nhạc từ cấp ba với nghệ danh M-TP và được biết đến với "Cơn Mưa Ngang Qua".\nNăm 2012, anh đậu thủ khoa Nhạc viện TPHCM và ký hợp đồng với Văn Production, đổi nghệ danh sang Sơn Tùng M-TP.\nTừ 2013 đến 2015, anh có nhiều bản hit như "Em Của Ngày Hôm Qua", "Nắng Ấm Xa Dần"...\nNăm 2015, anh rời khỏi công ty cũ và gia nhập WePro, tổ chức minishow đầu tiên "M-TP and Friends".\nNăm 2017, anh rời khỏi WePro để thành lập M-TP Entertainment, ra mắt "Lạc Trôi" và "Nơi Này Có Anh". Anh ra mắt album đầu tay "m-tp M-TP".\nNăm 2018 anh ra mắt "Chạy Ngay Đi" và "Hãy Trao Cho Anh" năm 2019. Cả hai bài hát đều trở thành hit. Đặc biệt "Hãy Trao Cho Anh" kết hợp với Snopp Dogg đã đưa tên tuổi anh ra thế giới.	t	f	vn	image/dd07cb7b4d5468c4e3df8797282deb25.jpg	image/fd3fcd8ef567f006cae4cd74b608aba2.jpeg	moderator	moderator	2023-12-21 22:29:19.327548+00	2023-12-21 22:29:19.328047+00
e1d0d570-4563-4bfb-a484-158bb2fdf3c8	\N	Nguyễn Phúc Thạch	Only C	1988-02-20		Năm 2006, Only C cùng bạn thành lập nhóm nhạc underground Traisway Band. Cũng trong năm đó, Only C đi học kỹ năng phòng thu tại Singapore.\nDự án đầu tiên của anh khi trở về nước là sản xuất và sáng tác cho album Try To Up của Khổng Tú Quỳnh vào năm 2009.\nOnly C được các nghệ sĩ nổi tiếng đặt hàng ca khúc, có thể kể đến 365 DaBand, Miu Lê, Hồ Ngọc Hà... Không chỉ vậy, anh còn được gọi là "Nhạc Sĩ Nhạc Phim" khi có nhiều sáng tác như "Hai Cô Tiên" và "Bống Bống Bang Bang", "Em Chưa 18", Yêu Là Tha Thu"...\nKhông chỉ sáng tác, Only C còn là một ca sĩ được yêu thích với nhiều ca khúc tạo xu hướng trong giới trẻ như "Anh Không Đòi Quà" (với Karik), "Quan Trọng Là Thần Thái" (với Karik), "Đau Để Trưởng Thành"...	t	t	vn	\N	\N	moderator	moderator	2023-12-23 03:26:19.805555+00	2023-12-23 03:26:19.805555+00
f984f00e-b9f5-4732-89f1-23f4ddab5ee4	\N	Trương Nguyễn Hoài Nam	Andiez	1995-02-10		Đam mê âm nhạc từ bé, bắt đầu hát và sáng tác từ năm lớp 10. Năm 2017, Andiez sáng tác và trình bày ca khúc "Một Phút", ca khúc trở thành hiện tượng trên mạng xã hội.\nNăm 2018 Andiez tham gia Sing My Song và giành được vị trí Á Quân.\nSau cuộc thi, Andiez sáng tác nhiều bài hát trở thành hit của các ca sĩ nổi tiếng như "Anh Đang Ở Đâu Đấy Anh" và" Em Đã Thấy Anh Cùng Người Ấy" của Hương Giang, "Đóa Hoa Hồng" của Chi Pu hay "Tận Cùng Nỗi Nhớ" của Will song ca cùng Han Sara... Các sáng tác của Andiez đa dạng về thể loại, nhưng nổi bật nhất là Pop ballad.\nAnh cũng làm tốt vai trò ca sĩ với các bản hit "Một Phút", "Về Với Anh Đi", "Thật Tuyệt Vời Khi Ở Bên Em"...	t	t	vn	\N	\N	moderator	moderator	2023-12-23 12:49:13.991949+00	2023-12-23 12:49:13.991949+00
7bf7bfdd-5989-426e-8197-494d12652f01	\N	Trần Huyền My	AMEE	2000-03-23		Có vẻ ngoài dễ thương và chất giọng ngọt ngào, AMEE gặt hái thành công với những ca khúc nhạc Pop có phần lời thả thính trong sáng như Ex's Hate Me, Anh Nhà Ở Đâu Thế, Đen Đá Không Đường...\n15 tuổi, AMEE trở thành thực tập sinh của St.319 Entertainment.\nTháng 2 2019, cô góp giọng trong Ex's Hate Me của B Ray và Masew.\nTháng 4 2019, cô debut với Anh Nhà Ở Đâu Thế cùng B Ray, nhanh chóng thu hút một lực lượng lớn người nghe.\nTháng 5, bộ đôi ra mắt sản phẩm hợp tác thứ ba là Đen Đá Không Đường. Bài hát tiếp tục gây sốt với giới trẻ.\nTháng 7, cô kết hợp với Andiez trong Anh Đánh Rơi Người Yêu Này và tháng 10 với VIRUSS trong Trời Giấu Trời Mang Đi, kết thúc một năm thành công của tân binh khủng long AMEE.\nĐầu năm 2020, AMEE góp giọng trong Do For Love của B Ray và Masew. Và chỉ nửa tháng sau, AMEE ra mắt ca khúc Sao Anh Chưa Về Nhà kết hợp cùng Ricky Star.	t	t	vn	image/755725646caf1166d8651a6c42fed611.jpg	\N	moderator	moderator	2023-12-21 22:32:53.533851+00	2023-12-21 22:32:53.534271+00
8b0cb62c-3335-48d8-acf8-89a61a28d8fc	\N	Nguyễn Minh Hằng	MIN	1988-12-07		MIN đã có một bước đột phá mới trong sự nghiệp nghệ thuật, khi giới thiệu tới báo giới và người yêu nhạc ca khúc TÌM như một khởi đầu tốt đẹp cho con đường ca hát chuyên nghiệp.\n\nTÌM là một trong những ca khúc được tìm nghe nhiều nhất trên mạng xã hội, trong tháng 12/2013, và cũng là sản phẩm mở đường, giúp Min thêm nhiều cơ hội hợp tác cùng các nghệ sĩ trẻ khác.\n\nVới giọng hát tình cảm ngọt ngào và cá tính, có thể nói rằng, Min như một cơn gió lạ, một hình tượng mới của giới nghệ thuật Việt Nam, đang từng bước khẳng định được chính mình với sự ủng hộ của thế hệ trẻ.\n\n2017 phát hành các singles như Ghen, Chưa Bao Giờ Mẹ Kể, Có Em Chờ......	t	t	vn	\N	\N	moderator	moderator	2023-12-24 03:34:34.462007+00	2023-12-24 03:34:34.462007+00
5249bd50-fabc-4c2e-acfe-d1ca684aefb0	\N	Văn Mai Hương	Văn Mai Hương	1994-09-27		Cô được gia đình cho theo học nhạc và sinh hoạt âm nhạc từ nhỏ.\nNăm 2010, Văn Mai Hương tham gia Vietnam Idol và đoạt danh hiệu Á quân. Cô được khen ngợi với giọng hát cao và kỹ thuật thanh nhạc tốt.\nSau cuộc thi, cô phát hành đĩa đơn đầu tay và quyết định Nam tiến để phát triển sự nghiệp ca hát chuyên nghiệp.\nTrong năm 2011, cô ra mắt ca khúc "Nếu Như Anh Đến" và được khán giả đón nhận. Nối tiếp thành công, cho ra mắt "Ngày Chung Đôi" và album đầu tay "Hãy Mỉm Cười" cũng trong năm 2011.\nNhững năm tiếp theo, Văn Mai Hương chăm chỉ ra những sản phẩm âm nhạc mới, như album "Mười Tám +" (2013), "Blossom" (2019).	t	t	vn	\N	\N	moderator	moderator	2023-12-24 03:39:56.519157+00	2023-12-24 03:39:56.519157+00
f45f53ee-63cc-4aa9-9ec3-c3f695ced8c3	\N	Hoàng Thùy Linh	Hoàng Thùy Linh	1988-08-11		Sinh ra trong gia đình nghệ thuật, Hoàng Thùy Linh được khán giả biết đến với vai trò diễn viên năm 19 tuổi.\nNăm 2010, cô ra mắt album đầu tay "Hoàng Thùy Linh" với dòng nhạc Dance Pop, trong đó ca khúc "Nhịp Đập Giấc Mơ", "Cho Nhau Lối Đi Riêng" hay "Rung Động" rất được khán giả yêu thích.\nNhững năm tiếp theo, cô ra mắt các album với những dòng nhạc khác nhau như "Đừng Vội Vàng" (2011), "Rơi" (2012), "EP. 2013" (2013).\nNăm 2016, cô ra mắt ca khúc "Bánh Trôi Nước" với chất liệu văn học dân gian, gây hiệu ứng rất tốt.\nNăm 2019, cô tiếp tục sử dụng chất liệu dân gian trong "Để Mị Nói Mà Nghe", ca khúc gây bão và trở thành hiện tượng xã hội. Cả hai ca khúc đều nằm trong album "Hoàng" ra mắt vào cuối năm 2019.	t	t	vn	image/e5608e2edadc0302eeac90d397b5e890.jpg	\N	moderator	moderator	2023-12-24 03:42:05.708708+00	2023-12-24 03:42:05.708708+00
\.


--
-- Data for Name: audios; Type: TABLE DATA; Schema: public; Owner: beatbuddy
--

COPY public.audios (id, code, orig_url, file, hash_md5, released_date, created_by, updated_by, created_at, updated_at) FROM stdin;
1	ytb_xOmLxNyXc6o	https://www.youtube.com/watch?v=xOmLxNyXc6o	audio/19fafb9a6a19714d52105295e62b9b2b.mp3	19fafb9a6a19714d52105295e62b9b2b	2023-09-08	\N	\N	2023-12-21 22:48:46.005311+00	2023-12-21 22:48:46.005604+00
2	ytb_EhJqekMVxTc	https://youtu.be/EhJqekMVxTc	audio/a4859f589ca960075669e1e8305177d8.mp3	a4859f589ca960075669e1e8305177d8	2023-09-29	\N	\N	2023-12-22 07:17:50.040657+00	2023-12-22 07:17:50.044649+00
3	ytb_Hrv_p8CJYro	https://youtu.be/Hrv_p8CJYro?si=aKMuYTdPTOlTJPYI	audio/78eda7b376195b209da589d73145c35b.mp3	78eda7b376195b209da589d73145c35b	2023-09-20	\N	\N	2023-12-22 08:06:23.37506+00	2023-12-22 08:06:23.37506+00
4	ytb_OajQKIvLnbw	https://www.youtube.com/watch?v=OajQKIvLnbw&pp=ygUXZW0gY-G7p2EgbmfDoHkgaMO0bSBxdWE%3D	audio/2f450c0c58f12ec43e329c94deeeb3da.mp3	2f450c0c58f12ec43e329c94deeeb3da	2023-10-24	\N	\N	2023-12-22 08:19:29.843534+00	2023-12-22 08:19:29.843534+00
5	ytb_9GLwkGkMIxc	https://youtu.be/9GLwkGkMIxc?list=RDGMEMQ1dJ7wXfLlqCjwV0xfSNbAVM9GLwkGkMIxc	audio/1b2bc687d7f1029eab4618de7ad5bf34.mp3	1b2bc687d7f1029eab4618de7ad5bf34	2022-06-10	\N	\N	2023-12-23 18:37:11.396312+00	2023-12-23 18:37:11.396312+00
\.


--
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: beatbuddy
--

COPY public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
1	1	<< Flyway Baseline >>	BASELINE	<< Flyway Baseline >>	\N	beatbuddy	2023-12-25 15:17:13.535065	0	t
\.


--
-- Data for Name: resources; Type: TABLE DATA; Schema: public; Owner: beatbuddy
--

COPY public.resources (id, name, urn, tags, thumb, type, created_by, updated_by, created_at, updated_at) FROM stdin;
0d32c0a7-13c1-45bd-ad95-820227a629f2	Andiez	artist:f984f00e-b9f5-4732-89f1-23f4ddab5ee4		\N	artist	\N	\N	2023-12-23 12:49:14.097967+00	2023-12-23 12:49:14.097967+00
f35ea169-a109-46f1-a0fc-28ee62315785	MIN	artist:8b0cb62c-3335-48d8-acf8-89a61a28d8fc		\N	artist	\N	\N	2023-12-24 03:34:34.489927+00	2023-12-24 03:34:34.489927+00
0c5858f3-62c5-4d5c-be1a-8bdc5cce56a1	Văn Mai Hương	artist:5249bd50-fabc-4c2e-acfe-d1ca684aefb0		\N	artist	\N	\N	2023-12-24 03:39:56.549046+00	2023-12-24 03:39:56.549046+00
c790f89a-8ebe-4b60-9ac9-feee6d711511	Hoàng Thùy Linh	artist:f45f53ee-63cc-4aa9-9ec3-c3f695ced8c3		image/e5608e2edadc0302eeac90d397b5e890.jpg	artist	\N	\N	2023-12-24 03:42:05.734002+00	2023-12-24 03:42:05.734002+00
\.


--
-- Data for Name: track_suggestions; Type: TABLE DATA; Schema: public; Owner: beatbuddy
--

COPY public.track_suggestions (id, thumb, title, url, released_date, description, tmp_audio_code, audio_code, status, lyrics, created_by, updated_by, created_at, updated_at, tags) FROM stdin;
beda2aa8-be56-46c9-b7c8-3e8e5974f6db	\N	Suýt Nữa Thì	https://youtu.be/9GLwkGkMIxc?list=RDGMEMQ1dJ7wXfLlqCjwV0xfSNbAVM9GLwkGkMIxc	\N		ytb_9GLwkGkMIxc	\N	\N	public/lyrics/4390b03532a3893184bfde503e69063e.lrc	moderator	moderator	2023-12-23 18:36:10.537396+00	2023-12-23 18:36:10.537396+00	\N
5c77042b-28de-42f7-b8d7-7a9ccd80d712	image/28a0a63bdc79ce369dec16b42b219c8e.jpg	Muộn Rồi Mà Sao Còn	https://www.youtube.com/watch?v=xOmLxNyXc6o	2023-09-08		ytb_xOmLxNyXc6o	\N	PENDING	public/lyrics/b8dfcf915cc0b537c3172360b442e9fa.lrc	moderator	moderator	2023-12-21 22:48:22.358263+00	2023-12-21 22:48:22.358364+00	Sơn Tùng M-TP, BOMATELA,
39d166a5-05c8-477b-9747-5c60acfb67fb	\N	Có Chắc Yêu Là Đây Remix	https://youtu.be/EhJqekMVxTc	2023-09-29		ytb_EhJqekMVxTc	\N	PENDING	public/lyrics/a7047d6cf1622e2efb7fbb84084dd364.lrc	moderator	moderator	2023-12-22 07:19:15.621283+00	2023-12-22 07:19:15.621344+00	Sơn Tùng M-TP, BOMATELA,
72099846-98a0-4d5e-997b-801324833913	image/70aab0a26061030df12884027bed1990.jpg	Nơi Này Có Anh Remix	https://youtu.be/Hrv_p8CJYro?si=aKMuYTdPTOlTJPYI	2023-09-20		ytb_Hrv_p8CJYro	\N	PENDING	public/lyrics/59bed6e40b16b838487862b4992fc5c3.lrc	vutien.dat.3601	vutien.dat.3601	2023-12-22 08:06:05.133825+00	2023-12-22 08:06:05.133825+00	Sơn Tùng M-TP, BOMATELA,
c3c7047f-361e-448d-9667-a23ad80c2a74	image/4923c6de869dd9fc8c8b95866051f3fb.jpg	Em Của Ngày Hôm Qua	https://www.youtube.com/watch?v=OajQKIvLnbw&pp=ygUXZW0gY-G7p2EgbmfDoHkgaMO0bSBxdWE%3D	\N		ytb_OajQKIvLnbw	\N	PENDING	public/lyrics/3f41b23ea2327504011a118642b356c1.lrc	vutien.dat.3601	vutien.dat.3601	2023-12-22 08:19:07.195959+00	2023-12-22 08:19:07.195959+00	Sơn Tùng M-TP, BOMATELA,
\.


--
-- Data for Name: tracksuggestion_artist; Type: TABLE DATA; Schema: public; Owner: beatbuddy
--

COPY public.tracksuggestion_artist (id, tracksugg_id, artist_id, created_by, updated_by, created_at, updated_at, is_active) FROM stdin;
1	5c77042b-28de-42f7-b8d7-7a9ccd80d712	18bf78c7-5e15-4df2-98af-a240fe53e1c6	moderator	moderator	2023-12-21 22:48:22.382681+00	2023-12-21 22:48:22.382742+00	t
7	c3c7047f-361e-448d-9667-a23ad80c2a74	18bf78c7-5e15-4df2-98af-a240fe53e1c6	vutien.dat.3601	vutien.dat.3601	2023-12-22 08:19:07.236881+00	2023-12-22 08:19:07.236881+00	t
8	beda2aa8-be56-46c9-b7c8-3e8e5974f6db	f984f00e-b9f5-4732-89f1-23f4ddab5ee4	moderator	moderator	2023-12-23 18:36:10.565458+00	2023-12-23 18:36:10.565458+00	t
6	72099846-98a0-4d5e-997b-801324833913	18bf78c7-5e15-4df2-98af-a240fe53e1c6	vutien.dat.3601	vutien.dat.3601	2023-12-22 08:06:05.268689+00	2023-12-22 08:06:05.268689+00	t
5	72099846-98a0-4d5e-997b-801324833913	19d99de3-fd09-4507-b0bf-5c9dbe6d3311	vutien.dat.3601	vutien.dat.3601	2023-12-22 08:06:05.268689+00	2023-12-22 08:06:05.268689+00	t
4	39d166a5-05c8-477b-9747-5c60acfb67fb	18bf78c7-5e15-4df2-98af-a240fe53e1c6	moderator	moderator	2023-12-22 07:19:15.680588+00	2023-12-22 07:19:15.680633+00	t
3	39d166a5-05c8-477b-9747-5c60acfb67fb	19d99de3-fd09-4507-b0bf-5c9dbe6d3311	moderator	moderator	2023-12-22 07:19:15.671654+00	2023-12-22 07:19:15.671703+00	t
2	5c77042b-28de-42f7-b8d7-7a9ccd80d712	19d99de3-fd09-4507-b0bf-5c9dbe6d3311	moderator	moderator	2023-12-21 22:48:22.439747+00	2023-12-21 22:48:22.439828+00	t
\.


--
-- Name: audios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beatbuddy
--

SELECT pg_catalog.setval('public.audios_id_seq', 5, true);


--
-- Name: suggesttrack_artist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beatbuddy
--

SELECT pg_catalog.setval('public.suggesttrack_artist_id_seq', 8, true);


--
-- Name: artists artists_acc_id_key; Type: CONSTRAINT; Schema: public; Owner: beatbuddy
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_acc_id_key UNIQUE (acc_id);


--
-- Name: artists artists_pkey; Type: CONSTRAINT; Schema: public; Owner: beatbuddy
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (id);


--
-- Name: audios audios_code_key; Type: CONSTRAINT; Schema: public; Owner: beatbuddy
--

ALTER TABLE ONLY public.audios
    ADD CONSTRAINT audios_code_key UNIQUE (code);


--
-- Name: audios audios_pkey; Type: CONSTRAINT; Schema: public; Owner: beatbuddy
--

ALTER TABLE ONLY public.audios
    ADD CONSTRAINT audios_pkey PRIMARY KEY (id);


--
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: beatbuddy
--

ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- Name: resources resources_pkey; Type: CONSTRAINT; Schema: public; Owner: beatbuddy
--

ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_pkey PRIMARY KEY (id);


--
-- Name: resources resources_urn_key; Type: CONSTRAINT; Schema: public; Owner: beatbuddy
--

ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_urn_key UNIQUE (urn);


--
-- Name: track_suggestions suggest_tracks_pkey; Type: CONSTRAINT; Schema: public; Owner: beatbuddy
--

ALTER TABLE ONLY public.track_suggestions
    ADD CONSTRAINT suggest_tracks_pkey PRIMARY KEY (id);


--
-- Name: tracksuggestion_artist suggesttrack_artist_pkey; Type: CONSTRAINT; Schema: public; Owner: beatbuddy
--

ALTER TABLE ONLY public.tracksuggestion_artist
    ADD CONSTRAINT suggesttrack_artist_pkey PRIMARY KEY (id);


--
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: beatbuddy
--

CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);


--
-- PostgreSQL database dump complete
--

