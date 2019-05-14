## Extension

<br/>

익스텐션은 구조체, 클래스 열거형, 프로토콜 타입에 새로운 기능을 추가할 수 있다.

<br/>

* Int 타입 확장

```swift
extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
    var isOdd: Bool {
        return self % 2 == 1
    }
}

print(1.isOdd) //true
print(1.isEven) //false
let two = 2
print(two.isOdd) //false
print(two.isEven) //true

```

<br/>

<br/>

* 메서드 추가

```swift
extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
    var isOdd: Bool {
        return self % 2 == 1
    }
    
    func multiply(by number: Int) -> Int {
        return self * number
    }
}

print(1.isOdd) //true
print(1.isEven) //false
let two = 2
print(two.isOdd) //false
print(two.isEven) //true

print(two.multiply(by: 5)) //10
print(3.multiply(by: 10)) //30
```

<br/>

<br/>

* 이니셜라이저

```swift
extension String {
    init(int: Int) {
        self = "\(int)"
    }
    
    init(double: Double) {
        self = "\(double)"
    }
}

let stringFromInt: String = String(int: 100)
let stringFromDouble: String = String(double: 100.0)
```

<br/>

<br/>