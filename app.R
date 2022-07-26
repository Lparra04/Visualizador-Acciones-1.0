library(shiny)
library(shinydashboard)
library(shinyWidgets)

#Este es el logo de Fintrade que va arriba a la izquierda
title=tags$a(tags$img(src="Logo.png", height='48', width='102', aligne="center"))

#La función FluidRow define que el espacio de la columna son 12 columnas



ui <- dashboardPage(
  dashboardHeader(title=title, titleWidth=130, 
                  tags$li(class = "dropdown",  #agregar el título en el centro del header
                          style = "padding: 10px 500px 3px 50px;",
                          tags$b("VISUALIZADOR ACCIONES COLOMBIA", style="font-family:Tahoma; color:#002956; text-aligne:center; font-size:20px"))),
  
  
  dashboardSidebar(disable = TRUE),
  dashboardBody(
    tabsetPanel(tabPanel(title="Dividendos", 
                         fluidRow(column(2,dateRangeInput("IN_Fechas", "Seleccione el rango de fechas", #Creacion de input para la fecha de asamblea.
                                                          start = "2020-01-01",end = "2022-12-31", #Se indican fechas seleccionadas por defecto.
                                                          min = "2020-01-01",max = "2024-12-31", #Limites de seleccion.
                                                          format = "yyyy-mm-dd", #Formato de impresion.
                         )
                         ),
                         column(2,pickerInput("IN_Sector", label = "Sector Economico", #Creacion de input para seleccionar el sector economico.
                                              choices = NULL, multiple = T,  #No se establecen opciones, se pueden seleccionar multiples opciones.
                                              options = list(`actions-box` = TRUE)
                         ), #Permite seleccionar y anular la seleccion de TODO.
                         ),
                         column(2,pickerInput("IN_Moneda", label = "Moneda", #Creacion de input para seleccionar la moneda.
                                              choices = NULL, multiple = T, 
                                              options = list(`actions-box` = TRUE)
                         )
                         ),
                         column(2,pickerInput("IN_Emisor",label = "Emisor", #Creacion de input para seleccionar el Emisor.
                                              choices = NULL,multiple = T,
                                              options = list(`actions-box` = TRUE)
                         )
                         ),
                         column(2,pickerInput("IN_Nemo",label = "Nemotécnico", #Creacion de input para seleccionar el Nemotécnico.
                                              choices = NULL,multiple = T,
                                          options = list(`actions-box` = TRUE, `live-search`=TRUE)
                         )
                         )
                         
                         ),
                         
                         
                         fluidRow(
                           tabBox(width = 12, #Se crea una caja de tamaño 12 con para los gráficos.
                                  
                                  tabPanel("Dividendos por Nemotécnico", plotOutput("Grafico_D")), #Se crea un espacio o pestaÃña llamada "Dividendos", en donde se muestra el gráfico llamado "Grafico_D".
                                  tabPanel("Dividendos por Moneda", plotOutput("Grafico_AD"))) #Se crea un espacio o pestaña llamada "Dividendos acumulados", en donde se muestra el grafico llamado "Grafico_AD".
                         )
                         
                        )
              ) 
              ),
  skin = "yellow" #Tema de la pagina amarillo.
  
)

source("MyServer.R")

shinyApp(ui, server)