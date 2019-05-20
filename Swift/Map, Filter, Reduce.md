## 고차함수

<br/>

Argument 로 함수를 받거나,

Return 값을 함수로 return 하는 함수

<br/>

<br/>

### argument vs parameter

<br/>

```swift
func sum(a: Int, b: Int) -> Int { //parameter
    return a + b
}

sum(a: 1, b: 2) //argument

```

<br/>

Argument 전달인자, 값을 전달해준다.

Parameter 매개변수, argument 의 값을 받아들이는 변수 

<br/>

<br/>

### map

<br/>

배열 각 index에 매핑해서 원하는 데이터로 변형된 값으로 반환

```swift
let numbers = [1, 2, 3, 4, 5]
var doubledNumber = [Int]()
var numberToString = [String]()

doubledNumber = numbers.map({ $0 * 2 })
print(doubledNumber) //[2, 4, 6, 8, 10]

numberToString = numbers.map({ String($0) })
print(numberToString) //["1", "2", "3", "4", "5"]
```

<br/>

<br/>

### filter

<br/>

원하는 값들만 걸러서 새로운 배열로 반환

```swift
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

let oddNumbers = numbers.filter({ $0 % 2 == 0 })

print(oddNumbers) //[2, 4, 6, 8, 10]
```

<br/>

<br/>

### 





### 참고링크

[zedd_argumet, parameter](https://zeddios.tistory.com/403)

[edwith_Swfit 프로그래밍 입문](https://www.edwith.org/boostcamp_ios/lecture/11285)