SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admins; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE admins (
    id bigint NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    status boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE admins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE admins_id_seq OWNED BY admins.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: brands; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE brands (
    id bigint NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: brands_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE brands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE brands_id_seq OWNED BY brands.id;


--
-- Name: deliveries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE deliveries (
    id bigint NOT NULL,
    store_id bigint,
    total_items integer NOT NULL,
    total_cost numeric(10,2) NOT NULL,
    total_price numeric(10,2) NOT NULL,
    description text NOT NULL,
    status boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: deliveries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE deliveries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: deliveries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE deliveries_id_seq OWNED BY deliveries.id;


--
-- Name: delivery_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE delivery_products (
    id bigint NOT NULL,
    delivery_id bigint,
    product_id bigint,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL,
    cost numeric(10,2) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: delivery_products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE delivery_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: delivery_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE delivery_products_id_seq OWNED BY delivery_products.id;


--
-- Name: ending_inventories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ending_inventories (
    id bigint NOT NULL,
    store_id bigint,
    sales numeric(10,2),
    cogs numeric(10,2),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: ending_inventories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ending_inventories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ending_inventories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ending_inventories_id_seq OWNED BY ending_inventories.id;


--
-- Name: ending_inventory_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ending_inventory_products (
    id bigint NOT NULL,
    product_id bigint,
    ending_inventory_id bigint,
    beginning_quantity integer,
    ending_quantity integer,
    price numeric(10,2),
    cost numeric(10,2),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: ending_inventory_products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ending_inventory_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ending_inventory_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ending_inventory_products_id_seq OWNED BY ending_inventory_products.id;


--
-- Name: order_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE order_products (
    id bigint NOT NULL,
    order_id bigint,
    product_id bigint,
    quantity integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: order_products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE order_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: order_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE order_products_id_seq OWNED BY order_products.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE orders (
    id bigint NOT NULL,
    supplier_id bigint,
    total_items integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE orders_id_seq OWNED BY orders.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE products (
    id bigint NOT NULL,
    sku character varying NOT NULL,
    name character varying NOT NULL,
    brand_id bigint,
    description text,
    "limit" integer NOT NULL,
    price numeric(10,2) NOT NULL,
    cost numeric(10,2) NOT NULL,
    inventory integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE products_id_seq OWNED BY products.id;


--
-- Name: pullout_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pullout_products (
    id bigint NOT NULL,
    pullout_id bigint,
    product_id bigint,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL,
    cost numeric(10,2) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: pullout_products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pullout_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pullout_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pullout_products_id_seq OWNED BY pullout_products.id;


--
-- Name: pullouts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pullouts (
    id bigint NOT NULL,
    store_id bigint,
    total_items integer NOT NULL,
    total_cost numeric(10,2) NOT NULL,
    total_price numeric(10,2) NOT NULL,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: pullouts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pullouts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pullouts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pullouts_id_seq OWNED BY pullouts.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: staffs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE staffs (
    id bigint NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: staffs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE staffs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: staffs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE staffs_id_seq OWNED BY staffs.id;


--
-- Name: store_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE store_products (
    id bigint NOT NULL,
    store_id bigint,
    product_id bigint,
    inventory integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: store_products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE store_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: store_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE store_products_id_seq OWNED BY store_products.id;


--
-- Name: stores; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stores (
    id bigint NOT NULL,
    name character varying NOT NULL,
    address text,
    email character varying,
    contact_person character varying DEFAULT ''::character varying,
    contact_number character varying(11),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: stores_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE stores_id_seq OWNED BY stores.id;


--
-- Name: supplier_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE supplier_products (
    id bigint NOT NULL,
    supplier_id bigint,
    product_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: supplier_products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE supplier_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: supplier_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE supplier_products_id_seq OWNED BY supplier_products.id;


--
-- Name: suppliers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE suppliers (
    id bigint NOT NULL,
    name character varying,
    email character varying,
    address text,
    contact_person character varying,
    contact_number character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: suppliers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE suppliers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: suppliers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE suppliers_id_seq OWNED BY suppliers.id;


--
-- Name: transfer_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE transfer_products (
    id bigint NOT NULL,
    transfer_id bigint,
    product_id bigint,
    quantity integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: transfer_products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE transfer_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: transfer_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE transfer_products_id_seq OWNED BY transfer_products.id;


--
-- Name: transfers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE transfers (
    id bigint NOT NULL,
    store_to_id bigint NOT NULL,
    store_from_id bigint NOT NULL,
    pullout_id bigint,
    delivery_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: transfers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE transfers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: transfers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE transfers_id_seq OWNED BY transfers.id;


--
-- Name: admins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY admins ALTER COLUMN id SET DEFAULT nextval('admins_id_seq'::regclass);


--
-- Name: brands id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY brands ALTER COLUMN id SET DEFAULT nextval('brands_id_seq'::regclass);


--
-- Name: deliveries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY deliveries ALTER COLUMN id SET DEFAULT nextval('deliveries_id_seq'::regclass);


--
-- Name: delivery_products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY delivery_products ALTER COLUMN id SET DEFAULT nextval('delivery_products_id_seq'::regclass);


--
-- Name: ending_inventories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY ending_inventories ALTER COLUMN id SET DEFAULT nextval('ending_inventories_id_seq'::regclass);


--
-- Name: ending_inventory_products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY ending_inventory_products ALTER COLUMN id SET DEFAULT nextval('ending_inventory_products_id_seq'::regclass);


--
-- Name: order_products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY order_products ALTER COLUMN id SET DEFAULT nextval('order_products_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY products ALTER COLUMN id SET DEFAULT nextval('products_id_seq'::regclass);


--
-- Name: pullout_products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pullout_products ALTER COLUMN id SET DEFAULT nextval('pullout_products_id_seq'::regclass);


--
-- Name: pullouts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pullouts ALTER COLUMN id SET DEFAULT nextval('pullouts_id_seq'::regclass);


--
-- Name: staffs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY staffs ALTER COLUMN id SET DEFAULT nextval('staffs_id_seq'::regclass);


--
-- Name: store_products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY store_products ALTER COLUMN id SET DEFAULT nextval('store_products_id_seq'::regclass);


--
-- Name: stores id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY stores ALTER COLUMN id SET DEFAULT nextval('stores_id_seq'::regclass);


--
-- Name: supplier_products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY supplier_products ALTER COLUMN id SET DEFAULT nextval('supplier_products_id_seq'::regclass);


--
-- Name: suppliers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY suppliers ALTER COLUMN id SET DEFAULT nextval('suppliers_id_seq'::regclass);


--
-- Name: transfer_products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY transfer_products ALTER COLUMN id SET DEFAULT nextval('transfer_products_id_seq'::regclass);


--
-- Name: transfers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY transfers ALTER COLUMN id SET DEFAULT nextval('transfers_id_seq'::regclass);


--
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: brands brands_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);


--
-- Name: deliveries deliveries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY deliveries
    ADD CONSTRAINT deliveries_pkey PRIMARY KEY (id);


--
-- Name: delivery_products delivery_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY delivery_products
    ADD CONSTRAINT delivery_products_pkey PRIMARY KEY (id);


--
-- Name: ending_inventories ending_inventories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ending_inventories
    ADD CONSTRAINT ending_inventories_pkey PRIMARY KEY (id);


--
-- Name: ending_inventory_products ending_inventory_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ending_inventory_products
    ADD CONSTRAINT ending_inventory_products_pkey PRIMARY KEY (id);


--
-- Name: order_products order_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY order_products
    ADD CONSTRAINT order_products_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: pullout_products pullout_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pullout_products
    ADD CONSTRAINT pullout_products_pkey PRIMARY KEY (id);


--
-- Name: pullouts pullouts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pullouts
    ADD CONSTRAINT pullouts_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: staffs staffs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY staffs
    ADD CONSTRAINT staffs_pkey PRIMARY KEY (id);


--
-- Name: store_products store_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY store_products
    ADD CONSTRAINT store_products_pkey PRIMARY KEY (id);


--
-- Name: stores stores_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (id);


--
-- Name: supplier_products supplier_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY supplier_products
    ADD CONSTRAINT supplier_products_pkey PRIMARY KEY (id);


--
-- Name: suppliers suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (id);


--
-- Name: transfer_products transfer_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transfer_products
    ADD CONSTRAINT transfer_products_pkey PRIMARY KEY (id);


--
-- Name: transfers transfers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transfers
    ADD CONSTRAINT transfers_pkey PRIMARY KEY (id);


--
-- Name: index_admins_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_admins_on_email ON admins USING btree (email);


--
-- Name: index_admins_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_admins_on_reset_password_token ON admins USING btree (reset_password_token);


--
-- Name: index_deliveries_on_store_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_deliveries_on_store_id ON deliveries USING btree (store_id);


--
-- Name: index_delivery_products_on_delivery_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_delivery_products_on_delivery_id ON delivery_products USING btree (delivery_id);


--
-- Name: index_delivery_products_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_delivery_products_on_product_id ON delivery_products USING btree (product_id);


--
-- Name: index_ending_inventories_on_store_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ending_inventories_on_store_id ON ending_inventories USING btree (store_id);


--
-- Name: index_ending_inventory_products_on_ending_inventory_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ending_inventory_products_on_ending_inventory_id ON ending_inventory_products USING btree (ending_inventory_id);


--
-- Name: index_ending_inventory_products_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ending_inventory_products_on_product_id ON ending_inventory_products USING btree (product_id);


--
-- Name: index_order_products_on_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_order_products_on_order_id ON order_products USING btree (order_id);


--
-- Name: index_order_products_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_order_products_on_product_id ON order_products USING btree (product_id);


--
-- Name: index_orders_on_supplier_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_supplier_id ON orders USING btree (supplier_id);


--
-- Name: index_products_on_brand_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_products_on_brand_id ON products USING btree (brand_id);


--
-- Name: index_products_on_sku; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_products_on_sku ON products USING btree (sku);


--
-- Name: index_pullout_products_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_pullout_products_on_product_id ON pullout_products USING btree (product_id);


--
-- Name: index_pullout_products_on_pullout_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_pullout_products_on_pullout_id ON pullout_products USING btree (pullout_id);


--
-- Name: index_pullouts_on_store_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_pullouts_on_store_id ON pullouts USING btree (store_id);


--
-- Name: index_staffs_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_staffs_on_email ON staffs USING btree (email);


--
-- Name: index_staffs_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_staffs_on_reset_password_token ON staffs USING btree (reset_password_token);


--
-- Name: index_store_products_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_store_products_on_product_id ON store_products USING btree (product_id);


--
-- Name: index_store_products_on_store_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_store_products_on_store_id ON store_products USING btree (store_id);


--
-- Name: index_supplier_products_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_supplier_products_on_product_id ON supplier_products USING btree (product_id);


--
-- Name: index_supplier_products_on_supplier_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_supplier_products_on_supplier_id ON supplier_products USING btree (supplier_id);


--
-- Name: index_transfer_products_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_transfer_products_on_product_id ON transfer_products USING btree (product_id);


--
-- Name: index_transfer_products_on_transfer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_transfer_products_on_transfer_id ON transfer_products USING btree (transfer_id);


--
-- Name: index_transfers_on_delivery_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_transfers_on_delivery_id ON transfers USING btree (delivery_id);


--
-- Name: index_transfers_on_pullout_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_transfers_on_pullout_id ON transfers USING btree (pullout_id);


--
-- Name: index_transfers_on_store_from_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_transfers_on_store_from_id ON transfers USING btree (store_from_id);


--
-- Name: index_transfers_on_store_to_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_transfers_on_store_to_id ON transfers USING btree (store_to_id);


--
-- Name: ending_inventories fk_rails_02635e5413; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ending_inventories
    ADD CONSTRAINT fk_rails_02635e5413 FOREIGN KEY (store_id) REFERENCES stores(id);


--
-- Name: ending_inventory_products fk_rails_0be61c9f76; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ending_inventory_products
    ADD CONSTRAINT fk_rails_0be61c9f76 FOREIGN KEY (ending_inventory_id) REFERENCES ending_inventories(id);


--
-- Name: ending_inventory_products fk_rails_218b651e01; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ending_inventory_products
    ADD CONSTRAINT fk_rails_218b651e01 FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: deliveries fk_rails_2bc2aaf559; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY deliveries
    ADD CONSTRAINT fk_rails_2bc2aaf559 FOREIGN KEY (store_id) REFERENCES stores(id);


--
-- Name: delivery_products fk_rails_30728471b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY delivery_products
    ADD CONSTRAINT fk_rails_30728471b1 FOREIGN KEY (delivery_id) REFERENCES deliveries(id);


--
-- Name: pullouts fk_rails_387edf3bad; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pullouts
    ADD CONSTRAINT fk_rails_387edf3bad FOREIGN KEY (store_id) REFERENCES stores(id);


--
-- Name: transfers fk_rails_6b7ab047f0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transfers
    ADD CONSTRAINT fk_rails_6b7ab047f0 FOREIGN KEY (store_to_id) REFERENCES stores(id);


--
-- Name: store_products fk_rails_814f36e860; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY store_products
    ADD CONSTRAINT fk_rails_814f36e860 FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: supplier_products fk_rails_8e1c65b71a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY supplier_products
    ADD CONSTRAINT fk_rails_8e1c65b71a FOREIGN KEY (supplier_id) REFERENCES suppliers(id);


--
-- Name: order_products fk_rails_96c0709f78; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY order_products
    ADD CONSTRAINT fk_rails_96c0709f78 FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: transfer_products fk_rails_9899e2357d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transfer_products
    ADD CONSTRAINT fk_rails_9899e2357d FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: supplier_products fk_rails_9a363579c5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY supplier_products
    ADD CONSTRAINT fk_rails_9a363579c5 FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: transfers fk_rails_a658be5735; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transfers
    ADD CONSTRAINT fk_rails_a658be5735 FOREIGN KEY (store_from_id) REFERENCES stores(id);


--
-- Name: pullout_products fk_rails_ab32f531e7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pullout_products
    ADD CONSTRAINT fk_rails_ab32f531e7 FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: transfer_products fk_rails_b02108c5c4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transfer_products
    ADD CONSTRAINT fk_rails_b02108c5c4 FOREIGN KEY (transfer_id) REFERENCES transfers(id);


--
-- Name: pullout_products fk_rails_d39ab2faf0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pullout_products
    ADD CONSTRAINT fk_rails_d39ab2faf0 FOREIGN KEY (pullout_id) REFERENCES pullouts(id);


--
-- Name: orders fk_rails_d426350910; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT fk_rails_d426350910 FOREIGN KEY (supplier_id) REFERENCES suppliers(id);


--
-- Name: transfers fk_rails_e17d874424; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transfers
    ADD CONSTRAINT fk_rails_e17d874424 FOREIGN KEY (pullout_id) REFERENCES pullouts(id);


--
-- Name: transfers fk_rails_e39f650b13; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transfers
    ADD CONSTRAINT fk_rails_e39f650b13 FOREIGN KEY (delivery_id) REFERENCES deliveries(id);


--
-- Name: delivery_products fk_rails_eabf57a855; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY delivery_products
    ADD CONSTRAINT fk_rails_eabf57a855 FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: products fk_rails_f3b4d49caa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY products
    ADD CONSTRAINT fk_rails_f3b4d49caa FOREIGN KEY (brand_id) REFERENCES brands(id);


--
-- Name: order_products fk_rails_f40b8ccee4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY order_products
    ADD CONSTRAINT fk_rails_f40b8ccee4 FOREIGN KEY (order_id) REFERENCES orders(id);


--
-- Name: store_products fk_rails_f80750e323; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY store_products
    ADD CONSTRAINT fk_rails_f80750e323 FOREIGN KEY (store_id) REFERENCES stores(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20180208235255'),
('20180208235317'),
('20180212080244'),
('20180212080251'),
('20180212080263'),
('20180212080273'),
('20180212080349'),
('20180212083250'),
('20180212083434'),
('20180212083741'),
('20180212084304'),
('20180212084826'),
('20180212124737'),
('20180212125109'),
('20180212125216'),
('20180212125300'),
('20180212125448'),
('20180212125601');


