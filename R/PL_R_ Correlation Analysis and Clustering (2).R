## 1 a)

titanic <- read.csv("C:/Users/Neide Varela/Documents/Acadamia Data Analyst- Cesae/R/PL6/datasettitanic.csv",
                    header = TRUE,
                    sep = ";")
head (titanic)
## 1 b) 
summary(titanic)

hist(titanic$age,
     main = "Histograma das Idades",
     xlab = "Idade",
     col = "lightblue")

hist(titanic$fare,
     main = "Histograma da Tarifa",
     xlab = "Valor do Bilhete",
     col = "lightgreen")

hist(titanic$sex,
     main = "Histograma do Sexo (0=Homem, 1=Mulher)",
     xlab = "Sexo",
     col = "pink")

## 1 b)
###  i – Identificar e remover linhas com NA
#Ver quantos NA existem

colSums(is.na(titanic))

## Verificar quantos registos têm NA
sum(!complete.cases(titanic))

## 1 b)
###  i- Remover linhas com NA usando
titanic_clean <- na.omit(titanic)

## Confirmar que já não há NA
sum(!complete.cases(titanic_clean))

## c  Ordene o dataser por Age
titanic_ord <- titanic[order(titanic$age), ]
head(titanic_ord)

## d) Use a função table() para verificar quantos passageiros entraram em cada porto de embarque (“Embarked”)
table(factor(titanic$embarked,
             levels = c(1, 2, 3),
             labels = c("Cherbourg", "Queenstown", "Southampton")))

## e) Selecionar apenas variáveis numéricas

num_cols <- sapply(titanic, is.numeric)
titanic_num <- titanic[, num_cols]

# Criar tabela de correlação
correlacao <- cor(titanic_num, use = "complete.obs")

# Ver a matriz de correlação no console
print(round(correlacao, 3)) 

## f)

# Instalar o pacote 
 
install.packages("leaps")
 library(leaps) 

# Criar cópia para análise
titanic2 <- titanic

## verificar os nomes
names(titanic)

# Converter Survived para numérico caso ainda não esteja
titanic2 <- titanic
titanic2$survived <- as.numeric(titanic2$survived)

# Selecionar apenas colunas numéricas para análise
num_cols <- sapply(titanic2, is.numeric)
dados_numeric <- titanic2[, num_cols]

# Aplicar melhores subsets (nvmax controla quantas variáveis testar)
subset_model <- regsubsets(survived ~ ., data = dados_numeric, nvmax = 10)

# Resultado da seleção
resultado <- summary(subset_model)


# Mostrar melhores combinações encontradas
resultado$which      # variáveis selecionadas por cada tamanho de modelo
resultado$adjr2      # R² ajustado — quanto maior melhor
resultado$cp         # Cp — ideal mais próximo do número de variáveis + 1
resultado$bic        # BIC — quanto menor, melhor

## g) garalhar o dataset

set.seed(123)  # garante que o embaralhamento é reprodutível
titanic_shuffled <- titanic2[sample(nrow(titanic2)), ]

# Visualizar as primeiras linhas do dataset embaralhado
head(titanic_shuffled)


## h ) Dividir em treino e teste (70% treino / 30% teste)

# Instalar e carregar pacote caTools se necessário

install.packages("caTools"); library(caTools) 

# Criar a divisão
set.seed(123)  # para reprodutibilidade
split <- sample.split(titanic_shuffled$survived, SplitRatio = 0.7)

train <- subset(titanic_shuffled, split == TRUE)
test  <- subset(titanic_shuffled, split == FALSE)

# Dimensões dos datasets
cat("Treino:", dim(train), "\n")
cat("Teste:", dim(test), "\n")


## i ) # Converter variáveis categóricas em factor
train$sex <- as.factor(train$sex)
train$embarked <- as.factor(train$embarked)
train$X.pclass <- as.factor(train$X.pclass)
train$survived <- as.factor(train$survived)

test$sex <- as.factor(test$sex)
test$embarked <- as.factor(test$embarked)
test$X.pclass <- as.factor(test$X.pclass)
test$survived <- as.factor(test$survived)

## Criar o modelo de previsão (árvore de decisão)
# Carregar pacotes necessários
install.packages("rpart"); library(rpart) 
install.packages("rpart.plot"); library(rpart.plot) 

# Fórmula do modelo: prever survived com variáveis principais
formula_tree <- survived ~ X.pclass + sex + age + sibsp + parch + fare + embarked

# Treinar árvore de decisão
model_tree <- rpart(formula_tree, 
                    data = train, 
                    method = "class", 
                    control = rpart.control(cp = 0.01))

## Visualizar a árvore
rpart.plot(model_tree, main = "Árvore de Decisão - Titanic")

## j) Testar o modelo e calcular ROC

## Gere a arvore de decisão
# Previsão de probabilidades de sobrevivência
pred_probs <- predict(model_tree, test, type = "prob")[,2]  # probabilidade de survived = 1

# Previsão de classes
pred_class <- predict(model_tree, test, type = "class")

# Matriz de confusão
conf_matrix <- table(Real = test$survived, Predito = pred_class)
print(conf_matrix)

# Carregar pacote pROC
install.packages("pROC"); library(pROC) 

# Converter variável real para numérico
real_numeric <- as.numeric(as.character(test$survived))

# Criar objeto ROC
roc_obj <- roc(response = real_numeric, predictor = pred_probs)

# Mostrar AUC
cat("AUC:", auc(roc_obj), "\n")

# Plotar ROC
plot(roc_obj, main = paste("ROC curve - AUC =", round(auc(roc_obj),3)))


## l) Adicionar previsões ao dataset original 

# Instalar se necessário
# install.packages("rpart")
# install.packages("rpart.plot")

library(rpart)
library(rpart.plot)
library(caTools)

# Criar colunas vazias no dataset original
titanic$PredictedClass <- NA
titanic$PredictedProb  <- NA

# Embaralhar dataset e criar índice original
titanic_shuffled <- titanic2[sample(nrow(titanic2)), ]
titanic_shuffled$orig_row <- 1:nrow(titanic_shuffled)

# Divisão treino/teste
set.seed(123)
split <- sample.split(titanic_shuffled$survived, SplitRatio = 0.7)
train <- subset(titanic_shuffled, split == TRUE)
test  <- subset(titanic_shuffled, split == FALSE)

# Ajuste dos fatores
train$survived <- as.factor(train$survived)
train$sex      <- as.factor(train$sex)
train$embarked <- as.factor(train$embarked)
train$X.pclass <- as.factor(train$X.pclass)

# Treinamento da árvore
model_tree <- rpart(survived ~ X.pclass + sex + age + sibsp + parch + fare + embarked, 
                    data = train, method = "class", control = rpart.control(cp = 0.01))

# Previsões
pred_probs <- predict(model_tree, test, type = "prob")[,2]
pred_class <- predict(model_tree, test, type = "class")

# Mapear resultados de volta ao dataset original
titanic$PredictedClass[test$orig_row] <- as.character(pred_class)
titanic$PredictedProb[test$orig_row]  <- pred_probs

# Visualizar resultado
head(titanic)


