dados_casas <- read.csv("C:/Users/Neide Varela/Documents/Acadamia Data Analyst- Cesae/R/PL5/casas.csv", header = TRUE, sep = ",")

head(dados_casas)

summary(dados_casas)


str(dados_casas)

## a 
#Arredondar todas as colunas numéricas para 2 casas decimais
dados_casas <- as.data.frame(lapply(dados_casas, function(x) {
  if (is.numeric(x)) round(x, 2) else x
}))
head(dados_casas)

## b
 install.packages("corrplot")
 library(corrplot)
 
 # Selecionar apenas colunas numéricas
 dados_num <- dados_casas[sapply(dados_casas, is.numeric)]
 
 # Calcular a matriz de correlação
 matriz_cor <- cor(dados_num, use = "complete.obs")  # ignora valores ausentes
 
 # Opção 1: Gerar um gráfico de correlação visual [web:5, web:4]
 corrplot(matriz_cor, method = "square")
 
 ## c 
 install.packages("corrgram")
 library(corrgram)
 
 corrgram(dados_num,
          upper.panel = panel.pie,
          lower.panel = panel.bar,
          diag.panel  = panel.density,
          main = "Corrgram do dataset casas")
 
 ## d - CORRELAÇÃO 
 cor(dados_num$sqft_living, dados_num$bathrooms, use = "complete.obs")
 
 ## e - CORRELAÇÃO 
 cor(dados_num$sqft_lot, dados_num$floors, use = "complete.obs")

 
 ## f 
 ## Não. Campos ID são apenas identificadores, não representam variáveis numéricas reais
 
 ## h TABELA NORMALIZADA (SCALED)
 casas_scaled <- as.data.frame(scale(dados_num))
 
 ## h Criar gráfico cotovelo segundo método silhouette
 install.packages("factoextra")
 library(factoextra)
 
 ## trabalhar com uma amostra
 set.seed(123)
 casas_sample <- casas_scaled[sample(nrow(casas_scaled), 3000), ]  # por ex. 3000 linhas
 
 fviz_nbclust(casas_sample, kmeans, method = "silhouette")
 
## conclusão - O gráfico mostra claramente que k = 2 é o número ideal de clusters, pois apresenta a maior largura média de silhueta, indicando que os dados se agrupam melhor em dois grupos.
 
## i Guardar número ideal de clusters

 k_ideal <- 2
 
## Executar classificação (k-means)
 set.seed(123)
 kmodel <- kmeans(casas_scaled, centers = 2 , nstart = 25)
 
 ## k  Gráfico dos clusters
 
  fviz_cluster(kmodel, data = casas_scaled)
  

## l Adicionar número de cluster ao dataset original
  
  dados_num$cluster <- as.factor(kmodel$cluster)
  print(dados_num)

## m Gráfico de dispersão baseado nos clusters
  
  library(ggplot2)
  
  ggplot(dados_num, aes(x = sqft_living, y = price, color = cluster)) +
    geom_point(alpha = 0.6) +
    theme_minimal() +
    labs(title = "Clusters no dataset casas")

  bank_clients<- read.csv("C:/Users/Neide Varela/Documents/Acadamia Data Analyst- Cesae/R/PL5/BankClients.csv", header = TRUE, sep = ";")
  
  head(bank_clients)
  
  ## 2.a Gráfico de correlação customizado (com corrplot)
  
  install.packages("corrplot")
  library(corrplot)
  
  # Selecionar apenas variáveis numéricas
  bank <- bank_clients[sapply(bank_clients, is.numeric)]
  
  # Matriz de correlação
  corr_matrix <- cor(bank, use = "complete.obs")
  
  # Gráfico customizado
  corrplot(corr_matrix,
           method = "color",
           type = "upper",
           tl.col = "black",
           tl.cex = 0.8,
           addCoef.col = "black",
           number.cex = 0.6,
           col = colorRampPalette(c("red", "white", "blue"))(200))
  
  
  ## 2.b – Análise da correlação entre age e income
  
  cor_age_income <- cor(bank$age, bank$income, use = "complete.obs")
  cor_age_income
  
  ## 2.c – Geração e classificação de clusters (ex.: K-means)
  
  # Selecionar variáveis numéricas para clustering
  dados_cluster <- bank[sapply(bank, is.numeric)]
  
  # Normalizar os dados
  dados_scaled <- scale(dados_cluster)
  
  # Determinar o nº ideal de clusters (ex.: método do cotovelo)
  install.packages("factoextra")
  library(factoextra)
  
  fviz_nbclust(dados_scaled, kmeans, method = "wss")
  
  # Supondo que o nº ideal é 4 (ajuste conforme o gráfico)
  set.seed(123)
  k4 <- kmeans(dados_scaled, centers = 4, nstart = 25)
  
  # Ver resultado dos clusters
  k4
  
  # Adicionar cluster ao dataset original
  bank$cluster <- as.factor(k4$cluster)
  
  # Visualização dos clusters
  fviz_cluster(k4, data = dados_scaled, geom = "point",
               ellipse.type = "convex", palette = "jco")
  
  k4$centers
  
  

 
 
