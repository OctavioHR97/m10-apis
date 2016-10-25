### Exercise 2 ###

# As you noticed, it often takes multiple queries to retrieve the desired information.
# This is a perfect situation in which writing a function will allow you to better structure your
# code, and give a name to a repeated task.
library(jsonlite)


# Write a function that allows you to specify an artist, and returns the top 10 tracks of that artist
TopTrackSearch <- function(artist) {
  # Search base
  base <- 'https://api.spotify.com/v1/'
  
  # Search artist
  artist.query <- paste0(base, 'search?', 'q=', artist, '&type=artist')
  
  # Artist info 
  artist.info <- fromJSON(artist.query)
  artist.id <- artist.info$artists$items$id[1]
  
  # Get albums
  album.query <- paste0(base, 'artists/', artist.id, '/top-tracks?country=US')
  top.tracks <- fromJSON(album.query)
  return(top.tracks$tracks$name)
}


# What are the top 10 tracks by Nelly?
nelly <- TopTrackSearch('Nelly')



### Bonus ### 
# Write a function that allows you to specify a search type (artist, album, etc.), and a string, 
# that returns the album/artist/etc. page of interest


# Search albums with the word "Sermon"

