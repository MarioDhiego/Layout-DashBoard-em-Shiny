
# Leitura de Base de Dados
library(readr)
library(readxl)

# Fazer Dashboard
library(shiny)
library(shinydashboard)
library(shinyauthr)
library(shinyjs) 
library(sodium) 

# Manipulação de Dados
library(tidyverse)
library(dplyr)
library(magrittr)

# Fazer Gráficos
library(ggplot2)

# Incluir Temas no gráfico
library(ggthemes)

# Fazer Mapas
library(geobr)
library(sf)
library(tmap)

# Fazer gráficos Dinâmicos
library(plotly)

# Fazer Tabelas Dinâmicas
library(DT)
library(data.table)
library(reactable)
library(kableExtra)
library(sparkline)

# Fazer Gráfico de Correlação
library(ggcorrplot)

# Trabalhar com html
library(htmltools)
library(htmlwidgets)

# Trabalhar com Markdown
library(markdown)
library(rmarkdown)

# Customização Visual
#library(fresh)
library(stargazer)


# Customização Visual
#meu_tema <- create_theme(
#  adminlte_color(
#    aqua="#0821F7",
#    blue="#6573E5",
#    red ="#ABB2ED",
#  ),
#    adminlte_sidebar(
#      dark_bg="#09DAF3"
#        ),
#    adminlte_global(
#      content_bg="#99DEE6" 
#    )
#    )






