# EMOJI PROCESSING

This folder contains: 
  * a table (emoji_reference.csv) with bytes encoding of 842 most used emojis and their corresponding (text) description
  * a function emoji.R that transforms the following encoding of an emoji: <f0><u+00xx><u+00yy><u+00zz> into its text description.
  It takes as an argument a df and one of its column, that has text containing encoded emojis (for instance an instagram post) 
  that we want to transform into plain text with emoji description. 
