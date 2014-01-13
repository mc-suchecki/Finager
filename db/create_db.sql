-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- PostgreSQL version: 9.3
-- Project Site: pgmodeler.com.br
-- Model Author: ---

SET check_function_bodies = false;
-- ddl-end --


-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: finager | type: DATABASE --
-- CREATE DATABASE finager
-- ;
-- -- ddl-end --
-- 

-- object: public.users | type: TABLE --
CREATE TABLE public.users(
	id_user serial NOT NULL,
	e_mail varchar(64) NOT NULL,
	password_hash char(64) NOT NULL,
	name varchar(64) NOT NULL,
	surname varchar(64) NOT NULL,
	password_salt char(16),
	CONSTRAINT users_pk PRIMARY KEY (id_user),
	CONSTRAINT e_mail_uk UNIQUE (e_mail)

);
-- ddl-end --
COMMENT ON COLUMN public.users.password_hash IS 'SHA-256 hash of the password used by the user.';
-- ddl-end --
COMMENT ON COLUMN public.users.password_salt IS 'Salt of the password concatenated before calculating the hash.';
-- ddl-end --
-- ddl-end --

-- object: public.roles | type: TABLE --
CREATE TABLE public.roles(
	id_user integer NOT NULL,
	role char(10) NOT NULL,
	CONSTRAINT roles_pk PRIMARY KEY (id_user,role)

);
-- ddl-end --
-- object: public.accounts | type: TABLE --
CREATE TABLE public.accounts(
	id_account serial NOT NULL,
	id_user integer NOT NULL,
	id_account_type smallint NOT NULL,
	id_currency char(3) NOT NULL,
	name varchar(64) NOT NULL,
	balance numeric(12,4) NOT NULL DEFAULT 0,
	CONSTRAINT accounts_pk PRIMARY KEY (id_account)

);
-- ddl-end --
COMMENT ON COLUMN public.accounts.id_currency IS 'ISO 4217 currency code.';
-- ddl-end --
COMMENT ON COLUMN public.accounts.balance IS 'Current balance of the account.';
-- ddl-end --
-- ddl-end --

-- object: public.currencies | type: TABLE --
CREATE TABLE public.currencies(
	iso_code char(3) NOT NULL,
	digits_after_separator numeric NOT NULL DEFAULT 2,
	CONSTRAINT currencies_pk PRIMARY KEY (iso_code)

);
-- ddl-end --
COMMENT ON COLUMN public.currencies.iso_code IS 'ISO 4217 currency code.';
-- ddl-end --
COMMENT ON COLUMN public.currencies.digits_after_separator IS 'Number of digits after the decimal separator.';
-- ddl-end --
-- ddl-end --

-- object: public.transactions | type: TABLE --
CREATE TABLE public.transactions(
	id_transaction bigserial NOT NULL,
	id_category smallint NOT NULL,
	value_transferred numeric(12,4) NOT NULL,
	account_to_balance_after numeric(12,4),
	account_from_balance_after numeric(12,4),
	description varchar(255),
	id_account_to integer,
	id_account_from integer,
	transaction_date date NOT NULL,
	CONSTRAINT transactions_pk PRIMARY KEY (id_transaction)

);
-- ddl-end --
COMMENT ON COLUMN public.transactions.value_transferred IS 'Money amount transferred within the transaction.';
-- ddl-end --
COMMENT ON COLUMN public.transactions.account_to_balance_after IS 'Balance in account_to after the transaction.';
-- ddl-end --
COMMENT ON COLUMN public.transactions.account_from_balance_after IS 'Balance in account_from after the transaction.';
-- ddl-end --
-- ddl-end --

-- object: public.categories | type: TABLE --
CREATE TABLE public.categories(
	id_category smallserial NOT NULL,
	name varchar(64) NOT NULL,
	id_parent smallint,
	CONSTRAINT categories_pk PRIMARY KEY (id_category)

);
-- ddl-end --
-- object: public.account_types | type: TABLE --
CREATE TABLE public.account_types(
	id_account_type smallserial NOT NULL,
	name varchar(64) NOT NULL,
	CONSTRAINT account_types_pk PRIMARY KEY (id_account_type)

);
-- ddl-end --
-- object: users_fk | type: CONSTRAINT --
ALTER TABLE public.accounts ADD CONSTRAINT users_fk FOREIGN KEY (id_user)
REFERENCES public.users (id_user) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --


-- object: currencies_fk | type: CONSTRAINT --
ALTER TABLE public.accounts ADD CONSTRAINT currencies_fk FOREIGN KEY (id_currency)
REFERENCES public.currencies (iso_code) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --


-- object: account_types_fk | type: CONSTRAINT --
ALTER TABLE public.accounts ADD CONSTRAINT account_types_fk FOREIGN KEY (id_account_type)
REFERENCES public.account_types (id_account_type) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --


-- object: categories_fk | type: CONSTRAINT --
ALTER TABLE public.transactions ADD CONSTRAINT categories_fk FOREIGN KEY (id_category)
REFERENCES public.categories (id_category) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --


-- object: categories_fk | type: CONSTRAINT --
ALTER TABLE public.categories ADD CONSTRAINT categories_fk FOREIGN KEY (id_parent)
REFERENCES public.categories (id_category) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --


-- object: users_roles_fk | type: CONSTRAINT --
ALTER TABLE public.roles ADD CONSTRAINT users_roles_fk FOREIGN KEY (id_user)
REFERENCES public.users (id_user) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: "Transaction_has_source" | type: CONSTRAINT --
ALTER TABLE public.transactions ADD CONSTRAINT "Transaction_has_source" FOREIGN KEY (id_account_from)
REFERENCES public.accounts (id_account) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: "Transaction_has_destination" | type: CONSTRAINT --
ALTER TABLE public.transactions ADD CONSTRAINT "Transaction_has_destination" FOREIGN KEY (id_account_to)
REFERENCES public.accounts (id_account) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --



