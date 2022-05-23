# 2022.05.23 R /Rstudio 코딩 테스트

# 1-1.
test_1 <- seq(1.0,3.0,0.2)
test_1

# 1-2
x <- 1:11
x <- x[rep(1:3,3)]
x

# 2
max.temp <-c(22,27,26,24,23,26,28)
barplot(max.temp, 
        main = '주간 최대 기온',
        xlab = '섭씨',
        ylab = '요일',
        col = rainbow(7),
        horiz = T, 
        names = c('월', '화', '수', '목','금','토','일'), 
        las =2)


# 3
trees
Gir <- trees$Girth
Vol <- trees$Volume
plot(Gir, 
     Vol, 
     main = '나무둘레-용적 산점도', 
     xlab ='둘레', ylab = '용적', 
     las =1, col ='skyblue', pch =19)


# 4
airquality

par(mfrow = c(2,2), mar =c(5,5,7,4)) #파티션 화면분할 2x2 

color.1 <- rep('#A8DADC',9)
color.1[1] <- '#1d3577'

color.2 <- rep('#A8DADC',5)
color.2[4] <- '#1d3577'

color.3 <- rep('#A8DADC',7)
color.3[6] <- '#1d3577'

color.4 <- rep('#A8DADC',5)
color.4[2] <- '#1d3577'



hist(airquality$Ozone,
     main ='오존분포', 
     col = color.1,
     xlab = '오존', 
     ylab = 'Frequency')

hist(airquality$Temp,
     main ='기온분포', 
     col = color.2,
     breaks = 5,
     xlab = '기온', 
     ylab = 'Frequency')


hist(airquality$Solar.R,
     main ='자외선분포', 
     col = color.3,
     xlab = '자외선', 
     ylab = 'Frequency')


hist(airquality$Wind,
     main ='풍량분포', 
     col = color.4,
     breaks = 5,
     xlab = '풍량', 
     ylab = 'Frequency')

par(mfrow =c(1,1), mar = c(5,4,4,2)+.1) 


# 5
library(dplyr)
library(carData)
str(TitanicSurvival)
head(TitanicSurvival)
par(mfrow =c(1,1), mar = c(5,4,4,2)+.1) 
test.5 <-TitanicSurvival[,c('survived','age','passengerClass')]
test.5 <- test.5[(complete.cases(test.5)),] # 나이 결측값 제거한 데이터 
str(test.5)

test.5.1 <- subset(test.5,passengerClass== '1st')
test.5.2<- subset(test.5,passengerClass== '2nd')
test.5.3 <- subset(test.5,passengerClass== '3rd')

test.5.1.new <- count(test.5.1,survived)
test.5.2.new <- count(test.5.2,survived)
test.5.3.new <- count(test.5.3,survived)
test.info <- cbind(test.5.1.new[,2],test.5.2.new[,2],test.5.3.new[,2])
test.info <- as.matrix(test.info)
barplot(test.info,col = rainbow(2),main = '타이타닉 클래스별 생존자',
        names =c('First','Second','Third'),
        legend.text = c('생존자','사망자'),
        args.legend = list(x='topleft',inset=c(0.1,0)))

