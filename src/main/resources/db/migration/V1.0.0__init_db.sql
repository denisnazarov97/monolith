create table client
(
    id       uuid         not null,
    name varchar(255) not null, -- внутренний enum основные примитивные типы (String, Double ..)
    email    varchar(255) not null,
    password varchar(255) not null, -- внутренний enum основные место возникновения (Enricher, FactEngine, RuleEngine..)
    constraint client_pk primary key (id)
);


create table game
(    --Not null
    name     varchar(255) not null,
    price    float        not null,
    mode     varchar(255) not null,
    -- Nullable
    is_mmo    boolean     null,
    is_coop_net       boolean     null,
    is_coop_lan       boolean     null,
    is_single         boolean     null,
    constraint games_pk primary key (name)
);


create table party
(
    name    varchar(255)    not null,
    image   varchar(255)    not null,
    description  varchar(255)   null,
    owner_id    uuid        not null,
    constraint party_pk primary key (name),
    constraint party_owner_id_fk foreign key (owner_id) references "client"(id)
);



create table genre
(
    name    varchar(255) not null,
    constraint genre_pk primary key(name)
);

create table review
(
    id      uuid    not null,
    content     text    not null,
    owner_id    uuid    not null,
    vote        int     not null,
    game_name   varchar(255)    not null,
    constraint review_pk primary key (id),
    constraint review_owner_id_fk foreign key (owner_id) references client(id),
    constraint review_game_name_fk foreign key (game_name) references game(name)
);


create table client_profile
(
    id      uuid    not null,
    name    varchar(255)    not null,
    surname     varchar(255)    not null,
    favorite_genre_name  varchar(255),
    favorite_game_name   varchar(255),
    creation_date   timestamp   null,
    client_id   uuid    not null,
    constraint client_profile_pk primary key (id),
    constraint client_profile_favorite_genre_name_fk
        foreign key (favorite_genre_name)  references "genre"(name),
    constraint client_profile_favorite_game_name_fk
        foreign key (favorite_game_name)  references "game"(name),
    constraint client_profile_client_id_fk
        foreign key (client_id)  references "client"(id)
);

create table genre2game
(
    genre_name  varchar(255)    not null,
    game_name   varchar(255)    not null,
    constraint genre2game_pk primary key (genre_name, game_name),
    constraint genre2game_genre_name_fk foreign key (genre_name) references "genre" (name),
    constraint genre2game_game_id_fk foreign key (game_name) references "game" (name)
);

create table client2game
(
    client_id   uuid    not null,
    game_name   varchar(255)   not null,
    constraint client2game_pk primary key (client_id, game_name),
    constraint client2game_client_id_fk foreign key (client_id) references "client"(id),
    constraint client2game_game_name_fk foreign key (game_name) references "game"(name)
);

create table client2party
(
    client_id   uuid    not null ,
    party_name  varchar(255)    not null,
    constraint client2party_pk primary key (client_id, party_name),
    constraint client2party_client_id_fk
        foreign key (client_id) references "client"(id),
    constraint client2party_party_name_fk
        foreign key (party_name) references "party"(name)
);




