# 함수 
y <- sqrt(x = 100, y =1)
y # 함수 () 안에 들어가는 것 부르는 호칭 : 파라미터 매개변수 인자 인수 argument

y <- c(1, 7, 4, 2, 3, NA) # NA는 sort 안된다 
y
sort(y) # 오름차순으로 정리 
sort(x = y, decreasing = F) # 기본값, 매개변수 decreasing없이 위 코드로 간단하게 실행가능 
sort(x = y, decreasing = T) # 내림차순 정리
sort(x = y, decreasing = T, na.last= F) # 내림차순 정리 
# na.last= T 결측값을 맨마지막에 출력,  na.last= F 결측값 맨 앞에 출력 


# 문자열 붙이기 함수 
str <- paste('Hello','World','!','This', 'is', 'R') # 기본 공백 space

str <- paste('Hello','World','!', sep = ' / ' ) # sep 원하는 구분자 설정 
str

a <- '나의 나이는'
b <- '20'
c <- '입니다.'
paste(a,b,c)

a <- 1:12
b <- '월'
c <- paste(a,b, sep = '') # a 벡터에 b 값 같이 출력
c

# 월별 매출액 분석 
sales <- c(750, 740, 760, 680, 700, 710, 850, 890, 700, 720, 690, 730)
names(sales) <- paste(1:12, '월', sep= '') #sep= '' 공백없이 출력 
sales
sales['7월']
sales['1월'] + sales['2월']
max.sales.month <- sort(sales,decreasing = T) # 내림차순
max.sales.month

max.sales.month[1] # 가장 높은 매출액 월 

# 상반기 매출액 합계
sum(sales[1:6])

# 하반기 매출액 합계
sum(sales[7:12])

# 1년 매출액 합계계
sum(max.sales.month)

