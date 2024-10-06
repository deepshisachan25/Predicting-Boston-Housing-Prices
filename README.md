# Predicting-Boston-Housing-Prices
The dataset mlba::BostonHousing contains information collected by the U.S. Bureau of the Census concerning housing in the area of Boston, Massachusetts. The dataset includes information on 506 census housing tracts in the Boston area. The dataset contains 12 predictors. The last column (CAT.MEDV) was derived from median house value (MEDV) such that it obtains the value 1 if MEDV > 30 and 0 otherwise. 
The data dictionary describing each variable is -

- CRIM	Per capita crime rate by town
- ZN	Percentage of residential land zoned for lots over 25,000 ft2
- INDUS	Percentage of land occupied by nonretail business
- CHAS	Does tract bound Charles River (=1 if tract bounds river, =0 otherwise)
- NOX	Nitric oxide concentration (parts per 10 million)
- RM	Average number of rooms per dwelling
- AGE	Percentage of owner-occupied units built prior to 1940
- DIS	Weighted distances to five Boston employment centers
- RAD	Index of accessibility to radial highways
- TAX	Full-value property tax rate per $10,000
- PTRATIO	Pupil-to-teacher ratio by town
- LSTAT	Percentage of lower status of the population
- MEDV	Median value of owner-occupied homes in $1000s
- CAT.MEDV	Is median value of owner-occupied homes in tract above $30000 (CAT.MEDV = 1) or not (CAT.MEDV = 0)

Below screenshot shows the correlation between variables of Boston housing dataset. Correlation between 0.5 to 1(Positive or negative) is considered as a strong correlation. 
 ![image](https://github.com/user-attachments/assets/29e8ea1a-b42e-43dc-860f-dbed27cf5289)
![image](https://github.com/user-attachments/assets/277adfce-b46f-4f48-9bb4-d6ab47e54894)

RAD & TAX: With a correlation of 0.91
When you have easy accessibility to a radial highway then you can easily get to different localities faster. These properties might be more sought after, which would increase their value and hence higher taxes. Same is being confirmed with high positive correlation between these variables.

MEDV & CAT.MEDV: Correlation of 0.79
From MEDV & CAT.MEDV variable, we can tell there is a strong correlation between variables. CAT.MEDV is a categorical variable which is derived from MEDV variable where median value above $30,000 is classified as Class 1 otherwise Class 0.

DIS & NOX: Correlation of -0.77
High concentration of nitric oxide is mainly caused by high vehicular traffic which we would typically find in urban areas where a lot of people commute daily. Typically, employment centers are concentrated areas where a lot of people work. To get to these centers most of the time either they will use their vehicles or use public transport. More people commuting would mean more vehicular traffic which in turn would cause more nitric oxide emissions. This could be the reason for the high inverse correlation between the weighted distance to 5 major employment centers and nitric oxide levels.

NOX & INDUS: They have a positive correlation between NOX and INDUS variables which means they are directly correlated. The percentage of land occupied by non-retail business is correlated with Nitric oxide concentration as there would be more offices and traffic in industrial area so chances of nitric oxide and pollution will be higher in that location.

The first six rows of boston housing data is shown below-

![image](https://github.com/user-attachments/assets/cddb773c-a687-4ec2-a726-15acb3e824c5)

![image](https://github.com/user-attachments/assets/b1c24945-a834-4b68-a68b-771e3aa65b81)

![image](https://github.com/user-attachments/assets/20cbfaff-64e4-4cdc-91ec-0fe99b9f6334)


## Build a k‐NN classification model 
![image](https://github.com/user-attachments/assets/4cddc9af-4c75-4c4e-b7f9-3d16f3b78f1c)

Using the classification KNN model, 
### what is the median value category (above $30000 or not) for a tract in the Boston area that does not bound the Charles River, has a crime rate of 0.1, Full-value property tax rate is 250 and where the average number of rooms per house is 6?

To predict new values, we use following R code:
![image](https://github.com/user-attachments/assets/159b1d2a-b072-44fd-bc9d-ebe57e44def2)

We get predicted value as “0” which means the median value is not above $30,000 because Class “0” represents median value below or equal to $30,000.

#### To find the accuracy of KNN model, we do prediction on holdout data.

![image](https://github.com/user-attachments/assets/a0107839-80e8-4893-a474-803287fb586a)

Accuracy = 0.9154 ~ 91.54% which means this model can give 91.54% accurate value for new data.

## Confusion matrix on train data
![image](https://github.com/user-attachments/assets/d499db79-e3ee-4269-a555-b96c493026c7)

  From the above confusion matrix, we can see that the accuracy is different for holdout and training set. Accuracy for training set is higher than accuracy for holdout set. 
Some of the reasons, why accuracy is different for both the set is: 
•	One reason can be because of the outliers: The presence of outliers in the holdout set, which did not exist in the training set on which the model was trained, due to this it might have an impact on the model's predictions and accuracy varies. 
•	A class (say 0) may be predicted less precisely by the model if there are fewer occurrences of that class in the holdout set. So, because of this reason accuracy for holdout set can be different from training set. 
•	Because of the random partitioning, the distributions of the training and holdout sets may differ. It is possible that the model will not work effectively on the holdout set if the sample size of the holdout set differs from that of the training set dat.
•	A model that performs perfectly well on the training set but is unable to generalize new data (the holdout set) may be because of overfitting, which means the model fits very well on the training data due to which accuracy of training set and holdout set is very different. Our main purpose of building a model is that it should predict new data instead of overfitting on which it was trained then in that case it will not give accurate result.
Holdout is unknown data which will give value for future data.
