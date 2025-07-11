### 1. range와 slicing을 활용하여 1부터 50까지의 숫자 중, 홀수로만 이루어진 리스트를 만드시오

> 답변

```py
# 1부터 50까지의 숫자 리스트 생성
num_list = list(range(1, 51))
print(num_list)

# 슬라이싱을 사용하여 홀수만 추출 (시작 인덱스 0, 스텝 2)
odd_slicing = num_list[0::2]

print(odd_slicing)
```

### 2. 두개의 정수n 과 m이 주어졌을때, 가로의 길이가 n, 세로의 길이가 m인 직사각형 형태를 별(\*) 문자를 이용하여 출력하시오. 단, 반복문을 사용하여작성하시오

> 답변

```py
n,m=5,9

for i in range(m):
    print(('*'*n + '\n'))
```

### 3. 주어진 코드의 조건문을 조건표현식으로 바꾸어 작성하시오

> 답변

```py
temp = 36.5
result = '입실 불가' if temp >= 37.5 else '입실 가능'
print(result)
```

### 4. 주어진 list에 담긴 숫자들의 평균값을 출력하시오

> 답변

```py
# 방법 1
scores = [80, 89, 99, 83]

avg_score = sum(scores) / len(scores)
print(f"평균값: {avg_score}")

# 방법 2
scores = [80, 89, 99, 83]

total_score = 0
count = 0

for score in scores:
    total_score += score
    count += 1

average_score = total_score / count
print(f"평균값: {average_score}")
```
