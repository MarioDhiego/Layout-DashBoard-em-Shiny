
library(readr)
library(readxl)
library(utils)
library(shiny)
library(shinydashboard)
library(dplyr)
library(ggplot2)
library(ggthemes)
library(sf)
library(plotly)
library(DT)
library(data.table)
library(reactable)
library(ggcorrplot)
library(htmltools)
library(htmlwidgets)
library(markdown)
library(rmarkdown)
library(fresh)


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
dashboardHeader(title="ANUÁRIO ESTATÍSTICO DE ÓBITO POR ACIDENTES DE TRÂNSITO",
                titleWidth=700,
                tags$li(class="dropdown",tags$a(href="https://www.detran.pa.gov.br",icon("linkedin"),"DETRAN-PA",target="_blank")),tags$li(class="dropdown",tags$a(href="https://github.com/MarioDhiego",icon("github"), "AUTHOR",target="_blank")),
                dropdownMenu(type="messages"),
                dropdownMenu(type="notifications"),
                dropdownMenu(type="tasks")
),
dashboardSidebar(
  sidebarMenu(
    menuItem("ANUÁRIO"                       ,tabName="about1",icon=icon("address-card"),
            menuSubItem("Sobre Anuário"      ,tabName="sobre1"),
            menuSubItem("Pareamento de Dados",tabName="pareamento1") 
             ),
    menuItem("MICRODADOS"                  ,tabName="banco1",icon=icon("database"),
              menuSubItem("Base de Dados"  ,tabName="base1"),
              menuSubItem("Fonte de Dados" ,tabName="fonte1"),
              menuSubItem("Medidas"        ,tabName="medi1")),
    menuItem("SOCIOECONÔMICO"              ,tabName="socio1",icon=icon("male"),
             menuSubItem("Gênero"          ,tabName="genero1"),
             menuSubItem("Faixa Etaria"    ,tabName="idade1"),
             menuSubItem("Raca"            ,tabName="raca1"),
             menuSubItem("Escolaridade"    ,tabName="escola1"),
             menuSubItem("Renda Familiar"  ,tabName="renda1")),
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
              column(width = 8, 
              tags$img(src="crime.jpeg",width =600,height = 400),
              tags$br() , 
              tags$a("Photo by Asdecom"),align="left"),
              column(width = 4, tags$br(),
              tags$p("Anuário Estatístico de Óbito por Acidente de Trânsito do Detran-Pa, é um catalogo que engloba dados sobre as características das vítimas fatais, cujo resultado é um processo de gestão e integração de multiplas bases de dados, utilizando o Método Probabilistico de Relacionamento de Registros desenvolvido por Fellegi e Sunter(1969)."),
              tags$p("Para criação do Anuário em formato Web, foi criado um script em Linguagem de Programação R-PROJECT versão 4.2.2 e um Ambiente de Desenvolvimento Integrado(IDE) chamado Rstudio versão 1.4.1.7 com uso de vários pacotes, para o ambiente Windows."),
              tags$p("O Anuário foi construído em Alinhamento ao Manual de Gestão do RENAEST (Resolução do CONTRAN Nº808/2020), utilizando metodologias factíveis com estatísticas de trânsito padronizada para todo o Território Nacional, e aos Objetivos de Desenvolvimento Sustentáveis (Resolução da ONU Nº70/2015).")
            )
            )
            ),
    tabItem(tabName="pareamento1"),
    tabItem(tabName="genero1",
            fluidRow(
              box(width=12,
                  title="Gênero da Vítimas",
                  background="green",
                  status="primary",
                  solidHeader=TRUE,
                  collapsible=TRUE,
                  height=10, 
                  plotOutput("histograma1")
              )
            )
    ),
    tabItem(tabName="idade1",
            fluidRow(
              box(width=12,
                  title="Faixa Etária das Vítimas",
                  status="primary",
                  solidHeader=TRUE,
                  collapsible=TRUE,
                  height=10, 
                  plotOutput("histograma2")
              )
            )
    ),
    tabItem(tabName="raca1",
            fluidRow(
              box(width=12,
                  title="Raça das Vítimas",
                  status="primary",
                  solidHeader=TRUE,
                  collapsible=TRUE,
                  height=10, 
                  plotOutput("histograma3")
              )
            )
    ),
    tabItem(tabName="escola1",
            fluidRow(
              box(width=12,
                  title="Grau de Escolaridades das Vítimas",
                  status="primary",
                  solidHeader=TRUE,
                  collapsible=TRUE,
                  height=10, 
                  plotOutput("histograma4")
              )
            )
    ),
    tabItem(tabName="base1",
            fluidRow(
              box(width=12,
                  title="Banco",
                  status="primary",
                  solideHeder=TRUE,
                  collapsible=TRUE,
                  height=10, 
                  dataTableOutput("tabela1")
              )
            )
    ),
    tabItem(tabName="condi1",
            fluidRow(
              box(width=12,
                  title="Condicao da Vitima",
                  status="primary",
                  solideHeder=TRUE,
                  collapsible=TRUE,
                  height=10, 
                  plotOutput("tabela2")
              )
            )
    )
)
)
)

server <- function(input, output, session){
  
  mtcars
  
  output$histograma1 <- renderPlot({
    hist(mtcars$mpg, 
         xlab="Milhas por Galão",
         ylab="Nº de Carros",
         col="lightblue",
         density=TRUE,
         main="Histograma1")
  })
  
  output$histograma2 <- renderPlot({
    hist(mtcars$cyl, 
         xlab="Milhas por Galão",
         ylab="Nº de Carros",
         col="green",
         density=TRUE,
         main="Histograma2")
  })
  
output$tabela1 <- renderDataTable({
    datatable(mtcars)
  
})
  
  
  
  
}





shinyApp(ui, server)
