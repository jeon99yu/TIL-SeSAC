### 1.

> 답변

```
숫자
특수문자 (@, \_, & 등등)
공백
['False', 'None', 'True', 'and', 'as', 'assert', 'async', 'await', 'break', 'class', 'continue', 'def', 'del', 'elif', 'else', 'except', 'finally', 'for', 'from', 'global', 'if', 'import', 'in', 'is', 'lambda', 'nonlocal', 'not', 'or', 'pass', 'raise', 'return', 'try', 'while', 'with', 'yield']
```

### 2.

> 답변

```py
num1 = round(0.1 * 3, 1)
num2 = 0.3
num1 == num2
```

### 3.

> 답변

```py
int('3.5')
```

### 4.

> 답변

```py
# 첫번째 방법
import math

a = float(input('a:'))
b = float(input('b:'))
c = float(input('c:'))

geun1 = (-b + math.sqrt(b**2 - 4*a*c)) / (2*a)
geun2 = (-b - math.sqrt(b**2 - 4*a*c)) / (2*a)
print(f'answer is {geun1} or {geun2}')

# 두번째 방법
a = float(input('a:'))
b = float(input('b:'))
c = float(input('c:'))

geun1 = (-b + (b**2 - 4*a*c)**(1/2)) / (2*a)
geun2 = (-b - (b**2 - 4*a*c)**(1/2)) / (2*a)
print(f'answer is {geun1} or {geun2}')
```
