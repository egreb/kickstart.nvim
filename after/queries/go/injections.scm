; extends

; copied (with thanks) from https://github.com/ray-x/go.nvim/blob/master/after/queries/go/injections.scm

; sql

; inject sql in single line strings
; e.g. db.GetContext(ctx, "SELECT * FROM users WHERE name = 'John'")

; neovim 0.10
([
  (interpreted_string_literal_content)
  (raw_string_literal_content)
  ] @injection.content
 (#match? @injection.content "(SELECT|select|INSERT|insert|UPDATE|update|DELETE|delete).+(FROM|from|INTO|into|VALUES|values|SET|set).*(WHERE|where|GROUP BY|group by)?")
 (#offset! @injection.content 0 1 0 -1)
(#set! injection.language "sql"))

; a general query injection
([
   (interpreted_string_literal_content)
   (raw_string_literal)
 ] @sql
 (#match? @sql "(SELECT|select|INSERT|insert|UPDATE|update|DELETE|delete).+(FROM|from|INTO|into|VALUES|values|SET|set).*(WHERE|where|GROUP BY|group by)?")
 (#offset! @sql 0 1 0 -1))

; ----------------------------------------------------------------
; fallback keyword and comment based injection

([
  (interpreted_string_literal_content)
  (raw_string_literal)
 ] @sql
 (#contains? @sql "-- sql" "--sql" "ADD CONSTRAINT" "ALTER TABLE" "ALTER COLUMN"
                  "DATABASE" "FOREIGN KEY" "GROUP BY" "HAVING" "CREATE INDEX" "INSERT INTO"
                  "NOT NULL" "PRIMARY KEY" "UPDATE SET" "TRUNCATE TABLE" "LEFT JOIN" "WITH" "add constraint" "alter table" "alter column" "database" "foreign key" "group by" "having" "create index" "insert into"
                  "not null" "primary key" "update set" "truncate table" "left join")
 (#offset! @sql 0 1 0 -1))

; nvim 0.10
([
  (interpreted_string_literal_content)
  (raw_string_literal)
 ] @injection.content
 (#contains? @injection.content "-- sql" "--sql" "ADD CONSTRAINT" "ALTER TABLE" "ALTER COLUMN"
                  "DATABASE" "FOREIGN KEY" "GROUP BY" "HAVING" "CREATE INDEX" "INSERT INTO"
                  "NOT NULL" "PRIMARY KEY" "UPDATE SET" "TRUNCATE TABLE" "LEFT JOIN" "WITH" "add constraint" "alter table" "alter column" "database" "foreign key" "group by" "having" "create index" "insert into"
                  "not null" "primary key" "update set" "truncate table" "left join")
 (#offset! @injection.content 0 1 0 -1)
 (#set! injection.language "sql"))
