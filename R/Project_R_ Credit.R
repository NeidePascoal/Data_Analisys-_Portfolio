
# TRABALHO PRÁTICO – BUSINESS INTELLIGENCE & MACHINE LEARNING
# Dataset: credit.csv

# 1. BIBLIOTECAS


library(tidyverse)
library(rpart)
library(rpart.plot)
library(ranger)
library(arules)
library(arulesViz)


credit <- read.csv("C:/Users/Neide Varela/Documents/Data Analyst- Cesae/R/trab.final/credit.csv",
                  sep = ",",
                  stringsAsFactors = FALSE)




# Análise inicial
str(credit)
summary(credit)
head(credit)


############################
# 3. PREPARAÇÃO DOS DADOS
############################

# Garantir que TODAS as variáveis são fatores
credit <- credit |>
  mutate(
    CreditHist = as.factor(CreditHist),
    Debt = as.factor(Debt),
    Collateral = as.factor(Collateral),
    Income = as.factor(Income),
    Risk = as.factor(Risk)
  )

# Verificar valores em falta
colSums(is.na(credit))


############################
# 4. BUSINESS INTELLIGENCE (BI)
############################

# BI 1 – Distribuição do risco
table(credit$Risk)
prop.table(table(credit$Risk))


# BI 2 – Cruzamento de variáveis com o risco
table(credit$CreditHist, credit$Risk)
table(credit$Income, credit$Risk)
table(credit$Collateral, credit$Risk)


# BI 3 – Gráfico de barras
ggplot(credit, aes(x=Risk, fill=Risk)) +
  geom_bar() +
  ggtitle("Distribuição do Risco de Crédito")



# 5. DIVISÃO TREINO / TESTE

set.seed(123)
credit_shuffled <- credit[sample(nrow(credit)), ]

div <- round(nrow(credit_shuffled) * 2/3)

train <- credit_shuffled[1:div, ]
test  <- credit_shuffled[(div+1):nrow(credit_shuffled), ]



# 6. MACHINE LEARNING – CLASSIFICAÇÃO



# 6.1 ÁRVORE DE DECISÃO


tree_model <- rpart(Risk ~ ., data=train, method="class")

rpart.plot(tree_model, box.palette = "Blues")

pred_tree <- predict(tree_model, test, type="class")

# Matriz de confusão
table(Predito = pred_tree, Real = test$Risk)



# 6.2 RANDOM FOREST


rf_model <- ranger(
  Risk ~ .,
  data = train,
  num.trees = 300,
  importance = "impurity"
)

print(rf_model)

# Importância das variáveis

install.packages("arules")
install.packages("arulesViz")


barplot(sort(rf_model$variable.importance, decreasing = TRUE),
        col="lightblue",
        las=2,
        main="Importância das Variáveis")

# Previsão
pred_rf <- predict(rf_model, test)$predictions

table(Predito = pred_rf, Real = test$Risk)



# 7. APRIORI – REGRAS DE ASSOCIAÇÃO


# Converter dataset para transações
trans <- as(credit, "transactions")

# Aplicar Apriori
library(arules)

trans <- as(credit, "transactions")

rules <- apriori(trans,
                 parameter = list(support = 0.05,
                                  confidence = 0.6,
                                  minlen = 2))

inspect(rules)


# Ver regras
inspect(rules)

# Top regras por confiança
inspect(sort(rules, by="confidence")[1:10])
