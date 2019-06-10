## Swift Memory Management

<br/>

Swift는 ARC Automatic Reference Counting (자동참조카운팅)를 사용하기 때문에

매 참조 타입의 오브젝트를 명시적, 개별적으로 메모리 관리 하지 않아도 된다.

하지만 ARC를 사용하더라도 메모리 관리에 오류가 발생할 수 있고 코코아 메모리 관리 

시스템이 메모리 관리에 실패할 수 있다. 

<br/>

####  코코아 메모리 관리 법칙

레퍼런스 타입 메모리가 관리돼야 하는 이유는 레퍼런스 타입 오브젝트가 참조하는 것은

포인터이기 때문이다. 

객체가 생성되면 메모리를 확보하고 소멸되면 메모리를 풀어주는데 실제 객체는 이 메모리를

가리키고 있다.

객체가 인스턴스화되면 메모리가 확보된다.

객체는 자신을 참조하는 다른 객체가 없을 경우에는 확실히 소멸해야 한다. 포인터가 없는

객체는 쓸모가 없다. 메모리를 점유하고 있지만 이를 참조하거나 참조를 얻으려는 객체가

없는 경우다. 이런 현상을 메모리 누수leak 라고 한다. 대다수의 컴퓨터 언어는 이 문제를 

가비지 컬렉션으로 해결하지만 (주기적으로 모든 객체를 살펴보면서 포인터가 없는 객체를 

소멸시켜 메모리 누수를 방지한다.) 하지만 가비지 컬렉션은 메모리가 제한적이고 프로세서가

상대적으로 느리기 때문에 iOS 디바이스에서는 비용이 많이 든다.

그래서 iOS 메모리는 각자의 방법으로 어느 정도의 수작업을 통해 관리 돼야 한다. 

**오브젝트 각각은 더 이상 필요가 없을 때 '정확히' 소멸 돼야 한다.**

객체 여러 개가 동일한 객체인 하나의 포인터(레퍼런스)를 가질 수 있다. 

어떤 객체가 참조하고 있는 객체를 즉시 소멸하라고 요청한다면 그 객체를 참조하고 있는

객체는 아무것도 가리키지 않는 포인터를 가지고 있게 된다. 

포인터 뒤에서 소멸된 객체를 가진 포인터는 **댕글링 포인터** dangling pointer 라고 한다. 

아무것도 가리키지 않는 포인터를 갖고 있는 객체가 지속적으로 소멸된 객체에게 메세지를

보내기 위해 댕글링 포인터를 계속 사용한다면 앱은 충돌하게 된다.

댕글린 포인터와 메모리 누수를 방지하기 위해 모든 레퍼런스 타입 오브젝트를 관리하는

숫자에 기반한 수작업 메모르 관리 정책이 있는데 이를 **리테인 카운트** retain count 라고

한다. 다른 객체는 참조하는 객체의 리테인 카운트를 증가시키거나 감소시킬 수 있다.

객체 리테인 카운트가 계속 양수로 유지되는 동안에 객체는 계속 살아있다. 

다른 객체에게 스스로 소멸하도록 직접 요청할 수 있는 객체는 없다. 객체 리테인 카운트가

0이 되자마자 자동으로 소멸된다.

지속적으로 a객체가 필요한 모든 객체는 a의 리테인 카운트를 증가시켜야 하고 지속적으로

a를 더 이상 참조하지 않을 때마다 카운트를 감소시켜야 한다. 모든 객체가 이 규칙에 따라서

잘 동작된다면 수작업 메모리 관리 문제는 효과적으로 해결된다.

<br/>

<br/>

#### 코코아 메모리 관리 규칙

레퍼런스 타입 객체를 참조하는 객체 각각은 메모리 관리 규칙에 따라 참조하는 객체의 메모리

관리를 책임져야 한다는 것이다.

