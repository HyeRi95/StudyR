# 변수 
total <- 5050
total
print(total)
# , 로 값을 여러개 출력
cat('합계는', total)
# print로는 여러개 출력 불가 
print('합계는', total)

변수 <-100
변수 # 출력 X : 한글 변수명은 되도록 사용 금지 
print(변수)# 출력 가능 

a <- 10
b <- 20
c <- a+b

print(a)
print(b)
print(c)
cat(a,'+',b,'=',c)

a<-50 # 한줄씩 실행하므로 c <- a+b 실행 후 print(c) 해줘야 값 바뀐다 

# R에서 변수명에 . _ 사용가능 (파이썬에서는 _ 만 사용가능)
avg
.total <- 20202
.total

num <- 80
mid <- 10
mid.sum <- mid*num
mid.sum 

10/0 # Inf
-10/0# -Inf
sqrt(-2) # NaN : 수학적으로 정의 불가능 
val <- NULL
val

# 숫자형 변수
age.1<-20
age.2<-25
print(age.1 + age.2)
name.1<-'John'
print(name.1+3) # 문자랑 숫자 결합하는 연산자는 존재 X  error
print(name.1*3) # error

# 논리형 대문자 T, F 
5>3
2>7
a<- TRUE
a
b <- F # 대문자 T , F 변수명으로 사용 불가 
b

a<-NA
a

# 소금물의 농도
# 변수 salt 소금약
# 변수 water 물의양
# 변수 result 농도값
# 결과를 "소금 = *mg, 물 = *ml: 농도 = **%"
salt <- 10 # mg
water <- 100 # ml
result <- (salt/(salt+water))*100
cat('소금 =',salt,'mg, 물 =', water, 'ml : 농도 =', result, '%')

`df # >  console 창에 + 나오면 esc로 종료하고 진행한다 


