-- Account types
INSERT INTO account_types VALUES (DEFAULT, 'Bank account');
INSERT INTO account_types VALUES (DEFAULT, 'Cash');
INSERT INTO account_types VALUES (DEFAULT, 'Credit card');

-- Transaction categories
INSERT INTO categories VALUES (1, 'Food', NULL);
INSERT INTO categories VALUES (2, 'Leisure', NULL);
INSERT INTO categories VALUES (3, 'Clothing', NULL);
INSERT INTO categories VALUES (4, 'Alcohol and tobacco', NULL);
INSERT INTO categories VALUES (5, 'Transportation', NULL);
INSERT INTO categories VALUES (6, 'Health and beauty', NULL);
INSERT INTO categories VALUES (7, 'Household', NULL);
INSERT INTO categories VALUES (8, 'Bills', NULL);
INSERT INTO categories VALUES (9, 'Family', NULL);
ALTER SEQUENCE categories_category_id_seq RESTART WITH 10;
-- Food category subcategories
INSERT INTO categories VALUES (DEFAULT, 'Groceries', 1);
INSERT INTO categories VALUES (DEFAULT, 'Lunch', 1);
INSERT INTO categories VALUES (DEFAULT, 'Eating out', 1);
INSERT INTO categories VALUES (DEFAULT, 'Coffee and snacks', 1);
-- Leisure category subcategories
INSERT INTO categories VALUES (DEFAULT, 'Music', 2);
INSERT INTO categories VALUES (DEFAULT, 'Movies', 2);
INSERT INTO categories VALUES (DEFAULT, 'Books and magazines', 2);
INSERT INTO categories VALUES (DEFAULT, 'Party', 2);
INSERT INTO categories VALUES (DEFAULT, 'Gifts', 2);
INSERT INTO categories VALUES (DEFAULT, 'Games', 2);
INSERT INTO categories VALUES (DEFAULT, 'Concerts', 2);
-- Clothing category subcategories
INSERT INTO categories VALUES (DEFAULT, 'Clothes', 3);
INSERT INTO categories VALUES (DEFAULT, 'Shoes', 3);
INSERT INTO categories VALUES (DEFAULT, 'Accessories', 3);
-- Alcohol and tobacco category subcategories
INSERT INTO categories VALUES (DEFAULT, 'Alcohol', 4);
INSERT INTO categories VALUES (DEFAULT, 'Tobacco', 4);
-- Transportation category subcategories
INSERT INTO categories VALUES (DEFAULT, 'Fuel', 5);
INSERT INTO categories VALUES (DEFAULT, 'Public transportation', 5);
INSERT INTO categories VALUES (DEFAULT, 'Taxi', 5);
INSERT INTO categories VALUES (DEFAULT, 'Car maintenance', 5);
-- Health and beauty category subcategories
INSERT INTO categories VALUES (DEFAULT, 'Cosmetics', 6);
INSERT INTO categories VALUES (DEFAULT, 'Sports', 6);
INSERT INTO categories VALUES (DEFAULT, 'Medicine', 6);
INSERT INTO categories VALUES (DEFAULT, 'Vitamins', 6);
-- Household category subcategories
INSERT INTO categories VALUES (DEFAULT, 'Rent and mortgage', 7);
INSERT INTO categories VALUES (DEFAULT, 'Electronics', 7);
INSERT INTO categories VALUES (DEFAULT, 'Appliances', 7);
INSERT INTO categories VALUES (DEFAULT, 'Furniture', 7);
INSERT INTO categories VALUES (DEFAULT, 'House maintenance', 7);
-- Bills category subcategories
INSERT INTO categories VALUES (DEFAULT, 'Internet', 8);
INSERT INTO categories VALUES (DEFAULT, 'Cold water', 8);
INSERT INTO categories VALUES (DEFAULT, 'Hot water', 8);
INSERT INTO categories VALUES (DEFAULT, 'Electric', 8);
INSERT INTO categories VALUES (DEFAULT, 'Heating', 8);
INSERT INTO categories VALUES (DEFAULT, 'Gas', 8);
INSERT INTO categories VALUES (DEFAULT, 'Telephone', 8);
INSERT INTO categories VALUES (DEFAULT, 'Tv', 8);
INSERT INTO categories VALUES (DEFAULT, 'Garbage and recycling', 8);
-- Family category subcategories
INSERT INTO categories VALUES (DEFAULT, 'Child care', 9);
INSERT INTO categories VALUES (DEFAULT, 'Child clothing', 9);
INSERT INTO categories VALUES (DEFAULT, 'Child education', 9);
INSERT INTO categories VALUES (DEFAULT, 'Toys', 9);

INSERT INTO categories VALUES (DEFAULT, 'Other expense', NULL);