# Criação dos Menus
ui <- dashboardPage(title= "Dasboard Acidentes de Transito",skin="blue",
dashboardHeader(tags$li(div(img(src='detran.jpeg',
                height = "20px"),
                style = "padding-top:12px; padding-right:200px;"),
                class = "dropdown"),
                title="ANUÁRIO ESTATÍSTICO DE ÓBITO POR ACIDENTES DE TRÂNSITO",
                titleWidth=660,
                tags$li(class = "dropdown",
                        tags$style(".main-header {max-height:50px}"),
                        tags$style(".main-header .logo {height:50px}")
                ),
                tags$li(class="dropdown",tags$a(href="https://www.detran.pa.gov.br",icon("linkedin"),"DETRAN-PA",target="_blank")),tags$li(class="dropdown",tags$a(href="https://github.com/MarioDhiego",icon("github"), "AUTHOR",target="_blank")),
                dropdownMenu(type="messages"),
                dropdownMenu(type="notifications"),
                dropdownMenu(type="tasks")
),
dashboardSidebar(width=200,
                 tags$style(".left-side, .main-sidebar {padding-center: 120px}"),
  sidebarMenu(
    menuItem("ANUÁRIO"                       ,tabName="about1",icon=icon("address-card"),
            menuSubItem("Sobre Anuário"      ,tabName="sobre1"),
            menuSubItem("Pareamento de Dados",tabName="pareamento1") 
             ),
    menuItem("MICRODADOS"                    ,tabName="banco1",icon=icon("database"),
              menuSubItem("Base de Dados"    ,tabName="base1"),
              menuSubItem("Fonte de Dados"   ,tabName="fonte1"),
              menuSubItem("Medidas"          ,tabName="medi1")),
    menuItem("SOCIOECONÔMICO"                ,tabName="socio1",icon=icon("male"),
             menuSubItem("Gênero"            ,tabName="genero1"),
             menuSubItem("Faixa Etaria"      ,tabName="idade1"),
             menuSubItem("Raca"              ,tabName="raca1"),
             menuSubItem("Escolaridade"      ,tabName="escola1"),
             menuSubItem("Renda Familiar"    ,tabName="renda1"),
             menuSubItem("Estado Civil"      ,tabName="civil1")),
    menuItem("CONDIÇÃO DA VÍTIMA"          ,tabName="condicao1",icon=icon("wheelchair"),
           menuSubItem("Condição da Vítima",tabName="condi1"),
           menuSubItem("Tipo da Vítimas"   ,tabName="tipo1"),
           menuSubItem("Tipo de Acidente"  ,tabName="acid1"),
           menuSubItem("Tipo de Veiculos"  ,tabName="veiculo1"),
           menuSubItem("Efeito de Drogas"  ,tabName="droga1"),
           menuSubItem("Efeito de Alcool"  ,tabName="alcool1")),
  menuItem("OCORRÊNCIAS"                   ,tabName="calendario1",icon=icon("calendar"),
           menuSubItem("Dias Semana"       ,tabName="dia1"),
           menuSubItem("Meses"             ,tabName="mes1"),
           menuSubItem("Ano"               ,tabName="ano1"),
           menuSubItem("Turno"             ,tabName="turno1")),
  menuItem("CUSTO HOSPITALAR"              ,tabName="custo1",icon = icon("hospital"),
           menuSubItem("Dias de Internacao" ,tabName="dias1"),
           menuSubItem("Custo de internacao",tabName="custo2")),
  menuItem("MAPAS"                         ,tabName="map1", icon=icon("globe"),
           menuSubItem("Belém"             ,tabName="bel1"),
           menuSubItem("Municípios"        ,tabName="munic1"))
  )
  ),
dashboardBody(
#  use_theme(meu_tema),
  tabItems(
    tabItem(tabName="sobre1",
            fluidRow(
              column(width=8,
                     position="left",
              tags$img(src="crime.jpeg",width=600,height=400),
              tags$br() , 
              tags$a("Photo by Asdecom"),align="left"),
              column(width=4,
              tags$br(),
              tags$p(style="text-align:justify;font-si20pt",strong("ANUÁRIO ESTATÍSTICO DE ÓBITO POR ACIDENTE DE TRÂNSITO DO DETRAN-PA, É UM CATÁLOGO QUE ENGLOBA DADOS SOBRE AS CARACTERÍSTICAS DAS VÍTIMAS FATAIS, CUJO RESULTADO É UM PROCESSO DE GESTÃO E INTEGRAÇÃO DE MÚLTIPLAS BASES DE DADOS, UTILIZANDO O MÉTODO PRABABILÍSTICO DE RELACIONAMENTO DE REGISTROS DESENVOLVIDO POR FELLEGI E SUNTER(1969).")),
              tags$p(style="text-align: justify;font-si20pt",strong("PARA CRIAÇÃO DO ANUÁRIO EM FORMATO WEB, FOI CRIADO UM SCRIPT EM LINGUAGEM DE PROGRAMAÇÃO R-PROJECT VERSÃO 4.2.2 E UM AMBIENTE DE DESENVOLVIMENTO INTEGRADO(IDE) CHAMADO Rstudio VERSÃO 1.4.1.7 COM USO DE VÁRIOS PACOTES, PARA O AMBIENTE WINDOWS.")),
              tags$p(style="text-align: justify;font-si20pt",strong("O ANUÁRIO FOI CONSTRUÍDO EM ALINHAMENTO AO MANUAL DE GESTÃO DO RENAEST (RESOLUÇÃO DO CONTRAN Nº808/2020), UTILIZANDO METODOLOGIA FACTÍVEIS COM ESTATÍSTICAS DE TRÂNSITO PADRONIZADA PARA TODO O TERRITÓRIO NACIONAL, E AOS OBJETIVO DE DESENVOLVIMENTOS SUSTENTÁVEIS (RESOLUÇÃO DA ONU Nº70/2015)."))
            )
            )
            ),
    tabItem(tabName="pareamento1"),
    tabItem(tabName="genero1",
            fluidRow(
              box(width=6,
                  title="Gênero da Vítimas",
                  status="primary",
                  solidHeader=TRUE,
                  collapsible=TRUE,
                  height=10, 
                  plotlyOutput("histograma1")
              ),
              box(width=6,
                title="Estatística Resumo",
                status="primary",
                solidHeader=TRUE,
                collapsible=TRUE,
                height=10,
                verbatimTextOutput("summary1")
              )
            ),
    ),
    tabItem(tabName="idade1",
            fluidRow(
              box(width=7,
                  title="Faixa Etária das Vítimas",
                  status="primary",
                  solidHeader=TRUE,
                  collapsible=TRUE,
                  height=15, 
                  plotlyOutput("histograma2")
              ),
              box(width=5,
                  title="Estatística Descritiva",
                  status="primary",
                  solidHeader=TRUE,
                  collapsible=TRUE,
                  height=12,
                  verbatimTextOutput("resumoidade")
              )
            )
    ),
    tabItem(tabName="raca1",
            fluidRow(
              box(width=7,
                  title="Raça das Vítimas",
                  status="primary",
                  solidHeader=TRUE,
                  collapsible=TRUE,
                  height=12, 
                  plotlyOutput("histograma3")
              )
            )
    ),
    tabItem(tabName="escola1",
            fluidRow(
              box(width=7,
                  title="Grau de Escolaridades das Vítimas",
                  status="primary",
                  solidHeader=TRUE,
                  collapsible=TRUE,
                  height=12, 
                  plotlyOutput("histograma4")
              )
            )
    ),
    tabItem(tabName="base1",
            fluidRow(
              box(width=12,
                  title="Data Set",
                  status="primary",
                  solideHeder=TRUE,
                  collapsible=TRUE,
                  height=35, 
                  dataTableOutput("tabela1")
              )
            )
    ),
    tabItem(tabName="condi1",
            fluidRow(
              box(width=7,
                  title="Condicao da Vitima",
                  status="primary",
                  solideHeder=TRUE,
                  collapsible=TRUE,
                  height=35, 
                  plotlyOutput("histograma5")
              )
            )
    ),
    tabItem(tabName="civil1",
            fluidRow(
              box(width=7,
                  title="Estado Civil da Vitima",
                  status="primary",
                  solideHeder=TRUE,
                  collapsible=TRUE,
                  height=35, 
                  plotlyOutput("histograma6")
              )
            )
    )
    
    
    
    
    
    
    
)
)
)

