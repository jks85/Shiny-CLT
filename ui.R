library(shiny)

# Define UI for application that draws a histogram
fluidPage(

    # Application title
    titlePanel("Simulating the CLT and LLN"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            h4("Instructions:"),
            h5(   "1. Input the number of samples."),
            h5(   "2. Input the size of each sample."),
            h5(   "3. Click run simulation."),
            h5("\n"),
            h5(" On the right you will see a histogram. Below you will see a table containing
               summary statistics."),
            h5("\n"),
            h5("Tip: Try both large and small values. Note how the plot changes and how the statistics below
               change."),
            
            tableOutput("stat_table")
        ),

        # Show a plot of the generated distribution
        mainPanel(
         # h4("Choose the number of samples"),
          numericInput(inputId = "num_samp",
                      label = "Number of samples (min 1, max 50,000):",
                      min = 1,
                      max = 50000,
                      value = 5),
          # h4("Choose the sample size:"),
          numericInput(inputId = "samp_size",
                      label = "Sample size (min 1, max 100):",
                      min = 1,
                      max = 100,
                      value = 2),  
          actionButton(inputId = "run",
                       label = "Run Simulation"),
          
          plotOutput("samp_distPlot")
          
        )
    )
)
