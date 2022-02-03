
# Loading required packages
library(spotifyr)
library(tidyverse)
library(httpuv)
library(knitr)
library(devtools)
library(dplyr)

# Connect to Spotify API
Sys.setenv(SPOTIFY_CLIENT_ID = "9af1a624b5da4e199e8782f6cf806378")
Sys.setenv(SPOTIFY_CLIENT_SECRET = "2db3f175820f43248d4bcf0dcd6580a5")

access_token <- get_spotify_access_token()



ahmad_jamal <- get_artist_audio_features('ahmad jamal')

## Selecting only the wanted columns
ahmad_jamal_1 <- ahmad_jamal %>% dplyr::select(key_mode, key, key_name)

## What were Ahmad Jamals favorite keys to play in?
ahmad_jamal_favorite <- ahmad_jamal %>% 
  count(key_mode, sort = TRUE) %>% 
  head(5) 

ahmad_jamal_favorite <- as.data.frame(ahmad_jamal_favorite)

favourite <- as.data.frame(ahmad_jamal_favorite) %>% 
  
  ggplot(aes(x=key_mode, y=n, fill=key_mode)) +
  
  geom_bar(stat="identity")   + 
  geom_text(aes(label=key_mode), hjust=2) +
  coord_flip() +
  
  labs(title ="",
       caption = "Fabio Auerswald, 2022",
       subtitle = "Ahmad Jamal's favorite keys to play in ",
       fill = "Favorite Key") +
  
  xlab("") +
  ylab("Number of songs composed in this key")  +
  theme_light() +
  
  theme(axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank())

favourite

