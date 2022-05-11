# 벡터 = 파이썬 리스트
# 학생성적
score <- c(68, 95 ,83, 76, 90, 80, 85, 91, 82, 70)
mean(score) # 평균값
score

x <- c(1,2,3)
x.1 <- 1:3
x
x.1

y <- c('a','b','c')
y
z <- c(TRUE, FALSE, F, T)
z
y.1 <- c('hello', 'world','!','c')
y.1
w <- c(1,2,'3','4',5) # 문자가 하나라도 섞여있으면 모두 문자로 전환 
w
w.1 <- c('7',8)
w.1

v1 <- 50:90
v2 <- c(1,2,3, 10:20)
v2
v3 <- seq(1,100,3) # 1부터 100까지 3씩 차이나게 *파이썬과의 차이점 1:10 일때 1~10 //1~9
v3
v4 <- seq(0.1, 1.0, 0.1) #장점 python 안됨

v5 <- rep(1, time =5) # rep 반복 
v5

v6 <- rep(1:5, time =3)
v6

v7 <- rep(c(1,3,5), time=3)
v7

v8 <- rep(seq(1,10,2), time=2)
v8

v9 <- rep(c('a','b',3), each = 4) # 각각 4개씩 출력 
v9

# 벡터 이름붙이기
absent = c(8, 2, 0, 4, 1)
absent
names(absent) <- c('Mon', 'Tue','Wed','Thu', 'Fri')# 벡터 각각의 요소마다 이름부여
names(absent)
absent
absent[0] # R 에서는 index 첫번째 값이 1 // 파이썬은 0 
absent[1]
absent[2]
absent[5]
absent[6] # 결측값 값이 없다 NA 출력 
absent['Mon']
absent['Tue']

val.1 <- 10 
val.1
val.1 <- '10'
val.1
val.1 <- T

