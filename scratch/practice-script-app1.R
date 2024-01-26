# load packages ----
library(palmerpenguins)
library(tidyverse)
library(DT)

# filter penguins df for observations where body mass is >= 3000 and <= 4000
body_mass_df <- penguins %>%  
  filter(body_mass_g %in% c(3000:4000)) # 3000:4000 needs to be update-able (or in other words, reactive)!

# create scatterplot ----
ggplot(na.omit(body_mass_df), # USING THE DF WE MADE ABOVE!!
       aes(x = flipper_length_mm, y = bill_length_mm, 
           color = species, shape = species)) + # different shape for the points
  geom_point() +
  scale_color_manual(values = c("Adelie" = "darkorange", "Chinstrap" = "purple", "Gentoo" = "cyan4")) +
  scale_shape_manual(values = c("Adelie" = 19, "Chinstrap" = 17, "Gentoo" = 15)) +
  labs(x = "Flipper length (mm)", y = "Bill length (mm)", 
       color = "Penguin species", shape = "Penguin species") +
  theme_minimal() +
  theme(legend.position = c(0.85, 0.2),
        legend.background = element_rect(color = "white")) # update background color of legend

# DT build a BASIC datatable ----

DT::datatable(penguins) # SO DANG COOL!!!

# DT build a more complex datatable ----
years_df <- penguins %>%
  filter(year %in% c(2007:2008))

DT::datatable(years_df) 


