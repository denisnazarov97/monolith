create extension if not exists "uuid-ossp";
alter schema public owner to openmonet;

create table available_methods
(
    id varchar(255) not null
        constraint available_methods_pkey
            primary key
);

alter table available_methods owner to openmonet;

create table available_methods_currencies
(
    currency_payment_entity_id varchar(255) not null
        constraint fkmka0i4lwhxn9tppwgmhtg5cgk
            references available_methods,
    currencies_id varchar(255) not null
        constraint uk_bt7dqgcyykoju3x52qhtxkkbh
            unique,
    constraint available_methods_currencies_pkey
        primary key (currency_payment_entity_id, currencies_id)
);

alter table available_methods_currencies owner to openmonet;

create table payments
(
    id varchar(255) not null
        constraint payments_pkey
            primary key,
    is_group boolean,
    name varchar(255),
    short_name varchar(255),
    type varchar(255),
    category_id varchar(255)
        constraint fkb5jtc0ttv6wk1b3p98dee5mys
            references payments
);

alter table payments owner to openmonet;

create table available_methods_payments
(
    currency_payment_entity_id varchar(255) not null
        constraint fkbndfjxk7pu83rq3240piix2ry
            references available_methods,
    payments_id varchar(255) not null
        constraint uk_k04bs0873nrcpcmek4k8571c7
            unique
        constraint fk8avca5tr6iw3nlqba7rwopi9j
            references payments,
    constraint available_methods_payments_pkey
        primary key (currency_payment_entity_id, payments_id)
);

alter table available_methods_payments owner to openmonet;

create table authorities
(
    id varchar(255) not null
        constraint authorities_pkey
            primary key,
    created timestamp,
    updated timestamp,
    authority varchar(255),
    enabled boolean
);

alter table authorities owner to openmonet;

create table currencies
(
    id varchar(255) not null
        constraint currencies_pkey
            primary key,
    name varchar(255),
    type varchar(255),
    url varchar(255),
    code varchar(3),
    weight integer
);

alter table currencies owner to openmonet;

create table oauth_client_details
(
    client_id varchar(255) not null
        constraint oauth_client_details_pkey
            primary key,
    created timestamp,
    updated timestamp,
    access_token_validity integer,
    additional_information varchar(255),
    authorities varchar(255),
    authorized_grant_types varchar(255),
    autoapprove varchar(255),
    client_secret varchar(255),
    refresh_token_validity integer,
    resource_ids varchar(255),
    scope varchar(255),
    web_server_redirect_uri varchar(255)
);

alter table oauth_client_details owner to openmonet;

create table payment_methods
(
    id varchar(255) not null
        constraint payment_methods_pkey
            primary key,
    created timestamp,
    updated timestamp,
    conditions varchar(255),
    name varchar(255)
        constraint name_constraint
            unique,
    short_name varchar(255),
    translate varchar(255),
    type varchar(255),
    url varchar(255),
    weight integer,
    confirmation_time bigint,
    payment_time bigint,
    confirmation_time_terms varchar(255),
    payment_time_terms varchar(255)
);

alter table payment_methods owner to openmonet;

create table identifications
(
    id varchar(255) not null
        constraint identifications_pkey
            primary key,
    created timestamp,
    updated timestamp,
    current_level varchar(255),
    name varchar(255),
    last_name varchar(255),
    phone varchar(255),
    verify_phone boolean,
    country varchar(255),
    passport varchar(255),
    passport_address varchar(255),
    verify_passport boolean,
    selfie varchar(255),
    verify_selfie boolean,
    address_data varchar(255),
    verify_address_data boolean,
    profile varchar(255),
    additional_identy_check boolean
);

alter table identifications owner to openmonet;

create table users
(
    id varchar(255) not null
        constraint users_pkey
            primary key,
    created timestamp,
    updated timestamp,
    arbitrages numeric(19,2),
    authorities varchar(255),
    enabled boolean,
    deleted boolean,
    locale varchar(255),
    name varchar(255),
    number_deals numeric(19,2),
    password varchar(255),
    phone varchar(255),
    trader_rate integer,
    second_email varchar(255),
    status varchar(255),
    system_trader boolean,
    telegram_chat_id varchar(255),
    telegram_name varchar(255),
    telegram_on boolean,
    trade_mode varchar(255),
    username varchar(255)
        constraint ukr43af9ap4edm43mmtq01oddj6
            unique,
    no_accept_deals integer,
    oauth_client_id varchar(36)
        constraint fkh2r5k8d1coxysoh204qbwptha
            references oauth_client_details,
    identification_id varchar(255)
        constraint users_identification_id_fkey
            references identifications,
    time_zone varchar(7)
);

