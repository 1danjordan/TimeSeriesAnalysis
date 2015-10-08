#Time Series Analysis Laboratory 1
#Plotting Time Series

packages <- c("ggplot2", "readxl", "ggfortify", "dplyr", "ggthemes", "cowplot")
lapply(packages, library, character.only = TRUE)

#import time series data and preview
dat <- read_excel("~/Economics & Finance/3rd Year Sem 1/Time Series Analysis/Labs/Lab 1/lab1_data.xls")

#Make dat a list to negate differing lengths, 
#turn them into dataframes and then remove NA rows
as.list(dat)
dat <- lapply(dat, as.data.frame.ts)
dat <- lapply(dat, function(x) na.omit(x) )
dat <- lapply(dat, function(x) ts(x) )

#create time series plot function and apply it across time series
timeSeriesPlot <- function(x) {
  autoplot(x, xlab = "Time", ylab = "Value", ts.colour = 'dodgerblue3') + 
    theme_classic()
}
timeSeriesPlots <- lapply(dat, FUN = timeSeriesPlot)
do.call("plot_grid", c(plots, ncol = 2))
ggplot2::ggsave(file = "TimeSeriesPlots.png")
