# 공공데이터 분석
getwd()
install.packages('data.table')
install.packages('dplyr')
install.packages('lubridate')
install.packages('stringr')
install.packages('forecast')
install.packages('randtests')
library(data.table)
library(dplyr)
library(ggplot2)
library(lubridate)
library(stringr)
library(forecast)
library(randtests)

# R 데이터 불러오기
load(file = './result_sales_dt.RData')

glimpse(result_sales_dt, width =60)
str(result_sales_dt)
unique(result_sales_dt)    

# 분기별 아파트 매매건수 
qrt_cnts <- result_sales_dt[,.N,yyyyqrt] # 쿼터별 매매량 계산 
qrt_cnts <- result_sales_dt[yyyyqrt != '2015Q2', .N, yyyyqrt] # 2015Q2 값 제거  
ggplot(qrt_cnts, aes(x=yyyyqrt, y=N, group=1))+
  geom_line()+xlab('년도분기')+ ylab('매매건수')+
  theme(axis.text = element_text(angle=90))+
  stat_smooth(method='lm')

# 분기별/지역별 매매추이
# yyyyqrt, region 그룹으로 나눈다
region_cnts <- result_sales_dt[yyyyqrt !='2015Q2', .N, .(yyyyqrt, region)]
head(region_cnts)

#facet_wrap : 변수의 level별로 sub그래프를 각기 다른 패널에 그려주는 역할
ggplot(region_cnts, aes(yyyyqrt, N, group=region))+
# facet_wrap(~region, scale = 'free_y', ncol=3)
  # region 순서대로 왼쪽 -> 오른쪽으로 sub 그래프 그리는 함수 
geom_line()+facet_wrap(~region, scale = 'free_y', ncol=3)+
stat_smooth(method ='lm')+
theme(axis.text.x =element_blank())


# 시계열의 랜덤성 검정
# 월별 지역별 매매량 
region_cnts<- result_sales_dt[,.N,.(yyyymm,region)]
regions <- unique(region_cnts$region)
regions
#각지역별로 매매량의 랜덤성 검정결과를 runs_p 변수에 추가 
runs_p <- c()
for(reg in regions){
  runs_p <- c(runs_p,runs.test(region_cnts[region %chin% reg,N])$p.value)  
} # for 문 돌아가면서 p.value가 생성되고 값이 runs_p에 저장된다 
ggplot(data.table(region,runs_p), aes(x=regions, y=runs_p, group=1))+
  geom_line()+
  geom_point()+
  ylab('P-value')+xlab('지역')

# 시계열 분할 (부산지역)
busan_cnts <- result_sales_dt[yyyymm != '201504'& region %in%'부산',.N,.(yyyymm)]
tot_ts <- ts(busan_cnts$N, start = c(2006,1), frequency =12)
plot(stl(tot_ts, s.window ='periodic'), col = 'steelblue')

arima_mdl <- auto.arima(tot_ts)
tsdiag(arima_mdl)
plot(forecast(arima_mdl,h=8)) # h=8 8번 예측 
