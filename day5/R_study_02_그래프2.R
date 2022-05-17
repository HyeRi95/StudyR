# 그래프2
# 원그래프 (Pie chart)

favorite.season
ds <- table(favorite.season)
ds
pie(ds, main = '선호계절', radius = 1, col = rainbow(4))

# 원그래프 2
install.packages('plotrix')
library(plotrix)
pie3D(ds, main = '선호계절', labels = names(ds), labelcol = 'yellow',
      labelcex = 1.0, explode = 0.1, radius = 1.5 , 
      col=c('brown','yellowgreen','skyblue','white'))

      
# 선 그래프
month = 1:12
late = c(5,8,7,9,4,6,12,13,8,6,6,4)
late
plot(month, late, main = '지각생통계', type = 'o', lty =1,
     lwd =2, xlab = '월', ylab = '지각생 수')

#선그래프 2개 이상 
month = 1:12
late1 = c(5,8,7,9,4,6,12,13,8,6,6,4)
late2 = c(4,6,5,8,7,8,10,11,6,5,7,3)
plot(month, late1, main = '지각생통계2', type = 'o', lty =1,
     lwd =2, xlab = '월', ylab = '지각생 수', col='red', 
     ylim =c(0,15)) # y 범위 지정 
lines(month, late2, type = 'b', col ='blue')

# LAB 
install.packages('DAAG')
library(DAAG)
science
ds <- table(science$like)
ds
length(ds)
pie(ds, radius =1, main = '선호 점수별 비율',col=rainbow(length(ds)))
pie3D(ds, radius =1.5, explode = 0.1, main = '선호 점수별 비율',
      col=rainbow(length(ds)), labels = names(ds), labelcex = 1.0, labelcol = 'white')

# 산점도 두 변수간의 관계 파악
wt <- mtcars$wt
mpg <- mtcars$mpg
plot(wt, mpg, main = '중량-연비 산점도', xlab ='중량', ylab = '연비', # 두개 변수 축 x, y
     las =1, col ='red', pch =19)  # pch  점의 모양 

# 아래의 세가지 산점도 다 동일 
plot(mtcars$wt, mtcars$mpg)
plot(mtcars[, c('wt', 'mpg')])
plot(mpg~wt, data=mtcars)

#여러변수들 간의 산점도 
vars <- c('mpg','disp','drat','wt')
target <- mtcars[vars]
plot(target, main = '다중 산점도',)

# iris
iris.2 <- iris[,3:4]
levels(iris$Species)
group <- as.numeric(iris$Species)
group
color.3 <- c('red', 'green ','blue')
plot(iris.2, main = '붓꽃 꽃잎길이 -넓이 산점도', pch = group, col = color.3[group],
     xlab ='꽃잎길이', ylab = '꽃잎넓이', las = 1)
legend(x = 'bottomright', legend = levels(iris$Species), 
       pch = (1:3),col=color.3)

# LAB 자동차 썬팅 분석
library(DAAG)
str(tinting)
plot(tinting$it, tinting$csoa)

group <-  as.numeric(tinting$tint)
group
color <- c('red','green','blue')
plot(tinting$it, tinting$csoa, pch = group, col = color[group])

group <- as.numeric(tinting$agegp)
group
plot(tinting$it, tinting$csoa,col=color[group],pch =group)

# 호주의 사회복지 서비스와 만족도
library(DAAG)
str(socsupport)     

library(plotrix)
ds <- table (socsupport$age)
pie3D(ds, main = '연령분포', labels = names(ds), labelcex = 1.0,
      radius = 1.5, explode =0.1, col = rainbow(length(ds)))

group <- as.numeric(socsupport$gender)
color <- c('blue','red')
plot(socsupport[,c('emotionalsat','tangiblesat','age')], pch =group, col=color[group])
