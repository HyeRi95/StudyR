# 제어문
# if 문
job.type <- 'A'

if (job.type =='B'){ # job.type ='B' 사용불가 
  bonus <- 200
} else { # else문 한줄 내리면 에러난다 
  bonus <- 100
}
print(bonus)

a <- 10 
b <- 20
if (a>5 & b>5) {
  print(a+b)
}
if (a>5 | b>30) {
  print(a*b)
}

a <- 10 
b <- 20
if (a < b) {
  c <-b
  print(c)
}

c <-ifelse(a < b, b, a) # 위의 조건문과 동일 
c

# 반복문
for( i in 1:5) {
  cat(i,'')
}
cat('\n')

for(y in 1:9){
  cat('2 X', y,'=', 2*y, '\n')
}

# 구구단 파이썬과 비교
for(x in 2:9){
  for(y in 1:9){
  cat(x, 'X', y,'=', x*y, ' ')}
  cat('\n')
}

for ( i in 1:20){
  if (i%%2 == 0){
    cat(i,'')
  }
}
  
# iris 꽃잎 크기 분류 
norow <- nrow(iris)
norow
mylabel<- c() # 빈벡터 생성 
for(i in 1:norow){
  if (iris$Petal.Length[i] <= 1.6){
    mylabel[i] <- 'L'
  } else if (iris$Petal.Length[i] >= 5.1){
    mylabel[i] <- 'H'
  }else {
      mylabel[i] <- 'M'
    }
  }

print(mylabel)
str(mylabel)
newds <- data.frame(iris$Petal.Length, mylabel, iris$Species)
newds

write.csv(newds, './day4/iris_petal.csv', row.names = F)

#while문 1~100 까지 합계 
sum <- 0 
i <- 1
 while (i <= 100) {
   sum <- sum +i
   i<-i+1
 } # 무한반복시 esc 눌러서 빠져나온다 
print(sum)

# 사용자 정의 함수
mymax <- function(x,y){
  num.max <- x
  if( y > x){
    num.max <- y
  }
  return (num.max)
}
print(mymax(1,3))
mymax(1,3)

# 내장함수가 좋앙 
max(1,3,5,6,7)

mydiv <- function (x, y=2){
  result <- x/y
  return (result)
}
mydiv(10,3)
mydiv(10)

myfunc <- function(x,y){
  val.sum <- x+y
  val.mul <- x*y
  
  return(list(sum = val.sum, mul = val.mul))
}
result <- myfunc(14,7)
result

#내장함수 apply()
apply(iris[,1:4],2, median) # species가 존재하므로 전체행에 대한 mean 에러 
