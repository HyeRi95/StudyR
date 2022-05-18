# 메모리 문제 R studio 가 느려질때 해결 
# R에 있는 파일을 싹다 지우는 
rm(list = ls())
gc() # garbage colooection 

# Tools > Global Options
# General > Restore previously open source doc at startup 체크해제
# 확인후 사용 
