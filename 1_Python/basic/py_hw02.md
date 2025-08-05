### 1. (1) 줄 바꿈, (2) 탭, (3) 백슬래시를 의미하는 이스케이프 시퀀스를 작성하시오

> 답변

```
\n
\t
\\
```

### 2. ‘안녕, 철수야’를 string interpolation을 사용하여 출력하시오.

> 답변

```py
print('안녕 %s'%name+'야!')
print(f'안녕 {name}야!')
```

### 3. 두 개의 정수n과 m이 주어졌을 때, 가로의 길이가n, 세로의 길이가 m인 직사각형 형태를 별(\*) 문자를 이용하여 출력하시오. 단, 반복문은 사용할수없다

> 답변

```py
n,m=5,9
nemo='*'*n

print((nemo + '\n')*m)
```

### 4. print() 함수를 한 번만 사용하여 다음 문장을 출력하시오

> 답변

```py
print('"파일은 c:\\Windows\\Users\\내문서\\Python에 저장이 되었습니다."\n나는 생각했다. \'cd를 써서 git bash로 들어가 봐야지.\'')
```

### 5. 주어진 컨테이너들을 각각 변경 가능한것(mutable)과 변경 불가능한 것(immutable)으로 분류하시오.

> 답변

```
mutable한 것: list, set, dictionary
immutable한 것: string, tuple, range
```

### 6. 반 학생들의 정보를 이용하여 key는 이름, value는 나이인 dictionary를 만드시오

> 답변

```py
class_dict = {
    'jason': 23,
    'jayden': 26,
    'julia': 24,
}
class_dict
```
