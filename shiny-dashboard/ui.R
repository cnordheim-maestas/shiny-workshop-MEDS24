#........................dashboardHeader.........................
header <- dashboardHeader(
  # title ----
  title = "Fish Creek Watershed Lake Monitoring",
  titleWidth = 400 # played with value until it looked good
  
)

#........................dashboardSidebar........................
sidebar <- dashboardSidebar(
  
  # ---- sidebar
  sidebarMenu(
    
    menuItem(text = "Welcome", tabName = "welcome", icon = icon("star")),
    menuItem(text = "Dashboard", tabName = "dashboard", icon = icon("gauge"))
    
  ) # END sidebarMenu
  
) # END dashboardSidebar

#..........................dashboardBody.........................
body <- dashboardBody(
  
  # tabItems ----
  tabItems(
    
    # welcome tabItem ----
    tabItem(tabName = "welcome", # identifier specified above
            
            "background info here"
            
    ), # END welcome tabItem
    
    # dashboard tabItem ----
    tabItem(tabName = "dashboard",
            
            "dashboard content here"
            
    ) # END dashboard tabItem
    
  ) # END tabItems
  
) # END dashboardBody

#..................combine all in dashboardPage..................
dashboardPage(header, sidebar, body)