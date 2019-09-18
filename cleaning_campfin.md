For this, you need two packages from the tidyverse.

``` r
library(readr)
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

You have to drill down quite a way from
<a href="https://cf.ncsbe.gov/CFOrgLkup/" class="uri">https://cf.ncsbe.gov/CFOrgLkup/</a>
before you find the url you want, but once you do, just replace the URL
on line 18 with the URL for the “Export data to .csv” that you need.

``` r
url <- "https://cf.ncsbe.gov/CFOrgLkup/ExportDetailResults/?ReportID=168216&Type=REC&Title=Cooper%20for%20North%20Carolina%20-%202019%20Mid%20Year%20Semi-Annual"
```

read\_csv() does not do a great job here guessing the correct
col\_types, so we have to define them explicitly.

``` r
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
        
head(receipts)
```

    ## # A tibble: 6 x 19
    ##   Date       `Is Prior` Name  `Street 1` `Street 2` City  State `Full Zip`
    ##   <date>     <lgl>      <chr> <chr>      <chr>      <chr> <chr> <chr>     
    ## 1 2019-01-01 NA         Aggr… <NA>       <NA>       <NA>  <NA>  <NA>      
    ## 2 2019-01-02 NA         Aggr… <NA>       <NA>       <NA>  <NA>  <NA>      
    ## 3 2019-01-03 NA         Aggr… <NA>       <NA>       <NA>  <NA>  <NA>      
    ## 4 2019-01-03 NA         Aggr… <NA>       <NA>       <NA>  <NA>  <NA>      
    ## 5 2019-01-03 NA         Aggr… <NA>       <NA>       <NA>  <NA>  <NA>      
    ## 6 2019-01-04 NA         Aggr… <NA>       <NA>       <NA>  <NA>  <NA>      
    ## # … with 11 more variables: `Country Name` <chr>, `Outside US Postal
    ## #   Code` <chr>, Profession <chr>, `Employers Name` <chr>, Purpose <chr>,
    ## #   `Receipt Type Desc` <chr>, `Account Abbr` <dbl>, `Form Of Payment
    ## #   Desc` <chr>, Description <chr>, Amount <dbl>, `Sum To Date` <dbl>

Finally, we should rename the columns to remove spaces and generally
promote brevity.

``` r
names(receipts) <- c("date","prior","donor","street1","street2","city","state","zip","country","postal","profession","employer","purpose","type","accont","payment_form","description","amount","sum_to_date")
```
