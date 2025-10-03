BMI Calculator & Health Risk Predictor
========================================================
author: Your Name
date: `r format(Sys.Date(), "%B %d, %Y")`
autosize: true

**An Interactive Shiny Application for Health Monitoring**

Course Project: Developing Data Products  
Coursera Data Science Specialization

The Problem
========================================================

**Health awareness is crucial, but calculating BMI manually is tedious**

- 🏥 **39% of adults worldwide are overweight** (WHO, 2024)
- 📊 BMI is a key indicator of health risks
- 🤔 People often don't know their BMI or health status
- 💡 Need for an **easy, interactive tool** for health assessment

***

```{r, echo=FALSE, fig.width=6, fig.height=5}
# Visualize global BMI distribution
set.seed(123)
bmi_sample <- c(rnorm(1000, mean=22, sd=3),
                rnorm(800, mean=27, sd=3),
                rnorm(500, mean=32, sd=2))

hist(bmi_sample, breaks=30, col="#3498db", 
     main="Global BMI Distribution (Sample)",
     xlab="BMI Value", ylab="Frequency",
     border="white", xlim=c(15, 40))
abline(v=c(18.5, 25, 30), col=c("green", "orange", "red"), 
       lwd=2, lty=2)
legend("topright", legend=c("Underweight", "Normal", "Overweight", "Obese"),
       col=c("green", "green", "orange", "red"), lwd=2, lty=2, cex=0.8)
```

The Solution: BMI Calculator App
========================================================

**A comprehensive, user-friendly Shiny application that:**

✅ **Calculates BMI** from weight and height inputs  
✅ **Assesses health risks** based on multiple factors  
✅ **Provides personalized recommendations**  
✅ **Visualizes results** with interactive charts  
✅ **Educates users** about BMI categories

### Key Features:
- Multiple input widgets (sliders, radio buttons, checkboxes)
- Real-time reactive calculations
- Interactive Plotly visualizations
- Comprehensive documentation

How It Works
========================================================

**Simple 3-Step Process:**

1. **Input** your personal data (weight, height, age, gender, activity level)
2. **Calculate** BMI with one click
3. **Review** results, charts, and recommendations

***

**The Math Behind It:**

```{r, echo=TRUE}
# BMI Calculation Function
calculate_bmi <- function(weight_kg, height_cm) {
    height_m <- height_cm / 100
    bmi <- weight_kg / (height_m ^ 2)
    
    category <- cut(bmi, 
        breaks = c(0, 18.5, 25, 30, Inf),
        labels = c("Underweight", "Normal", 
                   "Overweight", "Obese"))
    
    return(list(bmi = round(bmi, 1), 
                category = as.character(category)))
}

# Example calculation
result <- calculate_bmi(70, 170)
paste("BMI:", result$bmi, "-", result$category)
```

Live Demo & Results
========================================================

**Sample BMI Analysis Visualization:**

```{r, echo=FALSE, message=FALSE, warning=FALSE, fig.width=10, fig.height=6}
library(ggplot2)

# Create sample data for different scenarios
scenarios <- data.frame(
    Person = c("Underweight", "Normal", "Overweight", "Obese", "Athlete"),
    Weight = c(50, 70, 85, 100, 90),
    Height = c(170, 170, 170, 170, 180),
    Active = c(FALSE, TRUE, FALSE, FALSE, TRUE)
)

scenarios$BMI <- scenarios$Weight / ((scenarios$Height/100)^2)
scenarios$Color <- cut(scenarios$BMI, 
                       breaks = c(0, 18.5, 25, 30, Inf),
                       labels = c("#3498db", "#2ecc71", "#f39c12", "#e74c3c"))

ggplot(scenarios, aes(x=Person, y=BMI, fill=as.character(Color))) +
    geom_bar(stat="identity", width=0.7) +
    geom_hline(yintercept=c(18.5, 25, 30), linetype="dashed", color="black", alpha=0.5) +
    scale_fill_identity() +
    labs(title="BMI Comparison Across Different Profiles",
         x="Profile Type", y="BMI Value") +
    theme_minimal(base_size=14) +
    theme(legend.position="none",
          plot.title=element_text(hjust=0.5, face="bold", size=16)) +
    geom_text(aes(label=round(BMI,1)), vjust=-0.5, size=5, fontface="bold")
```

**Try it yourself at:** [Your Shiny App URL Here]

Why Use This App?
========================================================

### **Benefits:**

🎯 **Instant Results** - No manual calculations needed  
📊 **Data Visualization** - Beautiful, interactive charts  
🏥 **Health Insights** - Personalized risk assessments  
📚 **Educational** - Learn about BMI and health  
📱 **Accessible** - Works on any device with a browser

### **Technical Highlights:**

- Built with **Shiny** and **Plotly**
- Reactive programming for real-time updates
- Clean, intuitive user interface
- Comprehensive documentation included

---

**🔗 Links:**
- **App:** [shinyapps.io/your-app-url]
- **Code:** [github.com/yourusername/bmi-calculator]
- **Presentation:** [rpubs.com/yourusername/bmi-pitch]