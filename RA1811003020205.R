#Scraping "paytm" Diwali best deals for mens

# dependency to check access
library(robotstxt)
path <- paths_allowed ("https://paytmmall.com/men-t-shirts-glpid-5030?use_mw=1&src=store&from=storefront")

#setting website url
url <-"https://paytmmall.com/men-t-shirts-glpid-5030?use_mw=1&src=store&from=storefront"
#define(library)
library(dplyr)
library(rvest)

# defining url
web<- read_html(url)

#Automating data collection using pipeline
Name<-web%>%html_nodes(".UGUy")%>%html_text()
#scraps_name

Price <-web%>%html_nodes("._2MEo")%>%html_text()
#scraps_price

Cashback <-web%>%html_nodes("._1mS1")%>%html_text()
#scraps_cashback

#making a table for collected entrie
Menswear_Offers<- data.frame(Name,Price,Cashback)
View(Menswear_Offers)


#saving the table as a csv file
write.csv(Menswear_Offers, "in paytm mall.csv")

