# 고급그래프
# treemap
install.packages('treemap')

library(treemap)

data(GNI2014)
str(GNI2014)
head(GNI2014)
treemap(GNI2014, index = c('continent', 'iso3'), 
        vSize = 'population',
        vColor = 'GNI', title = '대륙간 인구수',
        type ='value', na.rm = T ) # bg.labels='yellow' 실행불가 

# LAB 미국 주요도시 통계 데이터 분석
library(treemap)
library(carData)
head(Ericksen)
str(Ericksen)
Ericksen
ds <- subset(Ericksen, city == 'state')
ds$stname <- rownames(ds)
treemap(ds, index = c('stname'),vSize = 'poverty', 
        vColor = 'crime',type = 'value', title = '미국 막장도시 찾기')

# 레이더 차트
install.packages('fmsb')
library(fmsb)
score <- c(80, 60, 95, 85, 40)
max.score <- rep(100,5)
min.score <- rep(0,5)
ds <- rbind(max.score, min.score, score)
ds
class(ds)
ds <- data.frame(ds) # 데이터프레임으로 변환
ds
colnames(ds) <- c('국어', '영어', '수학', '물리','음악')
ds
radarchart(ds)

# 매개변수(옵션)
# R 언어에서는 RGB(RR,GG,BB,AA) 순서 
radarchart(ds, 
           pcol='darkgreen',           # 다각형선의 색
           pfcol=rgb(0.0, 0.4, 0.2, 0.3), # 다각형 내부 색 
           # pfcol=rgb(red, green, blue, alpha) alpha: 투명도 
           plwd=2,                     # 다각형 선의 두께
           cglcol='grey',              # 거미줄의 색
           cglty=1,                    # 거미줄의 타입
           cglwd=1.2,                  # 거미줄의 두께
           axistype=1,                 # 축의 레이블 타입
           seg=4,                      # 축의 눈금 분할
           axislabcol='darkgrey',      # 축의 레이블 색
           caxislabels=seq(0,100,25)   # 축의 레이블 값 % 없애기 
           )

# LAB 종교 조사 데이터 
library(carData)
head(WVS)
str(WVS)
pop <- table(WVS$country)
pop
tmp <- subset(WVS, religion == 'yes')
length(tmp$religion) # 응답한사람
rel <- table(tmp$country) # 
pop
rel

stat <- rel/pop
stat
max.score <- rep (1,4)
min.score <- rep (0,4)
ds <- rbind(max.score, min.score, stat)
ds
ds <- data.frame(ds)
ds

colors()

radarchart(ds,
           pcol = 'red4',
           pfcol = '#7f33337f',
           plwd =3,
           cglcol = 'grey',
           cglty = 1,
           cglwd = 0.1,
           axistype = 1,
           axislabcol='black', # 축의 레이블 색
           seg =3,
           caxislabels = seq(0,1,0.3),
           
           title = '국가별 종교인 비율'
           )

# ggplot 
library(ggplot2)

month <- c(1, 2, 3, 4, 5, 6)
rain <- c(55, 50 ,45 ,50 ,60 ,70)
df <- data.frame(month, rain)
df

ggplot(df,aes(x=month, y=rain))+
       geom_bar(stat='identity', width = 0.7, fill = 'skyblue')

# 가로 막대그래프 
ggplot(df,aes(x=month, y=rain))+
  geom_bar(stat='identity', width = 0.7, fill = 'skyblue')+
  ggtitle('월별 강수량(1~6월)')+
  labs(x='월', y = '강수량') +
  coord_flip()+ # 가로로 만들기
  theme(plot.title =
          element_text(size = 20, 
                       face='italic',
                       color = 'darkblue',
                       hjust = 0.5)) # 중앙정렬 

# ggplot 에서 히스토그램 그리기
ggplot(data = iris, aes(x=Petal.Length))+
  geom_histogram(binwidth = 0.5, # 히스토그램 막대 간격 0.5
                 ) 
