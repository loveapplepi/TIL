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

```swift
        let content = UNMutableNotificationContent()
        
        content.title = "user Notification"
        content.subtitle = "user Notificaton tutorial"
        content.body = "push 알람 입니당"
        content.badge = 1
```

<br/>

<br/>

푸시 알람 **트리거** 지정를 지정하고, 알림을 요청한다.

알림 요청을 NotificationCenter에 추가하면 끝.

<br/>

```swift
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "noti", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
```

<br/>

프로젝트를 실행하고 버튼을 누르면 푸시 알림이 오고 앱에 배지1 표시가 된걸 확인할 수 있다.

<br/>

<br/>

<br/>

### 참고링크

[zedd_UserNotification사용해보기](https://zeddios.tistory.com/157)



