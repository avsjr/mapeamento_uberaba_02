# Carregue a biblioteca
library(ggplot2)
library(tidyr)

# Crie um data frame com os dados
data <- data.frame(
  Data = c("18/04/2023", "24/06/2023", "29/09/2023", "18/02/2024"),
  `Elisa Araújo` = c(11.00, 14.42, 16.00, 22.20),
  `Tony Carlos` = c(31.00, 29.07, 30.00, 21.60),
  `Ns/Nr` = c(19.00, 15.35, 17.00, 15.00),
  `Anderson Adauto` = c(NA, 8.60, 8.00, 12.50),
  `Paulo Piau` = c(7.00, 12.56, 6.00, 6.80),
  `Franco Cartafina` = c(7.00, 4.65, 6.00, 3.30),
  `Samir Cecílio` = c(NA, NA, NA, 2.10),
  `Branco/Nulo` = c(9.00, 12.33, 14.00, 16.50),
  `Patricia Melo` = c(NA, NA, 3.00, NA),
  `Marcos Montes` = c(NA, 3.02, NA, NA),
  `Anderson Cadina` = c(2.00, NA, NA, NA),
  `Thiago Mariscal` = c(14.00, NA, NA, NA)
)

# Transforme os dados para o formato longo (tidy)
data_long <- gather(data, Key, Value, -Data)

# Ordene as datas
data_long$Data <- factor(data_long$Data, levels = unique(data$Data))

# Crie o gráfico de barras agrupado com escala logarítmica no eixo y
ggplot(data_long, aes(x = Data, y = Value, fill = Key, label = sprintf("%.2f", Value))) +
  geom_bar(stat = "identity", position = position_dodge(), color = "white") +
  geom_text(position = position_dodge(width = 0.9),    # ajuste da posição dos rótulos
            vjust = -0.5,                             # ajuste vertical dos rótulos
            size = 3) +                               # tamanho dos rótulos
  labs(title = "VOTO ESTIMULADO PARA PREFEITO",
       x = "Data",
       y = NULL,
       fill = "Categoria") +
  scale_fill_brewer(palette = "Set3") +               # conjunto de cores mais suave
  scale_y_log10() +                                  # escala logarítmica no eixo y
  theme_minimal() +
  theme(legend.position = "bottom",                   # move a legenda para a parte inferior
        legend.title = element_blank(),               # remove o título da legenda
        axis.text.x = element_text(angle = 45, hjust = 1))  # ajusta a orientação do texto no eixo x