shinyUI(
    fluidPage(
        tags$head(
            tags$link(rel="stylesheet", type="text/css", href="css/application.css")
        ),
        titlePanel("Titanic Survival Analysis"),
        sidebarPanel(
            p("Passengers of the Titanic were divided into three distinct classes based on socio-economic status",
              class="helptext"),
            p("First Class was the highest class and included members of the aristocracy", class="helptext"),
            p("Second Class included tradespeople such as miners and teachers", class="helptext"),
            p("Third Class was considered the 'steerage' class and included a diverse group emigrating to the United States",
              class="helptext"),
            radioButtons("class", "Select A Passenger Class To Analyze:", c("First Class"=1,
                                                               "Second Class"=2,
                                                               "Third Class"=3)),
            p("There were a wide range of ages represented on the Titanic, from babies to the elderly",
                class="helptext"),
            p("Use the slider to focus the analysis on a subset of ages", class="helptext"),
            sliderInput("range", "Select Age Range To Include:", min = min.age, max = max.age, 
                        value = c(min.age,max.age), step=1)
        ),
        mainPanel(
            plotOutput("mainPlot", height="auto")
        )
    )
)