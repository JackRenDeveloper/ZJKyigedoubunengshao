//
//  mstimer.h
//  ZJKyigedoubunengshao
//
//  Created by qianfeng007 on 15/10/14.
//  Copyright (c) 2015年 钟继康. All rights reserved.
//

#ifndef ZJKyigedoubunengshao_mstimer_h
#define ZJKyigedoubunengshao_mstimer_h


1. 只初始化一次testTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(testTimer) userInfo:nil repeats:YES];
[testTimer fire];//有没有这句话，只是控制第一次是否执行
使用该方法，定时器已经被放到当前线程中
只初始化一次，在1.0秒后，自动调用testTimer方法
只初始化一次，需要循环使用定时器可以用以下方法，定时器调用不会出现混乱
在点击按钮的方法里写

- (void)btnAction
{
    [testTimer setFireDate:[NSDate distantPast]];
}
在定时器调用的方法里写

- (void)testTimer
{
    [testTimer setFireDate:[NSDate distantFuture]];
}
2.多次初始化testTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(testTimer) userInfo:nilrepeats:YES];

[testTimer fire];在初始化后，立即执行testTimer方法
多次初始化，需要循环使用定时器可以用以下方法，定时器调用不会出现混乱
在点击按钮的方法里写

- (void)btnAction
{
    testTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(testTimer) userInfo:nil repeats:YES];
    [testTimer fire];
}
在定时器调用的方法里写

- (void)testTimer
{
    [testTimer invalidate];
}
3.定时器只调用一次某个方法，可以使用repeat＝＝NO，代码如下：


testTimer = [NSTimer scheduledTimerWithTimeInterval:10.0 target:self selector:@selector(testTimer) userInfo:nil repeats:NO];
[testTimer fire]; //定时器立即执行，执行一次之后就不再执行，注销掉这句后，延时10秒钟调用testTimer方法
类似于：

[self performSelector:@selector(testTimer) withObject:nil afterDelay:10.0];
4.  这种方式初始化代码，也只执行一次
testTimer =[NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(testTimer) userInfo:nil repeats:YES];
[testTimer fire];
这种方式使用，可以循环使用，其他使用与上面相同
testTimer =[NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(testTimer) userInfo:nil repeats:YES];
[testTimer fire];
[[NSRunLoop currentRunLoop] addTimer:testTimer forMode:NSDefaultRunLoopMode];

#endif
