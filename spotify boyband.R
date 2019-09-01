###Clean Spotify Sheet for Regressions and Other Fun Things###

rm(list=ls())

##Installing Things Here

install.packages("devtools")
devtools::install_github('charlie86/spotifyr')
install.packages("tidyverse")
install.packages("knitr")
install.packages("ggplot2")
install.packages("ISLR")
install.packages("class")

##Put all your books here (libraries)

library(spotifyr)
library(tidyverse)
library(knitr)
library(ggplot2)
library(ISLR)
library(class)

##Load in your data    #the first two functions are how I scraped my data through spotify

Sys.setenv(SPOTIFY_CLIENT_ID = ) #client API
Sys.setenv(SPOTIFY_CLIENT_SECRET = ) #secret API

access_token <- get_spotify_access_token() #gets connection through localhost

#################################Scraping section


playlist_uris <- c('4vYzYwDkQq6wVX1uURSJ3N')

scrapefeatures <- get_playlist_audio_features('reicst13', playlist_uris) #gathers audio features of selected URIs

sdf <- data.frame(scrapefeatures) #spotify data frame

csdf <- subset(sdf, select = -c(1:6,8,12,14,29)) #clean spotify data frame by deselecting various rows not helpful to our analysis

write.csv(csdf, "spotifyboyband.csv")
