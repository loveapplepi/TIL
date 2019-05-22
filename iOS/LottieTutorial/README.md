## Lottie Animation

<br/>

[After Effects 애니메이션을 JSON 데이터 형식으로 추출](https://airbnb.io/lottie/#/after-effects)해서 애니메이션을 만들수 있다.

<br/>

<br/>

적용할 프로젝트로 이동해서 

```
$ pod init
```

<br/>

<br/>

Podfile에 `pod 'lottie-ios'` 추가 하고,

```
$ pod install
```

<br/>

<br/>

```swift
import Lottie
```

<br/>

<br/>

[lottiefiles](https://lottiefiles.com/) 에서 원하는 json 파일을 다운받아서 프로젝트에 넣고

`AnimationView(name: "data") `  여기 `"data"` 에  json 파일 이름을 넣는다.

프레임 설정을 해주고, addSubView, play 함수 호출해주면 끝.

여기서 옵션을 설정할 수 있는데

반복 모드 기본값은 **.playOnce** 이고

애니메이션 속도 기본값은 **1**로 설정되어있다.

```swift
        let animationView = AnimationView(name: "data")
        animationView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        view.center = self.view.center
        view.contentMode = .scaleToFill
        
        view.addSubview(animationView)
        animationView.play()
        
        animationView.loopMode = .loop 
        animationView.animationSpeed = 0.5
```

<br/>

<br/>

Lottie animation에 다른 view animation을 추가할수도 있다.

```swift
        let timing = UICubicTimingParameters(animationCurve: .easeInOut)
        let animator = UIViewPropertyAnimator(duration: 2.0, timingParameters: timing)
        
        animator.addAnimations {
            animationView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }
        
        animator.addCompletion {_ in
            animationView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
        
        animator.startAnimation(afterDelay: 0.3)
```





<br/>

<br/>

### 참고링크

* [aribnb_lottie](https://airbnb.io/lottie/#/README)

* [lottiefiles](https://lottiefiles.com/)

* [IOS Swift Animation using Lottie](https://qiita.com/phanithken/items/b4154914524b09075587)

