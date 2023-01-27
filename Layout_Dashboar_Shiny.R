
# -------------------------------------------------------------------------
# Ativação de Pacotes 
# [] Passo 1: Ativar os Pacotes
# [] Passo 2: Atualizar Versao de Pacotes
# -------------------------------------------------------------------------

# Pacotes: Leitura de Base de Dados
#library(readr)
#library(readxl)

# Pacotes: Criar Formulas no LaTeX
#library(tinytex)

# Pacotes: Construção de Tabelas
#library(gt)
#library(DT)
#library(kableExtra)
#library(formattable)
#library(rhandsontable)
#library(gridExtra)

# Pacotes: DashBoard
#library(knitr)
library(shiny)
library(shinydashboard)
#library(shinycssloaders)
library(shinythemes)
library(shinyWidgets)
#library(rsconnect)

# Pacote: Manipulação Dados
library(tidyverse)
library(dplyr)
library(magrittr)

# Pacotes: Gráficos/Mapas
library(ggplot2)
library(ggcorrplot)
library(esquisse)
library(dplyr)
library(ggplot2)
#library(gganimate) 
#library(ggspatial)
library(plotly)
#library(highcharter)
#library(ggtext)
#library(maps)
#library(gifski)
#library(leaflet)
#library(crul)
#library(ggpubr)
#library(htmltools)
#library(htmlwidgets)
#library(sp)
#library(tmap)
#library(raster)
#library(geobr)
#library(RColorBrewer) 
#library(colorspace)
# -------------------------------------------------------------------------

# -------------------------------------------------------------------------
# Criação de DashBoard/Painel de Controle
# [] Passo 1: Criar Interface do Usuário
# [] Passo 2: Criar Menu Servidor
# [] Passo 3; Criar ShinyaApp 
# -------------------------------------------------------------------------



# -------------------------------------------------------------------------
ui <- dashboardPage(skin = "blue", 
                    
                    
dashboardHeader(title="Anuário Estatístico de Acidentes de Trânsito",titleWidth = 500,
tags$li(class="dropdown",tags$a(href="https://www.detran.pa.gov.br",icon("linkedin"),"Detran", target="_blank")),
tags$li(class="dropdown",tags$a(href="https://github.com/MarioDhiego", icon("github"), "Author", target="_blank")),
                  dropdownMenu(type = "messages"),
                  dropdownMenu(type = "notifications"),
                  dropdownMenu(type = "tasks"))),




#fluidRow(
#column(width = 12,
#selectInput(inputId="gender",label="Gênero:",
#choices=c("Masculino","Feminino"),
#selected = 'Masculino')),
#column(width = 12,
#selectInput(inputId="escolaridade", 
#label="Escolaridade:",
#choices=c("Fundamental","Medio", "Superior"),
#selected = 'Fundamental')),
#column(width = 12,
#selectInput(inputId="raca", 
#label="Raça:",
#choices=c("Branca","Parda","Negra"),
#selected = 'Branca')),
#column(width = 12,
#selectInput(inputId="Renda", 
#label="Renda Familiar:",
#choices=c("Atém 1 SM","2 a 3 sm"," 3 a 5 sm"),
#selected = 'Até 1 SM')),
#column(width = 12,
#selectInput(inputId="Tipo", 
#label="Tipo de Acidentes:",
#choices=c("Atropelamento","Queda de Moto","Colisão"),
#selected = 'Atropelamento')),
#column(width = 12,
#selectInput(inputId="Condição", 
#label="Condição da Vitima:",
#choices=c("Pedestre","Condutor","Motociclista", "Ciclista"),
#selected = 'Pedestre')),
#column(width = 12,
#selectInput(inputId="Turno", 
#label="Turno:",
#choices=c("Manha","Tarde", "Noite", "Madrigada"),
#selected = 'Manha')),
#menuItem("Mapas", tabName = "map", icon=icon("map")),
#)
#)
#),



#dashboardBody(
#  fluidRow(
#    infoBox(title= "Média"),
#    infoBox(title = "Mediana"),
#    infoBox(title = "3ºQuartil"),
#    plotOutput("plot1"),
#    plotOutput("plot2"),
# )
#)
#)
  



server <- function(input, output, session){}
  
#library(readxl)
#library(magrittr)
#library(esquisse)
#library(plotly)
  
#output$plot1 <- renderPlotly({
#setwd("C:/Users/mario Dhiego/Documents/ENADE_2018_RMarkdown/Esqueleto_shiny")
#Base_Pareamento <- read_excel("base_pareamento.xls")
#Figura1 <- Base_Pareamento %>%
#  ggplot()+aes(x=GÊNERO)+
#  geom_bar(fill="#0852EF")+
#  labs(x="Gênero",y="Nº de Vítimas Fatais",caption = "Fonte: Detran-PA")+
#  theme_gray() +
#  theme(axis.title.y = element_text(size = 12L,face = "bold"),
#        axis.title.x = element_text(size = 12L,face = "bold"))
#ggplotly(Figura1)
#})


#output$plot2 <- renderPlotly({
#setwd("C:/Users/mario Dhiego/Documents/ENADE_2018_RMarkdown/Esqueleto_shiny")
#Base_Pareamento <- read_excel("base_pareamento.xls")
#Figura2 <- Base_Pareamento %>%
#    ggplot()+aes(x=`ESTADO CIVIL`)+
#    geom_bar(fill="#ED082E")+
#    labs(x="Estado Civil",y="Nº de Vítimas Fatais",caption="Fonte: Detran-PA")+
#    theme_gray() +
#    theme(axis.title.y = element_text(size = 12L,face = "bold"),
#          axis.title.x = element_text(size = 12L,face = "bold"))
#ggplotly(Figura2)
#})












shinyApp(ui, server)


