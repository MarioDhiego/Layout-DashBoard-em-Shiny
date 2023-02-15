

# Leitura de Base de Dados
library(readr)
library(readxl)
library(rsconnect)

# Fazer Dashboard
library(shiny)
library(shinydashboard)
#library(shinydashboardPlus)
#library(shinyWidgets)
#library(shinyauthr)
#library(shinyjs) 
#library(sodium) 

# Manipulação de Dados
library(tidyverse)
library(dplyr)
library(magrittr)

# Fazer Gráficos
library(ggplot2)
#library(gplots)

# Incluir Temas no gráfico
library(ggthemes)

# Fazer Mapas
#library(geobr)
#library(sf)
#library(tmap)
#library(rgdal)
library(leaflet)

# Fazer gráficos Dinâmicos

library(plotly)
library(highcharter)

# Fazer Tabelas Dinâmicas
library(DT)
#library(data.table)
#library(reactable)
#library(kableExtra)
#library(sparkline)

# Fazer Gráfico de Correlação
library(ggcorrplot)

# Trabalhar com html
library(htmltools)
library(htmlwidgets)

# Trabalhar com Markdown
#library(markdown)
#library(rmarkdown)

# Customização Visual
#library(fresh)
#library(stargazer)


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


#liberar memoria
#rm(list=ls())



