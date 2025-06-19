# 🛒 Analyse des Ventes Hebdomadaires - Walmart (Projet R)

Ce projet en **R** présente une analyse exploratoire et statistique d’un jeu de données issu des ventes hebdomadaires de Walmart.  
L’objectif est de comprendre la distribution des ventes et d’étudier l’impact de certaines variables explicatives comme la température et le CPI (Indice des Prix à la Consommation) sur les ventes.

---

## Table des matières

1. [🛒 Introduction](#-analyse-des-ventes-hebdomadaires---walmart-projet-r)
2. [📁 Données](#-données)
3. [🧪 Analyses réalisées](#-analyses-réalisées)
    - [🔢 Statistiques descriptives (Store)](#-statistiques-descriptives-variable--store)
    - [📉 Analyse bivariée](#-analyse-bivariée)
        - [📊 Régression linéaire CPI vs Weekly Sales](#-régression-linéaire-entre-cpi-et-weekly-sales)
        - [🔄 Corrélation Store et Weekly_Sales](#-corrélation-entre-store-et-weekly_sales)
    - [📈 Visualisations](#-visualisations)
        - [📌 Scatter Plot : Température vs Ventes](#-scatter-plot--température-vs-ventes-hebdomadaires)
        - [🌈 Densité des distributions (skewness)](#-densité-des-distributions-avec-skewness)
        - [📦 Boxplots](#-boxplots)
        - [📊 Histogramme](#-histogramme)
        - [📊 Visualisation avec ggplot2](#-visualisation-avec-ggplot2)
4. [🚀 Pour démarrer](#-pour-démarrer)
5. [🔧 Packages utilisés](#-packages-utilisés)
6. [📄 À propos](#-à-propos)

---

## 📁 Données

- **Fichier utilisé** : `Walmart.csv`
- **Colonnes analysées** :
  - `Store`
  - `Weekly_Sales`
  - `Temperature`
  - `CPI` (Consumer Price Index)

---

## 🧪 Analyses réalisées

### 🔢 Statistiques descriptives (variable : Store)

Quelques exemples de commandes R utilisées :
```r
mean(walmart$Store)
median(walmart$Store)
min(walmart$Store)
max(walmart$Store)
quantile(walmart$Store)
var(walmart$Store)
sd(walmart$Store)
```

![image](https://github.com/user-attachments/assets/2ce77025-f166-4971-9243-73833b06b8ce)

Ces mesures donnent un aperçu de la répartition des magasins dans le dataset.

---

### 📉 Analyse bivariée

#### 📊 Régression linéaire entre CPI et Weekly Sales
```r
linearMod <- lm(Walmart$Weekly_Sales ~ Walmart$CPI, data=Walmart)
summary(linearMod)
```
![image](https://github.com/user-attachments/assets/220c19bb-dd6b-458c-8d4c-5a96af79bc34)

Cette régression permet d’étudier l'effet de l'inflation (CPI) sur les ventes hebdomadaires.

#### 🔄 Corrélation entre Store et Weekly_Sales
```r
cor(walmart$Store, walmart$Weekly_Sales)
```
![image](https://github.com/user-attachments/assets/951d51db-c0ba-4d6b-91df-b2439707a854)

Cela évalue la relation linéaire entre le numéro du magasin et les ventes hebdomadaires.

---

### 📈 Visualisations

#### 📌 Scatter Plot : Température vs Ventes Hebdomadaires
```r
scatter.smooth(x=walmart$Temperature, y=walmart$Weekly_Sales, main="Temperature vs Weekly Sales")
```

![image](https://github.com/user-attachments/assets/79236898-96b5-4c5e-8c45-7868c1ff94df)


#### 🌈 Densité des distributions (avec skewness)
```r
library(e1071)
par(mfrow=c(1, 2))
plot(density(walmart$Weekly_Sales), main="Density Plot: Weekly_Sales", ylab="Frequency", sub=paste("Skewness:", round(e1071::skewness(walmart$Weekly_Sales), 2)))
polygon(density(walmart$Weekly_Sales), col="red")

plot(density(walmart$CPI), main="Density Plot: CPI", ylab="Frequency", sub=paste("Skewness:", round(e1071::skewness(walmart$CPI), 2)))
polygon(density(walmart$CPI), col="blue")
```
![image](https://github.com/user-attachments/assets/b946dd2d-6392-4dc6-a9a7-70251cf75003)

Ces graphiques permettent d’observer la forme et l’asymétrie des distributions.

#### 📦 Boxplots
```r
par(mfrow=c(1, 2))
boxplot(walmart$Weekly_Sales, main="Weekly_Sales", sub=paste("Outlier rows:", boxplot.stats(walmart$Weekly_Sales)$out))
boxplot(walmart$CPI, main="CPI", sub=paste("Outlier rows:", boxplot.stats(walmart$CPI)$out))
```
![image](https://github.com/user-attachments/assets/2dc1ffd4-92d4-47a8-ae9b-d808154516c7)


#### 📊 Histogramme
```r

library(ggplot2)
# Basic histogram
ggplot(walmart, aes(x=walmart$Temperature)) + geom_histogram()
ggplot(walmart, aes(x=walmart$Temperature)) + geom_histogram(binwidth=1)
# Change colors
p<-ggplot(walmart, aes(x=walmart$Age)) + geom_histogram(color="green", fill="pink")
р
```

#### 📊 Visualisation avec ggplot2
```r
library(ggplot2)
income.graph <- ggplot(Walmart, aes(x=CPI, y=Weekly_Sales)) + geom_point()
income.graph <- income.graph + geom_smooth(method="lm", col="red")
income.graph
```
![image](https://github.com/user-attachments/assets/7d53bf26-ba34-4554-9e2c-c3c7c93cf96c)

Cette visualisation met en évidence la relation linéaire entre le CPI et les ventes hebdomadaires.

---

## 🚀 Pour démarrer

1. Cloner le dépôt :
   ```bash
   git clone https://github.com/JasserChihi/Walmart-Analytics-R-Project.git
   cd Walmart-Analytics-R-Project
   ```
2. Ouvrir R ou RStudio.
3. Installer les packages nécessaires :
   ```r
   install.packages(c("readr", "e1071", "ggplot2"))
   ```
4. Charger le fichier de données dans R :
   ```r
   walmart <- read.csv("data/Walmart.csv")
   ```

---

## 🔧 Packages utilisés

- `readr`
- `e1071`
- `ggplot2`

---

## 📄 À propos

Projet d’analyse exploratoire et statistique réalisé en R sur les ventes hebdomadaires de Walmart.  
Auteur : [JasserChihi](https://github.com/JasserChihi)
