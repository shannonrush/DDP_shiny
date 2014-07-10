shinyUI(
    fluidPage(
        titlePanel("Titanic Survival Analysis"),
        sidebarPanel(
            radioButtons("class", "Select Passenger Class:", c("First Class"=1,
                                                               "Second Class"=2,
                                                               "Third Class"=3)),
            sliderInput("range", "Select Age Range To Include:", min = min.age, max = max.age, 
                        value = c(min.age,max.age), step=1)
        ),
        mainPanel(
            plotOutput("mainPlot", height="auto")
        )
    )
)