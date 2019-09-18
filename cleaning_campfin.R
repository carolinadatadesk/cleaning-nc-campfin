library(readr)
library(dplyr)

url <- "https://cf.ncsbe.gov/CFOrgLkup/ExportDetailResults/?ReportID=168216&Type=REC&Title=Cooper%20for%20North%20Carolina%20-%202019%20Mid%20Year%20Semi-Annual"

receipts <- read_csv(url, skip=1, col_types = 
                             cols(
                                     Date = col_date("%m/%d/%Y"),
                                     `Is Prior` = col_logical(),
                                     Name = col_character(),
                                     `Street 1` = col_character(),
                                     `Street 2` = col_character(),
                                     City = col_character(),
                                     State = col_character(),
                                     `Full Zip` = col_character(),
                                     `Country Name` = col_character(),
                                     `Outside US Postal Code` = col_character(),
                                     Profession = col_character(),
                                     `Employers Name` = col_character(),
                                     Purpose = col_character(),
                                     `Receipt Type Desc` = col_character(),
                                     `Account Abbr` = col_double(),
                                     `Form Of Payment Desc` = col_character(),
                                     Description = col_character(),
                                     Amount = col_double(),
                                     `Sum To Date` = col_double()))
names(receipts) <- c("date","prior","donor","street1","street2","city","state","zip","country","postal","profession","employer","purpose","type","accont","payment_form","description","amount","sum_to_date")