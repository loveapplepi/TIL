## Type Casting

`is` 인스턴스의 타입을 확인

`as`  타입으로 사용할수 있는지 확인

<br/>

`switch` 구문에서도 `is` 패턴을 활용할수 있다.

<br/>

<br/>

어제 퇴근 길 **연속** 세 대의 🚌가 사람이 꽉차서 그냥 지나가 버렸다 ㅜㅜ

어제의 분노를 담아 타입 캐스팅 예제에 담아 봤당..ㅎㅎ 😉

<br/>

### ✅  Type Checking

```swift
class PublicTransportation {
    var number: String
    var station: String
    init(number: String, station: String) {
        self.number = number
        self.station = station
    }
}

class Bus: PublicTransportation {
    var isFull: Bool
    var hasTrafficJam: Bool
    var time: Int
    
    init(number: String, station: String, isFull: Bool, hasTrafficJam: Bool, time: Int) {
        self.isFull = isFull
        self.hasTrafficJam = hasTrafficJam
        self.time = time
        super.init(number: number, station: station)
    }
    func passingByBus() {
        print("...🤬 ")
    }
    func trafficJam() {
        time += 1
    }
    
}

class Subway: PublicTransportation {
    
    var isDelay: Bool
    var transferLineNumber: String?
    
    init(number: String, station: String, isDelay: Bool, transferLineNumber: String?) {
        self.isDelay = isDelay
        self.transferLineNumber = transferLineNumber
        super.init(number: number, station: station)
    }
}


let vehicle = [
    Bus(number: "1111", station: "강남", isFull: false, hasTrafficJam: false, time: 1),
    Bus(number: "2222", station: "서초", isFull: true, hasTrafficJam: false, time: 1),
    Subway(number: "2호선", station: "잠실", isDelay: false, transferLineNumber: "8호선"),
    Subway(number: "분당선", station: "판교", isDelay: true, transferLineNumber: nil),
    Bus(number: "3333", station: "판교", isFull: true, hasTrafficJam: true, time: 2)
]

var busCount = 0
var subwayCount = 0

for i in vehicle {
    if i is Bus {
        busCount += 1
    } else if i is Subway {
        subwayCount += 1
    }
}

print("\(busCount) Bus, \(subwayCount) Subway") //3 Bus, 2 Subway

```

<br/>

<br/>

### ⬇️  Downcasting

다운캐스팅은 실패 할 가능성 있으므로 optional ❔ 타입을 반환한다.

강제 언래핑은❗️잘못된 타입으로 다운캐스팅 시도시 **런타임에러**가 발생합니둥 

<br/>

 ```swift
for i in vehicle {
    if let bus = i as? Bus {
        if bus.isFull {
            bus.passingByBus()
        } else {
            print("\(bus.number) number, \(bus.station) station, it takes \(bus.time) hours")
        }
    } else if let subway = i as? Subway, let transferNumber = subway.transferLineNumber {
        print("\(subway.number)line, \(subway.station) station, transferLineNumber  \(transferNumber) " )
    }
}
 ```

```
1111number, 강남 station, it takes 1 hours
...🤬 
2호선line, 잠실 station, transferLineNumber  8호선 
...🤬 
```



