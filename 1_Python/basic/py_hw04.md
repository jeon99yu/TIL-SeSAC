### 1. 자연수 number를 입력받아 1부터 number까지의 수를 세로로 한줄 씩 출력하시오

> 답변

```py
number = int(input())

for i in range(1, number + 1):
    print(i)
```

### 2. 자연수 number를 입력받아, number부터 0까지의 수를 세로로 한줄 씩 출력하시오

> 답변

```py
number = int(input())

for i in range(number, -1, -1):
    print(i)
```

### 3. 입력으로 자연수 number가 주어질 때, 1부터 주어진 자연수 number까지를 모두 더한 값을 출력하시오. 단, 주어지는 숫자는 10000을 넘지 않는다. 예를 들어, 주어진 숫자가 10일경우 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10 = 55이므로, 출력해야 할 값은 55

> 답변

```py
number = int(input())
total = 0

for i in range(1, number + 1):
    total += i
print(total)
```

### 4. 입력으로 1개의 정수N이 주어진다. 정수 N의 약수를 오름차순으로 출력하는 프로그램 을 작성하시오.

> 답변

```py
N = int(input())

for i in range(1, N + 1):
    if N % i == 0:
        print(i, end=' ')
```

### 5. 중간값 찾기

> 답변

```py
numbers = [
    85, 72, 38, 80, 69, 65, 68, 96, 22, 49, 67,
    51, 61, 63, 87, 66, 24, 84, 73, 71, 60, 64,
    52, 90, 60, 49, 31, 23, 99, 94, 11, 25, 24
]

numbers.sort()
middle = len(numbers) // 2
print(numbers[middle])
```

### 6. 계단 만들기

> 답변

```py
number = int(input())

for i in range(1, number + 1):
    for j in range(1, i + 1):
        print(j, end=' ')
    print()
```
