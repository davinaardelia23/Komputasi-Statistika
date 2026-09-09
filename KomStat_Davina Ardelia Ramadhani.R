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
  Nilai = c(75,80, 85, 90, 95),
  Usia = c(15L, 16L, 16L, 15L),
  df = dat,
  hasil = list(
    Nilai_quiz = c(80, 80, 90, 85, 95),
    Total_kehadiran= c(10L, 12L, 11L, 12L, 12L),
    data_rekap = data.frame(
      Nama = c("Draco", "Tom", "Regulus", "Nott"),
      Nilai_Owl = c(9, 10, 9, 7),
      Status = ifelse(c(9, 10, 9, 7) >= 8, "Lulus", "Tidak Lulus" )
    )
  )
)
dat_list

