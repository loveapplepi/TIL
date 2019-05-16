## UserNotifications

<br/>

**앱에서 보내는 푸시 알림 기능**

<br/>

UserNotifications import 하고

유저한테 푸시 알림 권한을 요청하는 함수를 호출한다.

completionHandler에서 didAllow로 권한을 허용했는지 Bool값으로 확인할수있다.

```swift
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions, completionHandler: {
            didAllow, Error in
            print(didAllow)
        })
        
    }

}
```

<br/>

<br/>

UNMutableNotificationContent 클래스로 푸시 알림에 들어갈 컨텐츠를 지정할수 있다.

<br/>

<br/>

<br/>

<br/>

<br/>

<br/>

<br/>

<br/>

<br/>