* b 또는 c 객체가 a를 인스턴스화한다면(직접 초기화 함수를 호출해서) 초기화 함수는 a 의 리테인 카운트를 증가시킨다.
* b 또는 c가 a의 복사본을 만든다면 copy 메소드는 리테인 카운트를 증가시키고 a를 복제한다.
* b 또는 c가 a의 레퍼런스를 얻고(인스턴스화나 복사가 아닌 다른방법) a가 지속적으로 존재해야 할 필요가 있다면 (코드에서 a를 이용해서 작업할 만큼 또는 인스턴스 속성의 값이 될 만큼만) 스스로 a의 리테인 카운트를 증가시킨다.
* b 또는 c가 직간접적으로 a의 리테인 카운트가 증가되도록 한다면 자신 스스로 a를 참조할 필요가 없을 때 레퍼런스를 끊기 전에 스스로 이전에 증가시켰던 a의 리테인 카운트가 균현을 유지하도록 a의 리테인 카운트를 감소시킨다. 이 작업으로 a의 리테인 카운트가 0이 되었다면 a가 해제되므로 b와 c는 a가 더이상 존재하지 않는 것으로 가정해야 한다.

<br/>

<br/>

#### ARC의 개념과 역할

ARC는 컴파일러의 일부로 구현돼 있다. 컴파일러는 컴파일 과정에서 코드에 retain과 release

호출을 삽입한다. 

예를 들어 어떤 메소드를 호출해서 레퍼런스 객체 타입을 받을 때 ARC는 즉시 이 객체를 유지

시키고 동일한 코드가 계속 실행 되는 동안에는 이를 계속 잔존시킨다. 그리고 코드가 끝나면 

ARC는 이를 릴리스 한다. ARC는 객체를 생성하거나 복사할 때도 리테인 카운트를 알고 있고 

코드가 종료되면 이를 릴리스한다. 

ARC는 메모리 관리를 위해 조금이라도 영향을 줄 수 있는 모든 시점을 저장한다.

<br/>

<br/>

#### 코코아 오브젝트가 메모리를 관리하는 방법

내장 코코아 객체는 리테인을 통해 갖고 있는 객체의 오너십을 가진다. 그리고 나서 릴리스와 

리테인의 균형을 맞춘다. 

<br/>

obj-c 코드의 경우

<br/>

```objective-c
id obj = myMutableArray[0];
[myMutableArray removeObjectAtIndex: 0];
// myMutableArray의 0번째 엘리먼트를 암시적으로 릴리스 하는 코드가 포함돼 있다.
// 만약 obj를 참조하면 충돌이 발생할 수 있다.
```

<br/>

뮤터블 컬렉션에서 객체를 제거하는 경우 컬렉션은 이를 릴리스 한다. 

객체의 리테인 카운트를 0으로 감소시킨다면 객체는 소멸될 것이다. 그러면 포인터 obj는 

댕글링 포인터가 되고 나중에 이를 사용하려고 하면 앱은 충돌할 수 있다.

하지만 ARC를 사용하면 이런 위험은 없다. 

<br/>

swift 코드의 경우

<br/>

```swift
let obj = myMutableArray[0]
myMutableArray.remove(at: 0)
// obj를 참조해도 안전하다.
```

<br/>

첫 번째 라인에서 객체를 리테인한다. 두 번째 라인은 객체를 릴리스 했다.

하지만 이 릴리스를 통해 객체가 컬렉션에 배치됐을 때 증가됐던 객체의 리테인에 대한

균형이 유지된다. 그래서 객체의 리테인 카운트는 여전히 0보다 크고 이 코드가 실행되는 

동안에는 계속 존재한다.

<br/>

<br/>

#### 오토릴리스 풀

<br/>

```swift
    func makeImage() -> UIImage? {
        if let image = UIImage(named: "myImage") {
            return image
        }
        return nil
    }
```

<br/>

UIImage(name:) 초기화 함수를 호출하면 리테인 카운트가 증가된다.

메모리 관리를 위해서는 UIImage를 리턴해서 외부로 전달할때 증가시킨 카운트의 

균형을 유지시키고 오너십을 포기할때 리테인 카운트를 감소시켜야 한다.

하지만 이 작업을 return 전에 수행하면 리테인 카운트는 0이 되고 바로 사라지므로

댕글링포인트를 반환하게 된다. 또한 return 구문 뒤에서는 이 작업을 수행할 수 없다.

리테인 카운트를 감소시키지 않고 이 객체를 제공할 방법이 필요한데 콜러가 객체를 사용할수 

있을 만큼의 충분한 시간을 유지하는 방법이다. 이 방법은 특정 미래 시점에 리테인 카운트를

감소시켜서 init(named:) 호출에 대한 균형을 맞추도록 보장돼야 하고 이 객체에 대한

