DROP DATABASE IF EXISTS has_many_blogs;
DROP USER IF EXISTS has_many_user;

CREATE USER has_many_user;
CREATE DATABASE has_many_blogs OWNER has_many_user;

\c has_many_blogs

DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id           SERIAL         PRIMARY KEY,
  username     VARCHAR(90)    NOT NULL,
  first_name   VARCHAR(90)    NULL        DEFAULT   NULL,
  last_name    VARCHAR(90)    NULL        DEFAULT   NULL,
  created_at   TIMESTAMPTZ    NOT NULL    DEFAULT   now(),
  updated_at   TIMESTAMPTZ    NOT NULL    DEFAULT   now()
);

DROP TABLE IF EXISTS posts;

CREATE TABLE posts (
  id          SERIAL         PRIMARY KEY,
  title       VARCHAR(180)   NULL         DEFAULT   NULL,
  url         VARCHAR(510)   NULL         DEFAULT   NULL,
  content     TEXT           NULL         DEFAULT   NULL,
  created_at  TIMESTAMPTZ    NOT NULL     DEFAULT   now(),
  updated_at  TIMESTAMPTZ    NOT NULL     DEFAULT   now(),
  user_id     int REFERENCES users(id)
);

DROP TABLE IF EXISTS comments;

CREATE TABLE comments (
  id          SERIAL        PRIMARY KEY,
  body        VARCHAR(510)  NULL          DEFAULT   NULL,
  created_at  TIMESTAMPTZ   NOT NULL      DEFAULT   now(),
  updated_at  TIMESTAMPTZ   NOT NULL      DEFAULT   now(),
  user_id    int REFERENCES users(id),
  post_id    int REFERENCES posts(id)   
);

\i scripts/blog_data.sql