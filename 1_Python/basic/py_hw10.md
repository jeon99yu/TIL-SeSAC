### 1. key 값으로 과목명, value 값으로 점수를 가지는 dictionary를 전달 받아, 전체 과목의 평균 점수를 반환하는 함수 get_dict_avg 함수를 작성하시오.

> 답변

```py
def get_dict_avg(score):
    return sum(score.values()) / len(score)

print(get_dict_avg({
    'python': 80,
    'algorithm': 90,
    'django': 89,
    'web': 83,
}))
```

### 2. 여러 사람의 혈액형(A, B, AB, O)에 대한 정보가 담긴 list를 전달 받아, key는 혈액형의 종류, value는 사람 수인 dictionary를 반환하는 count_blood 함수를 작성하시오.

> 답변

```py
def count_blood(blood):
    return {
        'A': blood.count('A'),
        'B': blood.count('B'),
        'O': blood.count('O'),
        'AB': blood.count('AB'),
    }

print(count_blood([
    'A', 'B', 'A', 'O', 'AB', 'AB',
    'O', 'A', 'B', 'O', 'B', 'AB',
]))
```