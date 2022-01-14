#!/usr/bin/env python
# coding: utf-8

# In[1]:


import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns


# In[2]:


import os
cwd = '/Users/lukemcevoy/Develop/stevens/f21/dataMining/final/data'
for dirname, _, filenames in os.walk(cwd):
    for filename in filenames:
        print(os.path.join(dirname, filename))


# In[3]:


data = pd.read_csv('/Users/lukemcevoy/Develop/stevens/f21/dataMining/final/data/train.csv')
data.head()


# In[4]:


data.info()


# In[5]:


data['ADDRESS'] = data['ADDRESS'].str.split(',').apply(lambda x: x[-1])


# In[6]:


data['ADDRESS'].value_counts(ascending=False).head(50)


# In[7]:


def map_city(city):
    if city in ['Ahmedabad', 'Bangalore', 'Chennai', 'Delhi', 'Hyderabad', 'Kolkata', 'Mumbai', 'Pune', 'Maharashtra']:
        return 'tier1'
    elif city in ['Agra', 'Ajmer', 'Aligarh', 'Amravati', 'Amritsar', 'Asansol', 'Aurangabad', 'Bareilly', 
                  'Belgaum', 'Bhavnagar', 'Bhiwandi', 'Bhopal', 'Bhubaneswar', 'Bikaner', 'Bilaspur', 'Bokaro Steel City', 
                  'Chandigarh', 'Coimbatore', 'Cuttack', 'Dehradun', 'Dhanbad', 'Bhilai', 'Durgapur', 'Dindigul', 'Erode', 
                  'Faridabad', 'Firozabad', 'Ghaziabad', 'Gorakhpur', 'Gulbarga', 'Guntur', 'Gwalior', 'Gurgaon', 'Guwahati', 
                  'Hamirpur', 'Hubli–Dharwad', 'Indore', 'Jabalpur', 'Jaipur', 'Jalandhar', 'Jammu', 'Jamnagar', 'Jamshedpur', 
                  'Jhansi', 'Jodhpur', 'Kakinada', 'Kannur', 'Kanpur', 'Karnal', 'Kochi', 'Kolhapur', 'Kollam', 'Kozhikode', 
                  'Kurnool', 'Ludhiana', 'Lucknow', 'Madurai', 'Malappuram', 'Mathura', 'Mangalore', 'Meerut', 'Moradabad', 
                  'Mysore', 'Nagpur', 'Nanded', 'Nashik', 'Nellore', 'Noida', 'Patna', 'Pondicherry', 'Purulia', 'Prayagraj', 
                  'Raipur', 'Rajkot', 'Rajahmundry', 'Ranchi', 'Rourkela', 'Ratlam', 'Salem', 'Sangli', 'Shimla', 'Siliguri', 
                  'Solapur', 'Srinagar', 'Surat', 'Thanjavur', 'Thiruvananthapuram', 'Thrissur', 'Tiruchirappalli', 'Tirunelveli', 
                  'Tiruvannamalai', 'Ujjain', 'Bijapur', 'Vadodara', 'Varanasi', 'Vasai-Virar City', 'Vijayawada', 'Visakhapatnam', 
                  'Vellore', 'Warangal']:
        return 'tier2'
    else:
        return 'tier3'
    
data['city_tier'] = data['ADDRESS'].apply(map_city)


# In[8]:


get_ipython().run_line_magic('matplotlib', 'inline')
data['area'] = np.log(data['SQUARE_FT'])
data['PRICE_IN_LACS'] = np.log(data['TARGET(PRICE_IN_LACS)'])


# In[9]:


plt.plot(data['area'], data['PRICE_IN_LACS'],'.')
plt.xlabel('area')
plt.ylabel('PRICE_IN_LACS')


# In[10]:


print(data['PRICE_IN_LACS'])


# In[11]:


get_ipython().run_line_magic('matplotlib', 'inline')

plt.plot(data['LONGITUDE'], data['PRICE_IN_LACS'],'.')
plt.xlabel('LONGITUDE')
plt.ylabel('PRICE_IN_LACS')


# In[12]:


get_ipython().run_line_magic('matplotlib', 'inline')

plt.plot(data['LATITUDE'], data['TARGET(PRICE_IN_LACS)'],'.')
plt.xlabel('LATITUDE')
plt.ylabel('PRICE_IN_LACS')


# In[13]:


import random
from matplotlib import pyplot as plt
from matplotlib import cm
from matplotlib import axes
from matplotlib.font_manager import FontProperties


# In[14]:


d = [[1,0.36,-0.04,-0.11, -1,-0.35,0, -0.03,-0.11],
       [0.36,1,0.02,0.01,-0.36,-0.27,0.1,-0.16,0.01],
       [-0.04,0.02,1,0.82,0.04,0.01,0.09,0.12,0.82],
       [-0.11,0.01,0.82,1,0.11,0.08,0.07,0.08,1],
       [-1,-0.36, 0.04, 0.11,1,0.35, 0,0.03, 0.11],
       [-0.35,-0.27, 0.01,0.08,0.35, 1, 0.03,0.03,0.08],
       [0,0.1,0.09,0.07,0,0.03,1,0.01,0.07],
       [-0.03,-0.16,0.12,0.08,0.03,0.03,0.01,1,0.08],
       [-0.11,0.01,0.82,1,0.11,0.08,0.07,0.08,1]]
