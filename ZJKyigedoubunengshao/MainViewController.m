//
//  MainViewController.m
//  ZJKyigedoubunengshao
//
//  Created by qianfeng007 on 15/10/13.
//  Copyright (c) 2015年 钟继康. All rights reserved.
//

#import "MainViewController.h"
#import "UIView+Common.h"
#import "OneView.h"
#import "OneView1.h"
#import "OneView2.h"
#import "OneView3.h"
@interface MainViewController ()<Dieon,Dieon1,Dieon2,Dieon3> {
    UIView  *_reloadView;
    UILabel  *_overTitle;
    UILabel *_twoLabel;
    UILabel *_fourLabel;
    UILabel *_groupLabel;
    OneView *viewA ;
    OneView1 *viewB;
    OneView2 *viewC;
    OneView3 *viewD;
    UILabel *_timeLabel;
    NSTimer *_timerTime;
    NSInteger _seconds;
    NSString *_bigNumber1;
    NSString *_bigNumber2;
    NSString *_bigNumber3;
    NSString *_appPath;
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _seconds = 0;
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    _timerTime = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(timeRun) userInfo:nil repeats:YES];
    [_timerTime setFireDate:[NSDate distantFuture]];
}

- (void)createData {
    _appPath = [NSHomeDirectory() stringByAppendingString:@"/data.txt"];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    _bigNumber1 = @"0";
    _bigNumber2 = @"0";
    _bigNumber3 = @"0";
    
    NSString *str1 = [NSString stringWithFormat:@"%@",[userDefaults valueForKey:@"bigNumber1"]];
    NSString *str2 = [NSString stringWithFormat:@"%@",[userDefaults valueForKey:@"bigNumber2"]];
    NSString *str3 = [NSString stringWithFormat:@"%@",[userDefaults valueForKey:@"bigNumber3"]];
    
    if (![str1 isEqualToString:@"(null)"]) {
        NSLog(@"--(%@)",str1);
        _bigNumber1 = str1;
    }
    if (![str2 isEqualToString:@"(null)"]) {
        NSLog(@"--(%@)",str2);
        _bigNumber2 = str2;
    }
    if (![str3 isEqualToString:@"(null)"]) {
        NSLog(@"--(%@)",str3);
        _bigNumber3 = str3;
    }
    
}


-(void)setHard:(int)hard {
    _hard = hard;
    [self createData];
    [self createTime];
    [self createView:_hard];
   viewA.delegte = self;
    viewB.delegte = self;
    viewC.delegte = self;
    viewD.delegte = self;
    [self createReloadView];
    [_timerTime setFireDate:[NSDate distantPast]];
}

-(void)createView:(int)k {
    if (k == 2) {
        viewA = [[OneView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height / k * 0, self.view.frame.size.width, self.view.frame.size.height / k)];
        viewA.begin = YES;
        
        [self.view addSubview:viewA];
        
        viewB = [[OneView1 alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height / k * 1, self.view.frame.size.width, self.view.frame.size.height / k)];
        viewB.begin = YES;
        [self.view addSubview:viewB];
    } if (k == 3) {
        viewA = [[OneView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height / k * 0, self.view.frame.size.width, self.view.frame.size.height / k)];
        viewA.begin = YES;
        [self.view addSubview:viewA];
        
        viewB = [[OneView1 alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height / k * 1, self.view.frame.size.width, self.view.frame.size.height / k)];
        viewB.begin = YES;
        [self.view addSubview:viewB];
        
        viewC = [[OneView2 alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height / k * 2, self.view.frame.size.width, self.view.frame.size.height / k)];
        viewC.begin = YES;
        [self.view addSubview:viewC];
    } if (k == 4) {
        viewA = [[OneView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height / k * 0, self.view.frame.size.width, self.view.frame.size.height / k)];
        viewA.begin = YES;
        [self.view addSubview:viewA];
        
        viewB = [[OneView1 alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height / k * 1, self.view.frame.size.width, self.view.frame.size.height / k)];
        viewB.begin = YES;
        [self.view addSubview:viewB];
        
        viewC = [[OneView2 alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height / k * 2, self.view.frame.size.width, self.view.frame.size.height / k)];
        viewC.begin = YES;
        [self.view addSubview:viewC];
        
        viewD = [[OneView3 alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height / k * 3, self.view.frame.size.width, self.view.frame.size.height / k)];
        viewD.begin = YES;
        [self.view addSubview:viewD];
    }
}

-(void)timeRun {
    _seconds++;
    
    //动态改变开始时间
    
    NSString * startTime=[NSString stringWithFormat:@"%02li:%02li.%02li",_seconds/100/60%60,_seconds/100%60,_seconds%100];
    _timeLabel.text=startTime;
    
    if (_seconds >2800 && _seconds <3100) {
        _groupLabel.alpha = 1;
    }else if (_seconds>5800 && _seconds < 6100) {
        _groupLabel.alpha = 1;
    }else {
        _groupLabel.alpha = 0;
    }
}

