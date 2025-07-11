### 1. 문자열을 전달 받아 해당 문자열에서 중복해서 나타난 문자들을 담은 list를 반환하는 duplicated_letters 함수를 작성하시오

> 답변

```py
def duplicated_letters(letters):
    result = []
    
    for letter in letters:
        if letters.count(letter) > 1 and letter not in result:
            result.append(letter)
    return result

duplicated_letters('apple')
duplicated_letters('banana')

# 방법2
past_letters = []
duplicated_letter_list = []

for char in word:
    if char not in past_letters:
        past_letters.append(char)
    else:
        dupplicated_letter_list.append(char)

print(dupplicated_letters(s: str))
```

### 2. 문자열을 전달 받아 해당 문자열을 소문자와 대문자가 번갈아 나타나도록 변환하여 반환하는 low_and_up 함수를 작성하시오. 이때, 전달 받는 문자열은 알파벳으로만 구성된다

> 답변

```py
def low_and_up(words):
    result = []
    for idx, word in enumerate(words):
        if idx % 2 == 0:
            result.append(word.lower())
        else:
            result.append(word.upper())
    return ''.join(result)

low_and_up('apple')
low_and_up('banana')

# 방법2
def low_and_up(words):
    result = ''
    for n in range(len(word)):
        if n % 2 == 0:
            result += word[n].lower()
        else:
            result += word[n].upper()
    return result

```

### 3. 정수 0부터 9까지로 이루어진 list를 전달 받아, 연속적으로 나타나는 숫자는 하나만 남기고 제거한 list를 반환하는 lonely 함수를 작성하시오. 이때, 제거된 후 남은 수들이 담 긴 list의 요소들은 기존의 순서를 유지해야 한다

> 답변

```py
def lonely(lst):
    if len(lst) == 0:
        return []
    
    result = [lst[0]]
    
    for i in range(1, len(lst)):
        if lst[i] != lst[i-1]:
            result.append(lst[i])
    
    return result

# 방법2
new_list = []

if len(numbers) == 0:
    print(new_list)
else:
    new_list.append(numbers[0])

    for num in numbers:
        if num != new_list[-1]:
            new_list.append(num)
        else:
            pass
        
    print(new_list)

lonely([1,1,3,0,1,1])
lonely([4,4,4,3,3])
```
