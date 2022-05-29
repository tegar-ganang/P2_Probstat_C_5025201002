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
karena kesimpulan dari uji z menolak H0, sehingga mobil dikemudikan rata-rata lebih dari 20000 kilometer per tahun

2b
Jelaskan maksud dari output yang dihasilkan!
```
library(BSDA)
tsum.test(mean.x=23500, sd(3900), n.x=100)
```
Output dari z test adalah, 

![image](https://user-images.githubusercontent.com/85062827/170869216-fccee706-f735-47f4-a9dd-60f173f320e7.png)

hipotesis alternatif alternative hypothesis: true mean is greater than 20000 atau H1 diterima sehingga klaim benar. 

2c
P-value dari uji tes z adalah 2.2e-16 atau mendekati 0, dari hasil p-value tersebut hipotesis awal dapat ditolak dan H1 diterima.


## No 3
Diketahui perusahaan memiliki seorang data analyst ingin memecahkan permasalahan pengambilan keputusan dalam perusahaan tersebut. Selanjutnya didapatkanlah data berikut dari perusahaan saham tersebut.

![image](https://user-images.githubusercontent.com/85062827/170868162-77b29c63-1d67-4054-8ac0-b311ca5769b0.png)

Dari data diatas berilah keputusan serta kesimpulan yang didapatkan dari hasil diatas. Asumsikan nilai variancenya sama, apakah ada perbedaan pada rata-ratanya (α= 0.05)? Buatlah :

3a
H0 = (miu1 = miu2)
H1 = (miu1 != miu2) 

3b
Hitung Sampel Statistik Penghitungan dilakukan sebagai berikut
```
tsum.test(mean.x=3.64, s.x = 1.67, n.x = 19, 
          mean.y=2.79, s.y = 1.32, n.y = 27, 
          alternative = "two.sided", mu = 0, var.equal = TRUE,
          conf.level = 0.95)
```

![image](https://user-images.githubusercontent.com/85062827/170870719-473543c4-0eca-4251-9f66-df482af81d00.png)

3c
Lakukan Uji Statistik (df =2)

```
plotDist(dist ='t', df = 2, col="pink")
```
![image](https://user-images.githubusercontent.com/85062827/170870795-a24beb1b-b8cf-404f-ae87-798215288e9c.png)

          
3d
Nilai kritikal Adapun untuk mendapatkan nilai kritikal bisa menggunakan qchisq dengan df=2 sesuai soal sebelumnya

```
qt(p = 0.05, df = 2, lower.tail = FALSE)
```
![image](https://user-images.githubusercontent.com/85062827/170870834-0b4e2555-8bd7-4d8b-ba39-e17cd85e058f.png)

3e
Keputusan
Karena p-value < a , Hipotesis awal ditolak

3f
Kesimpulan 

Dengan tingkat keyakinan 95%, diyakini bahwa tidak terdapat perbedaan rata-rata saham pada perusahaan di Bandung dan Bali.

Kesimpulan yang didapatkan yaitu perbedaan rata-rata yang terjadi tidak ada jika dilihat dari uji statistik dan akan ada tetapi tidak signifikan jika dipengaruhi nilai kritikal.

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

qqnorm(group1$Length)
qqline(group1$Length)

qqnorm(Group2$Length)
qqline(Group2$Length)

qqnorm(Group3$Length)
qqline(Group3$Length)
```

4b
carilah atau periksalah Homogeneity of variances nya , Berapa nilai p yang didapatkan? , Apa hipotesis dan kesimpulan yang dapat diambil ?

```
bartlett.test(Length~Group, data=dataOneWay)
```
nilai p-value = `0.8054`
Kesimpulan : Bartlett's K-squared memiliki nilai sebesar 0.43292 dan df bernilai 2

4c
Untuk uji ANOVA (satu arah), buatlah model linier dengan Panjang versus
Grup dan beri nama model tersebut model 1.
```
model1 <- lm(Length~Group, data=dataOneWay)

anova(model1)
```
4d
Dari Hasil Poin C, Berapakah nilai-p ? , Apa yang dapat Anda simpulkan dari H0?

nilai p adalah 0.8054, maka H0 ditolak

4e
Verifikasilah jawaban model 1 dengan Post-hoc test Tukey HSD, dari nilai p yang didapatkan apakah satu jenis kucing lebih panjang dari yang lain? 3 Jelaskan.

```
TukeyHSD(aov(model1))
```

4f
Visualisasikan data dengan ggplot2

```
library(ggplot2)
ggplot(dataoneway, aes(x = group, y = Length)) + geom_boxplot(fill = "grey80", colour = "black") + 
  scale_x_discrete() + xlab("Treatment Group") +  ylab("Length (cm)")
```

## No 5
Data yang digunakan merupakan hasil eksperimen yang dilakukan untuk mengetahui pengaruh suhu operasi (100˚C, 125˚C dan 150˚C) dan tiga jenis kaca pelat muka (A, B dan C) pada keluaran cahaya tabung osiloskop. Percobaan dilakukan sebanyak 27 kali dan didapat data sebagai berikut: Data Hasil Eksperimen. Dengan data tersebut:

5a
Buatlah plot sederhana untuk visualisasi data

```
qplot(x = Temp, y = Light, geom = "point", data = GTL) +
  facet_grid(.~Glass, labeller = label_both)
```

![image](https://user-images.githubusercontent.com/85062827/170869331-4b2eb19b-3530-4bc9-8a66-ef66b044c9c1.png)

5b
Lakukan uji ANOVA dua arah Langkah pertama adalah membuat variabel as factor sebagai ANOVA

```
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)

anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)
```
![image](https://user-images.githubusercontent.com/85062827/170869390-94dfda7e-6a1c-442b-a881-ac3405878e7f.png)

![image](https://user-images.githubusercontent.com/85062827/170869405-66b3a39a-824c-48de-8c61-d5373085ea7c.png)

5c
Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)

Menggunakan group_by lalu melakukan summarise sesuai mean dan standar deviasi yang berlaku sehingga scriptnya adalah sebagai berikut

```
data_summary <- group_by(GTL, Glass, Temp) %>%
  summarise(mean=mean(Light), sd=sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)
```
![image](https://user-images.githubusercontent.com/85062827/170869463-27d0a58a-5c27-4a2a-96b7-53d56a9c39ca.png)

5d
Lakukan uji Tukey

Menggunakan fungsi TukeyHSD sebagai berikut
```
tukey <- TukeyHSD(anova)
print(tukey)
```
![image](https://user-images.githubusercontent.com/85062827/170869528-19692a5f-b8da-487b-97b5-873270d4f982.png)
![image](https://user-images.githubusercontent.com/85062827/170869552-5f5469b8-4cc8-44e6-98e4-9c44f298ac4c.png)
![image](https://user-images.githubusercontent.com/85062827/170869571-d541c1e7-85ae-4922-b31e-e9ecb84e60c4.png)
![image](https://user-images.githubusercontent.com/85062827/170869585-943ad160-0da5-4d5a-81e5-9cf03517e966.png)

5e
Gunakan compact letter display untu![image](https://user-images.githubusercontent.com/85062827/170869673-5ac365c9-6846-4d92-940e-485a7cdb4d3f.png)k menunjukkan perbedaan signifikan antara uji Anova dan uji Tukey
```
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)

```
![image](https://user-images.githubusercontent.com/85062827/170869682-1c20777a-bfe5-43b7-8581-5c1ec6dc4756.png)

```
cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
data_summary$Tukey <- cld$Letters
print(data_summary)
```
![image](https://user-images.githubusercontent.com/85062827/170869702-2ab2624f-7537-4f58-ad6e-9efed039b12c.png)
