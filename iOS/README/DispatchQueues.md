## Dispatch Queues 

<br/>

GCD (Grand Cental Dispatch) queues 는 task(앱이 수행해야 하는 작업) 수행을 위한 

강력한 도구이다.

비동기/동기식으로 임의의 코드 블록을 수행할 수 있다.

dispatch queues 는 FIFO 선입선출 구조이다. 

GCD는 자동으로 일부 dispatch queues를 제공하지만 특정 용도로 작성할 수 있는 다른 

큐를 제공한다.

<br/>

다음은 앱에서 사용할수 있는 dispatch queues 타입과 사용방법이다.

* Serial queues(private dispatch queues) : 큐에 추가된 순서대로 한번의 하나의 task를 실행한다. 각 큐는 모든 큐와 관련하여 동시에 작동한다. 즉 각 큐는 한 번에 하나의 task만 실행하지만, 최대 4개의 task가 각 큐에서 동시에 실행될 수 있다.
* Concurrent queues(global dispatch queues) : 동시에 하나 이상의 task를 실행하지만 task는 큐에 추가된 순서대로 계속 시작된다. 현재 실행중인 task는 고유한 쓰레드에서 실행된다. 특정 시점에 실행되는 정확한 task의 수는 가변적이고 시스템 조건에 따라 다르다. 
* Main dispatch queue : main 쓰레드에서 task를 실행하는 전역적으로 사용가능한 serial queue이다. 이 큐는 앱의 실행루프와 함께 동작하여 큐에 있는 task의 실행을 실행루프에 연결된 다른 이벤트 소스의 실행과 얽힌다. 

앱의 동시성을 추가할 때 dispatch queues는 쓰레드에 비해 몇 가지 이점을 제공한다. 

work-queue(작업 큐) 프로그래밍 모델의 단순성.  쓰레드를 사용하면 수행할 작업과 쓰레드 

자체의 생성 및 관리를 위한 코드를 모두 작성해야 한다. dispatch queues를 사용하면, 

모든 쓰레드 생성 및 관리를 시스템이 처리한다. 그리고 시스템은 일반적으로 쓰레드를 직접 

작성한 경우보다 빨리 task를 실행할 수 있다.

<br/>

dispatch queues 코드 작성의 핵심은 독립적이고, 비동기적으로 실행되는 task를 설계하는 

것이다. (이는 실제로 쓰레에도 해당된다. 단 dispatch queues의 장적음 예측 가능성이다.)

예를 들어 동일한 공유 리소스에 접근 하지만, 다른 쓰레드에서 실행되는 두가지 task 가 있는 

경우, 쓰레드가 먼저 리소스를 수정할 수 있으므로 두 task가 동시에 해당 리소스를 수정하지

못하도록 lock을 해야 한다. 하지만 dispatch queues를 사용하면 한 번에 하나의 task만

자원을 수정하도록 할 수 있다. 이 queue-based synchronization타입은 lock보다 

효율적이다. lock는 경쟁/비경쟁의 경우 항상 고가의 커널 트랩을 필요하는 반면,

dispatch queue는 주로 앱의 프로세스 공간에서 작동하고 absolutely necessary에만 

커널을 호출하기 때문이다.

두 개의 쓰레드가 동시에 잠금을 사용하면, 쓰레드가 제공하는 동시성이 손실되거나 크게

감소한다. 더 중요한 것은 쓰레드 모델은 커널과 사용자 공간 메모를 모두 차지하는 두 개의

쓰레드를 생성해야 한다는 것이다. dispatch queues는 쓰레드에 대해 동일한 메모리 

패널티를 지불하지 않으며 사용하는 쓰레드는 차단block 되지 않는다.



#### Queue-Related Technologies

```
Dispatch groups : Dispatch groups은 완료(completion)을 위해 블록 객체 집합을 모니터링 하는 방법입니다. 그룹은 필요에 따라 동기적/비동기적으로 블록을 모니터링 할 수 있습니다. 그룹은 다른 task의 완료 여부에 따라 코드에 유용한 동기화 메커니즘을 제공합니다.



Dispatch semaphores : Dispatch semaphores는 전통적인 세마포어와 유사하지만, 일반적으로 더 효율적입니다. 세마포어를 사용 할 수 없기 때문에 호출 쓰레드(calling thread)를 차단해야하는 경우에만 세마포어가 커널로 호출됩니다. 세마포어를 사용 할 수 있으면, 커널 호출이 수행되지 않습니다. 



Dispatch sources : dispatch source는 특정 타입 시스템 이벤트에 대한 응답(response)으로 notifications을 생성합니다. Dispatch sources를 사용하여 프로세스 notifications, 신호(signal) 및 descriptor events와 같은 이벤트를 모니터링 할 수 있습니다. 이벤트가 발생하면 Dispatch sources는 처리를 위해 지정된 dispatch queue에 비동기적으로 task코드를 제출(submit)합니다. 



출처: https://zeddios.tistory.com/513 [ZeddiOS]
```



<br/>









### 참고링크

* [Concurrency Programming Guide - Dispatch Queues_zedd](https://zeddios.tistory.com/513) 
* [GCD - Dispatch Queue사용법 (1)_zedd](https://zeddios.tistory.com/516)