alter table users owner to openmonet;

create table favorites
(
    id varchar(255) not null
        constraint favorites_pkey
            primary key,
    last timestamp,
    currency varchar(255)
        constraint fkro3harq5byyqsq8a88yqvnnuj
            references currencies,
    payment_method_id varchar(255)
        constraint fkbv4no80n91wh532kitu11c8oj
            references payment_methods,
    profile_id varchar(255)
        constraint fkibik1ybqytthj4stpcktx9ivq
            references users
);

alter table favorites owner to openmonet;

create table notifications
(
    id varchar(255) not null
        constraint notifications_pkey
            primary key,
    created timestamp,
    updated timestamp,
    body varchar(255),
    title varchar(255),
    type integer,
    viewed boolean,
    user_profile_id varchar(255)
        constraint fk8s64nhsgsncfd7pwag0kb790h
            references users,
    params varchar(255)
);

alter table notifications owner to openmonet;

create table pay_informations
(
    id varchar(255) not null
        constraint pay_informations_pkey
            primary key,
    created timestamp,
    updated timestamp,
    account varchar(255),
    payment_method_id varchar(255)
        constraint fk8jdykgxte4pdw22qcmr7i5g8r
            references payment_methods,
    user_id varchar(255)
        constraint fkgyp2u0h0t14x4ls34hq5983ol
            references users,
    card_holder_name varchar(255)
);

alter table pay_informations owner to openmonet;

create table adverts
(
    id varchar(255) not null
        constraint adverts_pkey
            primary key,
    created timestamp,
    updated timestamp,
    action varchar(255),
    active boolean,
    amount numeric(20,8),
    deleted boolean,
    max numeric(20,8),
    min numeric(20,8),
    rate numeric(20,8),
    crypto_currency_id varchar(255)
        constraint fkexuth2dq9ha21h1u46ah9afx0
            references currencies,
    fiat_currency_id varchar(255)
        constraint fke1afk719odt4lbi2d6pfvvsp4
            references currencies,
    pay_information_id varchar(255)
        constraint fk15wkjbq2w6loory6h17qt1pl2
            references pay_informations,
    payment_method_id varchar(255)
        constraint fk4bei7gykey7jxlhfe5pr90wrv
            references payment_methods,
    trader_id varchar(255)
        constraint fkrmoh6m6fl8ggf4ia3oiujmu0w
            references users
);

alter table adverts owner to openmonet;

create table deals
(
    id varchar(255) not null
        constraint deals_pkey
            primary key,
    created timestamp,
    updated timestamp,
    action varchar(5),
    advert_rate numeric(19,2),
    amount numeric(20,8),
    customer_rate numeric(19,2),
    finish_arbitrage timestamp,
    start_arbitrage timestamp,
    deal_status varchar(255),
    advert_id varchar(255)
        constraint fk3p7tsmj2opnwetmxbngnhr5tu
            references adverts,
    crypto_currency_id varchar(255)
        constraint fk7fi5uyvnf1kgkvbtbadafq94n
            references currencies,
    customer_id varchar(255)
        constraint fk55p4ueo767ksurq21aj5a7ka9
            references users,
    customer_pay_information_id varchar(255)
        constraint fkt92lxkikw3n1ram90i9la1vns
            references pay_informations,
    fiat_currency_id varchar(255)
        constraint fkkx55w8856kpwole23pf2v7ch1
            references currencies,
    trader_id varchar(255)
        constraint fko2sxqoab6rujq4l0n2t4yvp97
            references users,
    trader_pay_information_id varchar(255)
        constraint fkqj2sgsivoa8yaug58f68n2cm6
            references pay_informations,
    customer_wallet varchar(255),
    outgoing_tx varchar(255)
);

