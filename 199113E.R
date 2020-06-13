#load two data sets
Mahaseason = read.csv("paddy_production_in_maha_season_1952-2012.csv", header = TRUE)

Yalaseason = read.csv("paddy_production_in_yala_season_1952_2012.csv", header = TRUE)

#read selected raws from the maha season dataset
Datamaha = Mahaseason[60:61,]
Datamaha

#read selected raws from the yala season dataset
Datayala = Yalaseason[60:61,]
Datayala

install.packages("tidyverse")
library(tidyverse)

#rename the column
Maha = Datamaha %>% 
        rename(
                Year = Maha.Season
        )
Maha

Yala = Datayala %>% 
        rename(
                Year = Yala.Season
        )
Yala

#create new dataset combining the two datasets
data = rbind(Maha, Yala)
data

#add new column called season
data$season <- c ("Maha","Maha","Yala","Yala")
data

#drawing histogram

ggplot(data, aes(fill=season, y=Production.000.Bushels, x=Year)) +
        geom_bar(position="dodge", stat="identity")

summary(data)

 
ggplot(data, aes(fill=season, y=Average.Yield.Kg.Ha, x=Year)) +
        geom_bar(position="dodge", stat="identity")






 
 