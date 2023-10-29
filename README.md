This is a web app using Express which offers information about emissions and climate pledges by country. It retrieves data from a MySQL database and outputs eCharts graphics dynamically through the creation of APIs.

## My Steps

**1. Data handling**

All original datasets are saved in /data-processing/data/original. I handled the data using R and my workings as well as processed datasets for the database can be found in /data-processing.

**2. Fire up MAMP locally >> phpMyAdmin >> create SQL database >> import datasets**
After processing the data, I created a MySQL database with 4 tables and imported corresponding datasets:
| Table      | Dataset |
| ----------- | ----------- |
| emissions      | emissions_nonulldata.csv       |
| sectorals   | sectors-data.csv        |
| pledges      | pledge_data.csv       |
| recommendations   | recommendations.xlsx        |

To import my database, go to `rwils001_co2.sql`

**3. Set up app in index.js and config_local.js**

`index.js` sets up the app – creating routes for APIs and laying out the indexation of pages that are for display.

`config_local.js` details the connection with the SQL database. The name of the database is rwils001_co2.

**4. Style pages with .ejs files**

Files in `.ejs` format are the HTML pages.

## To view the app on browser

Go to Terminal >> open the folder >> run `npm install` >> run `node index.js`
Go to browser >> load `http://localhost:3000`

Software and packages used in this project include:
•	[UIkit](https://github.com/uikit/uikit)
•	[eCharts](https://echarts.apache.org/handbook/en/get-started/)
•	[Node.js](https://nodejs.org/en/download)
•	[jQuery](https://blog.jquery.com/2022/08/26/jquery-3-6-1-maintenance-release/)



## Attributions

A few parts of this project may not be in the public domain. Attribution and licensing information is described in detail in LICENSE.md.

**Original data sources**

Climate Policy Initiative. 2019-2020_GLCF_Data. 2021. https://www.climatepolicyinitiative.org/wp-content/uploads/2022/01/2019-2020_GLCF_Data.xlsx

Climate Watch. Historical Emissions. 2023. https://www.climatewatchdata.org/data-explorer/historical-emissions?historical-emissions-data-sources=climate-watch&historical-emissions-gases=all-ghg&historical-emissions-regions=All%20Selected&historical-emissions-sectors=agriculture%2Cbunker-fuels%2Celectricity-heat%2Cenergy%2Cfugitive-emissions%2Cindustrial-processes%2Cland-use-change-and-forestry%2Cmanufacturing-construction%2Cother-fuel-combustion%2Ctransportation%2Cwaste%2Cbuilding&page=1

Lang, John, Camilla Hyslop, Zhi Yi Yeo, Richard Black, Peter Chalkley, Thomas Hale, Frederic Hans, Nick Hay, Niklas Höhne, Angel Hsu, Takeshi Kuramochi, Silke Mooldijk, Steve Smith. Net Zero Tracker. Energy and Climate Intelligence Unit, Data-Driven EnviroLab, NewClimate Institute, Oxford Net Zero. 2023. https://download.zerotracker.net/csv/snapshot_2023-04-29_10-09-42.xlsx

NASA’s Goddard Institute for Space. Global Land-Ocean Temperature Index. 2022. https://data.giss.nasa.gov/gistemp/graphs/graph_data/Global_Mean_Estimates_based_on_Land_and_Ocean_Data/graph.txt

Our World in Data. Data on CO2 and Greenhouse Gas Emissions. 2023. https://github.com/owid/co2-data
