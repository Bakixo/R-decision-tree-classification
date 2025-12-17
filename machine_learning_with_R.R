library(mice)
library(caret)
library(rpart)
library(rpart.plot)
library(dplyr)

file_path <- file.choose()
data <- read.csv(file_path, header=TRUE, sep=";")
summary(data)
cat_vars <- c("job","marital", "education", "default", "housing","loan","contact", "month", "poutcome","y")
data[cat_vars] <- lapply(data[cat_vars],as.factor)
summary(data)


#eksik veri doldurma

imp <- mice(data, m=1, method="pmm",maxit=5,seed=123)
data_imputed <- complete(imp)

#normalize
num_vars <- c("age", "balance","duration","campaign","pdays","previous")
num_vars

data_imputed[num_vars] <- scale(data_imputed[num_vars])
summary(data_imputed)


#eğitim ve test böl

set.seed(123)
train <- data_imputed%>%sample_frac(0.8)
summary(train)
test <- anti_join(data_imputed,train)
summary(test)

#caret
traindex <- createDataPartition(data_imputed$y, p=0.8, list=FALSE)
train <- data_imputed[traindex,]
test<- data_imputed[-traindex,]


#karar agacı 

tree_model <- rpart(y~., data=train,method = "class")
rpart.plot(tree_model,type=3,extra = 101)


#tahmin 
pred <- predict(tree_model, test,type="class")
pred

#matris 
conf_matris <- confusionMatrix(pred,test$y,positive = "yes")
conf_matris