ggplot(data = iris, aes(x=Sepal.Width, fill = Species))+
  geom_histogram()+ 
  #geom_histogram() position = 'dodge')  : 품종별로 따로따로 그려진다 
  ggtitle ('붓꽃 품종별 꽃받침넓이 히스토그램')+
  theme(legend.position = 'bottom')+
  theme(plot.title = element_text(hjust =0.5))

# ggplot 에서 산점도 그리기 
library(ggplot2)
ggplot(data = iris, aes(x=Petal.Length, y = Petal.Width, 
                        color = Species))+
  geom_point()+
  ggtitle('붓꽃 품종별 꽃잎 산점도')+
  theme(plot.title =
          element_text(size = 16, 
                       face='bold',
                       color = 'darkblue',
                       hjust = 0.5)) # 중앙정렬 

# ggplot 에서 선그래프 그리기
library(ggplot2)
year <- 1937:1960
cnt <- as.vector(airmiles)
df <- data.frame(year, cnt)
df
ggplot(data=df , aes(x=year, y =cnt))+
  geom_line(linetype = 1)+
  geom_line(size=1)+
  geom_line(col='yellowgreen')

# LAB Air quailty
df <- aggregate(airquality[,'Temp'], by=list(month=airquality$Month), FUN = mean)
class(df)
colnames<- c('month', 'temp')
df
ggplot (data = df , aes(x=month, y=x))+
    geom_bar(stat = 'identity',width=0.9 ,
         fill = 'darkgreen')+
    ggtitle('5개월 평균기온(화씨)')

# 산점도 
df <- airquality[complete.cases(airquality),]
str(df)
ggplot(data =df, aes(x=Temp, y=Ozone, color='orange'))+
  geom_point(size=2)
cor(df$Temp, df$Ozone) # 상관관계

# 선그래프 
df.7 <- subset(df, Month ==7)
df.7
ggplot(data = df.7, aes(x=Day, y = Ozone))+
  geom_line(color='red', linetype = 'dashed' )+
  geom_point(col = 'orange', size =3)+
  ggtitle('일별 오존지수')+
  theme(plot.title = 
          element_text(size=16,
                       face ='bold',
                       color ='darkred',
                       hjust =0.5))+
  labs(x = '일' , y = '오존지수')

# 실전분석 
str(UN98)
help(UN98)
df <- UN98[,c('region','tfr')]
df <- df[complete.cases(df),] # 결측값 제거 
str(df)
df <- aggregate(df[,'tfr'], by =list(region = df$region), FUN =mean)
df
ggplot(data=df, aes(x=region, y =x))+
  geom_bar(stat = 'identity', width = 0.8,
           col='#333333',
           fill =rainbow(5))+
  ggtitle('대륙간 평균 여성출산률')+
  theme(plot.title = 
        element_text(size=14,
                     face ='bold',
                     color ='darkred',
                     hjust =0.5))+
  labs(x = '대륙', y = '평균출산률')


## treemap
df.tm <- UN98[,c('region', 'lifeFemale','illiteracyFemale')]
df.tm
df.tm <-df.tm[complete.cases(df.tm),] # 결측값 제거
df.tm$country <- rownames(df.tm)

treemap(df.tm, index = c('region','country'), vSize ='lifeFemale', 
        vColor = 'illiteracyFemale', type = 'value')

# 산점도 작성 
df.edu <- UN98[,c('region','educationMale','educationFemale')]
df.edu <- df.edu[complete.cases(df.edu),]
ggplot(data = df.edu, aes(x = educationMale, y = educationFemale, 
       color=region))+
  geom_point(size=2.2)+
  ggtitle('대륙별 남녀 교육 수준')+
  theme(plot.title = 
        element_text(size=15,
                     face ='bold',
                     color ='steelblue',
                     hjust =0.5))+
  labs(x = '교육수준(남성)', y = '교육수준(여성)')

cor(df.edu$educationMale, df.edu$educationFemale) # 상관관계 


plot(UN98) # 전체적으로 상관관계 파악 