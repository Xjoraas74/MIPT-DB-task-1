CREATE TABLE "transaction" (
  "transaction_id" serial PRIMARY KEY,
  "product_id" integer not null,
  "customer_id" integer not null,
  "transaction_date" date not null,
  "online_order" boolean,
  "order_status" text not null,
  "list_price" decimal not null
);

CREATE TABLE "product" (
  "id" serial PRIMARY KEY,
  "product_id" integer not null,
  "brand" text,
  "product_line" text,
  "product_class" text,
  "product_size" text,
  "standard_cost" decimal
);

CREATE TABLE "customer" (
  "customer_id" serial PRIMARY KEY,
  "first_name" text not null,
  "last_name" text,
  "gender" text not null,
  "DOB" date not null,
  "job_title" text,
  "job_industry_category" text,
  "wealth_segment" text not null,
  "deceased_indicator" boolean not null,
  "owns_car" boolean not null,
  "address_id" integer,
  "property_valuation" integer not null
);

CREATE TABLE "address" (
  "address_id" serial PRIMARY KEY,
  "address" text not null,
  "postcode" integer not null,
  "state" text not null,
  "country" text not null
);

ALTER TABLE "transaction" ADD FOREIGN KEY ("product_id")  REFERENCES "product" ("id");

ALTER TABLE "transaction" ADD FOREIGN KEY ("customer_id")  REFERENCES "customer" ("customer_id");

ALTER TABLE "customer" ADD FOREIGN KEY ("address_id") REFERENCES "address" ("address_id");
