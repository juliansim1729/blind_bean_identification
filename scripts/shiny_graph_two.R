# library calls
library(shiny)
library(ggplot2)
library(readr)

df <- read_csv("source_data/Dry_Bean_Dataset.csv")

theme_set(theme_minimal())

ui <- fluidPage(
    titlePanel("Bean Differences by Species"),
    
    sidebarLayout(
        sidebarPanel(
            selectInput("var1", "Variable 1", choices = ""),
            selectInput("var2", "Variable 2", choices = "")
        ),
        mainPanel(
            plotOutput("p1")
        )
    )
)

server <- function(input, output, session) {
    
    
    options <- names(df)[-ncol(df)]
    
    updateSelectInput(session, "var1", choices = options)
    updateSelectInput(session, "var2", choices = options)
    
    create_plot <- function(df, v1, v2) {
        dat <- data.frame(df$Class, df[,v1], df[,v2])
        
        p <- ggplot(dat) + 
            aes_string(x = v1, y = v2) + 
            geom_point(aes(color = df.Class, alpha = 0.5)) +
            ggtitle(paste("Scatter Plot of", v1, "versus", v2))
        return(p)
    }
    
    output$p1 <- renderPlot({
        create_plot(df, input$var1, input$var2)
    })
}

shinyApp(ui, server, options = list(port = 8080, host = "0.0.0.0"))