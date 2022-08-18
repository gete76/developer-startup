/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO,ANSI' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
drop schema public cascade;
create schema public;

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "api_keys" (
  "id" int NOT NULL PRIMARY KEY,
  "created_at" timestamp DEFAULT NULL,
  "last_used" timestamp DEFAULT NULL,
  "num_uses" int DEFAULT '0',
  "user_id" int NOT NULL,
  "key" varchar(128) NOT NULL,
  "notes" text,
  "verified" timestamp DEFAULT NULL

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "ar_internal_metadata" (
  "key" varchar(255) NOT NULL,
  "value" varchar(255) DEFAULT NULL,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "articles" (
  "id" int NOT NULL PRIMARY KEY,
  "title" varchar(255) DEFAULT NULL,
  "body" text,
  "user_id" int DEFAULT NULL,
  "rss_log_id" int DEFAULT NULL,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "collection_numbers" (
  "id" int NOT NULL PRIMARY KEY,
  "created_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "user_id" int DEFAULT NULL,
  "name" varchar(255) DEFAULT NULL,
  "number" varchar(255) DEFAULT NULL

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "collection_numbers_observations" (
  "collection_number_id" int DEFAULT NULL,
  "observation_id" int DEFAULT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "comments" (
  "id" int NOT NULL PRIMARY KEY,
  "created_at" timestamp DEFAULT NULL,
  "user_id" int DEFAULT NULL,
  "summary" varchar(100) DEFAULT NULL,
  "comment" text,
  "target_type" varchar(30) DEFAULT NULL,
  "target_id" int DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "copyright_changes" (
  "id" int NOT NULL PRIMARY KEY,
  "user_id" int NOT NULL,
  "updated_at" timestamp NOT NULL,
  "target_type" varchar(30) NOT NULL,
  "target_id" int NOT NULL,
  "year" int DEFAULT NULL,
  "name" varchar(255) DEFAULT NULL,
  "license_id" int DEFAULT NULL

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "donations" (
  "id" int NOT NULL PRIMARY KEY,
  "amount" decimal(12,2) DEFAULT NULL,
  "who" varchar(100) DEFAULT NULL,
  "email" varchar(100) DEFAULT NULL,
  "created_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "anonymous" smallint NOT NULL DEFAULT '0',
  "reviewed" smallint NOT NULL DEFAULT '1',
  "user_id" int DEFAULT NULL,
  "recurring" smallint DEFAULT '0'

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "external_links" (
  "id" int NOT NULL PRIMARY KEY,
  "created_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "user_id" int DEFAULT NULL,
  "observation_id" int DEFAULT NULL,
  "external_site_id" int DEFAULT NULL,
  "url" varchar(100) DEFAULT NULL

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "external_sites" (
  "id" int NOT NULL PRIMARY KEY,
  "name" varchar(100) DEFAULT NULL,
  "project_id" int DEFAULT NULL

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "glossary_term_images" (
  "image_id" int DEFAULT NULL,
  "glossary_term_id" int DEFAULT NULL,
  "id" bigint NOT NULL PRIMARY KEY

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "glossary_terms" (
  "id" int NOT NULL PRIMARY KEY,
  "version" int DEFAULT NULL,
  "user_id" int DEFAULT NULL,
  "name" varchar(1024) DEFAULT NULL,
  "thumb_image_id" int DEFAULT NULL,
  "description" text,
  "rss_log_id" int DEFAULT NULL,
  "created_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "glossary_terms_images" (
  "image_id" int DEFAULT NULL,
  "glossary_term_id" int DEFAULT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "glossary_terms_versions" (
  "id" int NOT NULL PRIMARY KEY,
  "glossary_term_id" int DEFAULT NULL,
  "version" int DEFAULT NULL,
  "user_id" int DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "name" varchar(1024) DEFAULT NULL,
  "description" text
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "herbaria" (
  "id" int NOT NULL PRIMARY KEY,
  "mailing_address" text,
  "location_id" int DEFAULT NULL,
  "email" varchar(80) NOT NULL DEFAULT '',
  "name" varchar(1024) DEFAULT NULL,
  "description" text,
  "created_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "code" varchar(8) NOT NULL DEFAULT '',
  "personal_user_id" int DEFAULT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "herbaria_curators" (
  "user_id" int NOT NULL DEFAULT '0',
  "herbarium_id" int NOT NULL DEFAULT '0'
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "herbarium_curators" (
  "user_id" int NOT NULL DEFAULT '0',
  "herbarium_id" int NOT NULL DEFAULT '0',
  "id" bigint NOT NULL PRIMARY KEY
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "herbarium_records" (
  "id" int NOT NULL PRIMARY KEY,
  "herbarium_id" int NOT NULL,
  "notes" text,
  "created_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "user_id" int NOT NULL,
  "initial_det" varchar(221) NOT NULL,
  "accession_number" varchar(80) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "herbarium_records_observations" (
  "observation_id" int NOT NULL DEFAULT '0',
  "herbarium_record_id" int NOT NULL DEFAULT '0'
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "image_votes" (
  "id" int NOT NULL PRIMARY KEY,
  "value" int NOT NULL,
  "anonymous" smallint NOT NULL DEFAULT '0',
  "user_id" int DEFAULT NULL,
  "image_id" int DEFAULT NULL
);

CREATE UNIQUE INDEX index_image_votes_on_user_id ON image_votes (user_id);
CREATE UNIQUE INDEX index_image_votes_on_image_id ON image_votes (image_id);

/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "images" (
  "id" int NOT NULL PRIMARY KEY,
  "created_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "content_type" varchar(100) DEFAULT NULL,
  "user_id" int DEFAULT NULL,
  "when" date DEFAULT NULL,
  "notes" text,
  "copyright_holder" varchar(100) DEFAULT NULL,
  "license_id" int NOT NULL DEFAULT '1',
  "num_views" int NOT NULL DEFAULT '0',
  "last_view" timestamp DEFAULT NULL,
  "width" int DEFAULT NULL,
  "height" int DEFAULT NULL,
  "vote_cache" float DEFAULT NULL,
  "ok_for_export" smallint NOT NULL DEFAULT '1',
  "original_name" varchar(120) DEFAULT '',
  "transferred" smallint NOT NULL DEFAULT '0',
  "gps_stripped" smallint NOT NULL DEFAULT '0',
  "ok_for_ml" smallint NOT NULL DEFAULT '1'

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "images_observations" (
  "image_id" int NOT NULL DEFAULT '0',
  "observation_id" int NOT NULL DEFAULT '0'
);

CREATE UNIQUE INDEX index_images_observations_on_observation_id ON images_observations (observation_id);

/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "images_projects" (
  "image_id" int NOT NULL,
  "project_id" int NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "interests" (
  "id" int NOT NULL PRIMARY KEY,
  "target_type" varchar(30) DEFAULT NULL,
  "target_id" int DEFAULT NULL,
  "user_id" int DEFAULT NULL,
  "state" smallint DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "languages" (
  "id" int NOT NULL PRIMARY KEY,
  "locale" varchar(40) DEFAULT NULL,
  "name" varchar(100) DEFAULT NULL,
  "order" varchar(100) DEFAULT NULL,
  "official" smallint NOT NULL,
  "beta" smallint NOT NULL

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "licenses" (
  "id" int NOT NULL PRIMARY KEY,
  "display_name" varchar(80) DEFAULT NULL,
  "url" varchar(200) DEFAULT NULL,
  "deprecated" smallint NOT NULL DEFAULT '0',
  "form_name" varchar(20) DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "location_description_admins" (
  "location_description_id" int NOT NULL DEFAULT '0',
  "user_group_id" int NOT NULL DEFAULT '0',
  "id" bigint NOT NULL PRIMARY KEY

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "location_description_authors" (
  "location_description_id" int NOT NULL DEFAULT '0',
  "user_id" int NOT NULL DEFAULT '0',
  "id" bigint NOT NULL PRIMARY KEY

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "location_description_editors" (
  "location_description_id" int NOT NULL DEFAULT '0',
  "user_id" int NOT NULL DEFAULT '0',
  "id" bigint NOT NULL PRIMARY KEY

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "location_description_readers" (
  "location_description_id" int NOT NULL DEFAULT '0',
  "user_group_id" int NOT NULL DEFAULT '0',
  "id" bigint NOT NULL PRIMARY KEY

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "location_description_writers" (
  "location_description_id" int NOT NULL DEFAULT '0',
  "user_group_id" int NOT NULL DEFAULT '0',
  "id" bigint NOT NULL PRIMARY KEY

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "location_descriptions" (
  "id" int NOT NULL PRIMARY KEY,
  "version" int DEFAULT NULL,
  "created_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "user_id" int DEFAULT NULL,
  "location_id" int DEFAULT NULL,
  "num_views" int DEFAULT '0',
  "last_view" timestamp DEFAULT NULL,
  "source_type" int DEFAULT NULL,
  "source_name" varchar(100) DEFAULT NULL,
  "locale" varchar(8) DEFAULT NULL,
  "public" smallint DEFAULT NULL,
  "license_id" int DEFAULT NULL,
  "gen_desc" text,
  "ecology" text,
  "species" text,
  "notes" text,
  "refs" text,
  "ok_for_export" smallint NOT NULL DEFAULT '1',
  "project_id" int DEFAULT NULL

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "location_descriptions_admins" (
  "location_description_id" int NOT NULL DEFAULT '0',
  "user_group_id" int NOT NULL DEFAULT '0'
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "location_descriptions_authors" (
  "location_description_id" int NOT NULL DEFAULT '0',
  "user_id" int NOT NULL DEFAULT '0'
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "location_descriptions_editors" (
  "location_description_id" int NOT NULL DEFAULT '0',
  "user_id" int NOT NULL DEFAULT '0'
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "location_descriptions_readers" (
  "location_description_id" int NOT NULL DEFAULT '0',
  "user_group_id" int NOT NULL DEFAULT '0'
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "location_descriptions_versions" (
  "id" int NOT NULL PRIMARY KEY,
  "location_description_id" int DEFAULT NULL,
  "version" int DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "user_id" int DEFAULT NULL,
  "license_id" int DEFAULT NULL,
  "merge_source_id" int DEFAULT NULL,
  "gen_desc" text,
  "ecology" text,
  "species" text,
  "notes" text,
  "refs" text

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "location_descriptions_writers" (
  "location_description_id" int NOT NULL DEFAULT '0',
  "user_group_id" int NOT NULL DEFAULT '0'
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "locations" (
  "id" int NOT NULL PRIMARY KEY,
  "version" int DEFAULT NULL,
  "created_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "user_id" int DEFAULT NULL,
  "description_id" int DEFAULT NULL,
  "rss_log_id" int DEFAULT NULL,
  "num_views" int DEFAULT '0',
  "last_view" timestamp DEFAULT NULL,
  "north" float DEFAULT NULL,
  "south" float DEFAULT NULL,
  "west" float DEFAULT NULL,
  "east" float DEFAULT NULL,
  "high" float DEFAULT NULL,
  "low" float DEFAULT NULL,
  "ok_for_export" smallint NOT NULL DEFAULT '1',
  "notes" text,
  "name" varchar(1024) DEFAULT NULL,
  "scientific_name" varchar(1024) DEFAULT NULL,
  "locked" smallint NOT NULL DEFAULT '0'

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "locations_versions" (
  "id" int NOT NULL PRIMARY KEY,
  "location_id" varchar(255) DEFAULT NULL,
  "version" int DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "user_id" int DEFAULT NULL,
  "north" float DEFAULT NULL,
  "south" float DEFAULT NULL,
  "west" float DEFAULT NULL,
  "east" float DEFAULT NULL,
  "high" float DEFAULT NULL,
  "low" float DEFAULT NULL,
  "name" varchar(1024) DEFAULT NULL,
  "notes" text,
  "scientific_name" varchar(1024) DEFAULT NULL

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "name_description_admins" (
  "name_description_id" int NOT NULL DEFAULT '0',
  "user_group_id" int NOT NULL DEFAULT '0',
  "id" bigint NOT NULL PRIMARY KEY

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "name_description_authors" (
  "name_description_id" int NOT NULL DEFAULT '0',
  "user_id" int NOT NULL DEFAULT '0',
  "id" bigint NOT NULL PRIMARY KEY

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "name_description_editors" (
  "name_description_id" int NOT NULL DEFAULT '0',
  "user_id" int NOT NULL DEFAULT '0',
  "id" bigint NOT NULL PRIMARY KEY

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "name_description_readers" (
  "name_description_id" int NOT NULL DEFAULT '0',
  "user_group_id" int NOT NULL DEFAULT '0',
  "id" bigint NOT NULL PRIMARY KEY

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "name_description_writers" (
  "name_description_id" int NOT NULL DEFAULT '0',
  "user_group_id" int NOT NULL DEFAULT '0',
  "id" bigint NOT NULL PRIMARY KEY

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "name_descriptions" (
  "id" int NOT NULL PRIMARY KEY,
  "version" int DEFAULT NULL,
  "created_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "user_id" int DEFAULT NULL,
  "name_id" int DEFAULT NULL,
  "review_status" int DEFAULT '1',
  "last_review" timestamp DEFAULT NULL,
  "reviewer_id" int DEFAULT NULL,
  "ok_for_export" smallint NOT NULL DEFAULT '1',
  "num_views" int DEFAULT '0',
  "last_view" timestamp DEFAULT NULL,
  "source_type" int DEFAULT NULL,
  "source_name" varchar(100) DEFAULT NULL,
  "locale" varchar(8) DEFAULT NULL,
  "public" smallint DEFAULT NULL,
  "license_id" int DEFAULT NULL,
  "gen_desc" text,
  "diag_desc" text,
  "distribution" text,
  "habitat" text,
  "look_alikes" text,
  "uses" text,
  "notes" text,
  "refs" text,
  "classification" text,
  "project_id" int DEFAULT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "name_descriptions_admins" (
  "name_description_id" int NOT NULL DEFAULT '0',
  "user_group_id" int NOT NULL DEFAULT '0'
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "name_descriptions_authors" (
  "name_description_id" int NOT NULL DEFAULT '0',
  "user_id" int NOT NULL DEFAULT '0'
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "name_descriptions_editors" (
  "name_description_id" int NOT NULL DEFAULT '0',
  "user_id" int NOT NULL DEFAULT '0'
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "name_descriptions_readers" (
  "name_description_id" int NOT NULL DEFAULT '0',
  "user_group_id" int NOT NULL DEFAULT '0'
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "name_descriptions_versions" (
  "id" int NOT NULL PRIMARY KEY,
  "name_description_id" int DEFAULT NULL,
  "version" int DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "user_id" int DEFAULT NULL,
  "license_id" int DEFAULT NULL,
  "merge_source_id" int DEFAULT NULL,
  "gen_desc" text,
  "diag_desc" text,
  "distribution" text,
  "habitat" text,
  "look_alikes" text,
  "uses" text,
  "notes" text,
  "refs" text,
  "classification" text
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "name_descriptions_writers" (
  "name_description_id" int NOT NULL DEFAULT '0',
  "user_group_id" int NOT NULL DEFAULT '0'
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "names" (
  "id" int NOT NULL PRIMARY KEY,
  "version" int DEFAULT NULL,
  "created_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "user_id" int DEFAULT NULL,
  "description_id" int DEFAULT NULL,
  "rss_log_id" int DEFAULT NULL,
  "num_views" int DEFAULT '0',
  "last_view" timestamp DEFAULT NULL,
  "rank" int DEFAULT NULL,
  "text_name" varchar(100) DEFAULT NULL,
  "search_name" varchar(221) DEFAULT NULL,
  "display_name" varchar(204) DEFAULT NULL,
  "sort_name" varchar(241) DEFAULT NULL,
  "citation" text,
  "deprecated" smallint NOT NULL DEFAULT '0',
  "synonym_id" int DEFAULT NULL,
  "correct_spelling_id" int DEFAULT NULL,
  "notes" text,
  "classification" text,
  "ok_for_export" smallint NOT NULL DEFAULT '1',
  "author" varchar(100) DEFAULT NULL,
  "lifeform" varchar(1024) NOT NULL DEFAULT ' ',
  "locked" smallint NOT NULL DEFAULT '0',
  "icn_id" int DEFAULT NULL

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "names_versions" (
  "id" int NOT NULL PRIMARY KEY,
  "name_id" int DEFAULT NULL,
  "version" int DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "user_id" int DEFAULT NULL,
  "text_name" varchar(100) DEFAULT NULL,
  "search_name" varchar(221) DEFAULT NULL,
  "display_name" varchar(204) DEFAULT NULL,
  "sort_name" varchar(241) DEFAULT NULL,
  "author" varchar(100) DEFAULT NULL,
  "citation" text,
  "deprecated" smallint NOT NULL DEFAULT '0',
  "correct_spelling_id" int DEFAULT NULL,
  "notes" text,
  "rank" int DEFAULT NULL,
  "lifeform" varchar(1024) NOT NULL DEFAULT ' ',
  "icn_id" int DEFAULT NULL

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "naming_reasons" (
  "id" int NOT NULL PRIMARY KEY,
  "naming_id" int DEFAULT NULL,
  "reason" int DEFAULT NULL,
  "notes" text

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "namings" (
  "id" int NOT NULL PRIMARY KEY,
  "created_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "observation_id" int DEFAULT NULL,
  "name_id" int DEFAULT NULL,
  "user_id" int DEFAULT NULL,
  "vote_cache" float DEFAULT '0',
  "reasons" text

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "notifications" (
  "id" int NOT NULL PRIMARY KEY,
  "user_id" int NOT NULL DEFAULT '0',
  "flavor" int DEFAULT NULL,
  "obj_id" int DEFAULT NULL,
  "note_template" text,
  "updated_at" timestamp DEFAULT NULL,
  "require_specimen" smallint NOT NULL DEFAULT '0'

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "observation_collection_numbers" (
  "collection_number_id" int DEFAULT NULL,
  "observation_id" int DEFAULT NULL,
  "id" bigint NOT NULL PRIMARY KEY

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "observation_herbarium_records" (
  "observation_id" int NOT NULL DEFAULT '0',
  "herbarium_record_id" int NOT NULL DEFAULT '0',
  "id" bigint NOT NULL PRIMARY KEY

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "observation_images" (
  "image_id" int NOT NULL DEFAULT '0',
  "observation_id" int NOT NULL DEFAULT '0',
  "id" bigint NOT NULL PRIMARY KEY,
  "rank" int NOT NULL DEFAULT '0'
);

CREATE UNIQUE INDEX index_observation_images_on_observation_id on observation_images (observation_id);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "observation_views" (
  "id" bigint NOT NULL PRIMARY KEY,
  "observation_id" int DEFAULT NULL,
  "user_id" int DEFAULT NULL,
  "last_view" timestamp DEFAULT NULL

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "observations" (
  "id" int NOT NULL PRIMARY KEY,
  "created_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "when" date DEFAULT NULL,
  "user_id" int DEFAULT NULL,
  "specimen" smallint NOT NULL DEFAULT '0',
  "notes" text,
  "thumb_image_id" int DEFAULT NULL,
  "name_id" int DEFAULT NULL,
  "location_id" int DEFAULT NULL,
  "is_collection_location" smallint NOT NULL DEFAULT '1',
  "vote_cache" float DEFAULT '0',
  "num_views" int NOT NULL DEFAULT '0',
  "last_view" timestamp DEFAULT NULL,
  "rss_log_id" int DEFAULT NULL,
  "lat" decimal(15,10) DEFAULT NULL,
  "long" decimal(15,10) DEFAULT NULL,
  "where" varchar(1024) DEFAULT NULL,
  "alt" int DEFAULT NULL,
  "lifeform" varchar(1024) DEFAULT NULL,
  "text_name" varchar(100) DEFAULT NULL,
  "classification" text,
  "gps_hidden" smallint NOT NULL DEFAULT '0'

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "observations_projects" (
  "observation_id" int NOT NULL,
  "project_id" int NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "observations_species_lists" (
  "observation_id" int NOT NULL DEFAULT '0',
  "species_list_id" int NOT NULL DEFAULT '0'
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "project_images" (
  "image_id" int NOT NULL,
  "project_id" int NOT NULL,
  "id" bigint NOT NULL PRIMARY KEY

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "project_observations" (
  "observation_id" int NOT NULL,
  "project_id" int NOT NULL,
  "id" bigint NOT NULL PRIMARY KEY

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "project_species_lists" (
  "project_id" int NOT NULL,
  "species_list_id" int NOT NULL,
  "id" bigint NOT NULL PRIMARY KEY

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "projects" (
  "id" int NOT NULL PRIMARY KEY,
  "user_id" int NOT NULL DEFAULT '0',
  "admin_group_id" int NOT NULL DEFAULT '0',
  "user_group_id" int NOT NULL DEFAULT '0',
  "title" varchar(100) NOT NULL DEFAULT '',
  "summary" text,
  "created_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "rss_log_id" int DEFAULT NULL

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "projects_species_lists" (
  "project_id" int NOT NULL,
  "species_list_id" int NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "publications" (
  "id" int NOT NULL PRIMARY KEY,
  "user_id" int DEFAULT NULL,
  "full" text,
  "link" varchar(255) DEFAULT NULL,
  "how_helped" text,
  "mo_mentioned" smallint DEFAULT NULL,
  "peer_reviewed" smallint DEFAULT NULL,
  "created_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "query_records" (
  "id" int NOT NULL PRIMARY KEY,
  "updated_at" timestamp DEFAULT NULL,
  "access_count" int DEFAULT NULL,
  "description" text,
  "outer_id" int DEFAULT NULL

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "queued_email_integers" (
  "id" int NOT NULL PRIMARY KEY,
  "queued_email_id" int NOT NULL DEFAULT '0',
  "key" varchar(100) DEFAULT NULL,
  "value" int NOT NULL DEFAULT '0'

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "queued_email_notes" (
  "id" int NOT NULL PRIMARY KEY,
  "queued_email_id" int NOT NULL DEFAULT '0',
  "value" text

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "queued_email_strings" (
  "id" int NOT NULL PRIMARY KEY,
  "queued_email_id" int NOT NULL DEFAULT '0',
  "key" varchar(100) DEFAULT NULL,
  "value" varchar(100) DEFAULT NULL

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "queued_emails" (
  "id" int NOT NULL PRIMARY KEY,
  "user_id" int DEFAULT NULL,
  "queued" timestamp DEFAULT NULL,
  "num_attempts" int DEFAULT NULL,
  "flavor" varchar(50) DEFAULT NULL,
  "to_user_id" int DEFAULT NULL

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "rss_logs" (
  "id" int NOT NULL PRIMARY KEY,
  "observation_id" int DEFAULT NULL,
  "species_list_id" int DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "notes" text,
  "name_id" int DEFAULT NULL,
  "location_id" int DEFAULT NULL,
  "project_id" int DEFAULT NULL,
  "glossary_term_id" int DEFAULT NULL,
  "article_id" int DEFAULT NULL,
  "created_at" timestamp NOT NULL

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "schema_migrations" (
  "version" varchar(255) UNIQUE NOT NULL DEFAULT ''
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "sequences" (
  "id" int NOT NULL PRIMARY KEY,
  "observation_id" int DEFAULT NULL,
  "user_id" int DEFAULT NULL,
  "locus" text,
  "bases" text,
  "archive" varchar(255) DEFAULT NULL,
  "accession" varchar(255) DEFAULT NULL,
  "notes" text,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "species_list_observations" (
  "observation_id" int NOT NULL DEFAULT '0',
  "species_list_id" int NOT NULL DEFAULT '0',
  "id" bigint NOT NULL PRIMARY KEY

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "species_lists" (
  "id" int NOT NULL PRIMARY KEY,
  "created_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "when" date DEFAULT NULL,
  "user_id" int DEFAULT NULL,
  "where" varchar(1024) DEFAULT NULL,
  "title" varchar(100) DEFAULT NULL,
  "notes" text,
  "rss_log_id" int DEFAULT NULL,
  "location_id" int DEFAULT NULL

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "synonyms" (
  "id" int NOT NULL PRIMARY KEY

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "translation_strings" (
  "id" int NOT NULL PRIMARY KEY,
  "version" int DEFAULT NULL,
  "language_id" int NOT NULL,
  "tag" varchar(100) DEFAULT NULL,
  "text" text,
  "updated_at" timestamp DEFAULT NULL,
  "user_id" int DEFAULT NULL

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "translation_strings_versions" (
  "id" int NOT NULL PRIMARY KEY,
  "version" int DEFAULT NULL,
  "translation_string_id" int DEFAULT NULL,
  "text" text,
  "updated_at" timestamp DEFAULT NULL,
  "user_id" int DEFAULT NULL

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "triples" (
  "id" int NOT NULL PRIMARY KEY,
  "subject" varchar(1024) DEFAULT NULL,
  "predicate" varchar(1024) DEFAULT NULL,
  "object" varchar(1024) DEFAULT NULL

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "user_group_users" (
  "user_id" int NOT NULL DEFAULT '0',
  "user_group_id" int NOT NULL DEFAULT '0',
  "id" bigint NOT NULL PRIMARY KEY

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "user_groups" (
  "id" int NOT NULL PRIMARY KEY,
  "name" varchar(255) NOT NULL DEFAULT '',
  "created_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "meta" smallint DEFAULT '0'

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "user_groups_users" (
  "user_id" int NOT NULL DEFAULT '0',
  "user_group_id" int NOT NULL DEFAULT '0'
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "users" (
  "id" int NOT NULL PRIMARY KEY,
  "login" varchar(80) NOT NULL DEFAULT '',
  "password" varchar(40) NOT NULL DEFAULT '',
  "email" varchar(80) NOT NULL DEFAULT '',
  "theme" varchar(40) DEFAULT NULL,
  "name" varchar(80) DEFAULT NULL,
  "created_at" timestamp DEFAULT NULL,
  "last_login" timestamp DEFAULT NULL,
  "verified" timestamp DEFAULT NULL,
  "license_id" int NOT NULL DEFAULT '3',
  "contribution" int DEFAULT '0',
  "location_id" int DEFAULT NULL,
  "image_id" int DEFAULT NULL,
  "locale" varchar(5) DEFAULT NULL,
  "bonuses" text,
  "email_comments_owner" smallint NOT NULL DEFAULT '1',
  "email_comments_response" smallint NOT NULL DEFAULT '1',
  "email_comments_all" smallint NOT NULL DEFAULT '0',
  "email_observations_consensus" smallint NOT NULL DEFAULT '1',
  "email_observations_naming" smallint NOT NULL DEFAULT '1',
  "email_observations_all" smallint NOT NULL DEFAULT '0',
  "email_names_author" smallint NOT NULL DEFAULT '1',
  "email_names_editor" smallint NOT NULL DEFAULT '0',
  "email_names_reviewer" smallint NOT NULL DEFAULT '1',
  "email_names_all" smallint NOT NULL DEFAULT '0',
  "email_locations_author" smallint NOT NULL DEFAULT '1',
  "email_locations_editor" smallint NOT NULL DEFAULT '0',
  "email_locations_all" smallint NOT NULL DEFAULT '0',
  "email_general_feature" smallint NOT NULL DEFAULT '1',
  "email_general_commercial" smallint NOT NULL DEFAULT '1',
  "email_general_question" smallint NOT NULL DEFAULT '1',
  "email_html" smallint NOT NULL DEFAULT '1',
  "updated_at" timestamp DEFAULT NULL,
  "admin" smallint DEFAULT NULL,
  "alert" text,
  "email_locations_admin" smallint DEFAULT '0',
  "email_names_admin" smallint DEFAULT '0',
  "thumbnail_size" int DEFAULT '1',
  "image_size" int DEFAULT '3',
  "default_rss_type" varchar(40) DEFAULT 'all',
  "votes_anonymous" int DEFAULT '1',
  "location_format" int DEFAULT '1',
  "last_activity" timestamp DEFAULT NULL,
  "hide_authors" int NOT NULL DEFAULT '1',
  "thumbnail_maps" smallint NOT NULL DEFAULT '1',
  "auth_code" varchar(40) DEFAULT NULL,
  "keep_filenames" int NOT NULL DEFAULT '1',
  "notes" text,
  "mailing_address" text,
  "layout_count" int DEFAULT NULL,
  "view_owner_id" smallint NOT NULL DEFAULT '0',
  "content_filter" varchar(255) DEFAULT NULL,
  "notes_template" text

);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE "votes" (
  "id" int NOT NULL PRIMARY KEY,
  "created_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "naming_id" int DEFAULT NULL,
  "user_id" int DEFAULT NULL,
  "observation_id" int DEFAULT '0',
  "favorite" smallint DEFAULT NULL,
  "value" float DEFAULT NULL

);
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

