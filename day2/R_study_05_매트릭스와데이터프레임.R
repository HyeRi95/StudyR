# 매트릭스와 데이터프레임
z <- matrix (1:20, nrow = 4, ncol = 5) # 4행 5열 매트릭스 생성 행기준 아래로 순서대로 숫자 출력
z
z2 <- matrix (1:20, nrow = 4, ncol = 5, byrow = T) # 열기준 옆으로 순서대로 숫자 출력 
z2

z[1,3]
z[3,4]

x <- 1:4
y <- 5:8
x
y
z <- matrix(1:20, nrow=4, ncol=5, byrow = T)
z

m1 <- cbind(x, y) # 열방향으로 결합 
m1

m2 <- rbind(x,y) # 행방향으로 결합
m2

m3 <- rbind(m2,x)
m3

m3.1 <- cbind(m2,x) # 개수가 안맞아서 cbind 불가 
m3.1
m4 <- cbind(z,x)
m4

z[,2] # 2열의 모든값 
z[3,] # 3행의 모든값 

