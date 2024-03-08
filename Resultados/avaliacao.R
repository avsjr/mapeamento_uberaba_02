# Carregue a biblioteca
library(ggplot2)

# Crie um data frame com os dados
data <- data.frame(
  Data = c("01/04/2022", "30/08/2022", "15/09/2022", "01/10/2022", "24/06/2023", "15/09/2023", "29/09/2023", "18/02/2024"),
  Otimo = c(1.83, 6.00, 5.00, 2.12, 3.02, 6.00, 7.00, 7.70),
  Bom = c(31.14, 25.00, 25.20, 19.06, 22.33, 20.00, 19.00, 35.20),
  Regular = c(36.05, 32.00, 29.80, 46.35, 34.88, 19.00, 20.00, 24.50),
  Ruim = c(17.65, 11.00, 9.00, 22.35, 16.28, 34.00, 32.00, 10.60),
  Pessimo = c(4.83, 18.00, 24.80, 6.35, 21.86, 21.00, 22.00, 17.10),
  NsNr = c(8.49, 9.00, 6.20, 3.76, 1.63, NA, NA, 5.00)
)

# Transforme os dados para o formato longo (tidy)
library(tidyr)
data_long <- gather(data, Key, Value, -Data)

# Reordene os níveis do fator "Key"
data_long$Key <- factor(data_long$Key, levels = c("Otimo", "Bom", "Regular", "Ruim", "Pessimo", "NsNr"))

# Ordene as datas
data_long$Data <- factor(data_long$Data, levels = c("01/04/2022", "30/08/2022", "15/09/2022", "01/10/2022", "24/06/2023", "15/09/2023", "29/09/2023", "18/02/2024"))

# Crie o gráfico de barras agrupado
ggplot(data_long, aes(x = Data, y = Value, fill = Key, label = sprintf("%.2f", Value))) +
  geom_bar(stat = "identity", position = position_dodge(), color = "white") +
  geom_text(position = position_dodge(width = 0.9),    # ajuste da posição dos rótulos
            vjust = -0.5,                             # ajuste vertical dos rótulos
            size = 3) +                               # tamanho dos rótulos
  labs(title = "AVALIAÇÃO DA ADMINISTRAÇÃO ELISA ARAÚJO",
       x = "Data",
       y = NULL,
       fill = "Categoria") +
  scale_fill_brewer(palette = "Set3") +               # conjunto de cores mais suave
  theme_minimal() +
  theme(legend.position = "bottom",                   # move a legenda para a parte inferior
        legend.title = element_blank(),               # remove o título da legenda
        axis.text.x = element_text(angle = 45, hjust = 1))  # ajusta a orientação do texto no eixo x

