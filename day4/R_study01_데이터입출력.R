## 데이터 입출력 
setwd('C:/STUDY/StudyR/day4') # working directory를 day4로 지정 
print('Hello R!!')

# 실행결과를 저장
sink('result.txt', append = T) # append = T -> 이전문서 다음 뒤에 계속 붙이기
a <- 10 
b<- 20
cat('a+b =',a+b,'\n') # 자동으로 한줄 밑으로 안내려간다 print와 다름 
a+b

print ('Hey')
sink() # 닫기

sink('result.txt', append = T)# append = F 는 파일을 새로 생성 
iris
tail(iris)
sink() # 닫아줘야 txt 파일 열때 error 안생긴다 
print('TEST')
sink()

# txt 파일 읽기 / 구분자는 공백 또는 tab
air.txt <- read.table('./airquality.txt', header = T , sep =' ')# 현재 day4로 지정되어있음 
air.txt
# csv 파일도 read.table()로 로드가능 sep = ','
air.csv <- read.table('../day3/airquality.csv', header = T, sep = ',') 
air.csv

# LAB 체질량 지수 계산 II
library(svDialogs)
# 마지막에 Ctrl + Enter
height <- dlgInput('키 입력(cm)')$res
weight <- dlgInput('몸무게 입력(kg)')$res
height <- as.numeric(height)
weight <- as.numeric(weight)
height.unit <- height/100
bmi <- weight / (height.unit^2)
sink('bmi.txt',append = F)
cat('height','weight','bmi\n')
cat(height.unit * 100, weight, bmi)
cat('\n')
sink()

result <- read.table('./bmi.txt',header = T, sep = ' ')
result

names(result) <- c('키','몸무게','체질량지수')
result
write.table(result,'./bmi2.txt', row.names =F)


#엑셀 패키지 !! 
install.packages('readxl') # 엑셀 읽기용 패키지  
library(readxl)

air.xlsx <- read_excel('../day3/airquality.xlsx')
air.xlsx

install.packages('openxlsx') # 엑셀 쓰기용 패키지 
library(openxlsx)
write.xlsx(result,'bmi_result.xlsx', rowNames = F)

# 실전분석 차정보 조회
library(svDialogs)
library(readxl) # 교재와 다른 패키지 사용  
library(openxlsx) # 교재와 다른 패키지 사용  

carprice.new <- read.csv('./carprice.csv', header=T) # header 읽지않고 
View(carprice.new) # 표 형식으로 보기 
str(carprice.new)
levels(carprice.new[.1])

input.type <-dlgInput('차량 타입 입력(Compact,Small, Midsize, Large, Sporty, Van)')$res
input.city <- dlgInput('최소 시내연비 입력')$res
input.city <- as.numeric(input.city)

result <- subset(carprice.new, Type == input.type & MPG.city >= input.city)
result

write.xlsx(result, './van_result', rowNames = F )

getwd() # 현재 설정된 폴더 위치 
