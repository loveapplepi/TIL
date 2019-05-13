## FCM을 사용해서 푸시 알람 받기

FCM 이란?

Firebase Cloud Messaging 

메세지를 전송할수 있는 서비스

쉽게 말하면 앱에서 푸시 알람 오는 서비스를 구현하는 것중 하나

GCM(google Cloud Messaging) 으로 구현하는 방법도 있다.

<br/>

<br/>

<img src="images/xcode.png" width="10%" align = "left">    먼저, Xcode 프로젝트 생성하기 





<br/>

<br/>

<img src="images/key.png" width="10%" align = "left"> 

다음은 키체인 접근 - 인증서 지원 - 인증 기관에서 인증서 요청을 한뒤

<br/>

<br/>

![img1](images/img1.png)

<br/>

<br/>

![img1](images/img2.png)



<br/> 

이메일주소를 적어주고 

- [x] 디스크에 저장됨
- [x] 본인이 키 쌍 정보 지정

두 항목을 체크해준 뒤에 `계속 ` 을 눌러서 저장 해준다.  (따로 관리할 파일을 만들어도 좋음)

<br/>

![img1](images/img3.png)

키 쌍 정보는 기본값 그대로 2048비트, RSA로 지정해주고 `계속`  

인증서 요청이 디스크에 생성되었습니다. 가 나오면 `완료`