-(void)createTime {
    _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 70)];
    _timeLabel.center = CGPointMake(self.view.frame.size.width / 2, 40);
    _timeLabel.font = [UIFont boldSystemFontOfSize:20];
    _timeLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_timeLabel];
    
    _groupLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(_timeLabel.frame), CGRectGetMaxY(_timeLabel.frame), 150, 20)];
    _groupLabel.text = @"要加速了！！！";
    _groupLabel.textColor = [UIColor redColor];
    _groupLabel.adjustsFontSizeToFitWidth = YES;
    _groupLabel.font = [UIFont boldSystemFontOfSize:20];
    _groupLabel.alpha = 0;
    _groupLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_groupLabel];
}

#pragma mark -
#pragma mark -delegte

-(void)endAn {
    [UIView animateWithDuration:0.04 animations:^{
        self.view.frame = CGRectMake(minX(self.view), minY(self.view)+10, width(self.view.frame), height(self.view.frame));
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.05 animations:^{
            self.view.frame = CGRectMake(minX(self.view), minY(self.view)-16, width(self.view.frame), height(self.view.frame));
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.02 animations:^{
                self.view.frame = CGRectMake(minX(self.view), minY(self.view)+6, width(self.view.frame), height(self.view.frame));
            } completion:^(BOOL finished) {
                [self showReloadView];
                _seconds = 0;
            }];
        }];
    }];
}

-(NSInteger)die:(BOOL)die {
    if (die) {
        [viewB die];
        [viewC die];
        [viewD die];
        [_timerTime setFireDate:[NSDate distantFuture]];
        [self endAn];
        
    }
    return _seconds;
}

-(NSInteger)die1:(BOOL)die {
    if (die) {
        [viewA die];
        [viewC die];
        [viewD die];
        [_timerTime setFireDate:[NSDate distantFuture]];
        [self endAn];
        
    }
    return _seconds;
}

-(NSInteger)die2:(BOOL)die {
    if (die) {
        [viewB die];
        [viewA die];
        [viewD die];
        [_timerTime setFireDate:[NSDate distantFuture]];
        [self endAn];
        
    }
    return _seconds;
}

-(NSInteger)die3:(BOOL)die {
    if (die) {
        [viewB die];
        [viewC die];
        [viewA die];
        [_timerTime setFireDate:[NSDate distantFuture]];
        [self endAn];

    }
    return _seconds;
}






-(void)createReloadView {
    _reloadView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width(self.view.frame), height(self.view.frame))];
    _reloadView.hidden = YES;
    [self.view addSubview:_reloadView];
    
    UILabel *bgLabel = [[UILabel alloc] initWithFrame:_reloadView.frame];
    bgLabel.backgroundColor = [UIColor blackColor];
    bgLabel.alpha = 0.5;
    [_reloadView addSubview:bgLabel];
    
    _overTitle = [[UILabel alloc] initWithFrame:CGRectMake((width(self.view.frame)-250)/2, 50, 250, 100)];
    _overTitle.text = @"游戏结束!";
    _overTitle.textColor = [UIColor whiteColor];
    _overTitle.textAlignment = NSTextAlignmentCenter;
    _overTitle.font = [UIFont boldSystemFontOfSize:40];
    [_reloadView addSubview:_overTitle];
    
    UIView *littleView = [[UIView alloc] initWithFrame:CGRectMake(minX(_overTitle), maxY(_overTitle)+10, width(_overTitle.frame), 160)];
    littleView.backgroundColor = [UIColor whiteColor];
    littleView.layer.cornerRadius = 10;
    littleView.clipsToBounds = YES;
    [_reloadView addSubview:littleView];
    
    UILabel *oneLabel = [[UILabel alloc] initWithFrame:CGRectMake((width(littleView.frame)-100)/2, 5, 100, 20)];
    oneLabel.text = @"分数";
    oneLabel.textAlignment = NSTextAlignmentCenter;
    oneLabel.font = [UIFont systemFontOfSize:16];
    [littleView addSubview:oneLabel];
    
    _twoLabel = [[UILabel alloc] initWithFrame:CGRectMake(minX(oneLabel), maxY(oneLabel)+5, width(oneLabel.frame), 50)];
    _twoLabel.adjustsFontSizeToFitWidth = YES;
    _twoLabel.textAlignment = NSTextAlignmentCenter;
    _twoLabel.font = [UIFont boldSystemFontOfSize:32];
    [littleView addSubview:_twoLabel];
    
    UILabel *threeLabel = [[UILabel alloc] initWithFrame:CGRectMake(minX(oneLabel), maxY(_twoLabel)+5, width(oneLabel.frame), 20)];
    threeLabel.text = @"最佳";
    threeLabel.textAlignment = NSTextAlignmentCenter;
    threeLabel.font = [UIFont systemFontOfSize:16];
    [littleView addSubview:threeLabel];
    
    _fourLabel = [[UILabel alloc] initWithFrame:CGRectMake(minX(oneLabel), maxY(threeLabel)+5, width(oneLabel.frame), 50)];
    _fourLabel.textAlignment = NSTextAlignmentCenter;
    _fourLabel.adjustsFontSizeToFitWidth = YES;
    _fourLabel.font = [UIFont boldSystemFontOfSize:32];
    [littleView addSubview:_fourLabel];
    [self createButton];
}



