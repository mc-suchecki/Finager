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
	user_id serial NOT NULL,
	e_mail varchar(64) NOT NULL,
	name varchar(64) NOT NULL,
	surname varchar(64) NOT NULL,
	CONSTRAINT users_pk PRIMARY KEY (user_id),
	CONSTRAINT e_mail_uk UNIQUE (e_mail)

);
-- ddl-end --
-- object: public.roles | type: TABLE --
CREATE TABLE public.roles(
	user_id integer NOT NULL,
	role char(10) NOT NULL,
	CONSTRAINT roles_pk PRIMARY KEY (user_id,role)

);
-- ddl-end --
-- object: public.accounts | type: TABLE --
CREATE TABLE public.accounts(
	account_id serial NOT NULL,
	user_id integer NOT NULL,
	account_type_id smallint NOT NULL,
	currency_code char(3) NOT NULL,
	balance numeric(12,4) NOT NULL DEFAULT 0,
	name varchar(64) NOT NULL,
	CONSTRAINT accounts_pk PRIMARY KEY (account_id)

);
-- ddl-end --
COMMENT ON COLUMN public.accounts.currency_code IS 'ISO 4217 currency code.';
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
	transaction_number bigserial NOT NULL,
	account_id integer NOT NULL,
	category_id smallint NOT NULL,
	transaction_date date NOT NULL,
	value_transferred numeric(12,4) NOT NULL,
	account_balance_after numeric(12,4) NOT NULL,
	description varchar(255),
	CONSTRAINT transactions_pk PRIMARY KEY (transaction_number,account_id)

);
-- ddl-end --
COMMENT ON COLUMN public.transactions.value_transferred IS 'Money amount transferred within the transaction.';
-- ddl-end --
COMMENT ON COLUMN public.transactions.account_balance_after IS 'Balance in account after the transaction.';
-- ddl-end --
-- ddl-end --

-- object: public.categories | type: TABLE --
CREATE TABLE public.categories(
	category_id smallserial NOT NULL,
	name varchar(64) NOT NULL,
	parent_id smallint,
	CONSTRAINT categories_pk PRIMARY KEY (category_id)

);
-- ddl-end --
-- object: public.account_types | type: TABLE --
CREATE TABLE public.account_types(
	account_type_id smallserial NOT NULL,
	name varchar(64) NOT NULL,
	CONSTRAINT account_types_pk PRIMARY KEY (account_type_id)

);
-- ddl-end --
-- object: users_fk | type: CONSTRAINT --
ALTER TABLE public.accounts ADD CONSTRAINT users_fk FOREIGN KEY (user_id)
REFERENCES public.users (user_id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --


-- object: currencies_fk | type: CONSTRAINT --
ALTER TABLE public.accounts ADD CONSTRAINT currencies_fk FOREIGN KEY (currency_code)
REFERENCES public.currencies (iso_code) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --


-- object: account_types_fk | type: CONSTRAINT --
ALTER TABLE public.accounts ADD CONSTRAINT account_types_fk FOREIGN KEY (account_type_id)
REFERENCES public.account_types (account_type_id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --


-- object: categories_fk | type: CONSTRAINT --
ALTER TABLE public.transactions ADD CONSTRAINT categories_fk FOREIGN KEY (category_id)
REFERENCES public.categories (category_id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --


-- object: categories_fk | type: CONSTRAINT --
ALTER TABLE public.categories ADD CONSTRAINT categories_fk FOREIGN KEY (parent_id)
REFERENCES public.categories (category_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --


-- object: accounts_fk | type: CONSTRAINT --
ALTER TABLE public.transactions ADD CONSTRAINT accounts_fk FOREIGN KEY (account_id)
REFERENCES public.accounts (account_id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --


-- object: users_roles_fk | type: CONSTRAINT --
ALTER TABLE public.roles ADD CONSTRAINT users_roles_fk FOREIGN KEY (user_id)
REFERENCES public.users (user_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --



