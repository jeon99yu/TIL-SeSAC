### 1. 정수로 이루어진 list를 전달받아, 각 정수에 대응되는 아스키문자를 이어붙인 문자열을 반환하는 get_secret_word 함수를작 성하시오. 단, list는 65이상 90이하 그리고 97이상 122이하의 정수로만 구성되어있다.

> 답변

```py
def get_secret_word(lst):
    secret_word = ''.join(chr(i) for i in lst)
    return secret_word

get_secret_word([83, 111, 115, 108, 110])
```

### 2. 문자열을 전달받아 해당 문자열의 각 문자에 대응되는 아스키 숫자들의 합을 반환하는 get_secret_number 함수를 작성하시오. 단, 문자열은 A~Z, a~z로만 구성되어 있다.

> 답변

```py
def get_secret_number(s):
    secret_number = sum(ord(char) for char in s)
    return secret_number

get_secret_number('tom')
```

### 3. 문자열 2개를 전달받아 두 문자열의 각 문자에 대응되는 아스키 숫자들의 합을 비교하여 더 큰 합을 가진 문자열을 반환하는 get_strong_word 함수를 작성하시오.

> 답변

```py
def get_strong_word(s1, s2):
    sum1 = sum(ord(char) for char in s1)
    sum2 = sum(ord(char) for char in s2)

    if sum1 > sum2:
        print(s1)
    elif sum2 > sum1:
        print(s2)
    else:
        return "두 문자열의 합이 같습니다."

get_strong_word('z', 'a')
get_strong_word('tom', 'john')
```
