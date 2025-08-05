### 실습 01

> 답변
```py
import numpy as np
import pandas as pd

x = [np.nan,1,2,3,4,5]
y = pd.Series([x[np.random.randint(0,6)] for i in range(20)])

print(f'원본 Series Y: \n{y}')
print(f'결측값 개수: {y.isnull().sum()}')
print(f'결측값 제거 Series: \n{pd.Series(y.dropna())}')
print(f'평균값 대체 Series: \n{pd.Series(y.fillna(y.mean()))}')
```

### 실습 02

> 답변
```py
import numpy as np
import pandas as pd

df = pd.DataFrame(
    np.random.randint(1, 101, size=(15, 3)),
    index=[[f'{i}학년' for i in range(1, 4) for _ in range(5)],
           [f'{j}반' for j in range(1, 6)] * 3],
    columns=['국어','영어','과학']
)

df['총점'] = df[['국어', '영어', '과학']].sum(axis=1)
df['평균'] = df[['국어', '영어', '과학']].mean(axis=1)

grade_sum = df.groupby(level=0)[['국어', '영어', '과학', '총점']].sum()
grade_sum['평균'] = grade_sum[['국어', '영어', '과학', '총점']].mean(axis=1)
grade_sum.index.name = '학년'

print(grade_sum)
```

### 실습 03

> 답변
```py
import pandas as pd
import numpy as np

df = pd.read_csv("./data/train.csv")

# 1.결측치 처리
df['Age'].fillna(df['Age'].mean(), inplace=True)
df['Cabin'].fillna('N', inplace=True)
df['Embarked'].fillna('N', inplace=True)

# 2.성(Sex)별 생존자 합
sex_survived = df[df['Survived'] == 1]['Sex'].value_counts()
print(f'Sex \n{sex_survived}')

# 3.클래스(Pclass)별 생존자합
pclass_survived = df[df['Survived'] == 1]['Pclass'].value_counts().sort_index()
print(f'Pclass \n{pclass_survived}')

# 4.나이(Age)를 활용 유아, 10대, 20대, 30대, 40대, 50대, 60대, 노인의 생존자합
age_filter = [
    df['Age'] < 10,
    df['Age'] < 20,
    df['Age'] < 30,
    df['Age'] < 40,
    df['Age'] < 50,
    df['Age'] < 60,
    df['Age'] < 70
]
choices = ['유아', '10대', '20대', '30대', '40대', '50대', '60대']
default = '노인'

df['Age_Range'] = np.select(age_filter, choices, default=default)

print(f"Age_Range \n{df[df['Survived'] == 1]['Age_Range'].value_counts().sort_index()}")
```