CREATE TABLE IF NOT EXISTS "schema_migrations" (
  "version" varchar NOT NULL PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS "ar_internal_metadata" (
  "key" varchar NOT NULL PRIMARY KEY,
  "value" varchar, "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL
);

CREATE TABLE IF NOT EXISTS "admins" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  "first_name" varchar NOT NULL, 
  "last_name" varchar NOT NULL, 
  "email" varchar DEFAULT '' NOT NULL, 
  "encrypted_password" varchar DEFAULT '' NOT NULL, 
  "reset_password_token" varchar, 
  "reset_password_sent_at" datetime, 
  "remember_created_at" datetime, 
  "sign_in_count" integer DEFAULT 0 NOT NULL, 
  "current_sign_in_at" datetime, 
  "last_sign_in_at" datetime, 
  "current_sign_in_ip" varchar, 
  "last_sign_in_ip" varchar, 
  "status" boolean DEFAULT 'f', 
  "created_at" datetime NOT NULL, 
  "updated_at" datetime NOT NULL
);
CREATE TABLE sqlite_sequence(name,seq);
CREATE UNIQUE INDEX "index_admins_on_email" ON "admins" ("email");
CREATE UNIQUE INDEX "index_admins_on_reset_password_token" ON "admins" ("reset_password_token");

CREATE TABLE IF NOT EXISTS "staffs" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  "first_name" varchar NOT NULL, 
  "last_name" varchar NOT NULL, 
  "email" varchar DEFAULT '' NOT NULL, 
  "encrypted_password" varchar DEFAULT '' NOT NULL, 
  "reset_password_token" varchar, 
  "reset_password_sent_at" datetime, 
  "remember_created_at" datetime, 
  "sign_in_count" integer DEFAULT 0 NOT NULL, 
  "current_sign_in_at" datetime, 
  "last_sign_in_at" datetime, 
  "current_sign_in_ip" varchar, 
  "last_sign_in_ip" varchar, 
  "created_at" datetime NOT NULL, 
  "updated_at" datetime NOT NULL
);
CREATE UNIQUE INDEX "index_staffs_on_email" ON "staffs" ("email");
CREATE UNIQUE INDEX "index_staffs_on_reset_password_token" ON "staffs" ("reset_password_token");

CREATE TABLE IF NOT EXISTS "brands" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  "name" varchar NOT NULL, 
  "created_at" datetime NOT NULL, 
  "updated_at" datetime NOT NULL
);

CREATE TABLE IF NOT EXISTS "products" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  "sku" varchar NOT NULL, 
  "name" varchar NOT NULL, 
  "brand_id" integer, 
  "description" text, 
  "limit" integer NOT NULL, 
  "price" decimal(2) NOT NULL, 
  "cost" decimal(2) NOT NULL, 
  "inventory" integer NOT NULL, 
  "created_at" datetime NOT NULL, 
  "updated_at" datetime NOT NULL, 
  CONSTRAINT "fk_rails_f3b4d49caa" FOREIGN KEY ("brand_id") REFERENCES "brands" ("id")
);
CREATE INDEX "index_products_on_brand_id" ON "products" ("brand_id");
CREATE UNIQUE INDEX "index_products_on_sku" ON "products" ("sku");

CREATE TABLE IF NOT EXISTS "stores" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  "name" varchar NOT NULL, 
  "address" text, 
  "email" varchar, 
  "contact_person" varchar DEFAULT '', 
  "contact_number" varchar(11), 
  "created_at" datetime NOT NULL, 
  "updated_at" datetime NOT NULL
);

CREATE TABLE IF NOT EXISTS "deliveries" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  "store_id" integer, 
  "total_items" integer NOT NULL, 
  "total_cost" decimal(2) NOT NULL, 
  "total_price" decimal(2) NOT NULL, 
  "description" text NOT NULL, 
  "status" boolean DEFAULT 'f', 
  "created_at" datetime NOT NULL, 
  "updated_at" datetime NOT NULL, 
  CONSTRAINT "fk_rails_2bc2aaf559" FOREIGN KEY ("store_id") REFERENCES "stores" ("id")
);
CREATE INDEX "index_deliveries_on_store_id" ON "deliveries" ("store_id");

