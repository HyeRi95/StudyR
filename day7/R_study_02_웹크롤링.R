# 웹크롤링

# 1. rvest 패키지 설치 
install.packages('rvest')
library(rvest)
library(stringr)

# 2. 보배드림 URL 검색 -> URL 가져오기 
url <- 'https://www.bobaedream.co.kr/cyber/CyberCar.php?gubun=K&page=1&order=S11&view_size=70'
usedcar <- read_html(url)

# 3. HTML .mode-cell.title 안에있는 차 정보 확인 
carInfos <- html_nodes(usedcar, css='.mode-cell.title')
carInfos

# 4. 'tit ellipsis'의 내용을 가져온다 
carTitles <- carInfos %>% html_nodes('.tit.ellipsis') %>% html_text()
carTitles

# 5. 불필요한 요소 제거 
carTitles <- gsub('  ','', carTitles)
carTitles
carTitles <- gsub('\r\n\t','',carTitles)
carTitles # 차 이름 가져오기 완료!

# 6. 연식 가져오기
carYears <- html_nodes(usedcar, css='.mode-cell.year')
carYears

# 7. css text에 있는 정보 가져오기
carYears <- carYears%>% html_nodes('.text')%>%html_text()
carYears

# 8. 불필요한 요소 제거
carYears <- carYears[2:length(carYears)]
carYears

# 9. 연료 정보 가져요기
carFuels <- html_nodes(usedcar, css='.mode-cell.fuel')
carFuels

# 10. css text에 있는 정보 가져오기
carFuels <- carFuels%>% html_nodes('.text')%>%html_text()
carFuels

# 11. 불필요한 요소 제거(연료)
carFuels <- carFuels[2:length(carFuels)]
carFuels <- factor(carFuels)
carFuels

# 정제 개수 20개만 추출해서 할때 사용한 정제코드 차이름 길어서 줄이기 
#carTitles[14] <- '현대 그랜드스타렉스 어린이보호차'
#carTitles[16] <- '현대 그랜저IG 하이브리드 2.4'
#carTitles[8] <- '현대 더 뉴 그랜드스타렉스 2.5 디젤'
# 12 합치기
carUsed<-data.frame(carTitles, carYears, carFuels)

# 13. 차트
ds <- table(carUsed$carFuels)
ds <- data.frame(ds)
ggplot(data =ds,aes(x =Var1, y =Freq,fill=Var1))+
geom_bar(stat = 'identity')+
  ggtitle('보배드림 1페이지 국산차 연료별')+
  theme(plot.title = 
        element_text(size=15,
                     face ='bold',
                     color ='steelblue',
                     hjust =0.5))+
  labs(x = '연료별', y = '차량수')

