---
title: "Spring Boot Workshop"
date: 2019-10-01T09:12:18+09:00
draft: true
---

# day 1

### 개발환경세팅

#### linux,osx -> sdkman
	sdkman으로 개발환경 구축. windows 10의 경우는 choco로 안내.
[https://sdkman.io/install](https://sdkman.io/install)

```
$ curl -s "https://get.sdkman.io" | bash
$ source "$HOME/.sdkman/bin/sdkman-init.sh"
$ sdk version
$ sdk list java version
$ sdk install java  12.0.1.j9-adpt
$ sdk install gradle 5.6.2

```

#### windows -> chocolatey

[https://chocolatey.org/install](https://chocolatey.org/install)

[https://chocolatey.org/packages](https://chocolatey.org/packages)


```
> choco install openjdk12
> choco install gradle
```


#### starters
[Starters](https://docs.spring.io/spring-boot/docs/2.2.0.M6/reference/html/using-spring-boot.html#using-boot-starter)

#### 프로젝트 환경세팅
[https://start.spring.io/](https://start.spring.io/)


```
$ curl -o web.zip 'https://start.spring.io/starter.zip?type=gradle-project&language=java&bootVersion=2.2.0.M6&baseDir=web&groupId=kr.co.fastcampus.springboot&artifactId=web&name=web&description=springboot-workshop&packageName=kr.co.fastcampus.springboot.web&packaging=jar&javaVersion=11&dependencies=devtools&dependencies=lombok&dependencies=configuration-processor&dependencies=web&dependencies=thymeleaf&dependencies=data-jpa&dependencies=data-jdbc&dependencies=mysql&dependencies=h2&dependencies=restdocs'
$ unzip web.zip
```

#### Intellij 환경 세팅
- plugin 설치
  - rainbow brackets
  - atom material icons
  - lombok
- font 변경
  - [D2 Coding Ligature](https://github.com/naver/d2codingfont) 설치 
    - ligature(합자): 두개 이상의 문자가 합쳐져서 하나의 글자 모양으로 형성하는 것.
  - intellij font 적용
    - Settings > Editor > Font > D2Coding ligature, 16
- 환경 세팅
  - Settings > Editor > General > Code Folding 
    - 체크해제 
       - Imports, One-line methods, Closures, Generic constructor and method parameters, @suppressWarnings
  - Settings > build, Execution, Deployment > Compiler > Annotation Processors > Enable annotation processing 체크
- [Enable automaic compilation]
  -  Settings > build, Execution, Deployment > Compiler > Build project automatically 체크
  -  Appearance & Behavior > System Settings > Save files automatically if application is idle for. 10초
  - ctrl+shift+a(mac: cmd+shift+a) 에서 registry 검색 > compiler.automake.allow.when.app.running 체크

#### 기본적인 Intellij 학습
- [shortcut cheat sheet](https://resources.jetbrains.com/storage/products/intellij-idea/docs/IntelliJIDEA_ReferenceCard.pdf)
- create gradle multi-project: console
- Hello World 프로그램으로 간단히 intellij 학습하기.

```
gradle web-basic:bootRun
java -jar ./web-basic/build/libs/web-basic-0.0.1-SNAPSHOT.jar
```

#### devtools setting
application.properties 삭제 후 application.yml 생성.
[spring doc - appendix](https://docs.spring.io/spring-boot/docs/2.2.0.M6/reference/html/appendix.html#appendix)


#### bootstrap을 이용한 template 작성

- [https://getbootstrap.com/docs/4.3/getting-started/introduction/][https://getbootstrap.com/docs/4.3/getting-started/introduction/)
- [https://getbootstrap.com/docs/4.3/layout/overview/](https://getbootstrap.com/docs/4.3/layout/overview/)
- [emmet](https://docs.emmet.io
     ```
table.table>(thead>tr>(th[scope=col]>{#})+(th[scope=col]>{username})+(th[scope=col]>{password}))+(tbody>tr>td[scope=row]+td+td)

``` 
- th[scope=col] [scope attribute](https://webisfree.com/2015-10-12/[웹접근성]-table에서-scope-속성-사용하기)
- [thymeleaf](https://www.thymeleaf.org/doc/tutorials/3.0/usingthymeleaf.html)

#### thymeleaf 사용법
[thymeleaf layout](https://www.thymeleaf.org/doc/articles/layouts.html)
[Spring MVC and Thmeleaf](https://www.thymeleaf.org/doc/articles/springmvcaccessdata.html)


#### spring-data-common
[reference](https://docs.spring.io/spring-data/data-commons/docs/current/reference/html/#reference)

[maven repo](https://search.maven.org/artifact/org.springframework.data/spring-data-commons/2.2.0.RELEASE/jar)


#### paging
[jdbctemplate paging 참조](https://gist.github.com/mobynote/595b61d72a1a0363dc80b7eb785faef9)

#### database initialize
[initialize a database](https://docs.spring.io/spring-boot/docs/2.2.0.M6/reference/html/howto.html#howto-initialize-a-database-using-spring-jdbc)

#### spring-data-jdbc
[introducing spring data jdbc](https://spring.io/blog/2018/09/17/introducing-spring-data-jdbc)

#### @JdbcTest
[Auto-configured JDBC Tests](https://docs.spring.io/spring-boot/docs/2.2.0.M6/reference/html/spring-boot-features.html#boot-features-testing-spring-boot-applications-testing-autoconfigured-data-jdbc-test)


#### Mockito
[https://site.mockito.org/](https://site.mockito.org/)

[document](https://static.javadoc.io/org.mockito/mockito-core/3.1.0/org/mockito/Mockito.html)



#### @DataJdbcTest
[Auto-confiured Data JDBC Tests](https://docs.spring.io/spring-boot/docs/2.2.0.M6/reference/html/spring-boot-features.html#boot-features-testing-spring-boot-applications-testing-autoconfigured-data-jdbc-test)




#### 왜 스프링부트를 쓰는지 비교를 thymeleaf spring config랑 비교.
[참고](https://www.baeldung.com/thymeleaf-in-spring-mvc)

[maven repo]https://search.maven.org/artifact/org.thymeleaf/thymeleaf-spring5/3.0.11.RELEASE/jar)



## Day 2

#### spring security
[Security](https://docs.spring.io/spring-boot/docs/2.2.0.M6/reference/html/spring-boot-features.html#boot-features-security)

[Security 설명 한글](https://galid1.tistory.com/576?category=791456)

#### DelegatingPasswordEncoder
[DelegatingPasswordEncoder](https://docs.spring.io/spring-security/site/docs/current/api/org/springframework/security/crypto/password/DelegatingPasswordEncoder.html)


#### form login
[form-javaconfig](https://docs.spring.io/spring-security/site/docs/current/guides/html5/form-javaconfig.html)

#### Remember-Me Authentication
[remember-me authentication](https://docs.spring.io/spring-security/site/docs/5.2.0.RELEASE/reference/htmlsingle/#ns-remember-me)
[baeldung](https://www.baeldung.com/spring-security-remember-me)


#### antMatcher
[spring api](https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/util/AntPathMatcher.html)


#### mysql date type
[reference](https://dev.mysql.com/doc/refman/8.0/en/date-and-time-types.html)

#### jdbc reference & jdbc type mapping
[reference](https://docs.oracle.com/javadb/10.8.3.0/ref/crefjdbc12657.html)
[type mapping](https://docs.oracle.com/javadb/10.8.3.0/ref/rrefjdbc20377.html)


#### logging level
[Log Levels](https://docs.spring.io/spring-boot/docs/2.2.0.M6/reference/html/spring-boot-features.html#boot-features-custom-log-levels)



## Day 3

#### Jpa
[jsr-220](https://www.jcp.org/en/jsr/detail?id=220)

[jsr-220-pdf](https://download.oracle.com/otn-pub/jcp/ejb-3_0-fr-eval-oth-JSpec/ejb-3_0-fr-spec-persistence.pdf?AuthParam=1571017719_84c71fe0a9823656a77b492e2e8b9aa5)

[entity state](https://docs.jboss.org/hibernate/entitymanager/3.6/reference/en/html/objectstate.html#d0e1030)

[Entity Manager](https://docs.oracle.com/javaee/7/api/javax/persistence/EntityManager.html)

[springboot jpa log 설정](https://www.popit.kr/%EC%8A%A4%ED%94%84%EB%A7%81-%EB%B6%80%ED%8A%B8-auto-configuration%EA%B3%BC-jpa%ED%95%98%EC%9D%B4%EB%B2%84%EB%84%A4%EC%9D%B4%ED%8A%B8-sql%EB%AC%B8-%EB%A1%9C%EA%B9%85)

[hibernate criteria api](https://docs.oracle.com/javaee/6/api/javax/persistence/criteria/package-summary.html)

[jpql, criteia](https://www.objectdb.com/java/jpa/query/jpql/where)

[jpa query method](https://docs.spring.io/spring-data/jpa/docs/current/reference/html/#jpa.query-methods)

[jpa @query](https://docs.spring.io/spring-data/jpa/docs/current/reference/html/#jpa.query-methods.at-query)

[security mvc-authentication-principal](https://docs.spring.io/spring-security/site/docs/current/reference/html5/#mvc-authentication-principal)


```
## 에러처리

### The bean 'helloAccountRepository', defined in null, could not be registered. A bean with that name has already been defined in null and overriding is disabled.
## https://stackoverflow.com/questions/53723303/springboot-beandefinitionoverrideexception-invalid-bean-definition/53723731
## 'org.springframework.boot:spring-boot-starter-data-jdbc' <- 이 의존성 때문에 에러가 발생
#  main:
#    allow-bean-definition-overriding: true


```

## Day 4
#### Vue

[google trends react vs vue](https://trends.google.com/trends/explore?cat=733&date=today%205-y&q=vuejs,reactjs)

[vue cli router login example](https://medium.com/@zitko/structuring-a-vue-project-authentication-87032e5bfe16)

[vscode debugger](https://code.visualstudio.com/docs/editor/debugging)

[vscode debugger vuejs recipes](https://github.com/Microsoft/VSCode-recipes/tree/master/vuejs-cli)

#### oauth

[google api credentials](https://console.developers.google.com/apis/credentials)

[google signin javascript](https://developers.google.com/identity/sign-in/web/reference)

[facebook sigin oauth2 setting](https://developers.facebook.com/apps/2475606369171543/fb-login/settings/)

[vue-google-oauth2](https://www.npmjs.com/package/vue-google-oauth2)

[vue-google-oauth2 한글 블로그](https://medium.com/@jeongwooahn/vue-js-구글로그인-플러그인-vue-google-oauth2-184c2859c78a)

[spring security oauth2](https://projects.spring.io/spring-security-oauth/docs/oauth2.html)

[spring-boot-oauth2 reference](https://docs.spring.io/spring-boot/docs/2.2.0.RELEASE/reference/html/spring-boot-features.html#boot-features-security-oauth2)

[spring-boot-oauth2 tutorial](https://spring.io/guides/tutorials/spring-boot-oauth2/)

[spring-security-core oauth2](https://docs.spring.io/spring-security/site/docs/5.2.0.RELEASE/reference/htmlsingle/#oauth2)

[spring-security-boot oauth2](https://docs.spring.io/spring-security-oauth2-boot/docs/current-SNAPSHOT/reference/htmlsingle/)

[spring-security oauth baeldung](https://www.baeldung.com/spring-security-5-oauth2-login)

[spring-security-boot oauth](https://docs.spring.io/spring-security-oauth2-boot/docs/current-SNAPSHOT/reference/htmlsingle/)

[spring-security oauth series](https://www.callicoder.com/series/spring-security-react/)

[kakao talk oauth](https://galid1.tistory.com/582)

[spring oauth jwt](https://www.baeldung.com/spring-security-oauth-jwt)

[spring security autoconfigration 사용시 주의사항](https://hue9010.github.io/spring/OAuth2/)

[spring security 설명 한글 블로그](https://coding-start.tistory.com/153)

[spring security 한글 블로그 - good](https://flyburi.com/584)

[spring oauth2 한글 설명 블로그](https://coding-start.tistory.com/158?category=738631)

[spring oauth2 소셜인증](https://www.popit.kr/spring-security-oauth2-소셜-인증/)

[spring security oauth2 소셜인증 데이터베이스 저장](https://www.popit.kr/spring-security-oauth2-%EC%86%8C%EC%85%9C-%EC%9D%B8%EC%A6%9D-%EB%8D%B0%EC%9D%B4%ED%84%B0%EB%B2%A0%EC%9D%B4%EC%8A%A4-%EC%A0%80%EC%9E%A5/)


```
google>

http://localhost:8080/login/oauth2/code/google?state=eITp9RCxoz7xP0xgxucjSL6fT2__4no2b6jB0RZfX4w%3D&code=4/sgErYlPy6J4LbWwg2m7sLqVY5ej2tifxfqkzOqc3TtIcPkFssJ__9q6SYqF5EIVMBU7Nw8wMHKs3PmyhmbtsNIQ&scope=email+profile+openid+https://www.googleapis.com/auth/userinfo.profile+https://www.googleapis.com/auth/userinfo.email&authuser=0&hd=neofect.com&session_state=8ae2a5540374f7a6d3100e15bb09c0116b42edc6..2576&prompt=none

facebook> 

http://localhost:8080/login/oauth2/code/facebook?code=AQD8N7WCPaWvr4r_fBho3ZU7B0_4a93NeXKZwyz1QyRlqCUGkisEw1y2JozF6KJqkeCP6I9QeB3u0tsfRXazjgON_uw4qbPSM2_S0U6sZ3N8l2tp50Rwmj48vszeWbQU7YLrxtBGEbGrXyNCJrkPgwP2XNvofX9zexqZ7cv7x-EfiFgx3ISalVWTFTG15E2euxvjYMyJvnGslXPUhk55YjTYskn6akVMihLLJJZoUZq8QqoeSwbvzgSfLQVxWkh91PdvjsV4lPCnwcYJGpOIbbwd1d05XresUtqu_y4krA-TX4vFNs7XOhH59cWlfERNVzcr42gVD2M2GMZJRGJQ2t2a&state=5NZPtpwrjPMjzuU1oQDo2JnD6gSI167EV1kUpE7oy28%3D#_=_


```

```

  CommonOAuth2Provider

  OAuth2ClientAutoConfiguration

  springSecurityFilterChain

  DefaultSecurityFilterChain

  FilterChainProxy.getFilters

  OAuth2ClientRegistrationRepositoryConfiguration - InMemoryClientRegistrationRepository
  
  OAuth2WebSecurityConfiguration

```

oauth 내부 동작
```
OAuth2LoginAuthenticationFilter
- attemptAuthentication 

  OidcAuthorizationCodeAuthenticationProvider

  DefaultAuthorizationCodeTokenResponseClient.getTokenResponse <- access token을 가져옴.


AbstractAuthenticationProcessingFiltera
- successfulAuthentication <- SecurityContextHolder.getContext().setAuthentication(authResult);
  authResult: OAuth2AuthenticationToken


```

[참고 Spring security DebugFilter](https://stackoverflow.com/questions/30855252/how-do-i-enable-logging-for-spring-security/41823422)



##### authentication, authorization

[참조 블로그](https://velog.io/@ground4ekd/web-authentication)

[참조 블로그](https://umbum.tistory.com/367)

[authentication vs authorization](https://www.google.com/search?client=firefox-b-d&q=authentication+authorization)


처음에 oauth 설정을 보여주고 이건 authentication만 하고 authorization은 spring security가 세션을 만들고 security가 해주는것을 설명














