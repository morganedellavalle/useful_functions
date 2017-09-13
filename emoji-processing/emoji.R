convert_emoji = function(df, column){
  emoji_lookup <- read.csv("emoji_reference.csv")
  emoji_lookup$Bytes <- tolower(emoji_lookup$Bytes)
  emoji_lookup$Bytes <- trimws(emoji_lookup$Bytes)
  emoji_lookup$Bytes <- paste0("<", emoji_lookup$Bytes, ">")
  
  df$emojis = df$column
  
  df$column <- gsub('><u\\+00', " ", df$column)
  
  pattern_emoji = "<[a-z0-9\\s].+?>"
  
  for(row in 1:nrow(df)){
    
    values = str_extract_all(df[row, column], "<([a-z0-9\\s].+?)>")
    if(length(values[[1]]) > 0){
      for(i in 1:length(values[[1]])){
        emoji_name = emoji_lookup[match(values[[1]][i], emoji_lookup$Bytes, nomatch = 1), "Description"]
        df[row, "emojis"] <- str_replace(df[row, "emojis"], pattern_emoji, replacement = paste0("[[",emoji_name, "]]"))
      }
    }
  }
  return(df)
}
