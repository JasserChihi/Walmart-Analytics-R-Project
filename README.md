🛒 Analyse des Ventes Hebdomadaires - Walmart (Projet R)

Ce projet en R présente une analyse exploratoire et statistique d’un jeu de données issu des ventes hebdomadaires de Walmart. L’objectif est de comprendre la distribution des ventes et d’étudier l’impact de certaines variables explicatives comme la température et le CPI (indice des prix à la consommation) sur les ventes.

📁 Données

•Fichier utilisé : Walmart.csv

•Colonnes analysées :

   •Store
  
   •Weekly_Sales
  
   •Temperature

   •CPI (Consumer Price Index)

🧪 Analyse des données

🔢 Statistiques descriptives (sur la variable Store)

    mean(walmart$store)
    median(walmart$store)
    min(walmart$store)
    max(walmart$store)
    quantile(walmart$store)
    var(walmart$Store)
    sd(walmart$Store)
    

Ces mesures donnent un aperçu de la répartition des magasins (store) dans le dataset.

📉 Analyse bivariée

📊 Régression linéaire entre CPI et Weekly Sales

    linearMod <- lm(Walmart$Weekly_Sales ~ Walmart$CPI, data=Walmart)
    summary(linearMod)

Cette régression permet d’étudier l'effet de l'inflation (CPI) sur les ventes hebdomadaires.

🔄 Corrélation

    cor(walmart$store, walmart$weekly_Sales)

Ceci évalue la relation linéaire entre le numéro du magasin et les ventes hebdomadaires.

📈 Visualisations

📌 Scatter Plot : Température vs Ventes Hebdomadaires

    scatter.smooth(x=walmart$Temperature, y=walmart$weekly_Sales, main="Temperature vs Weekly Sales")

🌈 Densité des distributions

    library(e1071)
    par (mfrow=c(1, 2)) # divide graph area in 2 columns
    plot (density (walmart $weekly_Sales), main="Density Plot: weekly_Sales", ylab="Frequency", sub-paste("skewness:",
                                                                                                          round (e1071: skewness (walmart $weekly_sales), 2)))
    polygon (density (walmart $weekly_sales), col="red")
    #density plot pour CPI
    
    plot (density (walmart$CPI), main="Density Plot: CPI", ylab="Frequency", sub-paste ("Skewness:",
                                                                                        round (e1071: skewness (walmart$CPI), 2)))
    polygon (density (walmart$CPI), col="blue")

Ces graphiques permettent d’observer la forme et la symétrie des distributions à l’aide de la skewness (asymétrie).

📦 Boxplots

    #boxplot for weekly_sales
    par (mfrow=c(1, 2))
    boxplot (walmart $weekly_sales, main="weekly_sales", sub-paste("outlier rows:",
                                                                   boxplot.stats (walmart $weekly_Sales) $out))
    #boxplot for CPI
    boxplot (walmart$CPI, main="CPI", sub=paste("Outlier rows: ",
                                                boxplot.stats (walmart $CPI) $out))

📊 Visualisation avec ggplot2

    library(ggplot2)
    income.graph<-ggplot(Walmart, aes(x=Walmart$CPI, y=Walmart$Weekly_Sales))+geom_point()
    income.graph
    
    income.graph <- income.graph + geom_smooth(method="lm", col="red")
    income.graph

Cette visualisation met en évidence la relation linéaire entre le CPI et les ventes hebdomadaires.

🚀 À propos

• 📌 Langage : R

• 📁 Fichier de données : Walmart_dataset.csv

• 🔧 Packages utilisés : readr, e1071, ggplot2




