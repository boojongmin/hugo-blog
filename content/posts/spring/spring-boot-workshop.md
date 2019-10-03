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
  - ```
table.table>(thead>tr>(th[scope=col]>{#})+(th[scope=col]>{username})+(th[scope=col]>{password}))+(tbody>tr>td[scope=row]+td+td)

```) 
- th[scope=col] [scope attribute](https://webisfree.com/2015-10-12/[웹접근성]-table에서-scope-속성-사용하기)
- [thymeleaf](https://www.thymeleaf.org/doc/tutorials/3.0/usingthymeleaf.html)

#### thmeleaf 사용법
[thymeleaf layout](https://www.thymeleaf.org/doc/articles/layouts.html)
[Spring MVC and Thmeleaf](https://www.thymeleaf.org/doc/articles/springmvcaccessdata.html)


#### spring-data-common
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

#### DelegatingPasswordEncoder
[DelegatingPasswordEncoder](https://docs.spring.io/spring-security/site/docs/current/api/org/springframework/security/crypto/password/DelegatingPasswordEncoder.html)


#### form login
[form-javaconfig](https://docs.spring.io/spring-security/site/docs/current/guides/html5/form-javaconfig.html)

#### Remember-Me Authentication
[remember-me authentication](https://docs.spring.io/spring-security/site/docs/5.2.0.RELEASE/reference/htmlsingle/#ns-remember-me)
[baeldung](https://www.baeldung.com/spring-security-remember-me)














#### logging level
[Log Levels](https://docs.spring.io/spring-boot/docs/2.2.0.M6/reference/html/spring-boot-features.html#boot-features-custom-log-levels)