메모리 관리 규칙을 준수해야 한다.

이에 대한 해결책은 객체를 릴리스하거나 릴리스하지 않는 방법의 중간쯤에 있는데

ARC는 이 객체를 오토릴리스 한다.

오토릴리스 코드는 오토릴리스 풀 내에서 수행된다.

ARC가 객체를 오토릴리즈할 때 객체는 오토릴리즈 풀 내에 있고 숫자는 증가된다.

이 숫자에는 객체가 오토릴리즈 풀에 배치되는 횟수가 추가된다. 때로 아무것도 진행되지

않을 때 오토릴리즈 풀은 자동적으로 줄어든다.

<br/>

```swift
    func test() {
        if let path = Bundle.main.path(forResource: "001", ofType: "png") {
            for _ in 0..<50 {
                for _ in 0..<100 {
                    let image = UIImage(contentsOfFile: path)
                }
            }
        }
    }
```

<br/>

위 코드의 메소드는 단순히 이미지를 루프를 돌면서 반복적으로 이미지를 적재한다,

그럼 루프가 실행됨에 따라 메모리 사용량은 지속적으로 높아진다. 메소드가 끝나는 시점에

이르면 앱의 메모리 사용량은 거의 34MB 까지 올라간다. 이는 반복문이 수행되는 동안

이미지가 해제되지 않기 때문에 발생하는 문제가 아니라 init(contentsOfFile:)을 호출할 때

다수의 중간 객체가 생성됐고 이후 자동으로 해제됐지만 반복문이 수만 번 반복되며 오토릴리스

풀에 쌓여 있는 상태에서 오토릴리스 풀이 자동으로 비워지기를 기다리고 있기 때문에 메모리 

사용량이 급격히 감소해서 메모리의 여유가 없는 상태가 된 것이다.

오토리리스 풀을 autoreleasepool 함수를 사용해서 수작업으로 비워주면 루프를 더 많이

반복할 수 있다.

<br/>

```swift
    func test() {
        if let path = Bundle.main.path(forResource: "001", ofType: "png") {
            for _ in 0..<50 {
                autoreleasepool {
                    for _ in 0..<100 {
                        let image = UIImage(contentsOfFile: path)
                    }
                }
            }
        }
    }
```

<br/>

위 코드처럼 오토릴리스 풀을 사용하면 메모리 사용량은 안정적으로 유지된다.

다만 임시 오토릴리스 풀을 설정하고 이를 비우는 작업을 하면 오버헤드가 발생할 수 있기

때문에 위와 같이 오토릴리스 풀을 모든 반복문에 설정하지 않는다.

<br/>

<br/>

#### 인스턴스 프로퍼티에서 메모리 관리

ARC가 나오기 이전에 인스턴스 메모리 관리는 어려운 부분중에 하나였다.

오너가 소멸됐을 때 메모리 누수되는 것을 방지하기 위해 deinit에서 프로퍼티 값으로

리테인된 모든 객체를 릴리스하도록 구현해야 했다.

다행히도 ARC는 이 내용을 모두 알고 있고, 인스턴스 프로퍼티의 메모리를 모든 변수의

메모리처럼 올바르게 관리해준다.

이 작업은 객체가 매우 많은 메모리를 사용할 수 있기 때문에 매우 중요하다.

디바이스 메모리에 매우 큰 부담을 주면 안 되므로 객체를 이용해 작업하자마자 릴리즈

해야 한다. 또한 앱이 백그라운드로 전환되고 중단된 경우 와치독watchdog 프로세스가

앱이 너무 많은 메모리를 사용하고 있는 것을 발견한다면 백그라운드에서 강제 종료시킨다.

그렇기 때문에 앱이 막 백그라운드에 들어가는 시점에 노티피케이션을 받았을 때 이 객체를

릴리즈하는 것이 좋다.

<br/>

#### 리테인 사이클과 위크 레퍼런스

두 객체가 서로의 참조를 가지는 리테인 사이클을 시작할 수 있다. 

예를 들어 각각은 서로 다른 인스턴스 프로퍼티의 값이다. 

이러한 상황이 다른 객체가 상대방의 레퍼런스를 가지지 않을 때까지 지속적으로 허락된다면

두 객체 모두 소멸되지 않는다. 각각은 0보다 큰 리테인 카운트를 가지고 있고, 아무도 먼저

