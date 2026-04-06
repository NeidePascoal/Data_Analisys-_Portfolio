### ================================================================
### TITANIC — SCRIPT COMPLETO (importar, analisar, modelar, interpretar)
### ================================================================

# --- 0) (Opcional) Instalar pacotes (descomenta se ainda não tiveres)
# install.packages("caTools")
# install.packages("rpart")
# install.packages("rpart.plot")
# install.packages("pROC")
# install.packages("leaps")

# --- 1) Carregar bibliotecas
library(caTools)
library(rpart)
library(rpart.plot)
library(pROC)
library(leaps)

# --- 1 a ) Importar o ficheiro
titanic <- read.csv("C:/Users/Neide Varela/Documents/Acadamia Data Analyst- Cesae/R/PL6/datasettitanic.csv",
                    header = TRUE, sep = ";", stringsAsFactors = FALSE)

#  Ver as primeiras linhas e estrutura
head(titanic)
str(titanic)
summary(titanic)

# --- b) Visão geral com hist() e summary()
# Histograma das idades (se existir a coluna 'age' com valores numéricos)
if("age" %in% names(titanic)) {
  hist(titanic$age, main = "Histograma das Idades", xlab = "Idade", col = "lightblue")
}

# Histograma da tarifa (fare)
if("fare" %in% names(titanic)) {
  hist(titanic$fare, main = "Histograma da Tarifa (fare)", xlab = "Tarifa", col = "lightgreen")
}

# Se 'sex' codificada como 0/1 ou como texto, mostramos um histograma de frequências
if("sex" %in% names(titanic)) {
  # converter para factor para histograma de frequências
  sex_fac <- factor(titanic$sex)
  barplot(table(sex_fac), main = "Frequência por sexo", ylab = "Contagem")
}

# Mostrar resumo estatístico global
summary(titanic)

# --- 1 b- i ) Identificar e remover NAs
cat("NAs por coluna:\n")
print(colSums(is.na(titanic)))
cat("Registos com pelo menos 1 NA:", sum(!complete.cases(titanic)), "\n")

#1 b- ii) Guardar quantos NAs existem (espera-se 2, conforme enunciado)
n_na_total <- sum(!complete.cases(titanic))
if(n_na_total > 0) {
  # Remover linhas com NAs
  titanic_clean <- na.omit(titanic)
} else {
  titanic_clean <- titanic
}
cat("Registos após na.omit():", nrow(titanic_clean), "\n")

# --- c) Ordenar o dataset por Age
if("age" %in% names(titanic_clean)) {
  titanic_ord <- titanic_clean[order(titanic_clean$age), ]
  head(titanic_ord)
}

# --- d) Quantos passageiros por porto de embarque (Embarked)
if("embarked" %in% names(titanic_clean)) {
  # Se embarque estiver codificado numericamente, podes mapear os níveis conforme necessário.
  # Aqui mostramos a tabela direta:
  cat("Contagem por Embarked:\n")
  print(table(titanic_clean$embarked, useNA = "ifany"))
}

# --- e) Tabela de correlações (apenas variáveis numéricas)
num_cols <- sapply(titanic_clean, is.numeric)
titanic_num <- titanic_clean[, num_cols, drop = FALSE]
if(ncol(titanic_num) >= 2) {
  correlacao <- round(cor(titanic_num, use = "complete.obs"), 3)
  cat("Matriz de correlação (numéricas):\n")
  print(correlacao)
} else {
  cat("Não há suficientes colunas numéricas para calcular correlações.\n")
}

# --- f) Best subsets (leaps) para selecionar variáveis que melhor explicam 'survived'
# Garantir 'survived' numérico na cópia para regsubsets
titanic2 <- titanic_clean
if("survived" %in% names(titanic2)) {
  # Converter survived para numérico (0/1) se necessário
  if(!is.numeric(titanic2$survived)) {
    # tentar converter de factor/character -> numérico
    titanic2$survived <- as.numeric(as.character(titanic2$survived))
  }
  # Selecionar só colunas numéricas (regsubsets trabalha melhor com numéricas);
  # se quiseres incluir fatores, convém criar dummies antes
  dados_numeric <- titanic2[, sapply(titanic2, is.numeric), drop = FALSE]
  # Assegurar que survived está presente
  if("survived" %in% names(dados_numeric)) {
    subset_model <- regsubsets(survived ~ ., data = dados_numeric, nvmax = min(10, ncol(dados_numeric)-1))
    resultado <- summary(subset_model)
    cat("Resultados regsubsets (which):\n")
    print(resultado$which)
    cat("Adj R2 por modelo:\n"); print(resultado$adjr2)
    cat("Cp por modelo:\n"); print(resultado$cp)
    cat("BIC por modelo:\n"); print(resultado$bic)
  } else {
    cat("A coluna 'survived' não está disponível como numérica no dataset para regsubsets.\n")
  }
} else {
  cat("Coluna 'survived' não encontrada: não é possível executar regsubsets.\n")
}

