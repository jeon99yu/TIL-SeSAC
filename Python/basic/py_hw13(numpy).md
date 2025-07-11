### 실습 01

> 답변
```py
import numpy as np

x=[1, 2, 3, 4, 5, 6, 7, 8, 9] 
y=[10, 20, 30, 40, 50, 60, 70, 80, 90]

x = np.array(x).reshape(3, 3)
y = np.array(y).reshape(3, 3)

print(x + y)
print()
print(np.dot(x,y))
```

### 실습 02

> 답변
```py
import numpy as np

print(np.linspace(1,20,30) + 10)
```

### 실습 03

> 답변
```py
import numpy as np

new = np.random.randint(1, 101, 200).reshape(2, 10, 10)
filters = np.where(new >= 50, 1, 2)
result = filters[5:10, 5:10]

print(result)
```