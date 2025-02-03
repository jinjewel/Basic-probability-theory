# 조건부 확률과 독립

# 주사위 던지기
# 두 개의 주사위를 던져 합이 7이었을 때, 첫 번째 주사위의 눈이 2이었을 확률은?
n <- 10000
ctr <- 0
simlist <- numeric(n)
while (ctr < n) {
  trial <- sample(1:6,2,replace=TRUE)
  if (sum(trial) == 7) { # Check if sum is 7
    success <- if (trial[1] == 2) 1 else 0
    ctr <- ctr + 1
    simlist[ctr] <- success
  }
}
mean(simlist)


# 2. 몬티 홀 시뮬레이션
# 세 개의 문 중에 하나를 선택하여 문 뒤에 있는 선물을 가질 수 있는 게임쇼에 참가했다. 
# 한 문 뒤에는 자동차가 있고, 나머지 두 문 뒤에는 염소가 있다. 
# 이때 어떤 사람이 예를 들어 1번 문을 선택했을 때, 
# 게임쇼 진행자는 3번 문을 열어 문뒤에 염소가 있음을 보여주면서 1번 대신 2번을 선택하겠냐고 물었다. 
# 참가자가 자동차를 가지려할 때 원래 선택했던 번호를 바꾸는 것이 유리할까?
n <- 10^5
cardoor <- sample(3,n,replace=TRUE)
sum(cardoor==1)/n
monty <- function() {
  doors <- 1:3
  # 차가 있는 곳을 무작위로 선택하세요
  cardoor <- sample(doors,1)
  # 프롬프트 플레이어
  print("Monty Hall says ‘Pick a door, any door!’")
  # 플레이어가 선택한 문을 받습니다(1, 2 또는 3이어야 함)
  chosen <- scan(what = integer(), nlines = 1, quiet = TRUE)
  # Monty의 문을 고르세요(플레이어의 문이나 자동차 문은 불가)
  if (chosen != cardoor) {
    montydoor <- doors[-c(chosen, cardoor)]
  }else {
    montydoor <- sample(doors[-chosen],1)
  }
  # 플레이어가 문을 바꾸고 싶어하는지 알아보세요
  print(paste("Monty opens door ", montydoor, "!", sep=""))
  print("Would you like to switch (y/n)?")
  reply <- scan(what = character(), nlines = 1, quiet = TRUE)
  # 플레이어가 "y"로 시작하면 "예"로 쓴 것을 해석합니다.
  if (substr(reply,1,1) == "y") chosen <- doors[-c(chosen,montydoor)]
  # 게임 결과를 발표하세요
  if (chosen == cardoor) print("You won!")
  else print("You lost!")
}
