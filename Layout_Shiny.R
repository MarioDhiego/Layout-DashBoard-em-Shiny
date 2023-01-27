
library(shiny)
library(shinydashboard)
library(dplyr)
library(ggplot2)
library(plotly)
library(DT)
library(data.table)
library(reactable)
library(htmltools)
library(htmlwidgets)
library(fresh)


# Customização Visual
meu_tema <- create_theme(
  adminlte_color(
    aqua="#0937F3",
    blue="#5A71D0",
    red ="#B2BEF1",
  ),
    adminlte_sidebar(
      dark_bg="#A2CDEE"
        ),
    adminlte_global(
      content_bg="#DAEFF8" 
    )
    )



# Criação dos Menus
ui <- dashboardPage(title= "Dasboard Acidentes de Transito",skin="blue",
dashboardHeader(title="Anuário Estatístico por Acidentes de Trânsito",titleWidth=800,tags$li(class="dropdown",tags$a(href="https://www.detran.pa.gov.br",icon("linkedin"), "Detran",target="_blank")),tags$li(class="dropdown",tags$a(href="https://github.com/MarioDhiego",icon("github"), "Author",target="_blank")
)
),
dashboardSidebar(
  sidebarMenu(
    menuItem("SocioEconomico"              ,tabName="socio1",
             menuSubItem("Genero"          ,tabName="genero1"),
             menuSubItem("Faixa Etaria"    ,tabName="idade1"),
             menuSubItem("Raca"            ,tabName="raca1"),
             menuSubItem("Escolaridade"    ,tabName="escola1"),
             menuSubItem("Renda Familiar"  ,tabName="renda1")),
    menuItem("Condicao da Vitima"          ,tabName="condicao1",
           menuSubItem("Condicao"          ,tabName="condi1"),
           menuSubItem("Tipo da Vitima"    ,tabName="tipo1"),
           menuSubItem("Efeito Drogas"     ,tabName="droga1")),
  menuItem("Calenadario"                   ,tabName="calendario1",
           menuSubItem("Dias Semana"       ,tabName="dia1"),
           menuSubItem("Meses"             ,tabName="mes1")),
  menuItem("Mapas"                         ,tabName="map1",
           menuSubItem("Belem"             ,tabName="bel1"),
           menuSubItem("Municipios"        ,tabName="munic1"))
  )
  ),
dashboardBody(
  use_theme(meu_tema),
  tabItems(
    tabItem(tabName="genero1",
            fluidRow(
              box(width=12, plotOutput("histograma1")
                  )
              )
            ),
    tabItem(tabName="condi1",
            fluidRow(
              box(width=12,
                  title="Gênero",
                  status="primary",
                  solidHeader= TRUE,
                  height=10, 
                  plotOutput("histograma2")
              )
            )
    ),
    tabItem(tabName="calen1",
            fluidRow(
            reactableOutput("tabela1")
            )
    )
  )
)
)

server <- function(input, output, session){
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
  
output$tabela1 <- reactable::renderReactable({
    reactable::reactable(mtcars)
  
})
  
  
  
  
}





shinyApp(ui, server)
