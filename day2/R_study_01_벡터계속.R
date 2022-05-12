d = c(1,2,3,4,5)
d
d[1:3]
d[c(1,3,5)]
d[seq(1,5,2)]
d[-2]   # 파이썬과 상이, -는 해당 인덱스 제외 후 출력
d[-seq(1,5,2)]

e=1:10
e
e=10:1
e
e[seq(1,5,2)]
e[seq(10,5,-2)]

#1~4월까지 1분기 매출액
sales=c(640,720,680,540)
names(sales)<-c('M1','M2','M3','M4')
names(sales)
sales
sales[1]
sales['M2']
sales[c('M1','M4')]
sales['m3']  # R은 대소문자 구분, NA처리리


# 벡터의 원소값 변경
v1 <- c(1,5,7,8,9)
v1
v1[2]<- 4
v[1]
v1[c(1,5)]<-c(100,200)


# 적금 만기 금액 계산
# (LAB)만기 금액 = 원금 × (1+ 연이율/100) ^기간
customer=c('kim','lee','park','choi','seo')
deposit=c(5000000,4500000,4000000,5500000,6000000)
rate=c(3.5, 3, 4, 5, 4.5)
period=c(2, 2, 5, 7, 4)

names(deposit)<-customer
names(rate)<-customer
names(period)<-customer
deposit
rate
period



# kim의 만기 금액
kim_total<-deposit['kim']*(1+rate['kim']/100)^period['kim']
kim_total

# lee의 만기 금액
lee_total<-deposit['lee']*(1+rate['lee']/100)^period['lee']
lee_total

# who에 사람 입력
who <- ''
total<-deposit['who']*(1+rate['who']/100)^period['who']
total

# 벡터 산술연산 (간단방법)
result=deposit*(1+rate/100)^period
result