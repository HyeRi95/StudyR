# 다중변수 데이터
# 데이터 확인 
cars

plot(cars$speed, cars$dist,
     main = '자동차 속도와 제동거리',
     xlab = '속도',
     ylab = '제동거리'
     )
cor(cars$speed, cars$dist) # 속도와 제동거리의 상관관계

state.x77
class(state.x77) # state.x77 데이터 종류 확인
st <- data.frame(state.x77)
head(st)
plot(st)
cor(st$Life.Exp, st$Murder)
cor(st$Illiteracy, st$Murder)
cor(st)

#LAB 경제지표 데이터 분석
str(longley)
df <- longley[,c('GNP','Unemployed', 'Armed.Forces','Population','Employed')]
plot(df)
cor(df)
cor(df$GNP, df$Population)

# RDate로 데이터셋 불러오기
load('./result_sales_dt.RData') # load
save(result_sales_dt, file = './result_dt.RData') # RData 저장 
table(result_sales_dt$region)

# 실전분석
install.packages('Ecdat')
library(Ecdat)
str(Hdma)
tbl <- table(Hdma$deny)
tbl
tbl2 <- tbl/sum(tbl) # 비율계산
tbl2
names(tbl) <- c('승인','거절')
tbl
names(tbl2) <- c('승인','거절')
tbl2
barplot(tbl2, main = '주택담보대출 승인/거절', col = c('green','red'), 
        ylim=c(0,1),las=1, ylab='비율')


barplot(tbl, main = '주택담보대출 승인/거절 건수', col = c('green','red'), 
        ylim=c(0,2500),las=1, ylab='건수')

# 주택가격대비 대출금 비율 분포 히스토그램 
hist(Hdma$lvr, main = '주택가격 대비 대출금 비율', col = rainbow(10),
     ylim = c(0, 1200))

# dir  수입대비 보증금비율, hir 수입대비 주택 유지 비용 비율 
# ccs 고객 신용 등급, mcs 대출 신용등급 사이의 상관관계
df <- Hdma[,c('dir','hir','ccs','mcs')]
df
point.color <- c('green','red')
plot(df, col = point.color[Hdma$deny])
cor(df)