CREATE TABLE IF NOT EXISTS "delivery_products" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  "delivery_id" integer, 
  "product_id" integer, 
  "quantity" integer NOT NULL, 
  "price" decimal(2) NOT NULL, 
  "cost" decimal(2) NOT NULL, 
  "created_at" datetime NOT NULL, 
  "updated_at" datetime NOT NULL, 
  CONSTRAINT "fk_rails_30728471b1" FOREIGN KEY ("delivery_id") REFERENCES "deliveries" ("id"), 
  CONSTRAINT "fk_rails_eabf57a855" FOREIGN KEY ("product_id") REFERENCES "products" ("id")
);
CREATE INDEX "index_delivery_products_on_delivery_id" ON "delivery_products" ("delivery_id");
CREATE INDEX "index_delivery_products_on_product_id" ON "delivery_products" ("product_id");

CREATE TABLE IF NOT EXISTS "pullouts" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  "store_id" integer, 
  "total_items" integer NOT NULL, 
  "total_cost" decimal(2) NOT NULL, 
  "total_price" decimal(2) NOT NULL, 
  "description" text, 
  "created_at" datetime NOT NULL, 
  "updated_at" datetime NOT NULL, 
  CONSTRAINT "fk_rails_387edf3bad" FOREIGN KEY ("store_id") REFERENCES "stores" ("id")
);
CREATE INDEX "index_pullouts_on_store_id" ON "pullouts" ("store_id");

CREATE TABLE IF NOT EXISTS "pullout_products" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  "pullout_id" integer, 
  "product_id" integer, 
  "quantity" integer NOT NULL, 
  "price" decimal(2) NOT NULL, 
  "cost" decimal(2) NOT NULL, 
  "created_at" datetime NOT NULL, 
  "updated_at" datetime NOT NULL, 
  CONSTRAINT "fk_rails_d39ab2faf0" FOREIGN KEY ("pullout_id") REFERENCES "pullouts" ("id"), 
  CONSTRAINT "fk_rails_ab32f531e7" FOREIGN KEY ("product_id") REFERENCES "products" ("id")
);
CREATE INDEX "index_pullout_products_on_pullout_id" ON "pullout_products" ("pullout_id");
CREATE INDEX "index_pullout_products_on_product_id" ON "pullout_products" ("product_id");

CREATE TABLE IF NOT EXISTS "store_products" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  "store_id" integer, "product_id" integer, 
  "inventory" integer DEFAULT 0, 
  "created_at" datetime NOT NULL, 
  "updated_at" datetime NOT NULL, 
  CONSTRAINT "fk_rails_f80750e323" FOREIGN KEY ("store_id") REFERENCES "stores" ("id"), 
  CONSTRAINT "fk_rails_814f36e860" FOREIGN KEY ("product_id") REFERENCES "products" ("id")
);
CREATE INDEX "index_store_products_on_store_id" ON "store_products" ("store_id");
CREATE INDEX "index_store_products_on_product_id" ON "store_products" ("product_id");

CREATE TABLE IF NOT EXISTS "ending_inventories" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  "store_id" integer, "sales" decimal(2), 
  "cogs" decimal(2), "created_at" datetime NOT NULL, 
  "updated_at" datetime NOT NULL, 
  CONSTRAINT "fk_rails_02635e5413" FOREIGN KEY ("store_id") REFERENCES "stores" ("id")
);
CREATE INDEX "index_ending_inventories_on_store_id" ON "ending_inventories" ("store_id");

CREATE TABLE IF NOT EXISTS "ending_inventory_products" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  "product_id" integer, 
  "ending_inventory_id" integer, 
  "beginning_quantity" integer, 
  "ending_quantity" integer, 
  "price" decimal(2), 
  "cost" decimal(2), 
  "created_at" datetime NOT NULL, 
  "updated_at" datetime NOT NULL, 
  CONSTRAINT "fk_rails_218b651e01" FOREIGN KEY ("product_id") REFERENCES "products" ("id"), 
  CONSTRAINT "fk_rails_0be61c9f76" FOREIGN KEY ("ending_inventory_id") REFERENCES "ending_inventories" ("id")
);
CREATE INDEX "index_ending_inventory_products_on_product_id" ON "ending_inventory_products" ("product_id");
CREATE INDEX "index_ending_inventory_products_on_ending_inventory_id" ON "ending_inventory_products" ("ending_inventory_id");

