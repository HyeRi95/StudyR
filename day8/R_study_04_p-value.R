# P-value
mpg <- as.data.frame(ggplot2::mpg)

library(dplyr)
mpg_diff <- mpg %>% # ctrl + shift + m : %>% 추가공부  
  select(class,cty) %>%
  filter(class %in% c('compact','suv'))
unique(mpg_diff$class)

head(mpg_diff)
table(mpg_diff$class)
t.test(data = mpg_diff, cty ~ class, var.equal =T)

#p-value가 0.05 보다 작으면 신뢰할수있는 데이터 

mpg_diff2 <- mpg %>% # ctrl + shift + m : %>% 추가공부  
  select(fl,cty) %>%
  filter(fl %in% c('r','p'))
unique(mpg_diff2$fl)
table(mpg_diff2$fl)
t.test(data = mpg_diff2, cty~ fl, var.equal =T)