server <- function(input, output, session){


#-------------------------------------------------------------------------------
# Gráfico 2 - Genero
output$histograma1 <- renderPlotly({

# Definir diretorio
setwd("C:/Users/mario Dhiego/Documents/ENADE_2018_RMarkdown/Esqueleto_shiny/DashBoard1/Layout-DashBoard-em-Shiny")

# Ler Base de Dados
Tabela_DT <- read_excel("Tabela_DT.xls")
Tabela_DT$Genero = factor(Tabela_DT$Genero,
                          levels=names(sort(table(Tabela_DT$Genero), 
                                            decreasing=TRUE)))  

g1 <- ggplot(Tabela_DT)+
  aes(x=Genero)+
  geom_bar(fill="blue")+
 labs(x="Gênero",
      y="Número de Vítimas",
      title="Gráfico de Barras",
      caption="Fonte: Detran")+
  theme_gray()+
 theme(plot.title=element_text(size=12L,face="bold",hjust=0.5), 
       plot.caption=element_text(size=10L,face="bold",hjust=0), 
       axis.title.y=element_text(size=12L,face="bold"), 
       axis.title.x=element_text(size=12L,face="bold"),
       legend.position = "bottom")
ggplotly(g1)

#(table(Tabela_DT$Genero),
#        xlab="",
#        ylab="",
#        col="blue",
#        #xlim=c(0,300),
#        #ylim=c(0,300),
#        axis.lty="solid",
#        lwd=2,
#        font=2,
#        main="Gráfico de Barras")

  })
#-------------------------------------------------------------------------------



  
output$summary1 <- renderPrint({
    summary(mtcars$mpg)
  })
  

output$resumoidade <- renderPrint({
  summary(Tabela_DT$Idade)
})


# Gráfico 2 - Idade
output$histograma2 <- renderPlotly({
g2 <- ggplot(Tabela_DT, aes(x=Idade))+
  geom_histogram(aes(y=..density..), bins=30L,binwidth=5,fill="blue")+
  geom_density(alpha=.2, fill="white")+
    labs(x="Idade",
         y="Número de Vítimas",
         title="Histograma",
         caption="Fonte: Detran")+
  theme_gray(base_size=14)+
  theme(plot.title=element_text(size=12L,face="bold",hjust=0.5), 
        plot.caption=element_text(size=10L,face="bold",hjust=0), 
        axis.title.y=element_text(size=12L,face="bold"), 
        axis.title.x = element_text(size=12L,face="bold"))
ggplotly(g2)
  
    #hist(Tabela_DT$Idade,
    #     col="blue",
    #     freq=T,
    #     xlab="Idades",
    #    ylab="Nº de Vítimas Fatais",
    #     border="black",
    #     xlim=c(0,100),
    #     ylim=c(0,80),
    #     axis.lty="solid",
    #     lwd=2,
    #     font=2,
    #     #probability=TRUE,
    #     main="Hitograma das Idades",
    #     #sub="Fonte: Detran"
    #    )
  })


output$histograma4 <- renderPlotly({
Tabela_DT$Escolaridade = factor(Tabela_DT$Escolaridade,
                          levels=names(sort(table(Tabela_DT$Escolaridade), 
                          decreasing=TRUE)))  

g3 <- ggplot(Tabela_DT, aes(x=Escolaridade))+
  geom_bar(fill="blue")+
  labs(x="Grau de Escolaridade",
       y="Número de Vítimas",
       title="Gráfico de Barras",
       caption="Fonte: Detran")+
  theme_gray()+
  theme(plot.title=element_text(size=12L,face="bold",hjust=0.5), 
        plot.caption=element_text(size=10L,face="bold",hjust=0), 
        axis.title.y=element_text(size=12L,face="bold"), 
        axis.title.x=element_text(size=12L,face="bold"),
        legend.position = "bottom")
ggplotly(g3)


})



output$histograma3 <- renderPlotly({
  Tabela_DT$Raca = factor(Tabela_DT$Raca ,
                                  levels=names(sort(table(Tabela_DT$Raca ), 
                                                    decreasing=TRUE)))
  g4 <- ggplot(Tabela_DT, aes(x=Raca))+
    geom_bar(fill="blue")+
    labs(x="Raça",
         y="Número de Vítimas",
         title="Gráfico de Barras",
         caption="Fonte: Detran")+
    theme_gray()+
    theme(plot.title=element_text(size=12L,face="bold",hjust=0.5), 
          plot.caption=element_text(size=10L,face="bold",hjust=0), 
          axis.title.y=element_text(size=12L,face="bold"), 
          axis.title.x=element_text(size=12L,face="bold"),
          legend.position = "bottom")
  ggplotly(g4)
})


output$histograma5 <- renderPlotly({
  Tabela_DT$Condição = factor(Tabela_DT$Condição,
                          levels=names(sort(table(Tabela_DT$Condição), 
                                            decreasing=TRUE)))
  g5 <- ggplot(Tabela_DT, aes(x=Condição))+
    geom_bar(fill="blue")+
    labs(x="Condição da Vítima",
         y="Número de Vítimas",
         title="Gráfico de Barras",
         caption="Fonte: Detran")+
    theme_gray()+
    theme(plot.title=element_text(size=12L,face="bold",hjust=0.5), 
          plot.caption=element_text(size=10L,face="bold",hjust=0), 
          axis.title.y=element_text(size=12L,face="bold"), 
          axis.title.x=element_text(size=12L,face="bold"),
          legend.position = "bottom")
  ggplotly(g5)
})



output$histograma6 <- renderPlotly({
  Tabela_DT$`Estado Civil` = factor(Tabela_DT$`Estado Civil`,
                              levels=names(sort(table(Tabela_DT$`Estado Civil`), 
                                                decreasing=TRUE)))
  g6 <- ggplot(Tabela_DT, aes(x=`Estado Civil`))+
    geom_bar(fill="blue")+
    labs(x="Estado Civil da Vítima",
         y="Número de Vítimas",
         title="Gráfico de Barras",
         caption="Fonte: Detran")+
    theme_gray()+
    theme(plot.title=element_text(size=12L,face="bold",hjust=0.5), 
          plot.caption=element_text(size=10L,face="bold",hjust=0), 
          axis.title.y=element_text(size=12L,face="bold"), 
          axis.title.x=element_text(size=12L,face="bold"),
          legend.position = "bottom")
  ggplotly(g6)
})









  
output$tabela1 <- renderDataTable({
setwd("C:/Users/mario Dhiego/Documents/ENADE_2018_RMarkdown/Esqueleto_shiny/DashBoard1/Layout-DashBoard-em-Shiny")
  Tabela_DT <- read_excel("Tabela_DT.xls")
  datatable(Tabela_DT, 
            plugins='natural',
            extensions='Buttons',
            options=list(dom='Blfrtip',buttons=c('copy','csv','excel','pdf','print'),
                           engthMenu=list(c(5,50,100,250,-1)), c(5,50,100,250,"All"),
                           pageLength=5, 
                           autoWidth=TRUE,
                           scrollX=TRUE),
          rownames=FALSE,
          class='cell-border compact stripe hover row-border order-column dt-body-right',
          style='bootstrap',
          editable='cell',
          colnames=c('Gênero','Idade','Raça','Estado Civil','Escolaridade','Condição','Tipo','Turno','Bairro', 'Municipios'),
          caption='Base de Dados sobre Vitimas Fatais por Acidentes de Trânsito-2020.')
  })

#output$regressao1 <- renderPrint({
#  model1 <- lm(mpg~am,data=mtcars)
#  model2 <- lm(mpg~am + wt + hp,data=mtcars)
#  modelo1 <- stargazer(model1,model2,digits=4, type = "html", header = FALSE)
#})
    
    
    
  

  
  
  
  
}





shinyApp(ui, server)
