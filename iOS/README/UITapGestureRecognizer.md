## UITapGestureRecognizer

<br/>

```swift
let labelTapGesture = UITapGestureRecognizer(target: self, action: #selector(moveToUserPage))

self.userNameLabel.isUserInteractionEnabled = true
       self.userNameLabel.addGestureRecognizer(labelTapGesture)
```

tapGesture 인식기를 생성하고 탭 발생시 실행될 함수를 selector 해준다.

생성된 탭 인식기를 label에 addGestureRecognizer 해준다.

그 전에 레이블을 isUserInteractionEnabled를 true 해줘야 한다. 

