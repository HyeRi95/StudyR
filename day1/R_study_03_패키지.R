#패키지 설치 및 로드
'Hello World!' # 문자열 '', "" 둘다 가능 
"Hello World!"
install.packages('ggplot2') #  설치할때는 문자열 
library(ggplot2)# 패키지 호출 
library(g.data)

ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) + geom_point() # 사용

# cowsay 패키지
install.packages('cowsay')
library(cowsay)
say(what= 'Hi~', by='rabbit', by_color = 'blue', what_color ='green')

# 시스템 함수 
Sys.Date() # 현재 날짜
Sys.time() # 현재 시간 

#생일 맞추기 퀴즈  ==? ((month*4)+9)*25 + day
# 소윤 주연 민철 석준 현석
# 931  754  1029 1139 1442
#(m * 100) + 225 + d 
# 소윤이 생일 
val = 931
d <-(val -225)%%100
m <-((val -225)-(val -225)%%100)/100
cat(m,'월',d,'일')
