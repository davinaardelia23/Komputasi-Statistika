# 1. Vektor Numerik
vec_num <- c(23, 09, 06)
vec_num

# 2. Vector Integer
vec_int <- c(2L, 4L, 6L, 8L, 10L)
vec_int

# 3. Vektor Logical
vec_log <- c(TRUE, TRUE, TRUE, FALSE, FALSE)
vec_log

# 4. Matrix 4x4
mat <- matrix(10:25, nrow = 4, ncol = 4, TRUE)
mat

# 5. array
dat_array <- array(24:36, dim = c(4, 3, 2))
dat_array

# 6. Data Frame
dat <- data.frame(
  Mahasiswa = c(1:5),
  Usia = c(19, 19, 20, 22, 20),
  Jurusan = c("Statistika", "Informatika", "Hukum", "Farmasi", "Teknik Sipil"),
  Tugas_Akhir = c(TRUE, FALSE, TRUE, TRUE, FALSE),
  Status_kelulusan = c(TRUE, FALSE, TRUE, TRUE, FALSE)
)
dat

# 7. List
dat_list <- list(
  Vnum = vec_num,
  Vint = vec_int,
  df = dat,
  ulang = list(
    Vnum = vec_num,
    Vint = vec_int,
    df = dat
  )
)
dat_list