# Criação dos Menus
ui <- dashboardPage(title="Dasboard Acidentes de Transito",skin="blue",
dashboardHeader(tags$li(div(img(src='detran1.jpeg',
                height = "20px"),
                style = "padding-top:12px; padding-right:200px;"),
                class = "dropdown"),
                title="ANUÁRIO ESTATÍSTICO DE ÓBITO",
                titleWidth=650,
                tags$li(class = "dropdown",
                        tags$style(".main-header {max-height:50px}"),
                        tags$style(".main-header.logo {height:50px}")
                ),
                tags$li(class="dropdown",tags$a(href="https://www.detran.pa.gov.br",
                                                icon("road"),"DETRAN-PA",target="_blank")),
                tags$li(class="dropdown",tags$a(href="https://github.com/MarioDhiego",
                                                icon("github"),"AUTOR",target="_blank")),
                dropdownMenu(type="messages"),
                dropdownMenu(type="notifications"),
                dropdownMenu(type="tasks")
),
dashboardSidebar(width=200,
                 tags$style(".left-side, .main-sidebar {padding-center: 120px}"),
  sidebarMenu(
    menuItem("ANUÁRIO"                       ,tabName="about1",icon=icon("address-card"),
            menuSubItem("Sobre Anuário"      ,tabName="sobre1"),
            menuSubItem("Metodologia"        ,tabName="pare1") 
             ),
    menuItem("MICRODADOS"                    ,tabName="banco1",icon=icon("database"),
              menuSubItem("Base de Dados"    ,tabName="base1"),
              menuSubItem("Fonte de Dados"   ,tabName="fonte1"),
              menuSubItem("Pareamento"        ,tabName="medi1")),
    menuItem("SOCIOECONÔMICO"                ,tabName="socio1",icon=icon("male"),
             menuSubItem("Gênero"            ,tabName="genero1"),
             menuSubItem("Idade"             ,tabName="idade1"),
             menuSubItem("Raça"              ,tabName="raca1"),
             menuSubItem("Escolaridade"      ,tabName="escola1"),
             menuSubItem("Estado Civil"      ,tabName="civil1")),
    menuItem("CONDIÇÃO DA VÍTIMA"            ,tabName="condicao1",icon=icon("wheelchair"),
           menuSubItem("Condição da Vítima"  ,tabName="condi1"),
           menuSubItem("Tipos de Acidente"    ,tabName="acid1"),
           menuSubItem("Tipos de Veículos"    ,tabName="veiculo1"),
           menuSubItem("Efeito de Drogas"    ,tabName="droga1"),
           menuSubItem("Efeito de Alcool"    ,tabName="alcool1")),
  menuItem("OCORRÊNCIAS"                     ,tabName="calendario1",icon=icon("calendar"),
           menuSubItem("Dias Semana"         ,tabName="dia1"),
           menuSubItem("Meses"               ,tabName="mes1"),
           menuSubItem("Ano"                 ,tabName="ano1"),
           menuSubItem("Turno"               ,tabName="turno1")),
  menuItem("CUSTO HOSPITALAR"                ,tabName="custo1",icon=icon("hospital"),
           menuSubItem("Dias de Internção"  ,tabName="dias1"),
           menuSubItem("Custo de internação" ,tabName="custo2")),
  menuItem("LOCALIZAÇÃO"                     ,tabName="map1", icon=icon("globe"),
           menuSubItem("Bairros"             ,tabName="bairro1"),
           menuSubItem("Metropolitana"       ,tabName="metro1")
           )
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
            ),
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
                  highchartOutput("histograma1")
              ),
              box(width=6,
                title="Estatística Resumo",
                status="primary",
                solidHeader=TRUE,
                collapsible=TRUE,
                height=10,
                tableOutput("summary1")
              )
            ),
    ),
    tabItem(tabName="idade1",
            fluidRow(
              box(width=5,
                  title="Idade",
                  status="primary",
                  solidHeader=TRUE,
                  collapsible=TRUE,
                  height=12,
                  highchartOutput("resumoidade1")
              ),
              box(width=4,
                  title="Faixa Etária",
                  status="primary",
                  solidHeader=TRUE,
                  collapsible=TRUE,
                  enable_dropdown=TRUE,
                  height=12, 
                  highchartOutput("histograma2")
              ),
              box(width=3,
                  title="Perfil Etário",
                  status="primary",
                  solidHeader=TRUE,
                  collapsible=TRUE,
                  enable_dropdown=TRUE,
                  height=12, 
                  DT::dataTableOutput("resumoidade2")
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
                  highchartOutput("histograma3")
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
                  highchartOutput("histograma4")
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
                  highchartOutput("histograma5")
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
                  highchartOutput("histograma6")
              )
            )
    ),
    tabItem(tabName="mes1",
            fluidRow(
              box(width=7,
                  title="Meses de Ocorrência",
                  status="primary",
                  solideHeder=TRUE,
                  collapsible=TRUE,
                  height=35, 
                  highchartOutput("histograma7")
              )
            )
    ),
    tabItem(tabName="dia1",
            fluidRow(
              box(width=6,
                  title="Dias de Ocorrência",
                  status="primary",
                  solideHeder=TRUE,
                  collapsible=TRUE,
                  height=35, 
                  highchartOutput("histograma8")
              )
            )
    ),
    tabItem(tabName="turno1",
            fluidRow(
              box(width=6,
                  title="Turno de Ocorrência",
                  status="primary",
                  solideHeder=TRUE,
                  collapsible=TRUE,
                  height=35, 
                  highchartOutput("histograma9")
              )
            )
    ),
    tabItem(tabName="acid1",
            fluidRow(
              box(width=6,
                  title="Tipos de Acidentes",
                  status="primary",
                  solideHeder=TRUE,
                  collapsible=TRUE,
                  height=35, 
                  highchartOutput("histograma10")
              )
            )
    ),
    tabItem(tabName="veiculo1",
            fluidRow(
              box(width=6,
                  title="Veículos Envolvidos nas Ocorrência",
                  status="primary",
                  solideHeder=TRUE,
                  collapsible=TRUE,
                  height=35, 
                  highchartOutput("histograma11")
              )
            )
    ),
    tabItem(tabName="alcool1",
            fluidRow(
              box(width=6,
                  title="Efeito de Alcool nas Ocorrência",
                  status="primary",
                  solideHeder=TRUE,
                  collapsible=TRUE,
                  height=35, 
                  highchartOutput("histograma12")
              ),
              box(width=6,
                  title="",
                  status="primary",
                  solideHeder=TRUE,
                  collapsible=TRUE,
                  height=35, 
                  plotlyOutput("boxplot1")
              )
            )
    ),
    tabItem(tabName="droga1",
            fluidRow(
              box(width=6,
                  title="Efeito de Drogas nas Ocorrência",
                  status="primary",
                  solideHeder=TRUE,
                  collapsible=TRUE,
                  height=35, 
                  highchartOutput("histograma13")
              ),
            )
    ),
    tabItem(tabName="bairro1",
            fluidRow(
              box(width=6,
                  title="Bairro de Ocorrência",
                  status="primary",
                  solideHeder=TRUE,
                  collapsible=TRUE,
                  height=35, 
                  highchartOutput("histograma14")
              ),
              box(width=6,
                  title="Ocorrência",
                  status="primary",
                  solideHeder=TRUE,
                  collapsible=TRUE,
                  height=35, 
                  tableOutput("bairro2")
              )
            )
    ),
    tabItem(tabName="metro1",
            fluidRow(
              box(width=6,
                  title="Região Metropolitana",
                  status="primary",
                  solideHeder=TRUE,
                  collapsible=TRUE,
                  height=35, 
                  highchartOutput("histograma15")
              )
            )
    ),
    tabItem(tabName="fonte1",
            fluidRow(
              box(width=12,
                  title="Fontes de Dados",
                  status="primary",
                  solideHeder=TRUE,
                  collapsible=TRUE,
                  height=35, 
                  DiagrammeROutput("fonte1")
              )
            )
    ),
    tabItem(tabName="medi1",
            fluidRow(
              box(width=3,
                  title="Etapa 1",
                  status="primary",
                  solideHeder=TRUE,
                  collapsible=TRUE,
                  height=35, 
                  DiagrammeROutput("med1")
              ),
              box(width=3,
                  title="Etapa 2",
                  status="primary",
                  solideHeder=TRUE,
                  collapsible=TRUE,
                  height=35, 
                  DiagrammeROutput("med2")
              ),
              box(width=3,
                  title="Etapa 3",
                  status="primary",
                  solideHeder=TRUE,
                  collapsible=TRUE,
                  height=35, 
                  DiagrammeROutput("med3")
              ),
              box(width=3,
                  title="Etapa 4",
                  status="primary",
                  solideHeder=TRUE,
                  collapsible=TRUE,
                  height=35, 
                  DiagrammeROutput("med4")
              )
              
              
            )
    )
    )
  )
)



