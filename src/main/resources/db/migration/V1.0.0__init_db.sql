create table attributes
(
    name        varchar(255) not null,
    type        varchar(65)  not null, -- внутренний enum основные примитивные типы (String, Double ..)
    description varchar(255) null,
    source      varchar(255) not null, -- внутренний enum основные место возникновения (Enricher, FactEngine, RuleEngine..)
    constraint attributes_pk primary key (name)
);
