shinyServer(function(input, output) {
    TitleClass <- reactive({
          switch(as.character(input$class),
                 "1" = "First Class",
                 "2" = "Second Class",
                 "3" = "Third Class")  
    })
    
    output$mainPlot <- renderPlot({
        selected.data <- subset(titanic.data, class==input$class & age >= input$range[1] & age <= input$range[2])
        grouped.data <- selected.data %.%
            group_by(survived, gender) %.%
            summarise(counts=n())
        p <- ggplot(data=grouped.data, aes(x=survived, y=counts, fill=gender)) 
        title <- paste("Survival of Passengers Aged",input$range[1],"to",input$range[2],"in",TitleClass())
        l <- p + xlab("Survival")+ylab("Number of Passengers")+ggtitle(title)
        t <- l + theme(plot.title = element_text(lineheight=40, size=20, face="bold", vjust=1),
                           axis.title = element_text(size=17),
                           axis.text = element_text(size=15))
        t + geom_bar(stat="identity", position=position_dodge(), colour="black") +
            scale_fill_manual(name="", values=c("#FF33CC", "#3366FF"), labels=c("Female","Male"))
    }, height=500)
})