# --- g) Baralhar dataset
set.seed(123)
titanic_shuffled <- titanic2[sample(nrow(titanic2)), ]
head(titanic_shuffled)

# --- h) Divisão treino/teste (70% treino / 30% teste)
set.seed(123)
if("survived" %in% names(titanic_shuffled)) {
  split <- sample.split(titanic_shuffled$survived, SplitRatio = 0.7)
  train <- subset(titanic_shuffled, split == TRUE)
  test  <- subset(titanic_shuffled, split == FALSE)
  cat("Dimensões -> treino:", dim(train), " teste:", dim(test), "\n")
} else {
  stop("Coluna 'survived' necessária para dividir treino/teste não encontrada.")
}

# --- i) Preparar fatores nas variáveis categóricas (treino e teste)
# Ajusta os nomes conforme o teu ficheiro; aqui assumimos "sex","embarked","X.pclass"
factor_cols <- intersect(c("sex","embarked","X.pclass","survived"), names(train))
train[factor_cols] <- lapply(train[factor_cols], function(x) factor(x))
test[factor_cols]  <- lapply(test[factor_cols], function(x) factor(x))

# --- j) Treinar modelo de árvore de decisão (rpart)
formula_tree <- survived ~ X.pclass + sex + age + sibsp + parch + fare + embarked
model_tree <- rpart(formula_tree, data = train, method = "class", control = rpart.control(cp = 0.01))

# Visualizar árvore
rpart.plot(model_tree, main = "Árvore de Decisão - Titanic")

# Mostrar importância das variáveis
cat("Importância das variáveis (rpart):\n")
print(model_tree$variable.importance)

# --- k) Testar o modelo: previsões, matriz de confusão, ROC/AUC
# Previsão de probabilidades para a classe '1' (assume-se que o segundo nível corresponde a survived=1)
pred_probs <- predict(model_tree, test, type = "prob")[,2]
pred_class <- predict(model_tree, test, type = "class")

# Matriz de confusão
conf_matrix <- table(Real = test$survived, Predito = pred_class)
cat("Matriz de Confusão:\n"); print(conf_matrix)

# Métricas básicas
accuracy <- sum(diag(conf_matrix))/sum(conf_matrix)
cat("Acurácia:", round(accuracy, 4), "\n")

# ROC / AUC (converter resposta real para numérico 0/1)
real_numeric <- as.numeric(as.character(test$survived))
roc_obj <- roc(response = real_numeric, predictor = pred_probs)
cat("AUC:", round(auc(roc_obj), 4), "\n")
plot(roc_obj, main = paste("ROC curve - AUC =", round(auc(roc_obj), 4)))

# --- l) Adicionar previsões ao dataset original (mapear de volta usando índice original)
# Para mapear, vamos recriar um índice 'orig_row' no shuffled que representa a linha no titanic2 original
# NOTA: titanic2 era a versão sem NAs (titanic_clean), por isso usamos essa referência.
titanic_shuffled$orig_row <- as.numeric(rownames(titanic_shuffled))  # índice relativo à titanic2

# Criar colunas no dataset original (titanic_clean ou titanic)
# Usamos titanic_clean como original limpo sem NAs
titanic_clean$PredictedClass <- NA
titanic_clean$PredictedProb  <- NA

# Mapear previsões do conjunto 'test' (que veio de titanic_shuffled) para titanic_clean
# O objecto 'test' tem as mesmas rownames como em titanic_shuffled
# Vamos obter as rownames (orig_row) do test e usá-las para indexar titanic_clean
test_orig_rows <- as.numeric(rownames(test))

titanic_clean$PredictedClass[test_orig_rows] <- as.character(pred_class)
titanic_clean$PredictedProb[test_orig_rows]  <- pred_probs

# Visualizar primeiras linhas com as novas colunas
head(titanic_clean)

titanic_clean$PredictedClass <- predict(model_tree, titanic_clean, type="class")
titanic_clean$PredictedProb <- predict(model_tree, titanic_clean, type="prob")[,2]  # probabilidade de sobrevivência


# --- 15) Exportar dataset com previsões (opcional)
# write.csv(titanic_clean, "C:/Users/Neide Varela/Documents/Acadamia Data Analyst- Cesae/R/PL6/titanic_with_predictions.csv", row.names = FALSE)

# --- 16) Interpretação (impressa no console)
cat("\n--- INTERPRETAÇÃO RÁPIDA ---\n")
cat("As colunas adicionadas foram 'PredictedClass' (classe prevista) e 'PredictedProb' (probabilidade prevista de sobrevivência).\n")
cat("Verifica o 'model_tree$variable.importance' para saber as variáveis mais importantes na árvore.\n")
