# 데이터 입출력 220513 수정 
age <- c(28, 17, 35, 46, 23, 67, 30,50)
age
class(age)
str(age)

young <- min(age)
young
old <- max(age)
old

cat('가장 젊은 사람의 나이는',young,'세이고,\n가장 늙은 사람의 나이는',old,'입니다')

# 화면에서 데이터 입력받기
#install.packages('svDialogs')
#library(svDialogs)
user.input <- dlgInput('수입을 입력하세요')$res # res 필수! 입력된 값은 모두 문자취급 
user.input
income <- as.numeric(user.input) # 형변환
income # 1e+07 = 10000000
tax <- income * 0.05
tax
cat('세금',tax,'원')
options(scipen = 1) # 1e+4 부터 출력을 10000로 변경하는 옵션 

x <- 1
print(x)
cat(x)
print(iris[1:6,])
head(iris)
cat(iris[1:6,]) # cat으로 2차원 자료구조 출력 X

# LAB 체질량 지수 계산 1
height <- dlgInput('키를 입력하세요(cm)')$res 
weight <- dlgInput('몸무게를 입력하세요(kg)')$res

height <- as.numeric(height)
weight <- as.numeric(weight)

height.res <- height / 100
bmi <- weight / height.res^2
cat('키', height, 'cm', '몸무게', weight, 'kg\n')
cat('체질량 지수', bmi, '입니다.\n(25이상 과체중, 30이상 비만)')

# 숫자 천단위 마다 콤마
install.packages('formattable')
library(formattable)

num.data <- c(1250000, 22500, 123.456, 123.444, 1789.34)
num.data
comma(num.data)

# 파일 입출력 
getwd()
#setwd('C:/Windows') 작업경로 바꿀때 사용 

# csv 파일 읽기
air.quality <- read.csv('./day3/airquality.csv',header =T) # 경로 확인 
# header = F 로 하면 Ozone, Solar.R Wind ,Temp, Month, Day 도 값으로 들어가서 154행이됨
air.quality
head(air.quality)
tail(air.quality)
str(air.quality)

setosa.iris <- subset(iris, Species == 'setosa')
str(setosa.iris)

# row.names = F 해야지 행번호가 같이 저장안됨 
write.csv(setosa.iris,'./day3/setosa_iris.csv',row.names = F)


library(xlsx)
# 엑셀 읽고 쓰기
air.quality.xlsx <- read.xlsx('./day3/airquality.xlsx',header =T, sheetIndex=1)


## LAB 다이아몬드 정보
library(ggplot2)
diamonds
str(diamonds)
levels(diamonds$cut)
levels(diamonds$color)       
levels(diamonds$clarity)       

diamonds.new <- subset(diamonds, cut=='Premium'& carat >=2 )
diamonds.new
str(diamonds.new)
write.csv(diamonds.new, './day3/shiny_diamonds.csv', row.names =F)

# color가 D 나 H가 아닌 나머지 
diamonds.new.without.DH <- subset(diamonds.new, color != 'D' & color != 'H')
str(diamonds.new.without.DH)
write.csv(diamonds.new.without.DH, './day3/shiny_diamonds_without_DH.csv', row.names =F)
