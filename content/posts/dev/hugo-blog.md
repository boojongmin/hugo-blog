---
title: "Hugo Blog"
date: 2019-09-25T15:56:56+09:00
draft: false
---

# Hugo란
static page generator로 markdown 문법으로 컨텐츠를 작성하면 html 파일로 만들주고 이를 theme에서 정의된대로 컨텐츠가 조합되서 정적 사이트를 만들어주는 툴.

# 설치 방법
[mac Quick Start](https://gohugo.io/getting-started/quick-start/)

필자의 경우는 ubuntu 환경이라서 [Install Hugo](https://gohugo.io/getting-started/installing) 페리지를 참조.
(필자는 windows10이고 WSL환경에서 ubuntu로 환경. root로 작업함.)


```
apt update
apt install hugo
apt install asciidoctor
```

# Site(블로그) 생성

```shell
$ hugo new site blog
$ cd blog
$ ls
archetypes  config.toml  content  data  layouts  static  themes
```

# 테마 선택
[hugo themes](https://themes.gohugo.io/)
개인적으로는 심플하고 눈에 피로감을 덜주며 읽기 좋은 테마를 선택을 희망하여 [hugo-dusk](https://themes.gohugo.io/hugo-dusk/)를 선택

# 테마 설치
```
git init
git submodule add https://github.com/gyorb/hugo-dusk.git themes/hugo-dusk
echo 'theme = "hugo-dusk"' >> config.toml
```

# 컨텐츠 생성
```
$ hugo new posts/my-first-post.md
$ cat content/posts/my-first-post.md
---
title: "My First Post"
date: 2019-09-25T09:15:13+09:00
draft: true
---
```

# Hugo 서버 실행
```
$ hugo server -D
```
브라우저로 [ http://localhost:1313](http://localhost:1313) 확인

# 테마 설정
```
$ vi config.toml

$ cat config.toml
baseURL = "https://boojongmin.github.io/"
languageCode = "ko-KR"
title = "기억 저장소"
theme = "hugo-dusk"
```

# 댓글 설정

#### github repo 생성 및 댓글 기능 사용전 설정
	댓글은 utterance를 사용한다. utterance는 깃허브의 issue를 이용하여 댓글을 만들어주는데 utterance app이 나의 repo에 접근이 가능해야하므로 먼저 깃허브 저장소를 만들고 utterance app에 권한을 줘야한다.

[utterance 설명](https://utteranc.es/?installation_id=2153892&setup_action=install)


1. repo 생성 [boojongmin/hugo-blog](https://github.com/boojongmin/hugo-blog) repo
1. 아래의 링크에서 utterance app 권한 부여
	- [https://github.com/apps/utterances](https://github.com/apps/utterances)
	- 필자의 경우는 boojongmin/hugo-blog repo에만 권한을 부여함.


#### hugo template 수정

```
cd /root/blog/blog/themes/hugo-dusk/layouts/partials
vi social-links-footer.html
```
아래와 같이 scrip문을 추가해준다.

```html
<div class="social-links-footer">

  {{with .Site.Params.email}}
  <a href="mailto:{{.}}"><div class="social-link">Email</div></a>
  {{end}}

<!-- 생략 -->

  <div class="social-link">
  <a href="{{ .Site.RSSLink }}" target="_blank">RSS</a>
  </div>

</div>
<div>
        <script src="https://utteranc.es/client.js"
                        repo="boojongmin/hugo-blog"
                        issue-term="{{ .File.Path }}"
                        theme="github-light"
                        crossorigin="anonymous"
                async>
        </script>
</div>

```

#### 확인 
```
$ hugo serve -D

```
댓글 나오는지 브라우저에서 [http://localhost:1313/posts/my-first-post/](http://localhost:1313/posts/my-first-post/) 확인.


# 블로그 배포


#### 정적페이지 빌드
```
$ vi content/posts/my-first-post.md
$ cat content/posts/my-first-post.md
---
title: "My First Post"
date: 2019-09-25T09:15:13+09:00
draft: false
---
$ hugo
Building sites … WARN 2019/09/25 11:57:42 .File.Path on zero object. Wrap it in if or with: {{ with .File }}{{ .Path }}{{ end }}

                   | EN
+------------------+----+
  Pages            | 10
  Paginator pages  |  0
  Non-page files   |  0
  Static files     |  2
  Processed images |  0
  Aliases          |  1
  Sitemaps         |  1
  Cleaned          |  0

Total in 86 ms
```

#### hugo-blog repo 및 user gitpages 생성

	Gihub pages에서 User/Organization Pages를 만들어줘야한다.

hugo blog를 작성할 파일을 저장할 저장소는 생성
- 필자는 *boojongmin/hugo-blog*

정정 페이지를 호스팅할 user github pages 생성
- "{계정명}.github.io"으로 repo 생성
- 필자는 *boojongmin.github.io*로 생성함.

#### 2개의 github repo에 푸시(1. hugo-blog, 2. boojongmin.github.io)

[https://gohugo.io/hosting-and-deployment/hosting-on-github/](https://gohugo.io/hosting-and-deployment/hosting-on-github/)

```
$ git remote add origin https://github.com/boojongmin/hugo-blog.git

$ rm -rf public 

$ git submodule add -b master https://github.com/boojongmin/boojongmin.github.io.git  public

$ chmod +x deploy.sh
```

deploy.sh 파일을 만들고 아래의 내용을 복사
```
#!/bin/sh

# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master
```

deploy.sh에 실행 권한 부여 및 deploy.sh 실행
```
$ chmod +x deploy.sh
$ ./deploy.sh
```

# 브라우저에서 확인
https://boojongmin.github.io


# 기타
# 참고: 트러블 슈팅
필자는 hugo 버전 문제로 go 를 설치하고 hugo를 github에서 clone 받아 build를 하였다.

```
$ git clone https://github.com/gohugoio/hugo.git
$ cd hugo
$ go install --tags extended
$ hugo version
Hugo Static Site Generator v0.59.0-DEV/extended linux/amd64 BuildDate: unknown

```



