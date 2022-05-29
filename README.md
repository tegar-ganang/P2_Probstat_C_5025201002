# P2_Probstat_C_5025201002
Tegar Ganang Satrio Priambodo - 5025201002 - Probstat C

## No 1
Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas 𝐴 terhadap kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel sebanyak 9 responden. Pertama, sebelum melakukan aktivitas 𝐴, peneliti mencatat kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut diminta melakukan aktivitas 𝐴. Setelah 15 menit, peneliti tersebut mencatat kembali kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9 responden mengenai kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas 𝐴

![image](https://user-images.githubusercontent.com/85062827/170867578-8bfffcbd-5aac-45d8-b445-1d2d31b5dd4f.png)

Berdasarkan data pada tabel diatas, diketahui kadar saturasi oksigen dari responden ke-3 ketika belum melakukan aktivitas 𝐴 sebanyak 67, dan setelah melakukan aktivitas 𝐴 sebanyak 70.

1a
Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel diatas

```
sd(data$ï..X - data$Y)
```

Hasilnya

![image](https://user-images.githubusercontent.com/85062827/170867855-5b5739d3-83b4-4ffb-ac01-c1ddff957456.png)

1b
carilah nilai t (p-value)

untuk mencari t(p-value) menggunakan fungsi `t.test`
```
t.test(data$Y, data$ï..X, paired=TRUE)
```

Hasilnya
![image](https://user-images.githubusercontent.com/85062827/170867988-2df5ac57-127c-4185-9a09-e6eacb12f304.png)

1c
tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen, sebelum dan sesudah melakukan aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴”

karena nilai p-value lebih kecil dari nilai tingkat signifikansi nya maka h0 "tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴" salah

## No 2
Diketahui bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun. Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak diminta untuk mencatat jarak yang mereka tempuh. Jika sampel acak menunjukkan rata-rata 23.500 kilometer dan standar deviasi 3900 kilometer. (Kerjakan menggunakan 2 library seperti referensi pada modul).

2a
Apakah Anda setuju dengan klaim tersebut?

Setuju

2b
Jelaskan maksud dari output yang dihasilkan!

## No 3
Diketahui perusahaan memiliki seorang data analyst ingin memecahkan permasalahan pengambilan keputusan dalam perusahaan tersebut. Selanjutnya didapatkanlah data berikut dari perusahaan saham tersebut.

![image](https://user-images.githubusercontent.com/85062827/170868162-77b29c63-1d67-4054-8ac0-b311ca5769b0.png)

Dari data diatas berilah keputusan serta kesimpulan yang didapatkan dari hasil diatas. Asumsikan nilai variancenya sama, apakah ada perbedaan pada rata-ratanya (α= 0.05)? Buatlah :

## No 4

Seorang Peneliti sedang meneliti spesies dari kucing di ITS . Dalam penelitiannya ia mengumpulkan data tiga spesies kucing yaitu kucing oren, kucing hitam dan kucing putih dengan panjangnya masing-masing. Jika : diketahui dataset https://intip.in/datasetprobstat1 H0 : Tidak ada perbedaan panjang antara ketiga spesies atau rata-rata panjangnya sama. Maka Kerjakan atau Carilah:

4a
Buatlah masing masing jenis spesies menjadi 3 subjek "Grup" (grup 1,grup 2,grup 3). Lalu Gambarkan plot kuantil normal untuk setiap kelompok dan lihat apakah ada outlier utama dalam homogenitas varians.

- Mengambil data dari link soal

```
dataOneWay  <- read.table(url("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt"))
dim(dataOneWay)
head(dataOneWay)
attach(dataOneWay)
```

- Membuat group

```
dataOneWay$V1 <- as.factor(dataOneWay$V1)
dataOneWay$V1 = factor(dataOneWay$V1,labels = c("Kucing Oren","Kucing Hitam","Kucing Putih"))

class(dataOneWay$V1)
```

- membagi tiap value menjadi 3 bagian kedalam 3 group
```
group1 <- subset(dataOneWay, V1=="Kucing Oren")
group2 <- subset(dataOneWay, V1=="Kucing Hitam")
group3 <- subset(dataOneWay, V1=="Kucing Putih")
```



