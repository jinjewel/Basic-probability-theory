# R의 기본함수
x <- c(1,3,2,5)
x

y <- c(1,4,5,2)
y

x+y
x*y
x%*%y # 내적
f <- outer(x, y,function(x,y) cos(y)/(1+x^2)) # 외적
f

length(x)
length(y)

z_1 <- seq(1,10); z_1
z_2 <- 1:10; z_2
z_3 <- seq(-pi, pi, length=50); z_3
z_4 <- seq(1, 100, by=3); z_4

ls() # 모든 오브젝트(데이터, 함수 등)의 이름을 보여준다
rm(x, y) # 오브젝트를 지울 때 쓰는 함수
ls() # 모든 오브젝트를 지울 때 쓰는 함수


# R의 행렬 작성
x <- matrix(data=c(1,2,3,4), nrow=2, ncol=2)
x

matrix(c(1,2,3,4),2,2,byrow=TRUE)

sqrt(x)

x^2


# 무작위 자료의 생성
a <- rnorm(50) #자료의 갯수가 50개
b <- x + rnorm(50, mean = 50, sd = .1) #평균이 50이고 표준편차가 1인 정규분포를 따르는 무작위자료 50개 + x

cov(x,x) # 공분산 함수
cor(x,y) # 상관관계 함수

set.seed(1303) # 무작위 추출시 결과값이 달라지는 것을 막기 위해 시드를 고정
rnorm(50)


# R 그래픽스
x <- rnorm(100) 
y <- rnorm(100) 

plot(x,y)

plot(x,y, xlab="x-axis", ylab="y-axis", main="Title")

plot(x,y, col="green")

x <- seq(-pi, pi, length=50) 
y <- x
f <- outer(x, y, function(x, y) cos(y)/(1+x^2)) 
contour(x, y, f)
contour(x, y, f, nlevels=45, add=T) # nlevels: 등고선 레벨 지정

fa=(f-t(f)) / 2 
contour(x, y, fa, nlevels=15)

image(x, y, fa)

persp(x, y, fa) # 3차원 버전

persp(x, y, fa, theta=30, phi=20)


# 자료의 인덱싱
A <- matrix(1:16, 4,4) 
A

A[2,3]
A[c(1,3),c(2,4)]
A[1:3,2:4]
A[1:2, ]
A[ , 1:2]
A[1, ]
A[-c(1,3),]

dim(A)


# 자료 불러오기
OS <- .Platform$OS.type

if(OS == "unix"){
  #Mac
  setwd("~/Dropbox/Data/Books/An Introduction to Statistical Learning")
}else if(OS == "windows"){
  #Windows
  setwd("D:\\Dropbox\\Data\\Books\\An Introduction to Statistical Learning")
}

Auto <- read.table("Auto.data") 
head(Auto)
dim(Auto)

Auto[1:4,]

Auto <- read.table("Auto.data", header=T, na.strings="?") 
head(Auto)
dim(Auto)

Auto[1:4,]
Auto <- na.omit(Auto) 
dim(Auto)
names(Auto)


# Auto 자료를 이용한 그래프 및 자료 요약
plot(cylinders, mpg)

plot(Auto$cylinders, Auto$mpg)

attach(Auto) 
plot(cylinders , mpg)

class(cylinders)

cylinders = as.factor(cylinders)

plot(cylinders, mpg)

plot(cylinders, mpg, col="red")

plot(cylinders, mpg, col="red", varwidth=T)

plot(cylinders, mpg, col="red", varwidth=T, horizontal=T)

plot(cylinders, mpg, col="red", varwidth=T, xlab="cylinders", ylab="MPG")

hist(mpg)

hist(mpg, col=2)

hist(mpg, col=2, breaks=15)

pairs(~ mpg + displacement + horsepower + weight + acceleration, Auto)

summary(Auto)

summary(mpg)


# 초보자가 주의해야 할 점
# R은 자료의 대소문자를 구분한다. 
# 아래 코드는 x와 X가 다르기 때문에 오류가 발생한다.
x <- rnorm(100) 
summary(x)
# summary(X)

# 작업 파일의 위치를 제대로 지정하였는지 항상 확인하여야 한다.
getwd()

# 어떤 함수들은 package를 꼭 설치해야 한다.
# 아래의 함수는 패키지를 선언하지 않아서 오류가 발생한다.
# a <- mpfr(1/3, 100)

# 곱셈기호 *의 누락
# 필기로 계산할 때에는 곱셈기호를 생략할 때가 많지만 R에서는 곱셈기호를 항상 사용해줘야 한다.
n <- 10
# n2 <- 2n #오류
n2 <- 2*n
