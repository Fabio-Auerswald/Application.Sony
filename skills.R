if (!require("pacman")) install.packages("pacman")
pacman::p_load("tidyverse", "ggplot2")

language_skill <- as.data.frame(
  tibble(
    language = c("German", "English", "Portuguese", "Spanish", "French"),
    niveau = c("native", "C1", "B2", "C1","B1" ),
    level = c(7, 4, 5, 5, 3 )
  )
)

languages <- language_skill %>% ggplot(aes(x=language, y=as.numeric(level), fill=language)) +
  
  geom_bar(stat="identity") + 
  coord_flip() +
  
  labs(title ="",
       caption = "Fabio Auerswald, 2022",
       subtitle = "Language levels according to the European Framework of Reference",
       fill = "Spoken Languages") +
  
  xlab("") +
  ylab("Language proficiency") +
  
  scale_y_discrete(name ="Levels", 
                   limits=c("A1","A2","B1","B2","C1","C2", "Native")) +
  
  theme_light()

languages
