# No 1

#a
data = read.csv("Soal1.csv")
data
sd(data$ï..X - data$Y)

#b
t.test(data$Y, data$ï..X, paired=TRUE)

#c
#karena nilai p-value lebih kecil dari nilai tingkat signifikansi nya 
#maka h0 "tidak ada
#pengaruh yang signifikan secara statistika dalam hal kadar saturasi
#oksigen , sebelum dan sesudah melakukan aktivitas 𝐴" salah

# No 2
install.packages("BSDA")
library(BSDA)

#2a
# Jawaban di README yaa

#2b 
tsum.test(mean.x=23500, sd(3900), n.x=100)

#2c
# Jawaban di README yaa

# No 3
library(BSDA)
library(mosaic)
#a) H0 dan H1
# H0 = (miu1 = miu2)
# H1 = (miu1 != miu2) 

#b) Sampel statistik menggunakan uji t
tsum.test(mean.x=3.64, s.x = 1.67, n.x = 19, 
          mean.y=2.79, s.y = 1.32, n.y = 27, 
          alternative = "two.sided", mu = 0, var.equal = TRUE,
          conf.level = 0.95)

#c) Uji statistik dengan df = 2
plotDist(dist ='t', df = 2, col="pink")

#d) Nilai Kritikal
qt(p = 0.05, df = 2, lower.tail = FALSE)

#e) Keputusan
# Karena p-value < a , Hipotesis awal ditolak

#f) Kesimpulan
# Dengan tingkat keyakinan 95%, diyakini bahwa tidak terdapat 
# perbedaan rata-rata saham pada perusahaan di Bandung dan Bali.

# No 4

#A. Buatlah masing masing jenis spesies menjadi 3 subjek "Grup" (grup 1,grup
#2,grup 3). Lalu Gambarkan plot kuantil normal untuk setiap kelompok dan
#lihat apakah ada outlier utama dalam homogenitas varians.
dataOneWay  <- read.table(url("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt"))
dim(dataOneWay)
head(dataOneWay)
attach(dataOneWay)

dataOneWay$V1 <- as.factor(dataOneWay$V1)
dataOneWay$V1 = factor(dataOneWay$V1,labels = c("Kucing Oren","Kucing Hitam","Kucing Putih","Kucing Oren"))

class(dataOneWay$V1)

group1 <- subset(dataOneWay, V1=="Kucing Oren")
group2 <- subset(dataOneWay, V1=="Kucing Hitam")
group3 <- subset(dataOneWay, V1=="Kucing Putih")

qqnorm(group1$Length)
qqline(group1$Length)

qqnorm(Group2$Length)
qqline(Group2$Length)

qqnorm(Group3$Length)
qqline(Group3$Length)

#B. carilah atau periksalah Homogeneity of variances nya , Berapa nilai p yang
#didapatkan? , Apa hipotesis dan kesimpulan yang dapat diambil ?
bartlett.test(Length~Group, data=dataOneWay)


#  C. Untuk uji ANOVA (satu arah), buatlah model linier dengan Panjang versus
#Grup dan beri nama model tersebut model 1.
model1 <- lm(Length~Group, data=dataOneWay)

anova(model1)

#D. Dari Hasil Poin C, Berapakah nilai-p ? , Apa yang dapat Anda simpulkan
#dari H0?
#jwbn di readme yaa

#  E. Verifikasilah jawaban model 1 dengan Post-hoc test Tukey HSD, dari nilai p
#yang didapatkan apakah satu jenis kucing lebih panjang dari yang lain?
#  Jelaskan.

TukeyHSD(aov(model1))

#F. Visualisasikan data dengan ggplot2
library(ggplot2)
ggplot(dataoneway, aes(x = group, y = Length)) + geom_boxplot(fill = "grey80", colour = "black") + 
  scale_x_discrete() + xlab("Treatment Group") +  ylab("Length (cm)")



# No 5
install.packages("ggplot2")
install.packages("multcomp")
install.packages("readr")
install.packages("dplyr")
library(ggplot2)
library(multcompView)
library(readr)
library(dplyr)

GTL <- read_csv("GTL.csv")
head(GTL)

str(GTL)

#a. Buatlah plot sederhana untuk visualisasi data
qplot(x = Temp, y = Light, geom = "point", data = GTL) +
  facet_grid(.~Glass, labeller = label_both)

#b. Lakukan uji ANOVA dua arah
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)

anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)

#c. Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk
#setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)
data_summary <- group_by(GTL, Glass, Temp) %>%
  summarise(mean=mean(Light), sd=sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)


#d. Lakukan uji Tukey
tukey <- TukeyHSD(anova)
print(tukey)

#e. Gunakan compact letter display untuk menunjukkan perbedaan signifikan
#antara uji Anova dan uji Tukey
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)

cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
data_summary$Tukey <- cld$Letters
print(data_summary)