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

