rep(c(1, 3, 5), times = 5)
rep(c(1, 3, 5), each = 5)
seq(1, 1000, 2)

score <- c(90, 80, 70)
score
names(score)
names(score) <- c("홍길동", "이순신", "강감찬")
score

d <- c(1, 4, 6, 9) # R은 1번부터 인덱스 시작
# 슬라이싱
d[1]
d[5]
d[1:4]
d[-2]
d[-c(2, 3)]
d[2] <- 1
d[1] <- 4
d[c(1, 2)] <- c(1, 4)

# kiss 와 dog 뽑기 
letters
kiss <- c(letters[11], letters[9], letters[19], letters[19])
dog <- c(letters[4], letters[15], letters[7])

x <- c(1, 4, 3, 7, 8)
x * 2                     # c(1, 4, 3, 7, 8) * c(2, 2, 2, 2, 2)
3 * x + 4

# 벡터에 함수 사용 가능
x <- 1:10
sum(x)
mean(x[1:5])
length(x)
sort(x)
sort(x, decreasing = T)

# 벡터에 논리연산자 적용
x <- 1 : 10
x >= 5
x [x > 5]
sum(x > 5)
sum(x[x>5])
x[x > 5 & x < 8]

x <- 10:50
x[x >= 40]

# 2차원의 모든 데이터 값이동일한 자료형
m <- matrix(1:20, nrow=4, ncol=5)
 
# 매트릭스 만들기
(m1 <- matrix(1:20, nrow=4, ncol=5))
(m1 <- matrix(1:20, nrow=4, ncol=5, byrow=T))

x <- 1:4
y <- 5:8
cbind(x, y) # col단위로 붙이기
rbind(x, y) # row단위로 붙이기

# 매트릭스에서 값 추출
(x <- matrix(1:20, ncol=5))
x[2, 3]
x[3, ]
x[, 2]
x[, c(2, 4)]

# 매트릭스의 행과 열에 이름 지정
(x <- matrix(1:4, ncol=2))
rownames(x) <- c("row1", "row2")
colnames(x) <- c("col1", "col2")

# 데이터프레임 개념 
# 수자형 벡터, 문자형 벡터 등 서로 다른 형태의 데이터를 2차원의 형태로 표현하는 자료 구조
# 모양은 매트릭스와 차이가 없지만 동일한 자료형이 아닌 열단위로 다른 자료형을 저장할 수 있어 데이터 분석에서 활용도가 높다

# 데이터프레임 만들기
city <- c("seoul", "washington", "hongkong")
ranking <- c(1, 3, 2)
df <- data.frame(city, ranking)
str(df)
df <- data.frame(city, ranking, stringsAsFactors = F)
str(df)

# iris 데이터프레임 
# 150개의 붓꽃의 꽃받침과 꽃잎의 크기를 측정한 데이터셋

head(iris)
tail(iris, 3)
str(iris)
sd(iris$Sepal.Length)
iris[iris$Sepal.Length > 5, ]
iris(c(1,2), )



# 산술기하

dat <- c(5, 8, 9, 10, 11, 15, 16, 19, 21, 29, 120)
result <- dat - mean(dat)
sum(result)     # 편차의 합은 0이다.
sd(dat)         # 표준편차


log10(3000) - log10(1000) == log10(30) - log10(10)     # TRUE

library(ggplot2)
library(dplyr)
library(gapminder)
gapminder %>% # %>% 기호는 데이터를 뒤로 넘긴다.
  filter(year == 1952 & continent == "Asia") %>%
  ggplot(aes(reorder(country, pop), pop)) +
  geom_bar(stat = "identity") +
  scale_y_log10() + # log10 를 써서 그래프를 바꿔준다.  
  coord_flip()


head(iris)
iris$Sepal.Width                  # 이상치를 한 눈에 보기 어려움.
boxplot(iris$Sepal.Width)         # o가 이상치이다.
boxplot.stats(iris$Sepal.Width)   # 이상치의 값을 알려줌. 

# 표준편차
m <- mean(iris$Sepal.Width)
s <- sd(iris$Sepal.Width)
c(m - 3*s, m + 3*s) # 이 사이에 들어가면 정상값으로 보자.      
                    # 벗어나면 이상치로 보자.

# 평균
# 평균 주어진 값의 대푯값
# 데이터를 공간상의 배치 했을 때 무게중심

