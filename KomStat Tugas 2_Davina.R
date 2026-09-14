data("iris")
str(iris)

# 1. Data Sepal.Length
iris$Sepal.Length

# 2. tipe data tiap kolom
sapply(iris, class)

# 3 Menambahkan variabel turunan
library(dplyr)
iris <- iris %>%
  mutate(turunan = ifelse(Sepal.Width > 3, "Besar", "Kecil"))
head(iris, 10)

# 4 Mengubah nama turunan jadi Sepal
iris <- iris %>%
  rename(sepal = turunan)
head(iris, 5)

# 5. Filtering
library(dplyr)
data_filter <- filter(iris, sepal == "Besar" & Species == "virginica")
print(data_filter)

# 6. Cek jumlah species
length(unique(iris$Species))

# 7. Subset berdasarkan species
iris_setosa <- subset(iris, Species == "setosa")
print(iris_setosa)

iris_versicolor <- subset(iris, Species == "versicolor")
print(iris_versicolor)

iris_virginica <- subset(iris, Species == "virginica")
print(iris_virginica)

# 8.Sorting tiap data frame berdasrkan Sepal.Width
iris_setosa_terurut <- arrange(iris_setosa, Sepal.Width)
print(iris_setosa_terurut)

iris_versicolor_terurut <- arrange(iris_versicolor, Sepal.Width)
print(iris_versicolor_terurut)

iris_virginica_terurut <- arrange(iris_virginica, Sepal.Width)
print(iris_virginica_terurut)