- (void)createButton {
    
    NSArray *array = @[@"home",@"star",@"ccw"];
    
    CGFloat btnWidth = (width(self.view.frame)-10*2-180)/3;
    
    for (int i = 0; i < array.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(90+(btnWidth+10)*i, height(self.view.frame)-200, btnWidth, btnWidth);
        [button setImage:[UIImage imageNamed:array[i]] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor grayColor];
        button.layer.cornerRadius = 5.0;
        button.tag = 100+i;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 1) {
            button.alpha = 0;
        }
        [_reloadView addSubview:button];
    }
}

-(void)buttonClick:(UIButton *)button {
    NSInteger btnTag = button.tag-100;
    switch (btnTag) {
        case 0:
            [self dismissViewControllerAnimated:NO completion:^{
                
            }];
            break;
        case 2:
            for (UIView *someView in self.view.subviews) {
                [someView removeFromSuperview];
            }
            [self createData];
            [self createTime];
            [self createView:_hard];
            [self createReloadView];
            viewA.delegte = self;
            viewB.delegte = self;
            viewC.delegte = self;
            viewD.delegte = self;
            [_timerTime setFireDate:[NSDate distantPast]];
            
            
    }

}

- (void)showReloadView {
    _reloadView.hidden = NO;
    _twoLabel.text = _timeLabel.text;
    if (_hard == 2) {

        NSInteger bigNumber = [_bigNumber1 integerValue];
        _overTitle.text = @"游戏结束!";
        _overTitle.textColor = [UIColor whiteColor];
        NSLog(@"%ld",_seconds);
        if (bigNumber < _seconds) {
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            _overTitle.text = @"刷新最佳纪录";
            _overTitle.textColor = [UIColor redColor];
            [userDefaults setInteger:_seconds forKey:@"bigNumber1"];
            [userDefaults synchronize];
            _bigNumber1 = [NSString stringWithFormat:@"%ld",_seconds];
            _fourLabel.text = _twoLabel.text;
        } else {
            _fourLabel.text = [NSString stringWithFormat:@"%02li:%02li.%02li",bigNumber/100/60%60,bigNumber/100%60,bigNumber%100];
        }
    }
    if (_hard == 3) {
        
        NSInteger bigNumber = [_bigNumber2 integerValue];
        _overTitle.text = @"游戏结束!";
        _overTitle.textColor = [UIColor whiteColor];
        NSLog(@"%ld",_seconds);
        if (bigNumber < _seconds) {
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            _overTitle.text = @"刷新最佳纪录";
            _overTitle.textColor = [UIColor redColor];
            [userDefaults setInteger:_seconds forKey:@"bigNumber2"];
            [userDefaults synchronize];
            _bigNumber1 = [NSString stringWithFormat:@"%ld",_seconds];
           _fourLabel.text = _twoLabel.text;
        } else{
            _fourLabel.text = [NSString stringWithFormat:@"%02li:%02li.%02li",bigNumber/100/60%60,bigNumber/100%60,bigNumber%100];
        }
    }
    if (_hard == 4) {
        
        NSInteger bigNumber = [_bigNumber3 integerValue];
        _overTitle.text = @"游戏结束!";
        _overTitle.textColor = [UIColor whiteColor];
        NSLog(@"%ld",_seconds);
        if (bigNumber < _seconds) {
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            _overTitle.text = @"刷新最佳纪录";
            _overTitle.textColor = [UIColor redColor];
            [userDefaults setInteger:_seconds forKey:@"bigNumber3"];
            [userDefaults synchronize];
            _bigNumber1 = [NSString stringWithFormat:@"%ld",_seconds];
            _fourLabel.text = _twoLabel.text;
        } else {
            _fourLabel.text = [NSString stringWithFormat:@"%02li:%02li.%02li",bigNumber/100/60%60,bigNumber/100%60,bigNumber%100];
        }
    }
   

}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
