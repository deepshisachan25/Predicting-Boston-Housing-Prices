## Predicting Boston Housing Prices

library(mlba)
bostonhousing.df<-mlba::BostonHousing 
correlation_matrix <- cor(bostonhousing.df)
print(correlation_matrix)

corrplot(correlation_matrix, method="color")
corrplot(correlation_matrix, method="number")

bostonhousing.df<- bostonhousing.df[c('CRIM','TAX', 'CHAS', 'RM','CAT.MEDV')]

head(bostonhousing.df)
bostonhousing.df$CAT.MEDV<- factor(bostonhousing.df$CAT.MEDV, levels = c("0","1"))
plot(bostonhousing.df$CAT.MEDV)
summary(bostonhousing.df)

View(bostonhousing.df)
# use predict() to make predictions on a new set.
set.seed(35) 
bostonhousingpartition <- createDataPartition(bostonhousing.df$CAT.MEDV, p = 0.6, list = FALSE)
train.df<- bostonhousing.df[bostonhousingpartition, ]
holdout.df <- bostonhousing.df[-bostonhousingpartition, ]

model <- train(CAT.MEDV ~ .,data=train.df,
               method="knn",  
               preProcess=c("center", "scale"),  
               tuneGrid=expand.grid(k=3),
               trControl=trainControl(method="none"))
print(model)

###creating new dataframe with name bostonnewhousing.df
BostonnewHousing.df=data.frame(
  'CRIM' = 0.1,
  'CHAS' = 0,
  'RM' = 6,
  'TAX'= 250
)
BostonnewHousing.df
#predicting the new values
pred_holdout <- predict(model, BostonnewHousing.df)
pred_holdout

##To find the accuracy and get confusion matrix on holdout data we do predict on holdout data.
pred <- predict(model, holdout.df)
confusionMatrix(pred, holdout.df$CAT.MEDV, positive = "1")

##Confusion matrix on train data
predtrain <- predict(model, train.df)
confusionMatrix(predtrain, train.df$CAT.MEDV, positive = "1")

