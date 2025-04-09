library(RPostgreSQL)
library(RPostgres)
library(DBI)

con <- dbConnect(RPostgres::Postgres(),
    dbname = "iris",
    user = "neil",
    password = "Hendrix01",
    options = "-c search_path=iris"
)

q1 <- ("SELECT * from iris")
ti <- dbGetQuery(con, q1)

iris <- iris
dbSendQuery(con, "delete from iris")
tableid <- Id(table = "iris")
dbWriteTable(con, tableid, iris, append = T)
View(ti)
plot1 <- plot(ti$Sepal.Length, ti$Sepal.Width)
View(plot1)
