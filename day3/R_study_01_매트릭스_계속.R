# 매트릭스 계속
z <- matrix(1:20, nrow = 4 ,ncol = 5, byrow = T)
z

x <- c(20, 25, 30, 35)
x
m1 <- cbind(z,x) # 열 기준 결합
m1

y <- c(36, 37, 38, 39, 40, 41)
y

m2 <- rbind(m1,y) # 행 기준 결합 
m2

# 매트릭스 값 추출
m2[1,3]
m2[1,6]
m2[1,7] # out of bounds

z[1,5]
z[4,5]
z[2,1:3] # 2행에 1열부터 3열 까지 순차적 출력 
z[1,c(1,2,4)] # 1행의 1,2,4열
z[1:2,] # 1행 2행 전체 출력
z[1:2,1:5] # 1행 2행 전체 출력
z[1:2, c(2,4)] #1행2행의 1열 2열 출력
z[,c(1,4)] # 전체행의 1열 2열 출력

# 매트릭스 이름붙이기
score <- matrix(c(90,85,69,78,85,96,49,95,90,80,70,60),
                nrow =4) # ncol 안적어도 자동으로 생성 
score

rownames(score) <- c('John','Tom','Mark','Jane') # 행에 이름 붙이기 
score
colnames(score)<- c('English','Math','Science') # 열에 이름 붙이기 
score

score['John','Math'] # 행 먼저 , 열 뒤에 
score['Math','Tom'] # Error
score['Tom',]
score[, 'Science']
rownames(score)
colnames(score)[2]

# LAB 햄버거 영양성분 정보 제공
burger = matrix(c(514,533,566,917,853,888,11,13,10),nrow = 3)
burger
rownames(burger) <- c('Mcdonald','Lotteria','Burgerking')
burger
colnames(burger) <- c('kcal','na','fat')
burger

burger["Mcdonald",'na']
burger['Mcdonald',]
burger[,'kcal']

# 데이터 프레임 : 숫자형 자료와 문자형 자료가 결합되어있는 형태 
physicals <- matrix(c(168.4, 169.5, 62.4, 65.5,'M','F'), nrow = 2) 
physicals # 벡터와 마찬가지로 matrix는  문자 들어가면 전부 문자로 취급 

city <- c('Seoul', 'Tokyo', 'Washington')
rank <- c(1,3,2)
city.info <- data.frame(city,rank) # 데이터 프레임 생성  
city.info

# iris 데이터셋
iris
head(iris) # 첫부분 출력
tail(iris) # 마지막 부분 출력 
str(iris) # 데이터프레임 벡터 matrix 리스트 등 정보 알려주는 함수 
z
str(z)
burger
str(burger)

u = c(1,2,3)
u
str(u)
str(c('John','Tom','Makr','Jane'))

iris[140,]
iris[,5]
iris[,'Species']
levels(iris[,5])
iris[,c(1,2)]
iris[,c('Sepal.Length')]
head(iris[,c('Sepal.Length','Petal.Length','Species')])
tail(iris[,c('Sepal.Length','Petal.Length','Species')])

head(iris[,c('Sepal.Length','Petal.Length','Species')])[1,]
head(iris[,c('Sepal.Length','Petal.Length','Species')])[1,3]

# LAB2 햄버거 영양성분 정보 제공 2
kcal <- c(514,533,566)
na <- c(917,853,888)
fat <- c(11,13,10)
menu <- c('새우버거', '불고기버거','치킨버거')
burger.2 <- data.frame(kcal, na ,fat, menu)
burger.2
rownames(burger.2) <- c('맥도날드','롯데리아','버거킹')
burger.2
burger.sum <- burger.2[,'na'] * burger.2[,'fat']
burger.sum

burger.2['맥도날드',]


# 데이터셋의 기본정보 알아보기 
dim(iris) # 행 열 갯수 출력
dim(burger.2)
nrow(iris) # 행 갯수
ncol(iris) # 열 갯수
colnames(iris)
colnames(burger.2)
rownames(burger.2)

head(iris, n=2) # 기본값 6개, n =2 하면 2개 출력 
tail(iris)
str(iris) # 출력시 $ 나오면 사용 가능 
iris$Sepal.Length
levels(iris$Species)
levels(iris[,'Species'])

# 행별, 열별 합계, 평균, 산술계산
colSums(iris[, -5]) # 모든행의 값의 합계를 구하는데 5열의 값은 제외 하고 계산 
colSums(iris[, -'Species']) #ERROR 
colSums(iris[, c(1,2)]) # 최소 2개 이상의 열이 선택되어야 계산 가능 
colMeans(iris[, -5])
rowSums(iris[, -5])
rowMeans(iris[, -5])

z <- matrix(1:20, nrow=4)
z
t(z) # 행 열 바꾸기
burger.2
t(burger.2) # but 데이터 프레임의 행과 열을 바꾸면 값이 전부 matrix화 되는점 주의  

iris.subset.1 <- subset(iris, Species == 'setosa') # 조건에 맞는 행과열만 추출하기 Species가 setosa 인것만 출력  
iris.subset.1

iris.subset.2 <- subset(iris, Sepal.Length >= 5.0 & Sepal.Width >3.0)
iris.subset.2
str(iris.subset.2)

iris.subset.2$Sepal.Length
iris.subset.2[, c(1,2,5)]

a <- matrix(1:20, 4,5) # nrow =4, ncol=5
b <- matrix (21:40,4,5)
a+b
a*b
a.2 <- a*2
a.2

iris
class(iris) # iris 데이터셋의 자료구조 확인 
str(iris)
class(z)
str(z)
is.matrix(iris) # iris는 데이터 프레임이므로 FALSE
is.matrix(z)
is.data.frame(iris) # TRUE

# LAB 벚나무 판매  직경은 벚나무 평균보다 커야, 높이 > 80,  부피 > 50
trees
class(trees)
str(trees)

# 화원 나무들 직경 평균 
girth.mean <- mean(trees[,1])
girth.mean
girth.mean.2 <- mean(trees$Girth)
girth.mean.2

candidate <- subset(trees, Girth >= girth.mean & Height >= 80 & Volume >= 50)
candidate

nrow(candidate) # 6개 판매 가능 

# 종업원의 Tip 계산하기 
install.packages('reshape2')
library(reshape2)
tips
is.matrix(tips)
is.array(tips)
is.data.frame(tips)
class(tips)
str(tips)
levels(tips$day) # day 범주몇개인가 

head(tips)
tail(tips)

table(tips$day)#tips 데이터셋에서 요일(day)별 팁을 받는 빈도를 구하기
str(table(tips$day))
dinner <- subset(tips, time == 'Dinner')
lunch <- subset(tips, time == 'Lunch')
table(dinner$day)
table(lunch$day)


sum.tips <- (sum(tips[,2]))
sum.tips
mean.tips <- (mean(tips[,2]))         
mean.tips

dinner.data <- dinner[c('total_bill','tip','size')]
lunch.data <- dinner[c('total_bill','tip','size')]
str(dinner.data)
str(lunch.data)

colSums(dinner.data)
colMeans(dinner.data)
colSums(lunch.data)
colMeans(lunch.data)

tips.rate <- tips$tip/tips$total_bill
tips.rate
mean(tips.rate)*100 # 음식값에 대한 tip 비율 
