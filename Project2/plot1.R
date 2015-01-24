library(dplyr)
library(ggplot2)

# load data
  NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
  head(NEI)

# Group Data by year
  year <- group_by(NEI, year)

# Get sums of Emissions by year
  year_sums <- summarize(year, sum(Emissions))
  year_sums

# change column names to be readable by plot functions
  colnames(year_sums) <- c("year", "emissions")


# Create PNG file
  png("plot1.png",width=480,height=480,units="px")

  #Create Plot
      with(year_sums, plot(year, emissions, main = "Total PM2.5 Emissions in USA",
                     col = "blue", pch = 19, cex = 1.5))
          abline(reg = lm(emissions ~ year, year_sums))

  dev.off()
