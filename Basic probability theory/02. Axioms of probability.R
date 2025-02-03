# 확률의 공리

# 1. 몬테칼로 시뮬레이션


# 2. 몬테칼로 시뮬레이션으로 보는 동전 던지기 문제
# 1을 동전의 앞면, 0을 동전의 뒷면이라고 했을 때 동전의 앞면이 나올 P(Heads)를 구해보자.
n <- 10000 # 표본 추출
simlist <- numeric(n) # 초기 벡터
for (i in 1:n) {
  trial <- sample(0:1, 3, replace=TRUE)
  success <- if (sum(trial)==3) 1 else 0
  simlist[i] <- success }
mean(simlist) 


# 3. 생일 문제
# 방 안에 𝑛명이 있을 때 그들 모두 생일이 다른 날일 확률은 얼마인가? 이 확률이 1/2보다 작으려면 𝑛이 얼마나 커야 하는가?
b <- sample(1:365,23,replace=TRUE)
tabulate(b) # 테이블로 확인
r <- replicate(10^4, max(tabulate(sample(1:365,23,replace=TRUE))))
sum(r>=2)/10^4
# 10000번 반복했을 때의 결과가 50% 근처에서 형성됨을 확인할 수 있다.

# 그리고 R에서는 생일문제를 위한 pbirthday(), qbirthday() 함수를 제공하고 있다.
# pbirthday(n): n명 중에서 적어도 한 쌍 이상 같은 생일을 가질 확률
# qbirthday(p): 적어도 한 쌍 이상 같은 생일을 가질 확률이 p이기 위해 필요한 사람 수
pbirthday(23)
qbirthday(0.5)