server <- function(input, output, session){


 
  
  
  
#-------------------------------------------------------------------------------
# Gráfico 2 - Genero


# Definir diretorio
setwd("C:/Users/mario Dhiego/Documents/ENADE_2018_RMarkdown/Esqueleto_shiny/DashBoard1/Layout-DashBoard-em-Shiny")

# Ler Base de Dados
Pareamento_Limpo <- read_excel("Pareamento_Limpo.xls")

Pareamento_Limpo$Genero = factor(Pareamento_Limpo$Genero,
                          levels=names(sort(table(Pareamento_Limpo$Genero), 
                                            decreasing=TRUE)))  

output$histograma1 <- renderHighchart({
  hchart(Pareamento_Limpo$Genero, type="bar") %>%
    hc_title(text="Gênero das Vítimas Fatais") %>%
    hc_tooltip(
      crosshairs=TRUE,
      borderWidth=2,
      sort=TRUE,
      table=TRUE) %>%
    hc_caption(text="Fonte: Detran-PA")%>%
    hc_add_theme(hc_theme_google())
})


library(DiagrammeR)
output$fonte1 <- renderDiagrammeR({
  
mermaid("
graph TB
A[PAREAMENTO]-->B{FONTES}
B-->C[Policia Civil]
B-->D[PRE]
B-->E[PRF]
B-->F[IML]
B-->G[Bombeiro]
B-->H[SAMU]
B-->I[SESMA]
B-->J[SESPA]
B-->K[HMUE]
C-->L[ANUÁRIO WEB]
D-->L[ANUÁRIO WEB]
E-->L[ANUÁRIO WEB]
F-->L[ANUÁRIO WEB]
G-->L[ANUÁRIO WEB]
H-->L[ANUÁRIO WEB]
I-->L[ANUÁRIO WEB]
J-->L{ANUÁRIO WEB}
K-->L(ANUÁRIO WEB)
",width=50)
})



output$med1 <- renderDiagrammeR({
  mermaid("
graph TB
A[PAREAMENTO1]-->B{Base Policial}
B-->C[PC]
B-->D[PRE]
B-->E[PRF]
B-->F[IML]
C-->G(LUVF1)
D-->G(LUVF1)
E-->G(LUVF1)
F-->G(LUVF1)
",width=30)
})


output$med2 <- renderDiagrammeR({
  mermaid("
graph TB
A[PAREAMENTO2]-->B{Base Resgate}
B-->C[SAMU]
B-->D[BOMBEIRO]
C-->E(LUVF2)
D-->E(LUVF2)
",width=30)
})

output$med3 <- renderDiagrammeR({
  mermaid("
graph TB
A[PAREAMENTO3]-->B{Base Saúde}
B-->C[SESMA]
B-->D[SESPA]
B-->E(HMUE)
C-->F(LUVF3)
D-->F(LUVF3)
E-->F(LUVF3)
",width=30)
})

output$med4 <- renderDiagrammeR({
  mermaid("
graph TB
A[PAREAMENTO FINAL]-->B{BASES}
B-->C[LUVF1]
B-->D[LUVF2]
B-->E(LUVF3)
C-->F(BASE FINAL)
D-->F(BASE FINAL)
E-->F(BASE FINAL)
",width=30)
})




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

#-------------------------------------------------------------------------------

#describeBy(Pareamento_Limpo$Idade)
#library(gmodels)

library(janitor) 
library(kableExtra)
library(knitr)


output$summary1 <- renderTable({
  dt=data.frame(x=Pareamento_Limpo$`Faixa Etária`,y=Pareamento_Limpo$Genero)
  tabela1 <- tabyl(dt,x,y,show_na=FALSE)%>%
    adorn_totals("col")%>%
    adorn_totals("row")%>%
    adorn_percentages("all")%>%
    adorn_pct_formatting(digits=1)%>%
    adorn_rounding(2)%>%
    adorn_ns()%>%
    adorn_title("combined", row_name="Idade",col_name="Genero") 
  
  })
  


output$resumoidade2 <- DT::renderDataTable({
  Descritiva <- rbind(
    "Vitimas Fatais"=NROW(Pareamento_Limpo$Idade),
    "Menor Idade"=min(Pareamento_Limpo$Idade),
    "Maior Idade"=max(Pareamento_Limpo$Idade),
    "Idade Média"=mean(Pareamento_Limpo$Idade),
    "Idade Mediana"=median(Pareamento_Limpo$Idade),
    "Desvio Etário"=sd(Pareamento_Limpo$Idade),
    "25/%  Idades"=quantile(Pareamento_Limpo$Idade, probs = 0.25),
    "75/%  Idades"=quantile(Pareamento_Limpo$Idade, probs = 0.75)
  )
  colnames(Descritiva)="Estatísticas"
  datatable(Descritiva,
            caption='Tabela 1: Perfil Etário das Vitimas Fatais.')
  
  
  
})




# Gráfico 2 - Idade
#output$histograma2 <- renderPlotly({



output$resumoidade1 <- renderHighchart({
  hchart(Pareamento_Limpo$Idade) %>%
    hc_title(text="Idade") %>%
    hc_tooltip(
      crosshairs=TRUE,
      borderWidth=2,
      sort=TRUE,
      table=TRUE) %>%
    hc_caption(text="Fonte: Detran-PA")%>%
    hc_add_theme(hc_theme_google())
})


Pareamento_Limpo$`Faixa Etária`=factor(Pareamento_Limpo$`Faixa Etária`,
                            levels=names(sort(table(Pareamento_Limpo$`Faixa Etária`), 
                                              decreasing=TRUE)))
output$histograma2 <- renderHighchart({
  hchart(Pareamento_Limpo$`Faixa Etária`, type="bar") %>%
    hc_title(text="Faixa Etária") %>%
    hc_tooltip(
      crosshairs=TRUE,
      borderWidth=2,
      sort=TRUE,
      table=TRUE) %>%
    hc_caption(text="Fonte: Detran-PA")%>%
    hc_add_theme(hc_theme_google())
})


#Pareamento_Limpo$Genero=factor(Pareamento_Limpo$Genero,
#                                       levels=names(sort(table(Pareamento_Limpo$Genero), 
#                                                         decreasing=TRUE)))
#g2 <- ggplot(Pareamento_Limpo, aes(y=Alcool, x=Genero))+
# geom_boxplot(alpha=0.15, fill="blue")+
#    labs(x="Gênero",
#         y="Dosagem Alcoólica (mg/l)",
#         title="Vítimas Fatais p/ Acidentes de Trânsito",
#         caption="Fonte: Detran")+
#  theme_gray(base_size=14)+
#  theme(plot.title=element_text(size=12L,face="bold",hjust=0.5), 
#        plot.caption=element_text(size=10L,face="bold",hjust=0), 
#        axis.title.y=element_text(size=12L,face="bold"), 
#        axis.title.x = element_text(size=12L,face="bold"))+
  #geom_point()
  #geom_jitter(width=0.15)+
#  geom_violin(trim=FALSE,alpha=0.1,fill="blue", color="blue")
  #coord_flip()
#ggplotly(g2)
  
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
#})

# Grafico de Densidade
#library(fdth)
#library(summarytools)

#densidade <- density(Pareamento_Limpo$Idade)
#plot(densidade, frame = FALSE, col = "blue",main = "Density plot")


#tab.est=fdt(Pareamento_Limpo$Idade)

#min(Pareamento_Limpo$Idade,na.rm=T);max(Pareamento_Limpo$Idade, na.rm=T)

#(tab.es =fdt(Pareamento_Limpo$Idade, start=1.5, end=1.90, h=0.05))


#summary(Pareamento_Limpo$Idade, format=TRUE, pattern='%.2f')

# Polígonos de frequência
#plot(tab.est,
#     type='rfp',
#     col="red",
#     xlab="Limite das Classes",
#     ylab="Frequência das Idades", 
#     main="Polígono de Frequência - Relativa",
#     las=1,
#     lwd=3)  # Polígono da frequência absoluta
#plot(tab.est,type='rfp', col="red", las=1, lwd=2)    # Polígono da frequência relativa
#plot(tab.est,type='rfpp', las=1, lwd=2)                 # Polígono da frequência relativa percentual
#plot(tab.est, type='cdp', las=1, lwd=2)                  # Polígono da densidade acumulada
#plot(tab.est, type='cfp', las=1, lwd=2)                  # Polígono da frequência acumulada
#plot(tab.est, type='cfpp', las=1, lwd=2, col='black')    # Polígono da frequência acumulada percentual

#(Hist.est = hist(Pareamento_Limpo$Idade, right=F, plot=F))

#plot(tab.est, type='cfpp', las=1, lwd=2, ylim=c(0,100), col='blue',
#     ylab='Frequência acumulada percentual', xlab='Idades (anos)', yaxt='n', xaxt='n')
#axis(1, at=Hist.est$breaks, pos=0)
#axis(2, at=seq(0, 100, 10), las=1)
#lines(c(0, median(tab.est)), c(50, 50), lwd=1, col='red', lty=2)
#lines(c(median(tab.est), median(tab.est)), c(0, 50), lwd=1, col='red', lty=2)
#text(1.67,  -2.5, 'Md', col='blue', cex=0.7)
#abline(h=0)



Pareamento_Limpo$Escolaridade = factor(Pareamento_Limpo$Escolaridade,
                          levels=names(sort(table(Pareamento_Limpo$Escolaridade), 
                          decreasing=TRUE)))

output$histograma4 <- renderHighchart({
  hchart(Pareamento_Limpo$Escolaridade, type="bar") %>%
    hc_title(text="Grau de Escolaridade") %>%
    hc_tooltip(
      crosshairs=TRUE,
      borderWidth=2,
      sort=TRUE,
      table=TRUE) %>%
    hc_caption(text="Fonte: Detran-PA")%>%
    hc_add_theme(hc_theme_google())
})



  Pareamento_Limpo$Raça = factor(Pareamento_Limpo$Raça,
                                  levels=names(sort(table(Pareamento_Limpo$Raça), 
                                                    decreasing=TRUE)))
  output$histograma3 <- renderHighchart({
    hchart(Pareamento_Limpo$Raça, type="bar") %>%
      hc_title(text="Raça ou Etnia") %>%
      hc_tooltip(
        crosshairs=TRUE,
        borderWidth=2,
        sort=TRUE,
        table=TRUE) %>%
      hc_caption(text="Fonte: Detran-PA")%>%
      hc_add_theme(hc_theme_google())
  })
  
  
  



  Pareamento_Limpo$`Condição Vitima` = factor(Pareamento_Limpo$`Condição Vitima`,
                          levels=names(sort(table(Pareamento_Limpo$`Condição Vitima`), 
                                            decreasing=TRUE)))
  output$histograma5 <- renderHighchart({
    hchart(Pareamento_Limpo$`Condição Vitima`, type="bar") %>%
      hc_title(text="Condição da Vítima") %>%
      hc_tooltip(
        crosshairs=TRUE,
        borderWidth=2,
        sort=TRUE,
        table=TRUE) %>%
      hc_caption(text="Fonte: Detran-PA")%>%
      hc_add_theme(hc_theme_google())
  })
  
  
  
  
  
  
  




  Pareamento_Limpo$`Estado Civil`=factor(Pareamento_Limpo$`Estado Civil`,
                              levels=names(sort(table(Pareamento_Limpo$`Estado Civil`), 
                                                decreasing=TRUE)))
  output$histograma6 <- renderHighchart({
    hchart(Pareamento_Limpo$`Estado Civil`, type="bar") %>%
      hc_title(text="Estado Civil") %>%
      hc_tooltip(
        crosshairs=TRUE,
        borderWidth=2,
        sort=TRUE,
        table=TRUE) %>%
      hc_caption(text="Fonte: Detran-PA")%>%
      hc_add_theme(hc_theme_google())
  })
  
  
  
  
  
  
  
  


#output$histograma7 <- renderPlotly({
#  Pareamento_Limpo$Meses=factor(Pareamento_Limpo$Meses,
#                                    levels=names(sort(table(Pareamento_Limpo$Meses), 
#                                                      decreasing=TRUE)))
#  g7 <- ggplot(Pareamento_Limpo, aes(x=Meses))+
#    geom_bar(fill="blue")+
#    labs(x="Meses de Ocorrência",
#         y="Número de Vítimas",
#         title="Gráfico de Barras",
#         caption="Fonte: Detran")+
#    theme_gray()+
#    theme(plot.title=element_text(size=12L,face="bold",hjust=0.5), 
#          plot.caption=element_text(size=10L,face="bold",hjust=0), 
#          axis.title.y=element_text(size=12L,face="bold"), 
#          axis.title.x=element_text(size=12L,face="bold"),
#          legend.position = "bottom")
# ggplotly(g7)
#})



Pareamento_Limpo$Dia=factor(Pareamento_Limpo$Dia,
                                       levels=names(sort(table(Pareamento_Limpo$Dia), 
                                                         decreasing=TRUE)))
output$histograma8 <- renderHighchart({
  hchart(Pareamento_Limpo$Dia, type="bar") %>%
    hc_title(text="ocorrências por Dias da Semana") %>%
    hc_tooltip(
      crosshairs=TRUE,
      borderWidth=2,
      sort=TRUE,
      table=TRUE) %>%
    hc_caption(text="Fonte: Detran-PA")%>%
    hc_add_theme(hc_theme_google())
})




Pareamento_Limpo$`Turno Obito`=factor(Pareamento_Limpo$`Turno Obito`,
                                           levels=names(sort(table(Pareamento_Limpo$`Turno Obito`), 
                                                             decreasing=TRUE)))
output$histograma9 <- renderHighchart({
  hchart(Pareamento_Limpo$`Turno Obito`, type="bar") %>%
    hc_title(text="ocorrências por Turno") %>%
    hc_tooltip(
      crosshairs=TRUE,
      borderWidth=2,
      sort=TRUE,
      table=TRUE) %>%
    hc_caption(text="Fonte: Detran-PA")%>%
    hc_add_theme(hc_theme_google())
})


Pareamento_Limpo$`Tipo de Acidente`=factor(Pareamento_Limpo$`Tipo de Acidente`,
                                         levels=names(sort(table(Pareamento_Limpo$`Tipo de Acidente`), 
                                                           decreasing=TRUE)))
output$histograma10 <- renderHighchart({
  hchart(Pareamento_Limpo$`Tipo de Acidente`, type="bar") %>%
    hc_title(text="ocorrências por Tipo de Acidentes") %>%
    hc_tooltip(
      crosshairs=TRUE,
      borderWidth=2,
      sort=TRUE,
      table=TRUE) %>%
    hc_caption(text="Fonte: Detran-PA")%>%
    hc_add_theme(hc_theme_google())
})


Pareamento_Limpo$`Veículo Vitima`=factor(Pareamento_Limpo$`Veículo Vitima`,
                                        levels=names(sort(table(Pareamento_Limpo$`Veículo Vitima`), 
                                                          decreasing=TRUE)))
output$histograma11 <- renderHighchart({
  hchart(Pareamento_Limpo$`Veículo Vitima`, type="bar") %>%
    hc_title(text="ocorrências por Tipo de Veículos") %>%
    hc_tooltip(
      crosshairs=TRUE,
      borderWidth=2,
      sort=TRUE,
      table=TRUE) %>%
    hc_caption(text="Fonte: Detran-PA")%>%
    hc_add_theme(hc_theme_google())
})


Pareamento_Limpo$`Efeito Alcool`=factor(Pareamento_Limpo$`Efeito Alcool`,
                                        levels=names(sort(table(Pareamento_Limpo$`Efeito Alcool`), 
                                                          decreasing=TRUE)))
output$histograma12 <- renderHighchart({
  hchart(Pareamento_Limpo$`Efeito Alcool`, type="bar") %>%
    hc_title(text="Sob Efeito de Alcool") %>%
    hc_tooltip(
      crosshairs=TRUE,
      borderWidth=2,
      sort=TRUE,
      table=TRUE) %>%
    hc_caption(text="Fonte: Detran-PA")%>%
    hc_subtitle(text="Dosagem (mlg)")%>%
    hc_add_theme(hc_theme_google())
})


Pareamento_Limpo$`Efeito Drogas`=factor(Pareamento_Limpo$`Efeito Drogas`,
                            levels=names(sort(table(Pareamento_Limpo$`Efeito Drogas`), 
                                              decreasing=TRUE)))
output$histograma13 <- renderHighchart({
  hchart(Pareamento_Limpo$`Efeito Drogas`, type="bar") %>%
    hc_title(text="ocorrências por Tipo de Veículos") %>%
    hc_tooltip(
      crosshairs=TRUE,
      borderWidth=2,
      sort=TRUE,
      table=TRUE) %>%
    hc_caption(text="Fonte: Detran-PA")%>%
    hc_add_theme(hc_theme_google())
})



Pareamento_Limpo$Meses=factor(Pareamento_Limpo$Meses,
                            levels=names(sort(table(Pareamento_Limpo$Meses), 
                                              decreasing=TRUE)))
output$histograma7 <- renderHighchart({
  hchart(Pareamento_Limpo$Meses, type="bar") %>%
    hc_title(text="ocorrências por Meses") %>%
    hc_tooltip(
      crosshairs=TRUE,
      borderWidth=2,
      sort=TRUE,
      table=TRUE) %>%
    hc_caption(text="Fonte: Detran-PA")%>%
    hc_add_theme(hc_theme_google())
})


Pareamento_Limpo2$Bairro=factor(Pareamento_Limpo2$Bairro,
                              levels=names(sort(table(Pareamento_Limpo2$Bairro), 
                                                decreasing=TRUE)))
output$histograma14 <- renderHighchart({
  hchart(Pareamento_Limpo2$Bairro, type="bar") %>%
    hc_title(text="Bairros de ocorrências") %>%
    hc_tooltip(
      crosshairs=TRUE,
      borderWidth=2,
      sort=TRUE,
      table=TRUE) %>%
    hc_caption(text="Fonte: Detran-PA")%>%
    hc_add_theme(hc_theme_google())
})


Pareamento_Limpo$Municípios=factor(Pareamento_Limpo$Municípios,
                               levels=names(sort(table(Pareamento_Limpo$Municípios), 
                                                 decreasing=TRUE)))
output$histograma15 <- renderHighchart({
  hchart(Pareamento_Limpo$Municípios, type="bar") %>%
    hc_title(text="Municípios de ocorrências") %>%
    hc_tooltip(
      crosshairs=TRUE,
      borderWidth=2,
      sort=TRUE,
      table=TRUE) %>%
    hc_caption(text="Fonte: Detran-PA")%>%
    hc_add_theme(hc_theme_google())%>%
    hc_legend(enabled = TRUE) 
})





  
output$tabela1 <- renderDataTable({
  Pareamento_Limpo <- read_excel("Pareamento_Limpo.xls")
  datatable(Pareamento_Limpo, 
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
          colnames=c('Gênero','Idade','Faixa-Etária','Raça','Estado Civil','Escolaridade','Local Obito','Drogas','Alcool','Condição','Veiculo','Tipo','Turno','Dia','Meses','Rua','Bairro','Municipios','Fatal'),
          caption='Base de Dados sobre Vitimas Fatais por Acidentes de Trânsito-2020.')
  })

#output$regressao1 <- renderPrint({
#  model1 <- lm(mpg~am,data=mtcars)
#  model2 <- lm(mpg~am + wt + hp,data=mtcars)
#  modelo1 <- stargazer(model1,model2,digits=4, type = "html", header = FALSE)
#})
    
#hcmap(map="countries/br/br-all", 
#      showInLegend= FALSE) %>%
#$  hc_title(text = "Brasil") 
    
  

output$boxplot1 <- renderPlotly({
  Pareamento_Limpo$Genero=factor(Pareamento_Limpo$Genero,
                          levels=names(sort(table(Pareamento_Limpo$Genero), 
                                                       decreasing=TRUE)))
gbox1 <- ggplot(Pareamento_Limpo, aes(y=Alcool, x=Genero, color=Genero))+
 geom_boxplot(alpha=0.15, fill="blue")+
    labs(x="Gênero",
         y="Dosagem Alcoólica (mg/l)",
         title="Vítimas Fatais p/ Acidentes de Trânsito",
         caption="Fonte: Detran")+
  theme_gray(base_size=14)+
  theme(plot.title=element_text(size=12L,face="bold",hjust=0.5), 
        plot.caption=element_text(size=10L,face="bold",hjust=0), 
        axis.title.y=element_text(size=12L,face="bold"), 
        axis.title.x = element_text(size=12L,face="bold"))+
  geom_point()+
  geom_jitter()+
  geom_violin(trim=FALSE,alpha=0.1,fill="blue", color="blue")
ggplotly(gbox1)

  
})




output$bairro2 <- renderTable({
  Pareamento_Limpo2 <- read_excel("Pareamento_Limpo2.xls")
  Pareamento_Limpo2$Genero=factor(Pareamento_Limpo2$Genero,
                                 levels=names(sort(table(Pareamento_Limpo2$Genero), 
                                                   decreasing=TRUE)))
  dt=data.frame(x=Pareamento_Limpo2$Bairro,y=Pareamento_Limpo2$Genero)
  tabela1 <- tabyl(dt,x,y,show_na=FALSE)%>%
    adorn_totals("col")%>%
    adorn_totals("row")%>%
    adorn_percentages("all")%>%
    adorn_pct_formatting(digits=1)%>%
    adorn_rounding(2)%>%
    adorn_ns()%>%
    adorn_title("combined", row_name="Bairros",col_name="Gênero") 
  
})



  
  
  
}





shinyApp(ui, server)
