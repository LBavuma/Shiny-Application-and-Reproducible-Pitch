# BMI Calculator & Health Risk Predictor - Deployment Guide

## 📋 Project Overview

This project consists of:
1. **Shiny Application** - Interactive BMI calculator with health risk assessment
2. **Pitch Presentation** - 5-slide R Presenter deck

## 🚀 Part 1: Deploying Your Shiny Application

### Step 1: Prepare Your Files

1. Create a new folder called `bmi-calculator`
2. Save the following files in this folder:
   - `ui.R` (from artifact 1)
   - `server.R` (from artifact 2)

### Step 2: Deploy to ShinyApps.io

#### Option A: Deploy from RStudio (Recommended)

```r
# Install required packages
install.packages(c("shiny", "plotly", "rsconnect"))

# Load libraries
library(rsconnect)

# Set up your shinyapps.io account
# 1. Go to https://www.shinyapps.io/
# 2. Sign up for a free account
# 3. Go to Account > Tokens
# 4. Copy your token and secret

# Authorize your account (replace with your credentials)
rsconnect::setAccountInfo(
    name='your-account-name',
    token='your-token',
    secret='your-secret'
)

# Deploy the app (run from the app directory)
setwd("path/to/bmi-calculator")
rsconnect::deployApp()
```

#### Option B: Manual Upload

1. Go to https://www.shinyapps.io/
2. Click "New Application"
3. Upload `ui.R` and `server.R`
4. Click "Deploy"

### Step 3: Test Your App

- Your app will be available at: `https://your-username.shinyapps.io/bmi-calculator/`
- Test all features:
  - ✅ Input widgets work
  - ✅ Calculate button functions
  - ✅ Charts display correctly
  - ✅ Documentation is readable

## 📊 Part 2: Creating Your Pitch Presentation

### Step 1: Create the Presentation

#### Using R Presenter (Recommended for Rpubs)

1. Open RStudio
2. **File → New File → R Presentation**
3. Copy the content from artifact 3
4. Save as `bmi_pitch.Rpres`

#### Using Slidify (for GitHub Pages)

```r
# Install Slidify
library(devtools)
install_github('ramnathv/slidify')
install_github('ramnathv/slidifyLibraries')

# Create new deck
library(slidify)
author("bmi_pitch")
```

### Step 2: Publish Your Presentation

#### Option A: Publish to RPubs (Easiest with R Presenter)

1. Open your `.Rpres` file in RStudio
2. Click **"Publish"** button in preview window
3. Select **RPubs**
4. Sign in/Create RPubs account
5. Add title and description
6. Click **"Publish"**
7. Copy the URL (e.g., `http://rpubs.com/username/bmi-calculator-pitch`)

**IMPORTANT:** Use `http://` not `https://` for submission!

#### Option B: Publish to GitHub Pages

1. Create a GitHub repository: `bmi-calculator-pitch`
2. Add your presentation files
3. Generate HTML:
   ```r
   # For R Presenter
   # Just knit the presentation and save the HTML
   ```
4. Create `gh-pages` branch:
   ```bash
   git checkout -b gh-pages
   git add .
   git commit -m "Add presentation"
   git push origin gh-pages
   ```
5. Enable GitHub Pages in repository settings
6. Your URL: `https://yourusername.github.io/bmi-calculator-pitch/`

## 📤 Part 3: Pushing Code to GitHub

### Create GitHub Repository

```bash
# Initialize git in your project folder
cd bmi-calculator
git init

# Create .gitignore file
echo "rsconnect/" > .gitignore

# Add files
git add ui.R server.R README.md
git commit -m "Initial commit - BMI Calculator Shiny App"

# Create repository on GitHub, then:
git remote add origin https://github.com/yourusername/bmi-calculator.git
git push -u origin main
```

### Your GitHub should contain:
- `ui.R`
- `server.R`
- `README.md` (optional but recommended)

## 📝 Submission Checklist

### Shiny Application ✅
- [ ] App deployed to shinyapps.io
- [ ] App URL copied for submission
- [ ] Code pushed to GitHub
- [ ] All input widgets working (textbox, slider, radio, checkbox)
- [ ] Calculations performed in server.R
- [ ] Reactive output displays correctly
- [ ] Documentation included in app
- [ ] App is substantially different from class examples

### Pitch Presentation ✅
- [ ] Created in R Presenter or Slidify
- [ ] Exactly 5 slides (including title)
- [ ] Contains embedded R code that executes
- [ ] Published to RPubs or GitHub Pages
- [ ] Presentation URL copied for submission
- [ ] Uses `http://` (not `https://`) if on RPubs

## 🎯 What to Submit

### On Coursera Submission Page:

1. **Project Title:** "BMI Calculator & Health Risk Predictor"

2. **Your Shiny Application URL:**
   ```
   https://your-username.shinyapps.io/bmi-calculator/
   ```

3. **Your Reproducible Pitch Presentation URL:**
   ```
   http://rpubs.com/your-username/bmi-pitch
   ```
   OR
   ```
   https://your-username.github.io/bmi-pitch/
   ```

## 🔧 Troubleshooting

### Common Issues:

**App won't deploy:**
- Make sure all packages are listed in the code
- Check that there are no absolute file paths
- Verify your shinyapps.io account is set up correctly

**Presentation won't render:**
- Check for R code syntax errors
- Make sure all required libraries are loaded
- Try rendering locally first

**GitHub push fails:**
- Make sure you've created the remote repository
- Check your git credentials
- Use SSH key if HTTPS fails

## 📞 Support

- ShinyApps.io: https://docs.rstudio.com/shinyapps.io/
- R Presenter: https://support.rstudio.com/hc/en-us/articles/200486468
- GitHub Pages: https://pages.github.com/

## 📄 License

This project was created for the Developing Data Products course on Coursera.

---

**Good luck with your submission! 🎉**