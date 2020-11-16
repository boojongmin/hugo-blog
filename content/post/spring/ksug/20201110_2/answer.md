---
title: "KSUG 20201110 답변"
date: 2020-11-10T20:41:55+09:00
---
자야하는 관계로 간단하게 작성.


## 질문
![](../2020-11-10-20-42-35.png)

## 질문자가 모르는 것

gradle의 task에 대한 이해.

## 답변

```
안녕하세요! 젠킨스와 Git Gradle을 이용해 스프링프로젝트를 AWS에 배포하는 공부하면서 궁금증이 생겨서 질문드립니다.
1. git에서 특정 브랜치에 푸시 -> git hook이 젠킨스에 걸려서 jenkins에서 파이프라인 실행 -> jenkins 안에서 gradle test를 실행 
  -> 테스트실패할 경우 CI가 실패했다는 알림을 슬랙으로 알림 이러한 과정을 생각하고 있는데, 마지막 gradle test를 실행한 후에 테스트 실패시 pipeline job들을 멈추려고 하는데 이게 가능한가요?
2. gradle build를 실행할 경우 gradle build안에는 jar로 압축하는 task와 test를 실행하는 task가 따로 동작하게 되어서 테스트가 실패해도 jar가 생성되더라구요! 그래서 생각한게 gradle test -> gradle build 인데 이게 맞는 순서일까요?
3. 프로덕트 환경에선 여러분은 어떻게 구성하시는지 궁금합니다!
```

위의 질문에서 하나의 task가 실패하면 다음 task로 동작하지 않는다.

그리고 작성자는 test 이후에 jar package가 이루어진다고 판단했다.(물론 나도 그럴거라고 생각은 했었다.)

하지만 내가 테스트해본 결과 그렇지 않다는 것을 알게 되었다.

아마 질문자는 테스트를 하는 방법을 모르고 있는 것 같아 정리를한다.

#### 1. task 확인

gradle에서는 `gradle tasks` 라고 명령을 내리면 task들을 볼 수 있다.

![](../2020-11-10-20-48-08.png)


#### 2. task 상세 확인

` gradle help --task build`를 통해 태스크 상세를 본다. 아래에 group에  build라고 나와있는 것을 확인할 수 있다.

![](../2020-11-10-20-49-38.png)

#### 3. task group 확인

`gradle tasks --group build` build란 태스크는 여러 task들의 그룹으로 되어있음을 확인할 수 있다.

![](../2020-11-10-20-53-00.png)


#### 4. gradle logging


하지만 나는 위의 task들의 순서가 보장되는지 믿을 수 없어 실제로 실행해보았다.

단순히 gradle build만하면 로그가 안찍히므로 

`gradle build --debug` 또는 `gradle build --info`를 통해 로깅을 했다.

---
> Task `:compileJava` UP-TO-DATE
Resolving global dependency management for project 'demo'
Excluding []
Excluding []
Caching disabled for task ':compileJava' because:
  Build cache is disabled
Skipping task ':compileJava' as it is up-to-date.
:compileJava (Thread[Execution worker for ':',5,main]) completed. Took 0.241 secs.
:processResources (Thread[Execution worker for ':',5,main]) started.

> Task `:processResources` UP-TO-DATE
Caching disabled for task ':processResources' because:
  Build cache is disabled
Skipping task ':processResources' as it is up-to-date.
:processResources (Thread[Execution worker for ':',5,main]) completed. Took 0.002 secs.
:classes (Thread[Execution worker for ':',5,main]) started.

> Task `:classes` UP-TO-DATE
Skipping task ':classes' as it has no actions.
:classes (Thread[Execution worker for ':',5,main]) completed. Took 0.0 secs.
:bootJar (Thread[Execution worker for ':',5,main]) started.

> Task `:bootJar` UP-TO-DATE
Excluding []
Excluding []
Excluding []
Caching disabled for task ':bootJar' because:
  Build cache is disabled
Skipping task ':bootJar' as it is up-to-date.
:bootJar (Thread[Execution worker for ':',5,main]) completed. Took 0.055 secs.
:jar (Thread[Execution worker for ':',5,main]) started.

> Task `:jar` SKIPPED
Skipping task ':jar' as task onlyIf is false.
:jar (Thread[Execution worker for ':',5,main]) completed. Took 0.0 secs.
:assemble (Thread[Execution worker for ':',5,main]) started.

> Task `:assemble` UP-TO-DATE
Skipping task ':assemble' as it has no actions.
:assemble (Thread[Execution worker for ':',5,main]) completed. Took 0.0 secs.
:compileTestJava (Thread[Execution worker for ':',5,main]) started.

> Task `:compileTestJava` UP-TO-DATE
Excluding []
Excluding []
Caching disabled for task ':compileTestJava' because:
  Build cache is disabled
Skipping task ':compileTestJava' as it is up-to-date.
:compileTestJava (Thread[Execution worker for ':',5,main]) completed. Took 0.107 secs.
:processTestResources (Thread[Execution worker for ':',5,main]) started.

> Task `:processTestResources` NO-SOURCE
file or directory 'C:\Users\boojo\Downloads\demo\demo\src\test\resources', not found
Skipping task ':processTestResources' as it has no source files and no previous output files.
:processTestResources (Thread[Execution worker for ':',5,main]) completed. Took 0.0 secs.
:testClasses (Thread[Execution worker for ':',5,main]) started.

> Task `:testClasses` UP-TO-DATE
Skipping task ':testClasses' as it has no actions.
:testClasses (Thread[Execution worker for ':',5,main]) completed. Took 0.0 secs.
:test (Thread[Execution worker for ':',5,main]) started.
Gradle Test Executor 8 started executing tests.

> Task `:test`
Excluding []
Caching disabled for task ':test' because:
  Build cache is disabled
Task ':test' is not up-to-date because:
  Task has failed previously.


----
위에 로그를 보면 `test` task는 맨 마지막에 실행되므로 jar 파일이 만들어지는 것은 당연한 결과였다.