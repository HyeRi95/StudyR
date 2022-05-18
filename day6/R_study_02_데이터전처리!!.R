# 데이터 전처리!!
z <- c(1, 2, 3, NA, 5, NA, 7, 8, 9, 10)
z
summary(z) # 결측값 빼고 계산
sum(z)
min(z)
max(z)
mean(z)
sd(z)
median(z)
var(z)

is.na(z) # NA 값 확인 T 2개 
sum(is.na(z))
sum(c(T,T,F))
sum(z,na.rm = T) # NA 값을 제외하고 z 벡터의 합계를 구한다 

# 결측값 제거/대체
z1 <- c(1, 2, 3, NA, 5, NA, 7)
z2 <- c(5, 8, 1, NA, 3, NA, 7)

z1[is.na(z1)] <- 0 # z1에있는 NA 값에 0을 치환한다
z3 <- as.vector(na.omit(z2)) #  z2에 있는 NA값을 제거하고 새로운 z3 vector생성 

z4<- z1
# z1의 NA 값에 평균값 넣기 (NA값 치환)
z4[is.na(z4)] <- ceiling(sum(z4, na.rm = T)/length(z4)) # ceiling 올림 처리 
summary(z4)
sum(z1)
sum(z3)
summary(z1)

iris
iris.na <- iris
iris.na[1,2] <- NA
iris.na[1,3] <- NA
iris.na[2,3] <- NA
iris.na[3,4] <- NA
head(iris.na)

# 결측값 확인하는 방법 (열별)
for (i in 1:ncol(iris.na)){
  this.na <- is.na(iris.na[,i])
  cat(colnames(iris.na)[i], '\t', sum(this.na),'\n')
}

# apply 함수로 결측값 확인 (열별)
col_na = function(y){
  return(sum(is.na(y)))
}

na_count <- apply(iris.na, 2, FUN = col_na) # 궁금한것 박스 +F1 = 도움말 
na_count

# 결측값 확인하는 방법 (행별)
rowSums(is.na(iris.na))
result <- rowSums(is.na(iris.na))
sum(result>0) # 결측값있는 행의 갯수
sum(is.na(iris.na)) # 결측값 갯수 

# 매트릭스에서 NA 값 제외 전처리
head(iris.na)
# complete.cases(iris.na) = 출력이 T F 로 된다, NA 값 = F
iris.na [complete.cases(iris.na),] # NA 가 없는걸 표시 
iris.na [!complete.cases(iris.na),] # NA 가 있는걸 표시 
iris.na [complete.cases(iris.na) == F,] # NA 가 있는걸 표시 

# NA가 포함된 행들 제외 후 새로운 데이터셋 생성 
iris.comp <- iris.na[complete.cases(iris.na),] 

# LAB 전세계 국가들의 통계 데이터 분석 
library(carData)
str(UN)
levels(UN$region)
levels(UN$group)

# 결측값 확인 (열별)
col_na = function(y){
  return(sum(is.na(y)))
}

apply(UN, 2, FUN = col_na) 

mean(UN$lifeExpF, na.rm = T)# 결측값 제외 여성의 평균수명
tmp <- UN[,c('pctUrban', 'infantMortality')]
tmp <-tmp[complete.cases(tmp),]
tmp
length(tmp$pctUrban) # 결측값 제외한후의 행 갯수 
colMeans(tmp) # 열 평균 

tmp.asia <- subset(UN, region =='Asia')
mean(tmp.asia$fertility)

# 정렬
#sort( ) 함수 : 값의 크기에 따라 값들을 정렬하는 함수
v1 <- c(1, 7, 6, 8, 4, 2, 3, 9)
sort(v1)
sort(v1,decreasing = T) # 내림차순

name <- c('정대일', '강재구', '신현석', '홍길동')
sort(name)

#order( ) 함수 : 값의 크기에 따라 값들의 인덱스를 정렬하는 함수
idx <- order(name, decreasing =T) 
idx
name[idx]

# $ : 리스트와 데이터프레임만 사용가능 

# 데이터프레임 정렬시 order() 함수 사용해서 정렬 
iris
sort(iris$Sepal.Length)
sl.order <- order(iris$Sepal.Length)
iris[sl.order,]
iris.new <- iris[sl.order,]
iris.new

# decreasing = T : iris$Peicies, iris$Petal.Length 둘다 역정렬된다 
# Species 먼저정렬한 후에 그 품종내에서 Petal.Length 정렬 
iris.ag <- iris[order(iris$Species, decreasing = T, iris$Petal.Length),]
iris.ag

# LAB  고속도로 교통사고 데이터 
library(carData)
str(Highway1)
levels(Highway1$htype)
Highway1[order(Highway1$rate,decreasing = T),] # 행으로 정렬 (대부분)
tmp <- Highway1[order(Highway1$len, decresing = T), 'len']
tmp
sum(tmp[1:10])

tmp2<- sort(Highway1$len, decreasing =T)
tmp2
sum(tmp2[1:10])

tmp <- Highway1[order(Highway1$adt), c('adt','rate')]
tmp[1:10,]

tmp <- Highway1[order(Highway1$slim, decreasing = T), c('len','adt','rate')]
tmp[1:5,]
