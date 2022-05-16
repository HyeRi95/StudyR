# 자격증 합격 여부 판단 함수
determine <- function(score){
  total <- apply(score, 1, sum)
  scoreset <- cbind(score, total)
  result <- c()
  
  for(i in 1:nrow(scoreset)){
    if (scoreset[i,1] < 20*0.4 | 
        scoreset[i,2] < 20*0.4 |
        scoreset[i,3] < 60*0.4 ) {
      result[i] <- 'Fail'
    }else if (scoreset[i,4] >= 60){
      result[i] <- 'Pass'
    }else{
      result[i] <- 'Fail'
    }
    cat(i,'번째 응시자', result[i], '\n')
  }
  return(result) # 저장결과 리턴
}

