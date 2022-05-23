# 기본 그래프
favorite.season <- c('WINTER','SUMMER','SPRING','SUMMER','SUMMER','FALL','FALL',
'SUMMER','SPRING','SPRING','SUMMER','SUMMER')

favorite.season
f.season <- table(favorite.season)
str(f.season)
f.season
colors()

barplot(f.season, main = '좋아하는 계절', col = rainbow(4), xlab ='계절', ylab = '빈도수',
        horiz = F , names = c('가을', '봄', '여름', '겨울'), las =2)

# 중첩 막대그래프
# 데이터 입력 
age.A <- c(13709, 10974, 7979, 5000, 4250)
age.B <- c(17540, 29701, 36209, 33947, 24487)
age.C <- c(991, 2195, 5366, 12980,19007)
ds <- rbind(age.A, age.B, age.C)
str(ds)
ds
colnames(ds) <- c('1970','1990','2010','2030','2050')
ds

par(mfrow = c(1,1), mar =c(3,3,3,7)) # 아래, 왼쪽, 위 , 오른쪽 여백 설정 
barplot(ds, main ='인구수 추정', col = rainbow(3), xlab ='연도', ylab = '인구수', horiz=F, 
        beside = F, legend.text = c('0~14세','15~64세','65세이상'), # beside = T 그래프 분리해서 출력 , legend.text = T 범례 표시 
        args.legend = list(x='topright', bty ='y',inset=c(-0.3,0))) 
#bty ='n' 배경색 유무 , inset=c(-0.26,0) 범례 위치 미세조절 

# LAB 사업부문별 매출액 그래프 그리기
ha <- c(54659, 61028, 53307, 46161, 54180)
he <- c(31215, 29863, 32098, 39684,29707)
mc <- c(15104, 16133, 15222,13208, 9986)
vs <- c(13470, 14231, 13401, 13552, 13193)
bs <- c(16513, 14947 ,15112, 14392, 17091)
ds <- rbind(ha,he,mc,vs,bs)
ds
colnames(ds) <- c('19.1Q', '19.2Q','19.3Q','19.4Q','20.1Q')
ds        
par(mfrow = c(1,1), mar =c(4.5,3.5,2.5,3))
barplot(ds, main = '사업부문별 매출액(분기)', col = rainbow(5),
        horiz=T, las=1, xlab = '억원', beside = T,
        legend.text = c('H&A', 'HE','MC','VS','BS'),
        args.legend = list(x='topright', bty ='n',inset=c(-0.09,0)))


# 히스토그램 연속적인 값 그래프 그릴때 
par(mfrow = c(1,1), mar =c(4,4,4,3))
cars
dist<-cars[,2]
dist
# 자동으로 범위 설정되어서 히스토그램 출력 
hist(dist, main='제동거리', xlab = '제동거리', ylab = '빈도수', 
     border = 'blue', col = 'skyblue', las = 1, breaks = 6) # breaks = 12 범위 쪼개서 그리기

# LAB 다이아몬드 시세 
install.packages("Stat2Data")
library(Stat2Data)
data(Diamonds)
ds <- Diamonds$PricePerCt
hist(ds, main = '다이아몬드 시세 (캐럿당)', breaks = 9, 
     xlab = '캐럿당 가격($)', ylab = '빈도수', las =1)

color <- rep('skyblue',9)
color[3] <- '#1d3577'

hist(ds, main = '다이아몬드 시세 (캐럿당)', breaks = 9,
     col = color, border ='#457B9D', # border = 막대 테두리색
     xlab = '캐럿당 가격($)', ylab = '빈도수', las =1 )
