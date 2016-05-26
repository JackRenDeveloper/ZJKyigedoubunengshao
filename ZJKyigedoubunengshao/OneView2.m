//
//  OneView2.m
//  ZJKyigedoubunengshao
//
//  Created by qianfeng007 on 15/10/14.
//  Copyright (c) 2015年 钟继康. All rights reserved.
//

#import "OneView2.h"
#import "ZangAi.h"

@implementation OneView2{
    NSTimer *_timer;
    NSTimer *_timerAction;
    NSMutableArray *_zangaiArray;
    UIImageView * child;
    UIButton *_buttonTiao;
    int p;
    NSInteger _bT;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createImagePeople];
        p = 0;
        _zangaiArray = [NSMutableArray array];
        [self createLabel];
    }
    return self;
}

-(void)setBegin:(BOOL)begin {
    _begin = begin;
    if (begin) {
        [self createTiao];
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(labelChange) userInfo:nil repeats:YES];
        [_timer setFireDate:[NSDate distantFuture]];
        
        _timerAction = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(move) userInfo:nil repeats:YES];
    }
}
-(void)move {
     _bT = [_delegte die2:NO];
    [self zangAiPrepareToFly];
    [self zangAiFlying];
    [self checkHit];
}

-(void)createLabel {
    for (int i = 0; i < 6; i ++) {
        ZangAi *zangAi = [[ZangAi alloc]initWithFrame:CGRectZero];
        zangAi.backgroundColor = [UIColor darkGrayColor];
        [self addSubview:zangAi];
        [_zangaiArray addObject:zangAi];
    }
}

-(void)zangAiPrepareToFly {
    static int k = 0;
    static int b = 0;
    
    if (_bT <= 3000) {
        b = 120;
    } else if (_bT>3000 && _bT<= 6000) {
        b = 112;
    }else {
        b = 105;
    }
    
    int h = arc4random() % 2;
    if (k ++ %b != 0) {
        return;
    }else {
        if (h == 1) {
            return;
        }
    }
    
    for (ZangAi *zangAi in _zangaiArray) {
        if (!zangAi.isFlying) {
            int m = arc4random() % 35 + 15;
            int n = arc4random() %10 + 10;
            zangAi.isFlying = YES;
            zangAi.frame =CGRectMake(self.frame.size.width +25, self.frame.size.height -m -4 , n, m);
            return;
        }
    }
}
-(void)zangAiFlying {
    for (ZangAi *zangAi in _zangaiArray) {
        if (zangAi.isFlying) {
            if (_bT <= 3000) {
                [zangAi moving:1.2];
            } else if (_bT>3000 && _bT<= 6000) {
                [zangAi moving:1.7];
            }else {
                [zangAi moving:2.2];
            }
            
        }
    }
}



-(void)createImagePeople {
    NSMutableArray * imgArray = [NSMutableArray array];
    for(int i = 0; i < 4;i++)
    {
        UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"imagePeople%d.png",i]];
        [imgArray addObject:image];
    }
    child = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 14, 24)];
    child.contentMode = UIViewContentModeCenter;
    child.center = CGPointMake(self.frame.size.width / 2 -100, self.frame.size.height - (CGRectGetHeight(child.frame) / 2) - 10);
    child.image = imgArray[0];
    [self addSubview:child];
    child.animationDuration = 0.3;
    child.animationImages = imgArray;
    child.animationRepeatCount = 0;
    [child startAnimating];
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(child.frame) + 5, self.frame.size.width, 3)];
    lable.backgroundColor = [UIColor darkGrayColor];
    [self addSubview:lable];
}

-(void)createTiao {
    _buttonTiao = [UIButton buttonWithType:UIButtonTypeCustom];
    _buttonTiao.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [_buttonTiao addTarget:self action:@selector(buttonTiao:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:_buttonTiao];
}

-(void)buttonTiao:(UIButton *)button {
    
    [_timer setFireDate:[NSDate distantPast]];
    button.enabled = NO;
    
    
}

//
-(void)labelChange {
    
    p++;
    [child stopAnimating];
    child.image = [UIImage imageNamed:@"tiaoYue"];
    CGRect rect = child.frame;
    if (p<= 15) {
        [UIView animateWithDuration:0.01 animations:^{
            child.frame = CGRectMake(rect.origin.x, rect.origin.y-1.8, rect.size.width, rect.size.height);
        } completion:^(BOOL finished) {
            
        }];
    }else if (p > 15 && p <=30) {
        [UIView animateWithDuration:0.01 animations:^{
            child.frame = CGRectMake(rect.origin.x, rect.origin.y-1.5, rect.size.width, rect.size.height);
        } completion:^(BOOL finished) {
            
        }];
        
    } else if (p>30 && p <= 40) {
        [UIView animateWithDuration:0.01 animations:^{
            child.frame = CGRectMake(rect.origin.x, rect.origin.y-1.2, rect.size.width, rect.size.height);
        } completion:^(BOOL finished) {
            
        }];
    }else if (p>40 && p <= 50) {
        [UIView animateWithDuration:0.01 animations:^{
            child.frame = CGRectMake(rect.origin.x, rect.origin.y-0.9, rect.size.width, rect.size.height);
        } completion:^(BOOL finished) {
            
        }];
    }else if (p > 50 && p <= 60) {
        [UIView animateWithDuration:0.01 animations:^{
            child.frame = CGRectMake(rect.origin.x, rect.origin.y  +0.9, rect.size.width, rect.size.height);
        } completion:^(BOOL finished) {
            
        }];
    }else if (p > 60 && p <= 70) {
        [UIView animateWithDuration:0.01 animations:^{
            child.frame = CGRectMake(rect.origin.x, rect.origin.y+1.2, rect.size.width, rect.size.height);
        } completion:^(BOOL finished) {
            
        }];
    } else if (p > 70 && p <= 85) {
        [UIView animateWithDuration:0.01 animations:^{
            child.frame = CGRectMake(rect.origin.x, rect.origin.y +1.5, rect.size.width, rect.size.height);
        } completion:^(BOOL finished) {
            
        }];
    }else if (p > 85 && p <= 100) {
        [UIView animateWithDuration:0.01 animations:^{
            child.frame = CGRectMake(rect.origin.x, rect.origin.y+1.8, rect.size.width, rect.size.height);
        } completion:^(BOOL finished) {
            
        }];
    } else {
        [_timer setFireDate:[NSDate distantFuture]];
        _buttonTiao.enabled = YES;
        p = 0;
        [child startAnimating];
    }
    
}

-(void)checkHit{
    for (ZangAi *zangAi in _zangaiArray) {
        if (! zangAi.isFlying) {
            continue;
        }
        if (CGRectIntersectsRect(child.frame, zangAi.frame)) {
            [self die];
            if (_delegte &&[_delegte respondsToSelector:@selector(die2:)]) {
                [_delegte die2:YES];
            }
        }
    }
}

-(void)die {
    [child stopAnimating];
    _buttonTiao.enabled = NO;
    [_timerAction invalidate];
    [_timer invalidate];
}



@end