xLabel = ['UNDER_CONSTRUCTION', 'RERA', 'BHK_NO.', 'SQUARE_FT', 'READY_TO_MOVE', 'RESALE', 'LONGITUDE', 'LATITUDE', 'area']
yLabel = ['UNDER_CONSTRUCTION', 'RERA', 'BHK_NO.', 'SQUARE_FT', 'READY_TO_MOVE', 'RESALE', 'LONGITUDE', 'LATITUDE', 'area']

d = np.array(d)
plt.figure(dpi=100)
plt.imshow(d, cmap=plt.cm.hot_r)
plt.xticks(ticks=np.arange(9),labels=xLabel,rotation=90)
plt.yticks(ticks=np.arange(9),labels=yLabel)
plt.colorbar()


# In[15]:


categorical_features = ['POSTED_BY', 'BHK_OR_RK', 'city_tier', 'ADDRESS']
numerical_features = ['UNDER_CONSTRUCTION', 'RERA', 'BHK_NO.', 'SQUARE_FT', 'READY_TO_MOVE', 'RESALE', 'LONGITUDE', 'LATITUDE', 'area']


# In[16]:


df = data.groupby(['ADDRESS'])['TARGET(PRICE_IN_LACS)'].describe()[['mean', 'count']]
df = df[df['count']>20]


# In[17]:


from sklearn.preprocessing import LabelEncoder, OneHotEncoder
import joblib


# In[18]:


df = data.copy()
path = cwd
for i, feature in enumerate(categorical_features):
    le = LabelEncoder()
    ohe = OneHotEncoder(sparse=False)
    if not os.path.exists(os.path.join(path, "TextEncoding")):
        os.makedirs(os.path.join(path, "TextEncoding"))
    le.fit(df[feature])
    joblib.dump(le, open(os.path.join(path, "TextEncoding/le_{}.sav".format(feature)), 'wb'))
    df[feature] = le.transform(df[feature])
    columns = list(map(lambda x: feature+' '+str(x), list(le.classes_)))[1:]
    joblib.dump(columns, 
                open(os.path.join(path, "TextEncoding/le_{}_classes.sav".format(feature)), 'wb'))
    columns = joblib.load(
        open(os.path.join(path, "TextEncoding/le_{}_classes.sav".format(feature)), 'rb'))
    if len(le.classes_)>2 and feature!='ADDRESS':
        ohe.fit(df[[feature]])
        joblib.dump(ohe, 
                    open(os.path.join(path, "TextEncoding/ohe_{}.sav".format(feature)), 'wb'))
        tempData = ohe.transform(df[[feature]])[:, 1:]
        tempData = pd.DataFrame(tempData, columns=columns)
    else:
        tempData = df[[feature]]
    if i==0:
        encodedData = pd.DataFrame(data=tempData, columns=tempData.columns.values.tolist())
    else:
        encodedData = pd.concat([encodedData, tempData], axis=1)


# In[19]:


df = df[numerical_features+['TARGET(PRICE_IN_LACS)', 'PRICE_IN_LACS']]
df = pd.concat([df, encodedData], axis=1)
df.info()


# In[20]:


from sklearn.model_selection import train_test_split, cross_val_score
from sklearn.linear_model import LinearRegression
from sklearn import metrics, preprocessing
from sklearn.metrics import mean_squared_error
from sklearn.preprocessing import MinMaxScaler, StandardScaler
from xgboost import XGBRegressor


# In[21]:


train_data = df.copy()
feature_cols = [feature for feature in train_data.columns if feature not in(['READY_TO_MOVE', 'ADDRESS', 'TARGET(PRICE_IN_LACS)', 
                                                                             'SQUARE_FT', 'PRICE_IN_LACS'])]


# In[22]:


feature_cols


# In[23]:


X = train_data[feature_cols]
y = train_data['PRICE_IN_LACS']

validation_size = 0.2
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=validation_size, random_state=0, 
                                                    stratify=X[['RESALE', 'UNDER_CONSTRUCTION', 'RERA']])

y1 = train_data['TARGET(PRICE_IN_LACS)']
validation_size = 0.2
X_train1, X_test1, y_train1, y_test1 = train_test_split(X, y1, test_size=validation_size, random_state=0, 
                                                    stratify=X[['RESALE', 'UNDER_CONSTRUCTION', 'RERA']])


# In[24]:


y_test.head(20)


# In[25]:


X_test.head(20)


# In[26]:


# XGBRegressor


# In[27]:


