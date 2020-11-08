---
title: "Webflux NioEventLoop 살짝 살펴보기"
date: 2020-11-08T23:17:59+09:00
draft: false
---

### 들어가기전

웹플럭스 이벤트루프 소스를 언제는 보겠다 생각했었는데. 어쩌다보니 이제 보게되었다. 뒤돌아서면 까먹으니 간단히 메모형태로 정리

### 본론

> io.netty.channel.nio.NioEventLoop

![](../../2020-11-08-23-21-10.png)


![](../../2020-11-08-23-22-25.png)

NioEventLoop는 독립된 Thread로 실행되므로 run메서드가 최초 동작. for(;;)에서 보면 알 수 있듯이 무한 loop를 돌리고 client 요청이 오면 저 selectCnt에 값이 1 증가함.

![](../../2020-11-08-23-25-31.png)

요청이 들어오면 processSelectedKeysOptimized 메서드에서 

![](../2020-11-08-23-26-40.png)

위의 netty가 만들어주는 selectedKeySet에서 값을 가져와서 처리

![](../2020-11-08-23-29-21.png)
![](../2020-11-08-23-28-45.png)

unsafe.read() 이후 client 요청 데이터를 읽는 것으로 보임(TODO bytebuffer로 읽기는 하는데 어디에 저장하는지는 못찾음)

![](../2020-11-08-23-34-55.png)

io.netty.handler.codec.ByteToMessageDecoder 에서 byte에서 http 전문(문자열)을 만들어냄.


![](../2020-11-08-23-38-09.png)

io.netty.channel.AbstractChannelHandlerContext <- netty가 http 처리를 위한 마지막 클래스



reactor.netty.channel.ChannelOperationsHandler 여기에서

![](../2020-11-08-23-40-29.png)
위에 부분이 실행되는데

![](../2020-11-08-23-40-02.png)

ChannelOperations은 netty와 reactor 관련 인터페이스들이 있다.

![](../2020-11-08-23-42-14.png)

onInboundNext 란 메서드가 실행되면 msg 객체는 HttpRequest 코덱임을 확인하면서 코드가 실행되는데 isHttp2 체크하는 부분이 흥미롭다. 


reactor.netty.http.server.HttpTrafficHandler 이 클래스외 reactor netty에서 http 처리를 한참을 진행한후

![](../2020-11-09-00-00-42.png)
위의 코드에서 드디어 ServerWebExchange를 만날 수 있게 됨.(TODO ServerWebExchange 만드는 부분 확인 필요.)

reflection을 이용해서 bean을 invoke하는데

![](../2020-11-09-00-02-11.png)

![](../2020-11-09-00-02-58.png)
내가 만든 controller를 호출하는 것을 확인할 수 있다.

