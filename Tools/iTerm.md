# iTerm 설치 및 셋팅 19.04.25



#### 🛠 iTerm2 설치 

[링크](https://www.iterm2.com/downloads.html)로 이동해서 iTerm2 가장 최신 버전으로 설치 한다.

<br/>

<br/>

#### 🎨 컬러 테마 적용

[iTerm2-Color-Schemes](https://github.com/mbadolato/iTerm2-Color-Schemes) 에서 다양한 컬러 스키마를 다운받을 수 있다.

`Preferences` -> `Profiles` -> `Colors` -> Color Preset에서 

다운받은 폴더 schemes의 테마중 원하는걸 import 한다.

<br/>

<br/>

#### brew 설치

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

<br/>

<br/>

#### Oh my ZSH 설치

```
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

<br/>



여기까지 하면 현재 디렉토리 경로가 보이지 않고 `>` 이렇게만 보일 것이다.

이때 **agnoster** 테마를 적용해주면 되는데 이 테마를 적용하면 현재 디렉토리에서 

Git 상태를 알수있다. 

<br/>

<br/>

#### 🤓 zshrc 파일 수정하기

```
vi ~/.zshrc 
open ~/.zshrc
```

Zshrc 파일을 열고 위쪽에서 5~15번째줄 쯤에 

**ZSH_THEME=”robyrussell"** 테마를  **ZSH_THEME=”agnoster"** 로 변경해준다.

그럼 폰트가 깨질 것이다. 😱

[D2코딩폰트](https://github.com/naver/d2codingfont)를 적용해 보자. 

이 과정은 컬러 테마 적용 과정과 동일한데 Colors 가 아닌 Text로 가서 Change Font를 D2Coding폰트로 선택하면 된다.

<br/>

<br/>

#### ➡️ 명령어 입력 시 New Line 적용하기

터미널에 입력해서 theme 파일을 열자.

```
vi ~/.oh-my-zsh/themes/agnoster.zsh-theme
//or
open -a TextEdit ~/.oh-my-zsh/themes/agnoster.zsh-theme
```

하단으로 쭉 내려서 

```
build_prompt() {
  RETVAL=$?
  prompt_status
  prompt_virtualenv
  prompt_context
  prompt_dir
  prompt_git
  prompt_bzr
  prompt_hg
  prompt_newline //꼭 prompt_end 위에 순서 지켜서 추가
  prompt_end
}

prompt_newline() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n "%{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR
%{%k%F{blue}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi

  echo -n "%{%f%}"
  CURRENT_BG=''
}
```

<br/>

<br/>

#### ✨ Syntax Hightlight 적용

사용할수 있는 명령어라면 초록색으로 하이라이팅 되고 사용할수 없는 명령어라면 빨간색으로 표시된다.

```
//brew를 통해 설치
brew install zsh-syntax-highlighting

//플러그인을 적용
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

<br/>

<br/>

<br/>



### 참고링크

[Oh My ZSH + iTerm2로 터미널을 더 강력하게_해리의 유목코딩]([https://medium.com/harrythegreat/oh-my-zsh-iterm2%EB%A1%9C-%ED%84%B0%EB%AF%B8%EB%84%90%EC%9D%84-%EB%8D%94-%EA%B0%95%EB%A0%A5%ED%95%98%EA%B2%8C-a105f2c01bec](https://medium.com/harrythegreat/oh-my-zsh-iterm2로-터미널을-더-강력하게-a105f2c01bec))









