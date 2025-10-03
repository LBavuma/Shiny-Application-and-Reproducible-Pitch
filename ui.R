library(shiny)
library(plotly)

ui <- fluidPage(
  titlePanel("BMI Calculator & Health Risk Predictor"),
  
  tags$head(
    tags$style(HTML("
      .main-header {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        padding: 30px;
        border-radius: 10px;
        margin-bottom: 30px;
        text-align: center;
      }
      .info-box {
        background: #f8f9fa;
        padding: 20px;
        border-radius: 10px;
        margin-bottom: 20px;
      }
    "))
  ),
  
  div(class = "main-header",
      h2("Calculate Your Body Mass Index"),
      p("Enter your details below to calculate your BMI and assess your health risk")
  ),
  
  sidebarLayout(
    sidebarPanel(
      width = 4,
      h3("Your Information"),
      
      textInput("name", 
                "Your Name:", 
                placeholder = "Enter your name"),
      
      sliderInput("weight",
                  "Weight (kg):",
                  min = 30,
                  max = 200,
                  value = 70,
                  step = 0.5),
      
      sliderInput("height",
                  "Height (cm):",
                  min = 100,
                  max = 250,
                  value = 170,
                  step = 1),
      
      actionButton("calculate", 
                   "Calculate BMI",
                   class = "btn-primary btn-lg",
                   style = "width: 100%; margin-top: 20px;"),
      
      hr(),
      
      div(class = "info-box",
          h4("How to Use:"),
          tags$ol(
            tags$li("Enter your name"),
            tags$li("Adjust your weight using the slider"),
            tags$li("Adjust your height using the slider"),
            tags$li("Click 'Calculate BMI' to see results")
          )
      ),
      
      div(class = "info-box",
          h4("BMI Categories:"),
          tags$ul(
            tags$li(strong("Underweight:"), " BMI < 18.5"),
            tags$li(strong("Normal:"), " BMI 18.5 - 24.9"),
            tags$li(strong("Overweight:"), " BMI 25 - 29.9"),
            tags$li(strong("Obese:"), " BMI ≥ 30")
          )
      )
    ),
    
    mainPanel(
      width = 8,
      uiOutput("results"),
      plotlyOutput("bmi_chart", height = "400px"),
      uiOutput("history")
    )
  ),
  
  hr(),
  div(style = "text-align: center; padding: 20px; color: #666;",
      p("BMI Calculator | Coursera Data Products Project"),
      p(em("Note: BMI is a screening tool. Consult healthcare professionals for medical advice."))
  )
)