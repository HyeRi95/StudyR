# 샘플링 
x <- 1:100
x
y <- sample(x,size = 20, replace = F) # replace = F 비복원 추출 
y

idx <- sample(1:nrow(iris), size=15, replace = F)
idx
iris.15 <- iris[idx,]
iris.15

# set.seed()
# 임의 추출을 하되 재현가능한 결과가 필요한 경우 
# sample( ) 함수 실행 직전에 set.seed( ) 함수를 먼저 실행
sample(1:20, size = 5)
sample(1:20, size = 5)
sample(1:20, size = 5)
set.seed(100)
sample(1:20, size = 5)
set.seed(100)
sample(1:20, size = 5)
sample(1:20, size = 5)

# 조합: 하나의 열이 하나의 조합을 나타낸다, 열의수 = 모든 조합의 수 
combn(1:10,5) # 1부터 10까지에서 5개 조합
options(max.print=1000000) # 출력 한계 

x <- c('red','green','blue','black','white')
com <- combn(x,2)
com

for (i in 1:ncol(com)){
  cat(com[,i], '\n')
}

# LAB  편두통 데이터 분석
str(KosteckiDillon)
tot.mean <- mean(KosteckiDillon$dos)
tot.mean
summary(KosteckiDillon$dos)


# ------------- set.seed() 함수 이해위해 작성--------------- 
sample(nrow(KosteckiDillon),nrow(KosteckiDillon)*0.1)
set.seed(100)
sample(nrow(KosteckiDillon),nrow(KosteckiDillon)*0.2) 
# 위 문장 실행후 set.seed(100) 실행시 위에서 추출한 10퍼센트의 값을 그대로 유지한채
# 뒤에 10퍼센트의 값을 더 추출해서 총 20퍼센트의 값을 추출 
set.seed(100)
idx <- sample(nrow(KosteckiDillon),nrow(KosteckiDillon)*0.3) 
idx
# ----------------------------------------------------------


# LAB 시작 
# 10~ 50퍼센트까지 반복문 돌면서 진행 
# set.seed(100)때문에 추출된값에 추가로 계속 더해서 추출된다 
for(rt in (1:5)*0.1){
  set.seed(100)
  idx <- sample(nrow(KosteckiDillon), nrow(KosteckiDillon)*rt)
  sam.data <-KosteckiDillon[idx,'dos']
  tmp.mean <- mean(sam.data)
  cat('비교:', rt*100, '% 샘플링 평균 치료일수 =',tmp.mean,':', tot.mean-tmp.mean,'\n')
}

# 평균 치료일수 646.7059
tot.mean

#집계 aggregate() : 데이터의 그룹에 대해서 합계나 평균을 계산하는 작업

agg.result <- aggregate(iris[,-5], by =list(iris$Species), FUN = mean) # iris[,-5] species 제외 
agg.result
summary(iris)
agg.result <- aggregate(iris[,-5], by =list(iris$Species), FUN = median)
agg.result
agg.result <- aggregate(iris[,-5], by =list(품종 =iris$Species), FUN = mean)
agg.result
barplot(agg.result$Sepal.Length)

# LAB 2011캐나다 전국 선거 통계 데이터 분석
library(carData)
str(CES11)
table(CES11$abortion) # 범주형을 수치화해서 계산하기 위해 
levels(CES11$abortion)
table(CES11$abortion)/nrow(CES11) #  비율 계산 
agg <- aggregate(CES11[,'abortion'], by =list(성별 = CES11$gender), FUN =table)
agg
agg.2 <- agg[,2]
agg.2

colnames(agg[,2]) <- c('낙태찬성','낙태반대') # 열 이름 

agg.2[1,] <- agg.2[1,]/sum(agg.2[1,])
agg.2[2,] <- agg.2[2,]/sum(agg.2[2,])
agg.2
rownames(agg.2) <- agg[,1] # 행 이름 
agg.2

# LAB 칠레 대통령 선거 여론조사 데이터 분석 
help(Chile)
str(Chile)
nrow(Chile)
sum(is.na(Chile)) # 결측값 갯수
ch <- Chile[complete.cases(Chile),]
nrow(ch)

set.seed(100)
idx <- sample(nrow(ch),nrow(ch)*0.6)
ch60 <- ch[idx,]
ch60
dim(ch60)

agg <- aggregate(ch60[,'population'], by =list(지역=ch60$region), FUN=sum) 
#by =list(ch60$region)에는 팩터값만 (범주)
agg

table(ch60$vote)

no.people <- table(ch60$sex)
no.people
tmp <- subset(ch60, vote == 'Y')
tmp
agg <- aggregate(tmp[,'vote'],by=list(성별 = tmp$sex),FUN=length)
agg
yes.ratio <- agg$x/no.people
yes.ratio

no.region <- table(ch60$region)
no.region
tmp <- subset(ch60, vote =='Y')
agg <- aggregate(tmp[,'vote'], by =list(지역 = tmp$region), FUN = length)
agg
yes.ratio <- agg$x/no.region
yes.ratio
