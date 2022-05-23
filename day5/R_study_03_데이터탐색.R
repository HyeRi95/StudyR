# 데이터 탐색
#단일범주 데이터 

library(carData)
tData <- Titanic
Date2 <- TitanicSurvival
str(Titanic)
str(TitanicSurvival)
room.class <- TitanicSurvival$passengerClass
str(room.class)
room.class
tbl <- table(room.class)
tbl
sum(tbl)

barplot(tbl, main = '선실별 탑승객수', xlab = '선실등급',ylab ='탑승객수', 
        col = c('blue','green','yellow'), names =c('1등실','2등실','3등실'))

tbl/sum(tbl)
pie3D(tbl, main = '선실별 탑승객 비율', radius = 1.5, labels = c('1등실','2등실','3등실'),
      labelcex = 1.0, labelcol = 'white', explode = 0.1, col = c('blue','green','yellow'))

# 생사여부, 성별 모두 위와 동일하게 차트생성 가능

# 단일변수 수치형
state.x77
grads <- state.x77[,'HS Grad']
grads
str(grads)

summary(grads)
min(grads)
max(grads)
median(grads)
mean(grads)
sd(grads)
var(grads)

hist(grads, main= '주별 졸업률', xlab = '졸업률', ylab = '주의 개수',
     col='orange') 
boxplot(grads, main = '주별 졸업률', col = 'green')

idx <- which(grads ==min(grads))
grads[idx]

idx <- which(grads == max(grads))
grads[idx]
idx <- which(grads <mean(grads)) # 인덱스의 위치 알려줌 
grads[idx]

# 74~ 79 영국 폐질환 사망자 데이터
ds <- read.csv('./day5/fdeaths.csv', header = T , row.names = 'year')
ds
my.col <- c('orange', 'blue','red','green','purple','darkgray')
my.lty <- 1:6 
plot(1:12,                        # x축 데이터
     ds[1,],                      # y축 데이터(1974)
     main = '월별 사망자 추이',   # 그래프 제목 
     type ='b',                   # 포인트 타입
     lty = my.lty[1],             # 라인종류
     lwd =2,                      # 라인두께께
     xlab = '월',                 # x축 라벨    
     ylab = '사망자수',           # y축 라벨
     ylim = c(300,1200),          # y축 범위 
     las = 1,                     # y축 가로쓰기 
     col = my.col[1],              # 선 색깔 
     )                 
for(i in 2:6){
  lines(1:12,
        ds[i,],
        type = 'b',
        lwd = 2,
        lty = my.lty[i],
        col = my.col[i]
  )
}

legend(x ='topright', 
       lty =my.lty,
       lwd =2,
       col= my.col,
       legend = rownames(ds),
       inset = c(0,0))

# LAB 미국 자동차 판매가격 데이터
library(DAAG)
str(carprice)
carprice$Price
range(carprice$Price)
mean(carprice$Price)
summary(carprice$Price)
hist(carprice$Price, main = '자동차 가격 분포',
     xlab = '가격대(1000$)',
     ylab = '빈도수',
     col=rainbow(8)
     )

barplot(carprice$Price, col =rainbow(50))

tbl<- table(carprice$Type)
barplot(tbl,
        main = '차종별 빈도수',
        xlab = '차종',
        ylab = '빈도수',
        col = rainbow(length(tbl)))
summary(tbl)

#가격이 제일 비싼 자동차 
idx <- which(carprice$Price == max(carprice$Price))
carprice[idx, c('Type', 'Price')]

#가격이 제일 싼 자동차 
idx <- which.min(carprice$Price)
carprice[idx, c('Type', 'Price')]

# 다중변수 탐색(분석)
head(pressure)
str(pressure)
plot(pressure$temperature,
     pressure$pressure,
     main ='온도와 기압',
     xlab = '온도(섭씨)',
     ylab = '기압',
     )
