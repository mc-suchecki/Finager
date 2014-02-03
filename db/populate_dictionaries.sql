-- Account types
INSERT INTO account_types VALUES (DEFAULT, 'Bank account');
INSERT INTO account_types VALUES (DEFAULT, 'Cash');
INSERT INTO account_types VALUES (DEFAULT, 'Credit card');

-- Transaction categories
INSERT INTO categories VALUES (1, 'Income', NULL);
INSERT INTO categories VALUES (2, 'Food', NULL);
INSERT INTO categories VALUES (3, 'Leisure', NULL);
INSERT INTO categories VALUES (4, 'Clothing', NULL);
INSERT INTO categories VALUES (5, 'Alcohol and tobacco', NULL);
INSERT INTO categories VALUES (6, 'Transportation', NULL);
INSERT INTO categories VALUES (7, 'Health and beauty', NULL);
INSERT INTO categories VALUES (8, 'Household', NULL);
INSERT INTO categories VALUES (9, 'Bills', NULL);
INSERT INTO categories VALUES (10, 'Family', NULL);
INSERT INTO categories VALUES (11, 'Transfer', NULL);
ALTER SEQUENCE categories_category_id_seq RESTART WITH 100;
-- Incomes category subcategories
INSERT INTO categories VALUES (DEFAULT, 'Salary', 1);
INSERT INTO categories VALUES (DEFAULT, 'Bonus', 1);
INSERT INTO categories VALUES (DEFAULT, 'Scholarship', 1);
INSERT INTO categories VALUES (DEFAULT, 'Other income', 1);
-- Food category subcategories
INSERT INTO categories VALUES (DEFAULT, 'Groceries', 2);
INSERT INTO categories VALUES (DEFAULT, 'Lunch', 2);
INSERT INTO categories VALUES (DEFAULT, 'Eating out', 2);
INSERT INTO categories VALUES (DEFAULT, 'Coffee and snacks', 2);
-- Leisure category subcategories
INSERT INTO categories VALUES (DEFAULT, 'Music', 3);
INSERT INTO categories VALUES (DEFAULT, 'Movies', 3);
INSERT INTO categories VALUES (DEFAULT, 'Books and magazines', 3);
INSERT INTO categories VALUES (DEFAULT, 'Party', 3);
INSERT INTO categories VALUES (DEFAULT, 'Gifts', 3);
INSERT INTO categories VALUES (DEFAULT, 'Games', 3);
INSERT INTO categories VALUES (DEFAULT, 'Concerts', 3);
-- Clothing category subcategories
INSERT INTO categories VALUES (DEFAULT, 'Clothes', 4);
INSERT INTO categories VALUES (DEFAULT, 'Shoes', 4);
INSERT INTO categories VALUES (DEFAULT, 'Accessories', 4);
-- Alcohol and tobacco category subcategories
INSERT INTO categories VALUES (DEFAULT, 'Alcohol', 5);
INSERT INTO categories VALUES (DEFAULT, 'Tobacco', 5);
-- Transportation category subcategories
INSERT INTO categories VALUES (DEFAULT, 'Fuel', 6);
INSERT INTO categories VALUES (DEFAULT, 'Public transportation', 6);
INSERT INTO categories VALUES (DEFAULT, 'Taxi', 6);
INSERT INTO categories VALUES (DEFAULT, 'Car maintenance', 6);
-- Health and beauty category subcategories
INSERT INTO categories VALUES (DEFAULT, 'Cosmetics', 7);
INSERT INTO categories VALUES (DEFAULT, 'Sports', 7);
INSERT INTO categories VALUES (DEFAULT, 'Medicine', 7);
INSERT INTO categories VALUES (DEFAULT, 'Vitamins', 7);
-- Household category subcategories
INSERT INTO categories VALUES (DEFAULT, 'Rent and mortgage', 8);
INSERT INTO categories VALUES (DEFAULT, 'Electronics', 8);
INSERT INTO categories VALUES (DEFAULT, 'Appliances', 8);
INSERT INTO categories VALUES (DEFAULT, 'Furniture', 8);
INSERT INTO categories VALUES (DEFAULT, 'House maintenance', 8);
-- Bills category subcategories
INSERT INTO categories VALUES (DEFAULT, 'Internet', 9);
INSERT INTO categories VALUES (DEFAULT, 'Cold water', 9);
INSERT INTO categories VALUES (DEFAULT, 'Hot water', 9);
INSERT INTO categories VALUES (DEFAULT, 'Electric', 9);
INSERT INTO categories VALUES (DEFAULT, 'Heating', 9);
INSERT INTO categories VALUES (DEFAULT, 'Gas', 9);
INSERT INTO categories VALUES (DEFAULT, 'Telephone', 9);
INSERT INTO categories VALUES (DEFAULT, 'Tv', 9);
INSERT INTO categories VALUES (DEFAULT, 'Garbage and recycling', 9);
-- Family category subcategories
INSERT INTO categories VALUES (DEFAULT, 'Child care', 10);
INSERT INTO categories VALUES (DEFAULT, 'Child clothing', 10);
INSERT INTO categories VALUES (DEFAULT, 'Child education', 10);
INSERT INTO categories VALUES (DEFAULT, 'Toys', 10);
-- Transfer category subcategories
INSERT INTO categories VALUES (DEFAULT, 'Transfer', 11);