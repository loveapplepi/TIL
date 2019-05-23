## 제네릭

<br/>

다음은 inout 을 공부할때 봤던 swapTwoInts 예제이다.

이 함수는 Int 값만 사용할수 있는데 다른 타입으로 바꾸고 싶다면 함수를 또 작성해야한다.

즉 중복코드가 발생한다.

<br/>

```swift
func swapTwoInts(a: inout Int, b: inout Int) {
    let tempA = a
    a = b
    b = tempA
}

var a = 10
var b = 15

swapTwoInts(a: &a, b: &b)

print(a) //15
print(b) //10

func swapTwoDoubles(a: inout Double, b: inout Double) {
    let tempA = a
    a = b
    b = tempA
}

var aa = 10.5
var bb = 15.5

swapTwoDoubles(a: &aa, b: &bb)

print(aa) //15.5
print(bb) //10.5



```

<br/>

<br/>이 때 제네릭 코드를 사용하면 중복을 줄일 수있다.

함수 정의시 `<T>` 정의하고 실제 타입 대신 T로 명시한다.

T의 실제 타입은 함수 호출 시 결정된다. T는 함수 인자로 전달된 값으로부터 타입 추론한다.

> 실제로 값을 swap하는 함수를 구현하려면 Swift 표준라이브러리인 swap 함수를 사용하는것을 권장

<br/>

```swift
func swapTwoValues<T>(a: inout T, b: inout T) {
    let tempA = a
    a = b
    b = tempA
}

var a = 1
var b = 2

swap(&a, &b)
print(a) //2
print(b) //1

var aa = "aa"
var bb = "bb"

swap(&aa, &bb)
print(aa) //bb
print(bb) //aa

```

<br/>

<br/>

![generics](images/generics.png)

<br/>

이 때 다른 타입끼리는 swap 이 불가능하다. 

가능하도록 하려면 전달인자 변수에 Any 타입을 명시해주면 된다.

<br/>

```swift
func swapTwoValues<T>(a: inout T, b: inout T) {
    let tempA = a
    a = b
    b = tempA
}

var a: Any = 10
var b: Any = "hi"

swapTwoValues(a: &a, b: &b)

print(a) //hi
print(b) //10
```









### 참고링크

[민소네_[Swift]Generics 정리](http://minsone.github.io/mac/ios/swift-generics-summary)

