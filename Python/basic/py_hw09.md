### 1. 문자열을 전달받아 해당 문자열의 모음갯수를 반환하는 count_vowels 함수를 작성하시오. 단, .count() 메서드를 활용하여 작성하시오

> 답변

```py
def count_vowels(s):
    vowels = 'aeiou'
    return sum([s.count(vowel) for vowel in vowels])

count_vowels('apple')
count_vowels('banana')

# 두번째 방법
def count_vowels(s):
    count = 0
    for vowel in 'aeiou':
        count += word.count(vowel)
    return count

count_vowels('apple')
count_vowels('banana')
```

### 2. 다음 중, 문자열(string)을 조작하는 방법으로 옳지않은 것을 고르시오.

> 답변

```md
(4) .strip([chars])은 특정문자를 지정하면, 양쪽에서 해당문자를 찾아 제거한다. 특정문자를 지정하지 않으면 오류가 발생한다. -> 오류발생이 아니라 공백 return
```

### 3. 각각 너비와 높이의 값으로 이루어진 2개의 list를 전달받아, 각각의 값들을 조합하여 만들 수 있는 정사각형만의 넓이를 담은 list를 반환하는 only_square_area 함수를 작성하시오

> 답변

```py
def only_square_area(width, height):
    square_areas = []
    for w in width:
        for h in height:
            if w == h:
                square_areas.append(w * h)
    return square_areas

only_square_area([32, 55, 63],[13, 32, 40, 55])

#두번째 방법
def only_square_area(widths, heights):
    return [
        width * height
        for width in widths
        for height in height
        if width == height
    ]

only_square_area([32, 55, 63],[13, 32, 40, 55])
```
