Description: Simple Database result set test
Meta:
    @skip

!-- to be able to run this story:
!-- 1. Remove @skip annotitation
!-- 2. Add vividus-plugin-db into project dependencies (build.gradle)
!-- 3. Add postgresql into project dependencies (build.gradle)
!-- 4. Specify database connection settings in properties:
!--    db.connection.rna.driver-class-name=org.postgresql.Driver
!--    db.connection.rna.url=jdbc:postgresql://hh-pgsql-public.ebi.ac.uk:5432/pfmegrnargs
!--    db.connection.rna.username=reader
!--    db.connection.rna.password=ENC(RMVX9NZSnf4cvjQFs7FPWZ5SOFvngQOQ4Y3+ugSWhas=)

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
