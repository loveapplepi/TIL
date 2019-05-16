## Error Handling

<br/>

Error 프로토콜 함께 열거형을 사용해서 오류를 표현한다.

<br/>

<br/>

```swift
enum VendingMachineError: Error {
    case invalidInput
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}
```

<br/>

<br/>

Vendingmachine 객체 만들기

throws를 사용하여 오류를 내포하는 함수임을 표시한다.

```swift
class VendingMachine {
    var price = 100
    var count = 5
    var desposit = 0
    
    func receiveMoney(money: Int) throws {
        
        guard money > 0 else {
            throw VendingMachineError.invalidInput
        }
        
        self.desposit += money
        
    }
    
    func vend(numberOfItems numberOfItemsToVend: Int) throws -> String {
        guard numberOfItemsToVend > 0 else {
            throw VendingMachineError.invalidInput
        }
        
        guard numberOfItemsToVend * price < desposit else {
            let moneyNeeded =  numberOfItemsToVend * price - desposit
            throw VendingMachineError.insufficientFunds(coinsNeeded: moneyNeeded)
        }
        
        guard count > numberOfItemsToVend else {
            throw VendingMachineError.outOfStock
        }
        
        let totalPrice = numberOfItemsToVend * price
        self.desposit -= totalPrice
        self.count -= numberOfItemsToVend
        return "\(numberOfItemsToVend) 구매 "
    }
    
}
```

<br/>

<br/>

기본적인 모든 error 케이스를 포함한 do-catch 구문

```swift
do {
    try vendingMachine.receiveMoney(money: 0)
} catch VendingMachineError.invalidInput {
    print("invalid input")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("\(coinsNeeded) needed")
} catch VendingMachineError.outOfStock {
    print("out of stock")
}
```

<br/>

<br/>

Switch case 를 활용한 do-catch 구문

```swift
do {
    try vendingMachine.receiveMoney(money: 300)
} catch {
    switch error {
    case VendingMachineError.invalidInput:
        print("invalid input")
    case VendingMachineError.insufficientFunds(let coinsNeeded):
        print("\(coinsNeeded) needed")
    case VendingMachineError.outOfStock:
        print("out of stock")
    default:
        print("error \(error)")
    }
}

```

<br/>

<br/>

모든 케이스별로 오류처리할 필요가 없으면 catch 구문을 간략히 표시(생략도 가능)해도 된다 

```swift
do {
    result = try vendingMachine.vend(numberOfItems: 5)
} catch {
    print("error \(error)")
}

```





