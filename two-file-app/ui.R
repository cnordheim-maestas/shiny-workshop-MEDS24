# user interface ----
ui <- navbarPage(
  
  title = "LTER Animal Data Explorer",
  
  # (Page 1) intro tabPanel ----
  tabPanel(title = "About this App",
           
           "background info will go here" # REPLACE THIS WITH CONTENT
           
  ), # END (Page 1) intro tabPanel
  
  # (Page 2) data viz tabPanel ----
  tabPanel(title =  "Explore the Data",
           
           # tabset panel to contain tabs for data vis ----
           tabsetPanel(
             
             #trout tabpanel
             tabPanel(title="Trout",
                      
                      # trout sidebar layout ----
                      sidebarLayout(
                        
                        # trout sidebar panel ----
                        sidebarPanel(
                          
                         # channel type pickerinput ----
                         pickerInput(inputId = "channel_type_input",
                                     label = "Select Channel Type(s):",
                                     choices = unique(clean_trout$channel_type), # prints all options in the column channel type
                                     selected = c("cascade", "pool"), # to be selected by default
                                     options = pickerOptions(actionsBox = TRUE), # adds a selct all and deselect all
                                     multiple = TRUE # can select multiple channel types onto the plot together
                                     ), # END channel type pickerinput
                         
                         # section checkboxGroupButtons ----
                         checkboxGroupButtons(inputId = "section_input", label = "Select a sampling section(s):",
                                              choices = c("clear cut forest", "old growth forest"),
                                              selected = c("clear cut forest", "old growth forest"),
                                              individual = FALSE, justified = TRUE, size = "sm",
                                              checkIcon = list(yes = icon("check", lib = "font-awesome"), 
                                                               no = icon("xmark", lib = "font-awesome"))), # END section checkboxGroupInput
                        ), # END trout sidebar panel
                        
                        # trout main panel ----
                        mainPanel(
                          
                          # trout scatterplot output
                          plotOutput(outputId = "trout_scatterplot_output") # END trout scatterplot output
                          
                        ) # END trout main panel
                        
                      ) #END trout sidebar layout
                      
             ), # END trout panel
             
             # penguin tabpanel
             tabPanel(title="Penguins",
                      
                      # penguin sidebar layout ----
                      sidebarLayout(
                        
                        # penguin sidebar panel ----  
                        sidebarPanel(
                          
                          "penguin inputs go here"
                          
                        ), # END penguin sidebar panel
                        
                        # penguin main panel
                        mainPanel(
                          
                          "penguin plot goes here"
                          
                        ) # END main panel
                        
                        
                      ) # END penguin sidebar layout
                      
             ), # END penguin panel
             
           ) # end tabsetPanel
           
  ) # END (Page 2) data viz tabPanel
  
) # END navbarPage