# 펙터와 리스트
bt <- c('A','B','B','O','AB','A')
bt
bt.new <- factor(bt) 
bt.new # 반복 삭제 ( 집합 )
bt[5]
bt.new[5] # 원래 bt 리스트의 5번째 값과 Levels 값이 같이 나온다  
bt.new[1]
bt.new[7]
levels(bt.new)
as.integer(bt.new)

levels(bt.new)[4]
bt.new[7] <- 'B'
bt.new[8] <- 'c' # level에 없는 값이라 NA 값이 들어간다 
bt.new[8]
bt.new[9]# 값이 없으므로 NA 
bt.new

as.integer(bt.new)# 펙터의 문자값을 숫자로 바꾸어 출력 

# 리스트 (파이썬의 dictionary)
h.list <- c('bowling', 'tennis','ski')
person <- list(name = 'Tom', age = 25, student = T, hobby = h.list)
person
person[[1]]
person['name']
person$name
person$age
person$student
person$hobby[1]
person$hobby[2]
person$hobby[3]
person[[4]]
person[[4]][2] # 리스트의 4번째 값중 2번째 값 출력 

# 리스트 이용해서 R 카페 매출 분석 2 
cafe <- list(espresso = c(4, 5, 3, 6, 5, 4, 7), 
             americano = c(63, 68, 64, 68, 72, 89, 94),
             latte = c(61, 70, 59, 71, 71, 92, 88),
             price = c(2000, 2500, 3000),
             menu = c('espresso','americano','latte'))
cafe

cafe$menu <- factor(cafe$menu)
cafe$menu
names(cafe$price) <- cafe$menu
cafe$price

sale.espresso <- cafe$espresso*cafe$price[1] # 아래와 같은값
sale.espresso <- cafe$espresso*cafe$price['espresso']
sale.espresso

sale.americano <- cafe$americano*cafe$price['americano']
sale.americano

sale.latte <- cafe$latte*cafe$price['latte']
sale.latte

sale.day <- sale.espresso + sale.americano + sale.latte
sale.day
sale.total <- sum(sale.day)
sale.total
sale.mean.new <- mean(sale.day)
sale.mean.new
names(sale.day) <- c('Mon','Tue','Wed','Thu','Fri','Sat','Sun')
sale.day
sale.day[sale.day >= sale.mean.new] # 요일과 총액 출력 
names(sale.day[sale.day >= sale.mean.new]) # 요일만 출력 

# 월별 감전사고 통계
accident <- c(31, 26, 42, 47, 50, 54, 70, 66, 43, 32, 32, 22)
mon <- 1:12
mon.name <- paste('M',mon, sep='') # paste 
mon.name
names(accident) <- mon.name
accident

sum(accident)
max(accident)
min(accident)

# 사고율이 10% 감소시 사고수 예측 
accident*0.9

accident[accident>=50] # 월과 사고건수 같이 출력 
names(accident[accident>=50]) # 월만 출력
mean(accident)
accident[accident>=mean(accident)]
accident[accident>=accident[6]] # 6월보다 사고가 같거나 많은 달 구하기 