2 / sum(1/100, 1/80)    # 조화평균


# 표준편차와 분산 
# 루트분산 = 표준편차


iris[, c(1, 2)]
iris[2:3, c("Sepal.Width", "Sepal.Length")]
iris[1:2, -5]
iris["Sepal.Length" > 5, c(-1, -2)]

# 데이터셋의 기본 정보 확인
dim(iris)
nrow(iris)
ncol(iris)
colnames(iris)
tail(iris,2)
dim(iris)[2]

unique(iris[, 5])
table(iris$Species)
colSums(iris[, -5])
colMeans(iris[, -5])
rowSums(iris[, -5])[1:2]
rowMeans(iris[, -5])[1:2]

# R 에서는 되도록 반복문을 쓰지말자. 

subset(iris, Species == "setosa")[1:5, ]
iris[iris$Species == "setosa", 1:5]
subset(iris, Sepal.Length > 5.0 & Sepal.Width > 4.0)


# 파일 읽고 쓰기
head(airquality)
getwd()
write.csv(airquality, "air.csv")

air <- read.csv("air.csv", header = 1)
head(air)

# 조건문 

grade <- "A"
if (grade == "A"){
  bonus <- 100
} else if(grade=="B"){
  bonus <- 70
} else {
  bonus <- 50
}
print(bonus)

# &&, || 

a <- c(10, 20, 30)
b <- c(20, 30, 40)

if(a > 5 && b > 10){
  print(a+b)
}

# ifelse 함수 
ifelse(a > 5 && b > 10, a + b, 0)

# for문을 이용한 구구단
for (i in 2:9){
  for (j in 2:9){
    cat(i, "X", j, "=", i * j, '\n') 
  }
}

 
for(i in 1:nrow(iris)){
  vec[i] <- ifelse(iris$Sepal.Length > 5 ,"L", "H")
}
vec[]

# apply() 함수 응용
data(iris)                      # data 초기값 만들기
apply(iris[, -5], 2, mean)      # 컬럼 단위로 평균내기 

# 사용자 정의 함수의 개념
함수명 <- function(매개변수){
  실행할 명령문
  return(함수 수행 결과)
}

my_max <- function(x, y){
  return(ifelse(x > y, x, y))
}
my_max(10, 15)
my_max(-1, -10)


fav <- c(
  "W", "S", "SP", "S", "S", "F", "F", "SP", "S"
)
print(fav)
dat <- table(fav)
barplot(sort(dat, decreasing = T))
?pie(sort(dat))
round(table(fav) / length(fav), 2) * 100  

hist(iris$Sepal.Length)

head(cars)
boxplot(cars$dist, main='자동차 제동거리')


boxplot(Petal.Length ~ Species, data = iris)

boxplot(iris$Petal.Length, notch = T)



plot(mtcars$wt, mtcars$mpg,
     main="중량-연비 산점도",
     xlab="중량", ylab="연비", col='red', pch=20)

pairs(iris[-5])

plot(iris$Petal.Width, iris$Petal.Length,
     col=iris$Species, pch=20)

bears <- c(5, 2, 9, 8, 3, 7, 3, 5, 3, 5)
bal <- c(0.1, 0.03, 0.19, 0.12, 0.04, 0.095, 0.07, 0.06, 0.02, 0.05)
df <- data.frame(bears, bal)
head(df,2)
plot(bal ~ bears, data=df, pch=20, col='orange')
model <- lm(bal~bears, data=df)
abline(model, col='blue')

cor(df$bears, df$bal) # 상관관계


month <- 1:12
late <- c(5, 8, 7, 9, 4, 6, 12, 13, 8, 6, 6, 4)
plot(month, late, type="l", lty = 1, lwd = 1)


plot(month, late,
     type="l", lty = "dashed", lwd = 5,
     col = 'orange', ylim=c(0, 20))

lines(x=month, y=late, lty='solid',
      col='blue', lw5)

morning <- rnorm(100000, mean = 6, sd = 1) # 값 만들기 
length(morning)
hist(morning)

head(iris)

idx <- sample(1:NROW(iris), NROW(iris)*0.7, replace=F)
iris[idx, ]       # 학습용 데이터 70퍼센트
iris[-idx, ]      # 비학습용 데이터 30퍼센트 


