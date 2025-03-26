library(RPostgreSQL)
library(RPostgres)
library(DBI)

con<- dbConnect(RPostgres::Postgres(),
                dbname="iris",
                user="neil",
                password="Hendrix01",
                options="-c search_path=iris"
                )

q1<- ("SELECT * from iris")
ti<- dbGetQuery(con, q1)

iris<-iris
tableid<- Id(table="iris")
dbWriteTable(con, tableid, iris, overwrite=T)
  