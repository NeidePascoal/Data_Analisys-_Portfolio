# Carregar o ficheiro CSV
casas_pl <- read.csv("C:/Users/Neide Varela/Documents/Acadamia Data Analyst- Cesae/R/PL07/casas.csv",
                     header = TRUE, sep = ",", stringsAsFactors = FALSE)


head(casas_pl)
str(casas_pl)

# Calcular a matriz de correlação apenas com colunas numéricas
casas_num <- casas_pl

casas_num$id <- NULL   # remover ID
casas_num$date <- NULL # opcional (não é numérica)

# Calcular correlação das restantes colunas numéricas
correlacoes <- cor(casas_num[sapply(casas_num, is.numeric)], use = "complete.obs")
print(correlacoes)


##i. Analise os campos que têm melhor correlação com o campo “price” 
correlacoes_com_price <- sort(correlacoes["price", ], decreasing = TRUE)
print(correlacoes_com_price)


## a) já está feito acima

## b) baralhar
set.seed(123)
casas_embaralhado <- casas_pl[sample(nrow(casas_pl)), ]



## c) dividir
tamanho_treino <- floor(0.8 * nrow(casas_embaralhado))

treino <- casas_embaralhado[1:tamanho_treino, ]
teste  <- casas_embaralhado[(tamanho_treino + 1):nrow(casas_embaralhado), ]

## d) modelo
modelo <- lm(price ~ bedrooms + bathrooms + sqft_living + grade, data = treino)
summary(modelo)

## e) prever no TESTE (correto!)
previsoes <- predict(modelo, newdata = teste)

## R² no TESTE
SSE <- sum((teste$price - previsoes)^2)
SST <- sum((teste$price - mean(teste$price))^2)
R2 <- 1 - (SSE/SST)
print(paste("R²: ", round(R2, 4)))

## f) adicionar previsões ao dataset original
casas_pl$previsao_price <- predict(modelo, newdata = casas_pl)
head(casas_pl)


head(casas_pl[, c("price", "previsao_price")])


##O modelo apresenta um desempenho razoável na previsão de preços de imóveis de faixa média, como observado
## onde a estimativa se aproxima bem do valor real. No entanto, ele demonstra um padrão característico de
## modelos com R² em torno de 0,54: a tendência de superestimar imóveis mais caros e subestimar imóveis
## muito baratos ou excessivamente valorizados. Esse comportamento ocorre porque o modelo captura bem as
##tendências gerais do mercado, mas tem dificuldade em representar com precisão os preços situados nos 
##extremos da distribuição.
