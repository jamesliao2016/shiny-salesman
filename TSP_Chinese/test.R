all_cities = readRDS("data/cities.rds")

distance_matrix = readRDS("D:/GIT/shiny-salesman-DEMO-1/data/distance_matrix.rds")
library(maps)
library(mapdata)
china <- map_data("china")
map('china')
map("world", col="#f3f3f3", fill=TRUE, lwd=0.2, mar=margins)
china <- map("china")
china <- map("world")

library(ggmap)
library(mapproj)
## Google啊Google给我China的地图数据吧
map <- get_map(location = 'China', zoom = 4)
ggmap(map)

test_dt = readRDS("D:/GIT/shiny-salesman-DEMO-1/data/cities.rds")
test_dt = test_dt[test_dt$country.etc == 'China',]
saveRDS(test_dt, file = "D:/GIT/shiny-salesman-DEMO-1/data/china_cities.rds")
