install.packages("fpp")
library(fpp)
plot(as.ts(TSADATA))
plot(as.ts(`Yt`))
x<-TSADATACOMBINED$Yt

#package installation
install.packages("forecast")
library(forecast)

trend_AQI=ma(TSADATACOMBINED$Yt,order = 12,centre = 1)
plot(as.ts(TSADATACOMBINED$Yt))
lines(trend_AQI)
plot(as.ts(trend_AQI))

#detrend assuming additive model
detrend_AQI=x-trend_AQI
plot(as.ts(detrend_AQI))

#detrend assuming multiplicative model
detrend_AQIm=x/trend_AQI
plot(as.ts(detrend_AQIm))

#seasonality
m_AQI=data.frame(matrix(detrend_AQI, nrow = 12))
seasonal_AQI=colMeans(m_AQI, na.rm = TRUE)        
plot(as.ts(rep(seasonal_AQI, 12)))

#additive model
random_AQI=x-trend_AQI-seasonal_AQI
plot(as.ts(random_AQI))

#multiplicative model
random_AQIm=x/(trend_AQI*seasonal_AQI)
plot(as.ts(random_AQIm))

#using decompose function assuming additive model
ts_AQI=ts(x, frequency = 12)
decompose_AQI=decompose(ts_AQI, "additive")
plot(as.ts(decompose_AQI$seasonal))
plot(as.ts(decompose_AQI$trend))
plot(as.ts(decompose_AQI$random))
plot(decompose_AQI)

#using decompose function assuming multiplicative model
ts_AQI=ts(x, frequency = 12)
decompose_AQI=decompose(ts_AQI, "multiplicative")
plot(as.ts(decompose_AQI$seasonal))
plot(as.ts(decompose_AQI$trend))
plot(as.ts(decompose_AQI$random))
plot(decompose_AQI)

#plotting a trend line
plot(as.ts(TSADATACOMBINED$Yt))
abline(reg=lm(TSADATACOMBINED$Yt~time(TSADATACOMBINED$Month)))

data.frame(TSADATA)

#Build the ARIMA Model Using auto.arima() Function
fit <- auto.arima(TSADATACOMBINED$Yt)
plot(forecast(fit,h=5))
fit

#Plot the Residuals
plot.ts(fit$residuals)

#Forecast the Values for the Next 10 Years
myforecast <- forecast(fit, level=c(95), h=10*12)
plot(myforecast)

#Validate the Model by Selecting Lag Values
Box.test(fit$resid, lag=5, type="Ljung-Box")
Box.test(fit$resid, lag=10, type="Ljung-Box")
Box.test(fit$resid, lag=15, type="Ljung-Box")

#Looking at the lower p values, we can say that our model is relatively accurate, 
#and we can conclude that from the ARIMA model, that the parameters (2, 1, 1) 
#adequately fit the data.
