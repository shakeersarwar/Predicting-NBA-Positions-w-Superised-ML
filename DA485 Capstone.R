library(corrplot)
library(GGally)
library(ggplot2)
library(corpcor)
library(lmtest)
library(pastecs)
library(stargazer)

data <- read.csv("df_anova.csv")
names(data)[9] <- "FG%"
names(data)[10] <- "3P"
names(data)[11] <- "3PA"
names(data)[12] <- "3P%"
names(data)[13] <- "2P"
names(data)[14] <- "2PA"
names(data)[15] <- "2P%"
names(data)[18] <- "FT%"
data

data.cor <- cor(data)
corrplot(data.cor)
data.cor

model <- lm(Pos ~ ., data)
summary(model)

model2 <- lm(Pos ~ TRB + AST + STL + BLK + FG. + X2P. + FT + FTA + FT. + PF, data)
summary(model2)

model3 <- lm(Pos ~ TRB + AST + STL + BLK + X2P. + FT + FTA + FT. + PF, data)
summary(model3)

model4 <- lm(Pos ~ TRB + AST + STL + BLK + X2P. + FT + FTA + FT., data)
summary(model4)

model5 <- lm(Pos ~ TRB + AST + STL + BLK + X2P. + FT. + PF, data)
summary(model5)



subset <- data[ , c("TRB", "AST", "STL", "BLK", "X2P.", "FT", "FTA", "FT.", "PF")]
ggpairs(subset)
