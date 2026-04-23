CREATE TYPE "public"."accountTypeEnum" AS ENUM('freelancer', 'company');--> statement-breakpoint
CREATE TYPE "public"."categoryEnum" AS ENUM('web_development', 'software_development', 'network_engineering', 'cybersecurity', 'devops');--> statement-breakpoint
CREATE TYPE "public"."countryEnum" AS ENUM('be', 'de', 'fr', 'lu');--> statement-breakpoint
CREATE TYPE "public"."languageEnum" AS ENUM('en', 'de', 'fr', 'lu');--> statement-breakpoint
CREATE TYPE "public"."offerStatusEnum" AS ENUM('active', 'paused', 'deleted');--> statement-breakpoint
CREATE TYPE "public"."orderStatusEnum" AS ENUM('pending', 'accepted', 'rejected', 'completed', 'cancelled');--> statement-breakpoint
CREATE TYPE "public"."roleTypeEnum" AS ENUM('user', 'admin');--> statement-breakpoint
CREATE TYPE "public"."skillsEnum" AS ENUM('c', 'csharp', 'cpp', 'go', 'java', 'javascript', 'php', 'python', 'rust', 'typescript');--> statement-breakpoint
CREATE TYPE "public"."workPlaceEnum" AS ENUM('on_site', 'remote', 'hybrid');--> statement-breakpoint
CREATE TABLE "offers" (
	"id" serial PRIMARY KEY NOT NULL,
	"user_id" integer NOT NULL,
	"title" text NOT NULL,
	"description" text NOT NULL,
	"category" "categoryEnum" NOT NULL,
	"skills" "skillsEnum" NOT NULL,
	"hourly_rate" real NOT NULL,
	"duration" integer DEFAULT 1 NOT NULL,
	"work_place" "workPlaceEnum" NOT NULL,
	"location" "countryEnum" NOT NULL,
	"status" "offerStatusEnum" DEFAULT 'active' NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "orders" (
	"id" serial PRIMARY KEY NOT NULL,
	"offer_id" integer NOT NULL,
	"buyer_id" integer NOT NULL,
	"seller_id" integer NOT NULL,
	"price" real NOT NULL,
	"status" "orderStatusEnum" DEFAULT 'pending' NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "profiles" (
	"id" serial PRIMARY KEY NOT NULL,
	"user_id" integer NOT NULL,
	"first_name" text NOT NULL,
	"last_name" text NOT NULL,
	"house_number" integer,
	"street" text,
	"zip" text,
	"country" "countryEnum" NOT NULL,
	"language" "languageEnum",
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp DEFAULT now() NOT NULL,
	CONSTRAINT "profiles_user_id_unique" UNIQUE("user_id")
);
--> statement-breakpoint
CREATE TABLE "users" (
	"id" serial PRIMARY KEY NOT NULL,
	"email" text NOT NULL,
	"password" text NOT NULL,
	"account_type" "accountTypeEnum" NOT NULL,
	"role_type" "roleTypeEnum" NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp DEFAULT now() NOT NULL,
	CONSTRAINT "users_email_unique" UNIQUE("email")
);
--> statement-breakpoint
ALTER TABLE "offers" ADD CONSTRAINT "offers_user_id_users_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "orders" ADD CONSTRAINT "orders_offer_id_offers_id_fk" FOREIGN KEY ("offer_id") REFERENCES "public"."offers"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "orders" ADD CONSTRAINT "orders_buyer_id_users_id_fk" FOREIGN KEY ("buyer_id") REFERENCES "public"."users"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "orders" ADD CONSTRAINT "orders_seller_id_users_id_fk" FOREIGN KEY ("seller_id") REFERENCES "public"."users"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "profiles" ADD CONSTRAINT "profiles_user_id_users_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action;