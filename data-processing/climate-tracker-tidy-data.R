library(readr)
library(dplyr)

# Filtering PLEDGE data

maindata <- read_csv("data/climate-pledge-data.csv")
pledgedata <- maindata %>%
  filter(actor_type == "Country") %>%
  select(name, country, end_target, end_target_year, end_target_status, interim_target, interim_target_year)

  # replace strings in targeted columns
pledgedata$end_target[pledgedata$end_target == 'Carbon neutral(ity)'] <- 'Carbon neutrality'
pledgedata$end_target[pledgedata$end_target == 'GHG neutral(ity)'] <- 'GHG neutrality'
pledgedata$end_target[pledgedata$end_target == '1.5°C target'] <- '1.5 degree target'

  # Save pledge data
write_csv(pledgedata, "pledge_data.csv")

# Filtering EMISSIONS data

emissionsdata <- read_csv("data/co2-data.csv")
countrydata <- emissionsdata %>%
  filter(!is.na(iso_code), year>1849) %>%
  select(country, year, iso_code, population, gdp, co2, co2_per_capita, coal_co2, gas_co2, oil_co2, share_global_co2)

  # make year column to the proper date format for mysql
library(lubridate)
countrydata$year <- as.Date(as.character(countrydata$year),
                            format = "%Y")

  # Save emissions data with no null values
countrydata_no_NA <- na.omit(countrydata)
write_csv(countrydata_no_NA, "emissions_nonulldata.csv")

# Filtering SECTOR data

bysectordata <- read_csv("data/bysector-data.csv")
sectordata <-
  bysectordata[!grepl("European Union|World", bysectordata$Country), (invert = TRUE), ] %>%
  select(Country, Sector, "2019":"1990")

  # convert char type year columns to num type
sectordata$"1990" <- as.numeric(sectordata$"1990")
sectordata$"1991" <- as.numeric(sectordata$"1991")
sectordata$"1992" <- as.numeric(sectordata$"1992")
sectordata$"1993" <- as.numeric(sectordata$"1993")
sectordata$"1994" <- as.numeric(sectordata$"1994")
sectordata$"1995" <- as.numeric(sectordata$"1995")
sectordata$"1996" <- as.numeric(sectordata$"1996")
sectordata$"1997" <- as.numeric(sectordata$"1997")
sectordata$"1998" <- as.numeric(sectordata$"1998")
sectordata$"1999" <- as.numeric(sectordata$"1999")
sectordata$"2000" <- as.numeric(sectordata$"2000")
sectordata$"2001" <- as.numeric(sectordata$"2001")
sectordata$"2002" <- as.numeric(sectordata$"2002")
sectordata$"2003" <- as.numeric(sectordata$"2003")
sectordata$"2004" <- as.numeric(sectordata$"2004")
sectordata$"2005" <- as.numeric(sectordata$"2005")
sectordata$"2006" <- as.numeric(sectordata$"2006")
sectordata$"2007" <- as.numeric(sectordata$"2007")
sectordata$"2008" <- as.numeric(sectordata$"2008")
sectordata$"2009" <- as.numeric(sectordata$"2009")
sectordata$"2010" <- as.numeric(sectordata$"2010")
sectordata$"2011" <- as.numeric(sectordata$"2011")
str(sectordata)

  # remove missing values and save as new dataframe
sectordata_nonull <- na.omit(sectordata)

  # Save sector data with no null values as csv file
write_csv(sectordata_nonull, 'sectors-data.csv')

# CSV annual CO2 data for bar race chart
co2data <- emissionsdata %>% 
  filter(!is.na(iso_code), year>1849) %>%
  select(co2, country, year)
co2data_nonull <- na.omit(co2data)
co2data_nonull[is.na(co2data_nonull)] <- 0
write_csv(co2data_nonull, 'co2-data.csv')
