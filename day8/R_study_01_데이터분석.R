# 사례로 알아보는 데이터 분석

install.packages('HSAUR')
library(HSAUR)
data("Forbes2000")
ds <- Forbes2000
ds[!complete.cases(ds),] # 결측값 확인

str(ds)
View(ds)

table(ds$country)
tmp <- sort(table(ds$country), decreasing = T) # 내림차순으로 정렬 
top.10.country <- tmp[1:10] # 상위 10개국 
top.10.country
par(mar = c(8,4,4,2)) # 그래프 여백 조정 
barplot(top.10.country,
        main = '기업수 상위 10개국',
        col = rainbow(10), # 레인보우 팔레트 
        las =2)
par(mar=c(5,4,4,2))

# 업종별 기업분포 
table(ds$category)
tmp <- sort(table(ds$category), decreasing = T) # 내림차순으로 정렬 
top.10.category <- tmp[1:10] # 상위 10개국 
top.10.category
par(mar = c(10,4,4,2)) # 그래프 여백 조정 
barplot(top.10.category,
        main = '기업수 상위 10개국',
        col = 'pink',
        las =2)
par(mar=c(5,4,4,2))

# 업종별 기업 자산 분포
tmp <- ds[ds$category %in% names(top.10.category)]
tmp
str(tmp)
levels(tmp$category)
tmp$category <- factor(tmp$category)
levels(tmp$category)

par(mar = c(10,4,4,2))
boxplot(assets~category, data=tmp,
        ylim = c(0,100),
        xlab = ' ',
        las=2)
par(mar=c(5,4,4,2)) # 초기화 

# 정렬기준 marketvalue  내림차순 정렬 
tmp <- ds[order(ds$marketvalue, decreasing =T),] 
head(tmp$marketvalue)
tmp[1:10, c('name', 'country','category', 'marketvalue')]

# 한국 기업 정보
korea <- subset(ds, country =='South Korea')
# subset 부분집합으로 추출해서 korea에 저장 
korea[,c('rank','name','category','marketvalue')]

# 기업 가치와 타 변수와의 상관관계
tmp <- ds[,5:8]
tmp <- tmp[complete.cases(tmp),]
plot(tmp, lower.panel = NULL)
cor(tmp)


