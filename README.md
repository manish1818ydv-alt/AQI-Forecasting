# AQI Time Series Forecasting for Delhi (2018–2023)

This project focuses on analyzing the Air Quality Index (AQI) data of **Delhi** from **2018 to 2023** on a **monthly** basis using **time series analysis in R**. The goal was to detect patterns, identify trends and seasonality, decompose the series, build ARIMA models, and forecast future AQI levels.

---

## 🧪 Objectives

- **Trend Identification** – observe long-term patterns in AQI
- **Seasonality Detection** – explore monthly seasonal cycles
- **Anomaly Detection** – catch unexpected AQI spikes/dips
- **Forecasting** – build a model to predict AQI over the next 10 years
- **Health Impact Assessment** – understand health implications of fluctuations

---

## 📊 Methods Used

### Time Series Decomposition

- Trend extraction using **12-month centered moving averages**
- Manual and function-based decomposition using `decompose()` (additive & multiplicative)
- Seasonal index estimation using matrix averaging
- Deseasonalization and detrending using both models

### ARIMA Modeling

- Used `auto.arima()` from the **forecast** package
- Fitted ARIMA(2,1,1) or ARMA(2,1) model
- Residual analysis for independence and randomness
- Validated model using the **Box-Ljung test** for autocorrelation
- Forecasted AQI for 10 years (120 months) with 95% confidence intervals

---

## 🔍 Key Findings

- AQI dips in 2020 due to COVID lockdowns, peaks around **Diwali/fall season**
- Seasonal and trend components are clearly visible
- ARIMA model adequately fits with low residual autocorrelation
- Forecast predicts continued fluctuation followed by a gradual stabilization

---

## 🛠 R Packages Used

```r
install.packages("readxl")
install.packages("forecast")
install.packages("fpp")

library(readxl)
library(forecast)
library(fpp)
