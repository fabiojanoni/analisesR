#AJUSTE DOS DADOS
dados[ , 2:8] <- lapply(dados[ , 2:8], function(x){ factor(x, 
                                                       levels = c("1", "2", "3", "4", "5"),                                  
                                                       labels = c("FRACO", "MODERADO", "SATISFATÓRIO", "MUITO BOM", "EXCELENTE"))})

names(dados)[2:8] <- paste(names(dados)[2:8], itens$texto, sep="_")


#install.packages("likert")
library(likert)
lik <- likert(as.data.frame(dados[ , 2:8]))

# Opção 1
plot(lik, wrap = 60, text.size=3) + theme(axis.text.y = element_text(size="5"))

# Opção 2
plot(lik, type = "heat", wrap = 60, text.size=3) + theme(axis.text.y = element_text( size="5"))

#SEPARAR POR CATEGORIA
lik2 <- likert(as.data.frame(dados[ , 5:8]), grouping = dados$categ)
plot(lik2, wrap = 60, text.size=3) + theme(axis.text.y = element_text(size="6"))
