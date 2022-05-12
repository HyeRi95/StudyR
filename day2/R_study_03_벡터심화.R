# 벡터 심화

# 산술연산 각원소별로 연산 
d <- c(1,4,3,7,8)
f <- 2*d
f
d-5
3*d+4

#벡터간 연산 , 길이가 같아야 가능, 포함된 종류가 같아야  
x<-c(1,2,3,4)
y<-c(5,6,7,8)
x+y
x*y
z<- x+y

# 벡터와 벡터 연산
m <- c(x,y)
m
n <- c(y,x)
n
p <- c(m,n,90,100)
p
q <- c(x,y,90,100)
q


# 벡터 연산 2
v1 <- c(1,2,3)
v2 <- c('John','Jane','Tom')
v1
v2
v3 <- c(v1,v2) # 문자가 하나라도 있으면 모두 문자로 바뀜 
v3
v4 <- c(v1, T, F, T, v2)
v4

# 벡터 사용 함수
datas <- 1:10
datas
sum(datas)
sum(2*datas)
length(datas)
mean(datas) # 평균값
median(datas) # 중앙값
max(datas)
min(datas)
sort(datas)
v3 <- sort(datas, decreasing = T)
v2 <- sum(datas)/length(datas)
v2

var(datas)
sd(datas)
range(datas)
range(v3)

# 논리연산자 
d <- 1:9
d
d >= 5
d < 5
d[d >5] 
sum(d[d>5])
d == 5
condi <- d > 5 & d < 8
condi
d[condi]
sum(d>5) # 5보다 큰값이 개수를 출력 6,7,8,9 : 4개 


# R 카페의 매출액 분석하기
espresso <- c(4, 5, 3, 6, 5, 4, 7)
americano <- c(63, 68, 64, 68, 72, 89, 94)
latte <- c(61, 70, 59, 71, 71, 92, 88)
price <- c(2000, 2500, 3000)
names(price) <- c('espresso', 'americano','latte')
price

sale.espresso <- price ['espresso']*espresso
sale.espresso
sale.americano <- price['americano']*americano
sale.americano
sale.latte <- price['latte']*latte
sale.latte
sale.day <- sale.espresso+sale.americano+sale.latte
sale.day
names(sale.day) <- c('Mon','Tue','Wed','Thu','Fri','Sat','Sun')
sale.day
cat('총 매출액은 ', sum(sale.day),'원 입니다.')
sale.sum <- sum(sale.day)
sale.sum
sale.mean <- mean(sale.day)
sale.mean
cat('평균 매출액은', sale.mean,'원 입니다.')
result <- names(sale.day[sale.day>=sale.mean])
cat ('평균 매출액 보다 매출액이 높은 요일은',result,'입니다.' )

cat('총 매출액은 ', sum(sale.day),'원 입니다.')
cat('평균 매출액은', sale.mean,'원 입니다.')
cat ('평균 매출액 보다 매출액이 높은 요일은',result,'입니다.' )
