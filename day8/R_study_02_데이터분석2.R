# 데이터 분석 2
setwd('C:/STUDY/StudyR/day8')
getwd()
files <- c('ds.2015.csv','ds.2016.csv','ds.2017.csv',
           'ds.2018.csv','ds.2019.csv')
ds <- NULL
for(f in files){
  tmp <- read.csv(f,header=T)
  ds <- rbind(ds, tmp)
  print(f)
}
str(ds)
unique(ds$mdate)
range(ds$mdate) # 범위 

# 열별 결측값 확인
for (i  in 3:8){
  cat(names(ds)[i], sum(is.na(ds[,i])), 
      sum(is.na(ds[,i]))/nrow(ds),'\n')
}
ds <- ds[,-8] # 데이터 전처리 8열에 결측값이 많으므로 8열은 삭제  
ds <- ds[complete.cases(ds),] # 결측값 제거 

# 그룹정보 추가
# 문자열로 
mdate <- as.character(ds$mdate) # 문자열로 변환시켜줘야  substr 함수 사용가능 
head(mdate)

#substr : 문자열의 일부를 추출하는 함수
#첫번째 인수에 문자열을 넣고 두번째와 세번째 인수로 
#해당 문자열 중 추출하고 싶은곳의 시작위치와 끝 위치를 지정
ds$year <- as.numeric(substr(mdate, 1,4)) # 연도 4자리 가져오기
ds$month <- as.numeric(substr(mdate, 5,6))
ds$hour <- as.numeric(substr(mdate, 9,10))


# loc의 코드 확인 
unique(ds$loc)
#loc의 코드에 해당하는 지역이름을 새로운 열을 생성하여 대입 
ds$locname <-NA # 새로운열 생성 
ds$locname [ds$loc ==111123] <- '서울'
ds$locname [ds$loc ==336111] <- '목포'
ds$locname [ds$loc ==632132] <- '강릉'

head(ds)

# 지역별 PM10 농도 분포
color3 <- c('pink','skyblue','ivory')
boxplot(PM10~locname, data=ds,
        main ='미세먼지 농도 분포',
        ylime =c(1,100),col=color3)

# 연도별, 지역별 PM10 농도 추이
library(ggplot2)

tmp.year <- aggregate(ds[,7], 
                      by= list (year = ds$year, loc = ds$locname),
                      FUN ='mean')
tmp.year$loc = as.factor(tmp.year$loc) # factor : 범주형 데이터 변환 
head(tmp.year)

#x=year, y=x : 그래프의 x 축은 연도 y축은 tmp.year 데이터에서 x열의 값 
ggplot(tmp.year, aes(x=year, y=x, color = loc, group =loc))+ 
  geom_line()+
  geom_point(size=6, shape=19, alpha=0.5)+
  ggtitle('연도별 PM10 농도 변화')+
  ylab('농도')

# 월별 지역별 PM10 농도 추이
tmp.month <- aggregate(ds[,7], # 7번째 열 pm10의 값을 month로 
                      by= list (month = ds$month, loc = ds$locname),
                      FUN ='mean')
tmp.month$loc = as.factor(tmp.month$loc) # factor : 범주형 데이터 변환 
head(tmp.month)

#x=year, y=x : 그래프의 x 축은 연도 y축은 tmp.year 데이터에서 x열의 값 

ggplot(tmp.month, aes(x=month, y=x, color = loc, group =loc))+ 
  geom_line()+
  geom_point(size=6, shape=19, alpha=0.5)+
  ggtitle('연도별 PM10 농도 변화')+
  ylab('농도')

View(ds)

# 시간대별 지역별 PM10 농도 추이
tmp.hour <- aggregate(ds[,7], # 7번째 열 pm10의 값을 hour로 
                       by= list (hour = ds$hour, loc = ds$locname),
                       FUN ='mean')
tmp.hour$loc = as.factor(tmp.hour$loc) # factor : 범주형 데이터 변환 
head(tmp.hour)

#x=year, y=x : 그래프의 x 축은 연도 y축은 tmp.year 데이터에서 x열의 값 

ggplot(tmp.hour, aes(x=hour, y=x, color = loc, group =loc))+ 
  geom_line()+
  geom_point(size=4, shape=19, alpha=0.5)+
  ggtitle('연도별 PM10 농도 변화')+
  ylab('농도')

# 오염물질 농도간의 상관관계
set.seed(1234)
plot(ds[sample(nrow(ds),5000), 3:7], lower.panel =NULL) # 5000개의 샘플을 뽑아서 plot 
cor(ds[,3:7])

# 미세먼지 최고점과 최저점 확인 
tmp.yml <- aggregate(ds[,7],
                     by =list(year = ds$year, month =ds$month, 
                              loc=ds$locname), FUN ='mean')

# 가장미세먼지가 많았던 달
idx <- which(tmp.yml$x==max(tmp.yml$x))
tmp.yml[idx,]

#가장 미세먼지가 적었던 달 
idx <- which(tmp.yml$x==min(tmp.yml$x))
tmp.yml[idx,]
