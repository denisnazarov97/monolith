drop table if exists client_profile cascade;

drop table if exists genre2game cascade;

drop table if exists genre cascade;

drop table if exists client2game cascade;

drop table if exists game cascade;

drop table if exists client2party cascade;

drop table if exists party cascade;

drop table if exists client cascade;

drop table if exists review cascade;

delete from flyway_schema_history where version = '1.0.0';