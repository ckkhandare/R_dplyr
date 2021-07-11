#dplyr
library(dplyr)
?dplyr
library(readxl)
SalesData <- read_excel("D:/Users/HP/Downloads/SalesData.xlsx")
View(SalesData)
attach(SalesData)
df <- attach(SalesData)
View(df)
sal <- tbl_df(SalesData)
sal <- as_tibble(SalesData)
View(sal)
sal

#Filter
sal %>% filter(sal$Product=="Carretera")
sal %>%  select(Segment,Country,Product) %>%  filter(Product=="Velo")
Carreteradata <- sal %>% filter(sal$Product=="Carretera")
View(Carreteradata)


#select 
specific <- sal %>% select(Country,Sales,Year)
View(specific)
sal %>% select(Country,Sales,Year,contains("Montana"))
sal %>% select(Country,Sales,Year,contains("Canada"))
sal %>% select(Country,Sales,Year,contains("Sold"))
sal %>%  select(Segment,Country,Product)
sal %>% select(Country,`Units Sold`)

#select and arrange
sal %>% select(Country,`Units Sold`) %>%  arrange(`Units Sold`)
sal %>% select(Country,`Units Sold`) %>%  arrange(dsc(`Units Sold`))
sal %>% select(Country,`Units Sold`) %>%  arrange(desc(`Units Sold`))
sal %>% select(Segment,Country,Product)

#mutate
sal %>% select(Segment,Country,Product) %>% mutate(totalsales = `Units Sold`* `Sale Price`)
totlsal <- sal %>% select(Segment,Country,Product) %>% mutate(totalsales = `Units Sold`* `Sale Price`)

#groupby
sal %>%  group_by(Country) %>% summarise(ttlunit = sum(`Units Sold`), na.rm=T )
sal %>%  group_by(Country) %>% summarise(ttlunit = sum(`Units Sold`, na.rm=T ))
