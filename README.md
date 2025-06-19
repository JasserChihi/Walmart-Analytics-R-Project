# 🛒 Analyse des Ventes Hebdomadaires - Walmart (Projet R)

Ce projet en **R** présente une analyse exploratoire et statistique d’un jeu de données issu des ventes hebdomadaires de Walmart.  
L’objectif est de comprendre la distribution des ventes et d’étudier l’impact de certaines variables explicatives comme la température et le CPI (Indice des Prix à la Consommation) sur les ventes.

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
Ces mesures donnent un aperçu de la répartition des magasins dans le dataset.

---

### 📉 Analyse bivariée

#### 📊 Régression linéaire entre CPI et Weekly Sales
```r
linearMod <- lm(Walmart$Weekly_Sales ~ Walmart$CPI, data=Walmart)
summary(linearMod)
```
Cette régression permet d’étudier l'effet de l'inflation (CPI) sur les ventes hebdomadaires.

#### 🔄 Corrélation entre Store et Weekly_Sales
```r
cor(walmart$Store, walmart$Weekly_Sales)
```
Cela évalue la relation linéaire entre le numéro du magasin et les ventes hebdomadaires.

---

### 📈 Visualisations

#### 📌 Scatter Plot : Température vs Ventes Hebdomadaires
```r
scatter.smooth(x=walmart$Temperature, y=walmart$Weekly_Sales, main="Temperature vs Weekly Sales")
```

#### 🌈 Densité des distributions (avec skewness)
```r
library(e1071)
par(mfrow=c(1, 2))
plot(density(walmart$Weekly_Sales), main="Density Plot: Weekly_Sales", ylab="Frequency", sub=paste("Skewness:", round(e1071::skewness(walmart$Weekly_Sales), 2)))
polygon(density(walmart$Weekly_Sales), col="red")

plot(density(walmart$CPI), main="Density Plot: CPI", ylab="Frequency", sub=paste("Skewness:", round(e1071::skewness(walmart$CPI), 2)))
polygon(density(walmart$CPI), col="blue")
```
Ces graphiques permettent d’observer la forme et l’asymétrie des distributions.

#### 📦 Boxplots
```r
par(mfrow=c(1, 2))
boxplot(walmart$Weekly_Sales, main="Weekly_Sales", sub=paste("Outlier rows:", boxplot.stats(walmart$Weekly_Sales)$out))
boxplot(walmart$CPI, main="CPI", sub=paste("Outlier rows:", boxplot.stats(walmart$CPI)$out))
```

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
