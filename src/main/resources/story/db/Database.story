Description: Simple Database result set test

Scenario: Verify database result set
When I execute SQL query `
SELECT id, name
FROM rnc_taxonomy
ORDER by id
LIMIT 10
` against `rna` and save result to scenario variable `data`
Then `${data}` matching rows using `id` from `rna` is equal to data from:
|id|name                     |
|1 |root                     |
|2 |Bacteria                 |
|6 |Azorhizobium             |
|7 |Azorhizobium caulinodans |
|9 |Buchnera aphidicola      |
|10|Cellvibrio               |
|11|Cellulomonas gilvus      |
|12|Photobacterium profundum |
|13|Dictyoglomus             |
|14|Dictyoglomus thermophilum|
