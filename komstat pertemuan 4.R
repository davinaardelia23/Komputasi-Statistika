# 1. SEBARAN BERNOULLI
# Probability mass: P(X = x)
p <- 0.3
dbinom(1, size=1, prob=p)   # = p
dbinom(0, size=1, prob=p)   # = 1-p
# Cumulative: P(X <= x)
pbinom(0, size=1, prob=p)   # P(X <= 0) = 1-p
pbinom(1, size=1, prob=p)   # P(X <= 1) = 1
# Simulasi (generate n Bernoulli trials)
set.seed(2025)
n <- 100
p <- 0.3
x <- rbinom(n, size=1, prob=p)  # vektor 0/1
head(x, n=10)
# Estimasi p (MLE)
p_hat <- mean(x)
p_hat

# 2. SEBARAN BINOMIAL
n <- 20; p <- 0.3; x <- 0:n
pmf <- dbinom(x, size=n, prob=p)
cdf <- pbinom(x, size=n, prob=p)
plot(x, pmf, type="h", lwd=3, main="PMF Binomial", xlab="k", ylab="P(X=k)")
k_obs <- 24     # contoh: 24 sukses dari 100 percobaan
n <- 100
p_hat <- k_obs / n
p_hat

# 3. SEBARAN POISSON
lambda <- 2.5
x <- 0:15
pmf <- dpois(x, lambda)
plot(x, pmf, type='h', lwd=3, main='Poisson(λ=2.5)', xlab='k', ylab='P(X=k)')
samp <- rpois(n, lambda)
lambda_hat <- mean(samp)
lambda_hat

# 4. SEBARAN GEOMETRIK
set.seed(123)
p <- 0.2
x <- 1:15
pmf <- dgeom(x-1, p)
plot(x, pmf, type='h', lwd=3, main='Geometric(p=0.2)', xlab='Trial ke-berapa sukses pertama')

n <- 1000
p

# R menghasilkan jumlah kegagalan sebelum sukses (0-based). Untuk 1-based, tambahkan 1.
samp_failures <- rgeom(n, prob = p)   # 0,1,2,...
samp_1based <- samp_failures + 1      # 1,2,3,...

# Statistik simulasi (harus mendekati teoritis)
mean(samp_1based)      # mendekati 1/p
var(samp_1based)       # mendekati (1-p)/p^2
p_hat <- 1 / mean(samp_1based)
p_hat

# 5. SEBARAN NEGATIF BINOMIAL
r <- 3; p <- 0.4
x <- r:20
pmf <- dnbinom(x-r, size=r, prob=p)
plot(x, pmf, type='h', lwd=3, main='Negative Binomial', xlab='Jumlah percobaan total')
n <- 1000
p
r
# rnbinom menghasilkan jumlah kegagalan sebelum r sukses (Y)
samp_failures <- rnbinom(n, size = r, prob = p)
samp_total <- samp_failures + r  # X = Y + r

# Hitung MLE p_hat dari sampel 'samp_total'
p_hat <- (r * length(samp_total)) / sum(samp_total)
p_hat

# 6. SEBARAN HIPERGEOMETRIK
# Contoh parameter
N <- 50    # ukuran populasi
K <- 10    # jumlah sukses di populasi (misal bola merah = sukses)
n <- 5     # ukuran sampel

# Domain k
k <- seq(from = max(0, n + K - N), to = min(n, K))

# PMF: P(X = k)
pmf <- dhyper(k, m = K, n = N - K, k = n)
data.frame(k = k, P = pmf)

# Plot PMF
plot(k, pmf, type = "h", lwd = 3,
     main = paste0("Hypergeometric(N=",N,", K=",K,", n=",n,")"),
     xlab = "k (banyak sukses dalam sampel)", ylab = "P(X=k)")

# Simulasi sampling tanpa pengembalian
m <- 10000
samp <- rhyper(m, m = K, n = N - K, k = n)  # rhyper(nn, m, n, k)
mean(samp)   # harus ≈ n * K / N
n*K/N 
var(samp)    # harus ≈ teori var
n*K/N * (1-K/N) * ((N-n)/(N-1))

#MLE
x_obs <- 3  # misal kita mengamati 3 sukses dalam sampel
# Likelihood sebagai fungsi K (K harus integer 0..N)
lik <- sapply(0:N, function(Kc) {
  if ( (x_obs <= min(n, Kc)) && (x_obs >= max(0, n + Kc - N)) ) {
    choose(Kc, x_obs) * choose(N - Kc, n - x_obs)
  } else 0
})
K_candidates <- which(lik == max(lik)) - 1  # -1 karena index R mulai 1
K_candidates

# Estimator tidak-bulat (unbiased) untuk K
N * x_obs / n

# 7. SEBARAN MULTINOMIAL
# Probabilitas tiap kategori
probs <- c(0.2, 0.5, 0.3)   # p1=0.2, p2=0.5, p3=0.3
n <- 10                     # jumlah percobaan
m <- 1000                   # jumlah simulasi

# Simulasi Multinomial
res <- rmultinom(m, size=n, prob=probs)

# Lihat sebagian hasil
res[,1:14]  # 14 sampel pertama (per baris: (x1,x2,x3))
# Rata-rata empiris dibandingkan teori
rowMeans(res)     # ≈ n * probs
n * probs         # ekspektasi teoretis E(Xi) = n * pi
# Estimasi p_i (MLE) dari observasi/ empiris sampel pertama simulasi
x_obs <- res[,1]        # sampel pertama: jumlah tiap kategori (x1,x2,x3)
p_hat <- x_obs / sum(x_obs)
p_hat

