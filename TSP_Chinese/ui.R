library(shiny)
if (!exists("all_cities")) all_cities = readRDS("data/china_cities.rds")
if (!exists("usa_cities")) usa_cities = readRDS("data/china_cities.rds")

shinyUI(fluidPage(
  tags$head(
    tags$link(rel="stylesheet", type="text/css", href="custom_styles.css")
  ),
  
  title = "TSP",
  
  tags$h2(tags$a(href="/traveling-salesman", "TSP", target="_blank")),
  
  plotOutput("map", height="550px"),
  
  fluidRow(
    column(5,
      tags$ol(
        tags$li("根据需要选择城市"),
        
        tags$li("点击 '求解' 按钮!")
      )
    ),
    column(3,
      tags$button("求解", id="go_button", class="btn btn-info btn-large action-button shiny-bound-input")
    ),
    column(3,
      HTML("<button id='set_random_cities_2' class='btn btn-large action-button shiny-bound-input'>
              <i class='fa fa-refresh'></i>
              随机选择城市
            </button>")
    ), class="aaa"
  ),
  
  hr(),
  
  fluidRow(
    column(10,
      h4("选择地图与城市"),
      selectInput("map_name", NA, c("World"), "World", width="100px"),
      p("在以下文本框输入城市, 或者", actionButton("set_random_cities", "随机选择城市", icon=icon("refresh"))),
      selectizeInput("cities", NA, all_cities$full.name, multiple=TRUE, width="100%",
                     options = list(maxItems=30, maxOptions=100, placeholder="Start typing to select some cities...",
                                    selectOnTab=TRUE, openOnFocus=FALSE, hideSelected=TRUE)),
      checkboxInput("label_cities", "Label cities on map?", TRUE)
    ),

    
    column(1,
      plotOutput("annealing_schedule", height="260px"),
      plotOutput("distance_results", height="260px")
    )
  )
))