CREATE TABLE IF NOT EXISTS "suppliers" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  "name" varchar, 
  "email" varchar, 
  "address" text, 
  "contact_person" varchar, 
  "contact_number" varchar, 
  "created_at" datetime NOT NULL, 
  "updated_at" datetime NOT NULL
);

CREATE TABLE IF NOT EXISTS "supplier_products" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  "supplier_id" integer, 
  "product_id" integer, 
  "created_at" datetime NOT NULL, 
  "updated_at" datetime NOT NULL, 
  CONSTRAINT "fk_rails_8e1c65b71a" FOREIGN KEY ("supplier_id") REFERENCES "suppliers" ("id"), 
  CONSTRAINT "fk_rails_9a363579c5" FOREIGN KEY ("product_id") REFERENCES "products" ("id")
);
CREATE INDEX "index_supplier_products_on_supplier_id" ON "supplier_products" ("supplier_id");
CREATE INDEX "index_supplier_products_on_product_id" ON "supplier_products" ("product_id");

CREATE TABLE IF NOT EXISTS "orders" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  "supplier_id" integer, 
  "total_items" integer, 
  "created_at" datetime NOT NULL, 
  "updated_at" datetime NOT NULL, 
  CONSTRAINT "fk_rails_d426350910" FOREIGN KEY ("supplier_id") REFERENCES "suppliers" ("id")
);
CREATE INDEX "index_orders_on_supplier_id" ON "orders" ("supplier_id");


CREATE TABLE IF NOT EXISTS "order_products" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  "order_id" integer, 
  "product_id" integer, 
  "quantity" integer NOT NULL, 
  "created_at" datetime NOT NULL, 
  "updated_at" datetime NOT NULL, 
  CONSTRAINT "fk_rails_f40b8ccee4" FOREIGN KEY ("order_id") REFERENCES "orders" ("id"), 
  CONSTRAINT "fk_rails_96c0709f78" FOREIGN KEY ("product_id") REFERENCES "products" ("id")
);
CREATE INDEX "index_order_products_on_order_id" ON "order_products" ("order_id");
CREATE INDEX "index_order_products_on_product_id" ON "order_products" ("product_id");

CREATE TABLE IF NOT EXISTS "transfers" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  "store_to_id" integer NOT NULL, 
  "store_from_id" integer NOT NULL, 
  "pullout_id" integer, 
  "delivery_id" integer, 
  "created_at" datetime NOT NULL, 
  "updated_at" datetime NOT NULL, 
  CONSTRAINT "fk_rails_e17d874424" FOREIGN KEY ("pullout_id") REFERENCES "pullouts" ("id"), 
  CONSTRAINT "fk_rails_e39f650b13" FOREIGN KEY ("delivery_id") REFERENCES "deliveries" ("id")
);
CREATE INDEX "index_transfers_on_store_to_id" ON "transfers" ("store_to_id");
CREATE INDEX "index_transfers_on_store_from_id" ON "transfers" ("store_from_id");
CREATE INDEX "index_transfers_on_pullout_id" ON "transfers" ("pullout_id");
CREATE INDEX "index_transfers_on_delivery_id" ON "transfers" ("delivery_id");

CREATE TABLE IF NOT EXISTS "transfer_products" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  "transfer_id" integer, 
  "product_id" integer, 
  "quantity" integer NOT NULL, 
  "created_at" datetime NOT NULL, 
  "updated_at" datetime NOT NULL, 
  CONSTRAINT "fk_rails_b02108c5c4" FOREIGN KEY ("transfer_id") REFERENCES "transfers" ("id"), 
  CONSTRAINT "fk_rails_9899e2357d" FOREIGN KEY ("product_id") REFERENCES "products" ("id")
);
CREATE INDEX "index_transfer_products_on_transfer_id" ON "transfer_products" ("transfer_id");
CREATE INDEX "index_transfer_products_on_product_id" ON "transfer_products" ("product_id");

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