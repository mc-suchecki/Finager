# deleting tags and uncesessary lines
cat iso_currency_codes.xml | grep "<Ccy[M>]" | sed -e 's/<[^">]*>//g' | sed -e 's/^[ \t]*//' > tmp.sql

# merging lines (bash acts weirdly here)
vim tmp.sql

# sorting, deleting N.A. and duplicate values, sorting, converting into SQL
cat tmp.sql | grep "[0-9]" | sort -u | sed 's/\(...\) \([0-9]\)/INSERT INTO Currencies VALUES \(\1, \2\)\;/g' > iso_currency_codes.sql
