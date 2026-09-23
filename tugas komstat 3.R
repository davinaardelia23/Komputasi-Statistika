# 1. Data
data(airquality)
airquality

# 2. Histogram
# Histogram dengan break mulai dari 75
hist(airquality$Wind, 
     breaks = 0 + (0:5) * 5, 
     ylim = c(0, 100), 
     xlab = "Wind", 
     main = "Histogram : Breaks di 0, 5, ...")
# Estimasi kepadatan
dens <- density(airquality$Wind)

# Histogram + kurva kepadatan
hist(airquality$Wind, 
     breaks = 0 + (0:5) * 5, 
     probability = TRUE, 
     ylim = c(0,0.12),
     xlab = "Wind", 
     main = "Histogram + Density Curve")

# Tambahkan garis kepadatan
lines(dens, col = "blue", lwd = 2)

# 3. Boxplot
# Boxplot dengan base R
boxplot(airquality$Wind, horiz = TRUE, 
        main = "Boxplot wind",
        xlab = "Wind")

# Stem-and-leaf plot tinggi badan rowers
stem(airquality$Wind[airquality$Month == "5"])

# 4.Scatter Plot
plot(x = airquality$Wind, 
     y = airquality$Ozone,
     pch = 16, 
     main = "Scatterplot",
     xlab = "Wind", 
     ylab = "Ozone")

