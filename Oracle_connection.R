# Oracle 연결 
# 1. RODBC 패키지 설치 
# 한글해결 DBMSencoding = 'euc-kr' not 'utf-8'
# Rjava, rjdbc, rOracle 
install.packages("RODBC") # ROracle Open DataBase Connectity

# 2. library 연결
library(RODBC)

# 3. ODBC 데이터 원본(64비트) 설정
conn1 = odbcConnect('SCOTT_DSN', uid = 'scott', pwd = 'tiger',
                    DBMSencoding = 'euc-kr',
                    believeNRows = F,)

# 4. 연결확인
summary(conn1)


# 5. 쿼리실행
res <- sqlQuery(conn1, 'SELECT * FROM dept')
sqlQuery(conn1, 'SELECT * FROM emp')
res
str(res)
sqlQuery(conn1, 'SELECT * FROM memberTBL')

# 6. 접속끊기
odbcClose(conn1)


