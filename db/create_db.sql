-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- PostgreSQL version: 9.3
-- Project Site: pgmodeler.com.br
-- Model Author: ---

SET check_function_bodies = false;
-- ddl-end --


-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: new_database | type: DATABASE --
-- CREATE DATABASE new_database
-- ;
-- -- ddl-end --
-- 

-- object: public."Users" | type: TABLE --
CREATE TABLE public."Users"(
	id_user serial NOT NULL,
	e_mail varchar(64) NOT NULL,
	name varchar(64) NOT NULL,
	surname varchar(64) NOT NULL,
	CONSTRAINT users_pk PRIMARY KEY (id_user),
	CONSTRAINT e_mail_uk UNIQUE (e_mail)

);
-- ddl-end --
-- object: public."Roles" | type: TABLE --
CREATE TABLE public."Roles"(
	id_user integer NOT NULL,
	role char(10) NOT NULL,
	CONSTRAINT roles_pk PRIMARY KEY (id_user,role)

);
-- ddl-end --
-- object: public."Accounts" | type: TABLE --
CREATE TABLE public."Accounts"(
	id_account serial NOT NULL,
	id_user integer NOT NULL,
	id_account_type smallint NOT NULL,
	id_currency char(3) NOT NULL,
	name varchar(64) NOT NULL,
	balance numeric(12,4) NOT NULL DEFAULT 0,
	CONSTRAINT accounts_pk PRIMARY KEY (id_account)

);
-- ddl-end --
COMMENT ON COLUMN public."Accounts".id_currency IS 'ISO 4217 currency code.';
-- ddl-end --
COMMENT ON COLUMN public."Accounts".balance IS 'Current balance of the account.';
-- ddl-end --
-- ddl-end --

-- object: public."Currencies" | type: TABLE --
CREATE TABLE public."Currencies"(
	iso_code char(3) NOT NULL,
	digits_after_separator numeric NOT NULL DEFAULT 2,
	CONSTRAINT currencies_pk PRIMARY KEY (iso_code)

);
-- ddl-end --
COMMENT ON COLUMN public."Currencies".iso_code IS 'ISO 4217 currency code.';
-- ddl-end --
COMMENT ON COLUMN public."Currencies".digits_after_separator IS 'Number of digits after the decimal separator.';
-- ddl-end --
-- ddl-end --

-- object: public."Transactions" | type: TABLE --
CREATE TABLE public."Transactions"(
	id_transaction bigserial NOT NULL,
	id_account_to integer,
	id_account_from integer,
	id_category smallint NOT NULL,
	account_to_balance_after numeric(12,4),
	account_from_balance_after numeric(12,4),
	description varchar(255),
	transaction_date date NOT NULL,
	value_transferred numeric(12,4) NOT NULL,
	CONSTRAINT transactions_pk PRIMARY KEY (id_transaction)

);
-- ddl-end --
COMMENT ON COLUMN public."Transactions".account_to_balance_after IS 'Balance in 'account_to' after the transaction.';
-- ddl-end --
COMMENT ON COLUMN public."Transactions".account_from_balance_after IS 'Balance in 'account_from' after the transaction.';
-- ddl-end --
COMMENT ON COLUMN public."Transactions".value_transferred IS 'Money amount transferred within the transaction.';
-- ddl-end --
-- ddl-end --

-- object: public."Categories" | type: TABLE --
CREATE TABLE public."Categories"(
	id_category smallserial NOT NULL,
	id_parent smallint,
	name varchar(64) NOT NULL,
	CONSTRAINT categories_pk PRIMARY KEY (id_category)

);
-- ddl-end --
-- object: public."Account_types" | type: TABLE --
CREATE TABLE public."Account_types"(
	id_account_type smallserial NOT NULL,
	name varchar(64) NOT NULL,
	CONSTRAINT account_types_pk PRIMARY KEY (id_account_type)

);
-- ddl-end --
-- object: "Users_fk" | type: CONSTRAINT --
ALTER TABLE public."Accounts" ADD CONSTRAINT "Users_fk" FOREIGN KEY (id_user)
REFERENCES public."Users" (id_user) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --


-- object: "Currencies_fk" | type: CONSTRAINT --
ALTER TABLE public."Accounts" ADD CONSTRAINT "Currencies_fk" FOREIGN KEY (id_currency)
REFERENCES public."Currencies" (iso_code) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --


-- object: "Account_types_fk" | type: CONSTRAINT --
ALTER TABLE public."Accounts" ADD CONSTRAINT "Account_types_fk" FOREIGN KEY (id_account_type)
REFERENCES public."Account_types" (id_account_type) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --


-- object: "Categories_fk" | type: CONSTRAINT --
ALTER TABLE public."Transactions" ADD CONSTRAINT "Categories_fk" FOREIGN KEY (id_category)
REFERENCES public."Categories" (id_category) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --


-- object: "Categories_fk" | type: CONSTRAINT --
ALTER TABLE public."Categories" ADD CONSTRAINT "Categories_fk" FOREIGN KEY (id_parent)
REFERENCES public."Categories" (id_category) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --


-- object: users_roles_fk | type: CONSTRAINT --
ALTER TABLE public."Roles" ADD CONSTRAINT users_roles_fk FOREIGN KEY (id_user)
REFERENCES public."Users" (id_user) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: "Transaction_has_source" | type: CONSTRAINT --
ALTER TABLE public."Transactions" ADD CONSTRAINT "Transaction_has_source" FOREIGN KEY (id_account_from)
REFERENCES public."Accounts" (id_account) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: "Transaction_has_destination" | type: CONSTRAINT --
ALTER TABLE public."Transactions" ADD CONSTRAINT "Transaction_has_destination" FOREIGN KEY (id_account_to)
REFERENCES public."Accounts" (id_account) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --



