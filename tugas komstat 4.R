set.seed(123)
# 1. SEBARAN POISSON
lambda <- 3
x <- 0:15

pmf <- dpois(x, lambda)

plot(x, pmf, type='h', lwd=3,
     main='Poisson(λ=3)',
     xlab='k', ylab='P(X=k)')

# P(X >= 5)
prob <- 1 - ppois(4, lambda)
prob

# 2. SEBARAN HYPERGEOMETRIK
N <- 100  # ukuran populasi
K <- 20   # Bola merah
n <- 10   # diambil

x <- 0:10

pmf <- dhyper(x, K, N, n)
print(pmf)
df <- data.frame(x, pmf)
print(df)

plot(x, pmf, type='h', lwd=3,
     main='Hypergeometric',
     xlab='Jumlah bola merah',
     ylab='P(X=k)')

# 3. SEBARAN BINOMIAL
n <- 15
p <- 0.4

# Simulasi 1.000 percobaan
samp <- rbinom(1000, n, p)

# Histogram hasil simulasi
hist(samp,
     breaks=seq(-0.5, 15.5, 1),
     probability=TRUE,
     main='Simulasi Binomial(15, 0.4)',
     xlab='Jumlah keberhasilan',
     ylab='Probabilitas')

# PMF teoritis
x <- 0:15
pmf <- dbinom(x, n, p)
pmf

# Tambahkan PMF ke histogram
points(x, pmf, pch=19)
lines(x, pmf, lwd=2)

