### 1. 정수로만 이루어진 list를 전달받아 해당 list의 모든요소들의 합을 반환하는 list_sum 함수를 built-in 함수인 sum() 함수를 사용하지않고 작성하시오.

> 답변

```py
def sumlist(l):
    total = 0
    for i in l:
        total += i
    return total

print(sumlist([1, 2, 3, 4, 5]))
```

### 2. Dictionary로 이루어진 list를 전달받아 모든 dictionary의'age' key에 해당하는 value들의 합을 반환하는 dict_list_sum 함수를 built-in 함수인sum() 함수를 사용하지 않고 작성하시오.

> 답변

```py
def dict_list_sum(l):
    total = 0
    for i in l:
        total += i['age']
    return total

print(dict_list_sum([{'name': 'kim', 'age': 12},{'name': 'lee', 'age': 4}]))
```

### 3. 정수로만 이루어진 2차원 list를 전달받아 해당 list의 모든 요소들의 합을 반환하는 all_list_sum 함수를 built-in 함수인sum() 함수를 사용하지 않고 작성하시오

> 답변

```py
def all_list_sum(l):
    total = 0
    for sublist in l:
        for num in sublist:
            total += num
    return total

print(all_list_sum([[1], [2, 3], [4, 5, 6], [7, 8, 9, 10]]))
```
