# Web Scraping with R

# UNDERSTAND HTML AND CSS, 
# YOU WILL ALSO NEED TO KNOW THE PIPE OPERATOR IN R (%>%). 

# If you don't know HTML or CSS, you may be able to use an auto-web-scrape 
# tool, like import.io. 

# rvest library
install.packages('rvest')
library(rvest)
demo(package='rvest')
demo(package = 'rvest', topic = 'tripadvisor')

lego_movie <- read_html("http://www.imdb.com/title/tt1490017/")

# To extract the rating, we start with SelectorGadget to figure out 
# which css selector matches the data we want: strong span.

# If you haven't heard of selectorgadget, make sure to read "SelectorGadget" - it's the easiest way to determine 
# which selector extracts the data that you're interested in.
# We use html_node() to find the first node that matches that selector,
# extract its contents with html_text(), and convert it to numeric with 
# as.numeric():
  
lego_movie %>% 
html_node("strong span") %>%
html_text() %>%
as.numeric()

# We use a similar process to extract the cast, using html_nodes() 
# to find all nodes that match the selector:
  
lego_movie %>%
html_nodes("#titleCast .itemprop span") %>%
html_text()

# The titles and authors of recent message board postings are stored in a 
# the third table on the page. We can use html_node() and [[ ]] to find it,
# then coerce it to a data frame with html_table():
  
lego_movie %>%
html_nodes("table") %>%
.[[2]] %>%
html_table()

#Ref: www.pieriandata.com

