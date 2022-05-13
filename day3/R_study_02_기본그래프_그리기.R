# 기본그래프
# 막대그래프 = Bar chart
favorite.season <-c('WINTER','SUMMER','SPRING','SUMMER', 'SUMMER','FALL',
                    'FALL','SUMMER','SPRING','SPRING')
favorite.season
ds <- table(favorite.season) # 도수분포표
ds
barplot(ds, main = '좋아하는 계절') # 타이틀 삽입하여 막대그래프 그리기 
barplot(ds, main = '좋아하는 계절', col = '') # 색 선택 
barplot(ds, main = '좋아하는 계절', col = c('bisque','pink','skyblue','greenyellow'))
colors()
barplot(ds, main = '좋아하는 계절', col = rainbow(4), 
        xlab = '계절', ylab = '빈도수', horiz = F,
        names = c('가을', '봄', '여름', '겨울'), las=2) # las 0~3 까지 
