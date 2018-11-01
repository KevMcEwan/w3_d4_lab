drop table if exists castings;
drop table if exists movies;
drop table if exists stars;

create table movies (
  id SERIAL4 primary key,
  title varchar(255),
  genre varchar(255)
);

create table stars (
  id SERIAL4 primary key,
  first_name varchar(255),
  last_name varchar(255)
);

create table castings (
  id serial4 primary key,
  movie_id int4 REFERENCES movies(id) ON DELETE CASCADE,
  star_id int4 REFERENCES stars(id) ON DELETE CASCADE,
  fee int4 NOT NULL
);