릴리스하려고 하지 않으며, 상대방을 릴리스하지도 않기 때문이다. 이들 오브젝트 두 개 모두

가설에 따라 서로를 제외하고 다른 객체에 의해 더 이상 참조되지 않을 수 있다. 이들 객체는 

누수된다.

이에 대한 해결책은 이들 레퍼런스 중 하나를 위해 메모리 관리 방법을 변경하는 것이다.

기본적으로 레퍼런스는 할당된 값을 리테인 객체로 참조하는 퍼시스트 레퍼런스

persisting reference다. (ARC는 스트롱 또는 리테인 레퍼런스를 호출한다.)

스위프트에서는 메모리 관리 방법을 변경하기 위해 레퍼런스 타입 변수를 weak 또는

unowned로 선언할 수 있다.

<br/>

**weak:**

weak 레퍼런스는 강력한 ARC 가능을 이용한다. 레퍼런스가 약한 경우 ARC는 이에 할당된

객체를 리테인하지 않는다. 이 경우 댕글링 포인터를 남기고 잠재적인 충돌 위험을 남긴채

뒤에서 객체가 소멸될 수 있음을 의미하기 때문에 이는 매우 위험해 보이지만,

ARC는 이런 경우에 모든 위크 레퍼런스와 할당된 모든 객체를 추적한다. 그런 객체의

리테인 카운트가 0으로 떨어지고 객체가 막 소멸되려고 할 때 ARC는 살짝 들어가서 

레퍼런스에 nil을 할당해버린다. 즉, 스위프트에서 약한 참조는 ARC가 그 작업을 수행할 수

있도록 var로 옵셔널이 선언돼야 한다. 그래서 옵셔널을 지속적으로 사용하면 안 좋은 상황에

직면하지 않을 수 있다.

<br/>

**unowned:**

unowned 레퍼런스는 앞서 언급한 상황과 전혀 다르다. 

ARC에게 메모리 관리를 완전히 맡기게 되고, 이 레퍼런스에 무엇인가 할당될 때 

전혀 메모를 관리를 하지 않는다. 객체가 소멸된 객체를 참조한 다면 댕글링 포인터가 

계속 존재하기 때문에, 앱이 충돌될 수 있어 매우 위험하다.

객체가 소멸될지 안 될지 모르는 경우에는 unowned를 절대 사용하지 말아야 한다. 

객체가 이를 참조하는 객체보다 더 오래 살 경우에는 unowned를 사용해도 안전하다. 

그래서 unowned 객체는 참조하는 객체 없이 한 번에 한 번만 할당 되는 단일 객체가 

돼야 한다.

<br/>

실제 상황에서 weak는 객체를 델리게이트에 연결할 때 일반적으로 사용된다.

델리게이트는 독립적인 엔티티다. 다른 객체가 그의 델리게이트에게 오너십을 요청할 이유는

없고, 실제로 객체는 그 델리게이트의 오너가 아니라 서번트servant이다. 

오너십이 있는 경우에는 종종 다른 방식으로 실행된다. 객체 A가 객체 B를 생성하고 

리테인할 수 있으며 스스로 객체 B의 델리게이트가 될 수 있다. 이는 잠재적인 리테인 사이클

이다. 그러므로 모든 델리게이트는 위크 레퍼런스로 선언돼야 한다.

코드에서 ARC를 사용하더라도 ARC를 사용하는 코코아 코드에서는 메모리 관리에 관련된

실수가 여전히 발생할 수 있다. 네비게이션컨트롤러의 델리게이트와 같은 레퍼런스는 

이를 가리키는 객체가 사라지면 가비지를 가리키는 댕길링 포인터가 될 수있다. 

여기에 메시지를 보내려고 하면 앱은 충돌하고 한참뒤에 오류가 발생하기 때문에 앱의

충돌 원인을 알아내기가 매우 어렵다. 

이런 문제가 발생했을 때 해결 방법은 어떤 객체에 네비게이션컨트롤러의 델리게이트처럼 

ARC를 사용하지 않는 unsafe 레퍼런스를 할당한다. 이 레퍼런스가 여전히 존재하는 상태에서

객체가 막 소멸하려고 한다면, nil (또는 다른 객체)을 레퍼런스에 할당해야 오류없이 

렌더링된다.

<br/>

<br/>









<br/>

<br/>
