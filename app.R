library(shiny)
library(ggplot2)
library(dplyr)
library(DT)

# Load the donor dataset
donors <- read.csv("donor_predictions_with_scores.csv")

# Optional: Add a frequency group for filtering
donors <- donors %>%
  mutate(
    frequency_group = case_when(
      frequency == 1 ~ "One-time",
      frequency <= 3 ~ "Occasional",
      TRUE ~ "Frequent"
    )
  )

# UI
ui <- fluidPage(
  titlePanel("Donor Insights Dashboard"),

  sidebarLayout(
    sidebarPanel(
      selectInput("gender_filter", "Gender", choices = c("All", unique(donors$gender)), selected = "All"),
      selectInput("channel_filter", "Channel", choices = c("All", unique(donors$channel)), selected = "All"),
      sliderInput("score_range", "Donor Score Range", min = 1, max = 5, value = c(1, 5), step = 1),
      br(),
      downloadButton("downloadData", "Download Filtered CSV")
    ),

    mainPanel(
      tabsetPanel(
        tabPanel("Score Distribution",
                 plotOutput("scorePlot")),
        tabPanel("By Gender",
                 plotOutput("genderPlot")),
        tabPanel("By Channel",
                 plotOutput("channelPlot")),
        tabPanel("Donor Table",
                 DTOutput("donorTable"))
      )
    )
  )
)

# Server
server <- function(input, output) {

  # Reactive filtered data
  filtered_data <- reactive({
    data <- donors
    if (input$gender_filter != "All") {
      data <- data[data$gender == input$gender_filter, ]
    }
    if (input$channel_filter != "All") {
      data <- data[data$channel == input$channel_filter, ]
    }
    data <- data[data$donor_score >= input$score_range[1] & data$donor_score <= input$score_range[2], ]
    return(data)
  })

  # Score distribution plot
  output$scorePlot <- renderPlot({
    ggplot(filtered_data(), aes(x = factor(donor_score))) +
      geom_bar(fill = "#2E86AB", color = "black") +
      labs(title = "Donor Score Distribution",
           x = "Donor Score (1 = Lowest, 5 = Highest)",
           y = "Number of Donors") +
      theme_minimal()
  })

  # Gender breakdown
  output$genderPlot <- renderPlot({
    ggplot(filtered_data(), aes(x = factor(donor_score), fill = gender)) +
      geom_bar(position = "dodge", color = "black") +
      labs(title = "Donor Score by Gender", x = "Donor Score", y = "Count", fill = "Gender") +
      theme_minimal()
  })

  # Channel breakdown
  output$channelPlot <- renderPlot({
    ggplot(filtered_data(), aes(x = factor(donor_score), fill = channel)) +
      geom_bar(position = "dodge", color = "black") +
      labs(title = "Donor Score by Channel", x = "Donor Score", y = "Count", fill = "Channel") +
      theme_minimal()
  })

  # Donor table
  output$donorTable <- renderDT({
    datatable(filtered_data(), options = list(pageLength = 10, scrollX = TRUE))
  })

  # CSV download handler
  output$downloadData <- downloadHandler(
    filename = function() { "filtered_donor_data.csv" },
    content = function(file) {
      write.csv(filtered_data(), file, row.names = FALSE)
    }
  )
}

# Run the app
shinyApp(ui = ui, server = server)