alter table deals owner to openmonet;

create table confirm_deal_token_entity
(
    token varchar(255) not null
        constraint confirm_deal_token_entity_pkey
            primary key,
    expiration bigint not null,
    expiry_date timestamp,
    deal_id varchar(255)
        constraint fk4mwids9q1t4a6ii3l57cme9xx
            references deals,
    trader_id varchar(255)
        constraint fkhstv299483rmvas26jmgw6324
            references users
);

alter table confirm_deal_token_entity owner to openmonet;

create table feedbacks
(
    id varchar(255) not null
        constraint feedbacks_pkey
            primary key,
    created timestamp,
    updated timestamp,
    comment varchar(255),
    email varchar(255),
    rating integer,
    type varchar(255),
    deal_id varchar(255)
        constraint fk7osj93l25ufw67m5om0ty8ly6
            references deals
);

alter table feedbacks owner to openmonet;

create table user_entity_documents
(
    user_entity_id varchar(255) not null
        constraint fk5jgpb3ral1kk7ld1g6xx525m2
            references users,
    documents varchar(255)
);

alter table user_entity_documents owner to openmonet;

create table wallets
(
    id varchar(255) not null
        constraint wallets_pkey
            primary key,
    created timestamp,
    updated timestamp,
    address varchar(255),
    balance numeric(20,8),
    deleted boolean,
    hold numeric(20,8),
    type varchar(255),
    profile_id varchar(255)
        constraint fkdv8kpd5vavef2vgvlm23xlus7
            references users,
    received numeric(20,8),
    network varchar(36),
    exchange_address varchar(36)
);

alter table wallets owner to openmonet;

create table holds
(
    id varchar(255) not null
        constraint holds_pkey
            primary key,
    created timestamp,
    updated timestamp,
    amount numeric(20,8),
    wallet_id varchar(255)
        constraint holds_wallet_id_fkey
            references wallets,
    deal_id varchar(255)
        constraint holds_deal_id_fkey
            references deals
);

alter table holds owner to openmonet;

create table transactions
(
    id varchar(255) not null
        constraint transactions_pkey
            primary key,
    created timestamp,
    updated timestamp,
    tx_id varchar(255),
    type varchar(255),
    comment varchar(255),
    amount numeric(20,8),
    wallet_id varchar(255)
        constraint transactions_wallet_id_fkey
            references wallets,
    deal_id varchar(255)
        constraint transactions_deal_id_fkey
            references deals,
    user_id varchar(255)
        constraint transactions_user_id_fkey
            references users,
    external_wallet varchar(255)
);

alter table transactions owner to openmonet;

create table confirm_codes
(
    id varchar(255) not null
        constraint confirm_codes_pkey
            primary key,
    created timestamp,
    updated timestamp,
    code varchar(255),
    email varchar(255),
    user_id varchar(255)
        constraint confirm_codes_user_id_fkey
            references users
);

alter table confirm_codes owner to openmonet;

create table adverts_parse_info
(
    id varchar(255) not null
        constraint adverts_parse_info_pkey
            primary key,
    link varchar(255),
    ignore boolean,
    payment_description varchar(8192),
    payment_info_has_changed boolean,
    payment_method varchar(255),
    payment_method_provider varchar(255),
    payment_method_not_found boolean,
    not_active_in_source boolean,
    type varchar(255),
    advert_id varchar(255)
        constraint fkbin0der7p871lkaiyv97b2lxt
            references adverts
);

alter table adverts_parse_info owner to openmonet;

create table deal_time
(
    id varchar(255) not null
        constraint deal_time_pkey
            primary key,
    created timestamp,
    updated timestamp,
    payment_time timestamp,
    confirmation_time timestamp,
    deal_id varchar(255)
        constraint deal_time_deal_id_fkey
            references deals
);

alter table deal_time owner to openmonet;

create table payment_methods_matching
(
    id varchar(255) not null
        constraint payment_methods_matching_pkey
            primary key,
    created timestamp,
    updated timestamp,
    provider_code varchar(255),
    type varchar(255),
    payment_method_id varchar(255)
        constraint fkd4527fv829j4e4eoxq35qea56
            references payment_methods
);

alter table payment_methods_matching owner to openmonet;
