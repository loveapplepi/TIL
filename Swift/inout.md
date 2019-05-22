## inout prameter

<br/>

파라미터로 변수의 주소값을 넘겨 직접 값에 접근해서 변경할 수 있다.

<br/>

```swift
func swapTwoInts( a: inout Int, b: inout Int) {
    let tempA = a
    a = b
    b = tempA
}

var a = 10
var b = 15

swapTwoInts(a: &a, b: &b)

print(a) //15
print(b) //10
```