model = XGBRegressor( 
    n_estimators = 500,
    learning_rate=0.02, 
    seed=7)


# In[28]:


from sklearn.model_selection import learning_curve
train_sizes, train_scores, test_scores, fit_times, _ = learning_curve(model, X_test, y_test, cv=30, return_times=True)


# In[29]:


plt.plot(train_sizes, np.mean(train_scores, axis=1))
plt.xlabel('Training sizes') 
plt.ylabel('Mean train_score')
plt.show()


# In[30]:


model = model.fit(
    X_train, 
    y_train, 
    eval_metric="rmse", 
    verbose=False)


# In[31]:


model.score(X_test, y_test)


# In[32]:


# Support Vector Machine


# In[33]:


from sklearn import svm
regr = svm.SVR()
regr.fit(X_train, y_train)
regr.score(X_test, y_test)


# In[34]:


train_sizes, train_scores, test_scores, fit_times, _ = learning_curve(regr, X_test, y_test, cv=30, return_times=True)
plt.plot(train_sizes, np.mean(train_scores, axis=1))
plt.xlabel('Training sizes') 
plt.ylabel('Mean train_score')
plt.show()


# In[35]:


# Decision Tree


# In[36]:


from sklearn import tree
clf = tree.DecisionTreeRegressor()
clf = clf.fit(X_train, y_train)
clf.score(X_test, y_test)


# In[37]:


train_sizes, train_scores, test_scores, fit_times, _ = learning_curve(clf, X_test, y_test, cv=30, return_times=True)
plt.plot(train_sizes, np.mean(train_scores, axis=1))
plt.xlabel('Training sizes') 
plt.ylabel('Mean train_score')
plt.show()


# In[38]:


# Neural Network (MLPRegressor)


# In[39]:


from sklearn.neural_network import MLPRegressor
nnregr = MLPRegressor(random_state=1, max_iter=100000)
nnregr.fit(X_train, y_train)
nnregr.score(X_test, y_test)


# In[40]:


train_sizes, train_scores, test_scores, fit_times, _ = learning_curve(nnregr, X_test, y_test, cv=30, return_times=True)
plt.plot(train_sizes, np.mean(train_scores, axis=1))
plt.xlabel('Training sizes') 
plt.ylabel('Mean train_score')
plt.show()


# In[41]:


from sklearn import linear_model
reg = linear_model.Lars(n_nonzero_coefs=12, normalize=False)
reg.fit(X_train, y_train)
reg.score(X_test, y_test)


# In[42]:


train_sizes, train_scores, test_scores, fit_times, _ = learning_curve(reg, X_test, y_test, cv=30, return_times=True)
plt.plot(train_sizes, np.mean(train_scores, axis=1))
plt.xlabel('Training sizes') 
plt.ylabel('Mean train_score')
plt.show()


# In[43]:


# Random Forest


# In[44]:


from sklearn.ensemble import RandomForestRegressor
regr = RandomForestRegressor(max_depth=10000, random_state=0)
regr.fit(X_train, y_train)
regr.score(X_test, y_test)


# In[45]:


train_sizes, train_scores, test_scores, fit_times, _ = learning_curve(regr, X_test, y_test, cv=30, return_times=True)
plt.plot(train_sizes, np.mean(train_scores, axis=1))
plt.xlabel('Training sizes') 
plt.ylabel('Mean train_score')
plt.show()


# In[46]:


# Linear Model (Baysian Ridge)


# In[47]:


from sklearn import linear_model
reg = linear_model.BayesianRidge()
reg.fit(X_train, y_train)
reg.score(X_test, y_test)


# In[48]:


train_sizes, train_scores, test_scores, fit_times, _ = learning_curve(reg, X_test, y_test, cv=30, return_times=True)
plt.plot(train_sizes, np.mean(train_scores, axis=1))
plt.xlabel('Training sizes') 
plt.ylabel('Mean train_score')
plt.show()


# In[49]:


# K Nearest Neighbor


# In[50]:


from sklearn.neighbors import KNeighborsRegressor
neigh = KNeighborsRegressor(n_neighbors=3)
neigh.fit(X_train, y_train)
neigh.score(X_test, y_test)


# In[51]:


train_sizes, train_scores, test_scores, fit_times, _ = learning_curve(neigh, X_test, y_test, cv=30, return_times=True)
plt.plot(train_sizes, np.mean(train_scores, axis=1))
plt.xlabel('Training sizes') 
plt.ylabel('Mean train_score')
plt.show()


# In[52]:


# Linear Regression


# In[53]:


from sklearn.linear_model import LinearRegression
reg = LinearRegression().fit(X_train, y_train)
reg.score(X_test, y_test)


# In[54]:


train_sizes, train_scores, test_scores, fit_times, _ = learning_curve(reg, X_test, y_test, cv=30, return_times=True)
plt.plot(train_sizes, np.mean(train_scores, axis=1))
plt.xlabel('Training sizes') 
plt.ylabel('Mean train_score')
plt.show()

