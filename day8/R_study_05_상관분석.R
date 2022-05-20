# 실업자 수와 개인 소비 지출의 상관관계
economics <- as.data.frame(ggplot2::economics)
cor.test(economics$unemploy, economics$pce)

# 상관행렬 히트맵 만들기
head(mtcars)
car_cor <- cor(mtcars) # 상관행렬 생성 
round(car_cor,2)

install.packages('corrplot')
library(corrplot)
corrplot(car_cor) # 원으로 표현
corrplot(car_cor, method ='number', type = 'lower', diag =F, tl.srt=45)
#type = 'lower' 아래쪽만 나타내기 
#diag =F 대각행렬 1 제외 