library(shiny)
library(ggplot2)


# Define server logic required to plot simulated sampling distribution and compute related statistics
function(input, output, session) {

    min_val <- 0 # min of uniform distribution. used for calculation and not accessible by user
    max_val <- 10 # max of uniform distribution. used for calculation and not accessible by user
    
    samp_means_sim <- eventReactive(input$run,{ # create simulation from user inputs
      
      # User inputs sample size. Default 2
      # User in puts number of samples simulated. Default 5
      # Defaults are low to incentivize user interaction and observe CLT/LLN as input parameters increase
      # increasing number of samples results in convergence to normal distribution
      # increasing sample size decreases variation in sampling distribution. histogram width decreases
      
      min_val <- 0 # min of uniform distribution. used for calculation and not accessible by user
      max_val <- 10 # max of uniform distribution. used for calculation and not accessible by user
      
      
      uni_vars <- rep(NA,input$samp_size) # initialize empty variable
      
      sample_mat <- matrix(rep(NA,      # create empty matrix. each row is a sample
                               input$num_samp*input$samp_size), 
                               nrow = input$num_samp, 
                               ncol = input$samp_size) 
      
      # create matrix of samples
      for (i in 1:input$num_samp){
        sample_i <- runif(input$samp_size, min = min_val, max = max_val) # simulate k random uniform vars on [0,10]
        sample_mat[i,] <- sample_i # put sample i into row i
        
      }
      
      # compute sample mean and std dev of each sample
      sample_means <- apply(sample_mat, MARGIN = 1, mean) # mean
      sample_sd <-apply(sample_mat, MARGIN = 1, sd)   # std dev
      
      # data frame containing mean and sd of each sample (and sample id) 
      sample_distr_mat <- data.frame(sample_num = 1:input$num_samp, 
                                     mean = sample_means,
                                     std_dev = sample_sd)
      
    }) 
                               
    
    output$stat_table <- renderTable({
      
      stat_param <- data.frame(Stat = c("Samp Mean x_bar", 
                                     "Samp SD x_bar",
                                     "Pop Mean x_bar", 
                                     "Pop SD x_bar" ),
                            Value = c(round(mean(samp_means_sim()$mean),2),
                                      round(sd(samp_means_sim()$mean),2), 
                                      round(mean(c(min_val,max_val)), 2), 
                                      round(sqrt((max_val-min_val)^2/(12*input$samp_size)),2)))
      stat_param
      
    })
  
    output$samp_distPlot <- renderPlot({    # render simulated sampling distribution

    samp_dist_hist <-  ggplot(samp_means_sim(), aes(x=mean)) + 
        geom_histogram(color = 'black',
                       fill = 'lightblue') +
        scale_x_continuous(breaks = c(seq(min_val, max_val, by = 0.5)),limits = c(min_val,max_val)) +
        geom_vline(xintercept = mean(c(min_val,max_val)),
                   linetype = 2,
                   linewidth = 1.25,
                   color = 'purple') +
        geom_vline(xintercept = mean(samp_means_sim()$mean),
                   linetype = 2,
                   linewidth = 1.25,
                   color = 'red') +
        xlab('Sample Mean') +
        ylab('Frequency')
        
    samp_dist_hist
      
    })
    
  
    
    

}
