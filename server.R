library(shiny)
library(plotly)

server <- function(input, output, session) {
  
  bmi_data <- reactiveVal(NULL)
  
  observeEvent(input$calculate, {
    req(input$name)
    
    weight <- input$weight
    height_cm <- input$height
    height_m <- height_cm / 100
    
    bmi <- weight / (height_m^2)
    
    if (bmi < 18.5) {
      category <- "Underweight"
      risk <- "Low"
      color <- "#3498db"
    } else if (bmi < 25) {
      category <- "Normal weight"
      risk <- "Minimal"
      color <- "#2ecc71"
    } else if (bmi < 30) {
      category <- "Overweight"
      risk <- "Moderate"
      color <- "#f39c12"
    } else if (bmi < 35) {
      category <- "Obese"
      risk <- "High"
      color <- "#e74c3c"
    } else {
      category <- "Obese"
      risk <- "Very High"
      color <- "#c0392b"
    }
    
    bmi_data(list(
      name = input$name,
      bmi = bmi,
      category = category,
      risk = risk,
      color = color,
      weight = weight,
      height = height_cm
    ))
  })
  
  output$results <- renderUI({
    data <- bmi_data()
    req(data)
    
    tagList(
      h3(paste("Results for", data$name)),
      div(
        style = paste0("background: ", data$color, "; color: white; padding: 20px; border-radius: 10px; text-align: center; margin: 20px 0;"),
        h2(sprintf("BMI: %.1f", data$bmi)),
        h4(data$category)
      ),
      div(
        style = "padding: 15px; background: #f8f9fa; border-radius: 5px; margin: 10px 0;",
        h4("Health Risk Level:", style = "margin-top: 0;"),
        p(strong(data$risk), style = "font-size: 18px;")
      ),
      div(
        style = "padding: 15px; background: #e8f4f8; border-radius: 5px; margin: 10px 0;",
        h4("Your Measurements:", style = "margin-top: 0;"),
        p(paste("Weight:", data$weight, "kg")),
        p(paste("Height:", data$height, "cm"))
      )
    )
  })
  
  output$bmi_chart <- renderPlotly({
    data <- bmi_data()
    req(data)
    
    categories <- data.frame(
      Category = c("Underweight", "Normal", "Overweight", "Obese"),
      Min = c(0, 18.5, 25, 30),
      Max = c(18.5, 25, 30, 50),
      Color = c("#3498db", "#2ecc71", "#f39c12", "#e74c3c")
    )
    
    plot_ly() %>%
      add_bars(
        data = categories,
        x = ~Category,
        y = ~(Max - Min),
        base = ~Min,
        marker = list(color = ~Color),
        hovertemplate = paste0(
          "<b>%{x}</b><br>",
          "Range: %{base:.1f} - %{y:.1f}<br>",
          "<extra></extra>"
        ),
        showlegend = FALSE
      ) %>%
      add_trace(
        x = c(data$category),
        y = c(data$bmi),
        type = "scatter",
        mode = "markers",
        marker = list(
          size = 20,
          color = "black",
          symbol = "diamond",
          line = list(color = "white", width = 2)
        ),
        name = "Your BMI",
        hovertemplate = paste0(
          "<b>Your BMI: ", sprintf("%.1f", data$bmi), "</b><br>",
          "<extra></extra>"
        )
      ) %>%
      layout(
        title = "Your BMI Position",
        xaxis = list(title = "Category"),
        yaxis = list(title = "BMI Value", range = c(0, 50)),
        hovermode = "closest"
      )
  })
  
  output$history <- renderUI({
    data <- bmi_data()
    req(data)
    
    div(
      style = "margin-top: 20px;",
      h4("Calculation Summary"),
      tags$table(
        style = "width: 100%; border-collapse: collapse;",
        tags$tr(
          tags$th("Metric", style = "border: 1px solid #ddd; padding: 8px; background: #f2f2f2;"),
          tags$th("Value", style = "border: 1px solid #ddd; padding: 8px; background: #f2f2f2;")
        ),
        tags$tr(
          tags$td("Name", style = "border: 1px solid #ddd; padding: 8px;"),
          tags$td(data$name, style = "border: 1px solid #ddd; padding: 8px;")
        ),
        tags$tr(
          tags$td("BMI", style = "border: 1px solid #ddd; padding: 8px;"),
          tags$td(sprintf("%.1f", data$bmi), style = "border: 1px solid #ddd; padding: 8px;")
        ),
        tags$tr(
          tags$td("Category", style = "border: 1px solid #ddd; padding: 8px;"),
          tags$td(data$category, style = "border: 1px solid #ddd; padding: 8px;")
        ),
        tags$tr(
          tags$td("Risk Level", style = "border: 1px solid #ddd; padding: 8px;"),
          tags$td(data$risk, style = "border: 1px solid #ddd; padding: 8px;")
        )
      )
    )
  })
}