//
//  ViewController.m
//  ZJKyigedoubunengshao
//
//  Created by qianfeng007 on 15/10/13.
//  Copyright (c) 2015年 钟继康. All rights reserved.
//

#import "ViewController.h"
#import "OneView.h"
#import "MainViewController.h"
#import "UIView+Common.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController () {
    UIButton *_lastButton;
     BOOL _open;
    AVAudioPlayer *_audioPlayer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//     Do any additional setup after loading the view, typically from a nib.
    _open = YES;
    [self createView:2];
    [self createButton:4];
    [self createMp3];
    [self createMusic];
    [self createTitle];
}

- (void)createMp3 {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Theme of Guile -SFIV Arrange" ofType:@"mp3"];
    
    NSURL *fileUrl = [NSURL fileURLWithPath:filePath];
    
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileUrl error:nil];
    
    _audioPlayer.numberOfLoops = -1;
    
    [_audioPlayer play];
}

-(void)createTitle {
    NSMutableArray * imgArray = [NSMutableArray array];
    for(int i = 0; i < 9;i++)
    {
        UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"title%d.png",i]];
        [imgArray addObject:image];
    }
   UIImageView  *_titleImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 14, 24)];
    _titleImage.contentMode = UIViewContentModeCenter;
    _titleImage.center = CGPointMake(self.view.frame.size.width / 2 , self.view.frame.size.height /5 );
    _titleImage.image = imgArray[0];
    [self.view addSubview:_titleImage];
    _titleImage.animationDuration = 0.7;
    _titleImage.animationImages = imgArray;
    _titleImage.animationRepeatCount = 0;
    [_titleImage startAnimating];
}


-(void)createMusic {
    UIButton *musicButton = [[UIButton alloc] initWithFrame:CGRectMake(20, self.view.frame.size.height - 50, 30, 30)];
    musicButton.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    [musicButton setImage:[UIImage imageNamed:@"sound-alt"] forState:UIControlStateNormal];
    [musicButton addTarget:self action:@selector(musicButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    musicButton.layer.cornerRadius = 15;
    [self.view addSubview:musicButton];
}


-(void)musicButtonClick:(UIButton *)button {
    if (_open) {
        [button setImage:[UIImage imageNamed:@"soundoff"] forState:UIControlStateNormal];
        
        if (_audioPlayer.isPlaying) {
            [_audioPlayer pause];
        }
        
    } else {
        [button setImage:[UIImage imageNamed:@"sound-alt"] forState:UIControlStateNormal];
        
        if (!_audioPlayer.isPlaying) {
            [_audioPlayer play];
        }
        
    }
    _open = !_open;
}

-(void)createView:(int)k {
    for (int i = 0; i < k; i ++) {
        OneView *viewA = [[OneView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height / k * i, self.view.frame.size.width, self.view.frame.size.height / k)];
        viewA.begin = NO;
        [self.view addSubview:viewA];
    }
}

-(void)createButton:(int)x {
    NSArray *hardArray = @[@"简单",@"一般",@"地狱"];
    for (int i = 0; i < 3; i ++ ) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 50, 50);
        button.layer.cornerRadius = 25;
        button.clipsToBounds = YES;
        button.tag = 100 + i;
        button.center = CGPointMake(self.view.frame.size.width / 2 + 80 * (i - 1), self.view.frame.size.height /3 + 40 );
        [button setTitle:hardArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        [button addTarget:self action:@selector(buttonTouch:) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor = [UIColor cyanColor];
        if (x == i) {
            button.enabled = NO;
        }
        [self.view addSubview:button];
    }
}

-(void)createBeginButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake( 0 , 0, 120, 120);
    button.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2 + 100);
    
    [button setImage:[UIImage imageNamed:@"goImage2"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(gameBegin:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

-(void)gameBegin:(UIButton *)button {
    MainViewController *mainViewCon = [MainViewController new];
    mainViewCon.hard = (int)[_lastButton tag] - 100+ 2;
    [self presentViewController:mainViewCon animated:NO completion:^{
        
    }];
    
}

-(void)buttonTouch:(UIButton *)button {
    _lastButton = button;
    [UIView animateWithDuration:0.1 animations:^{
        NSArray *viewArray = [self.view subviews];
        for (UIView *view in viewArray) {
            [view removeFromSuperview];
        }
    } completion:^(BOOL finished) {
        [self createView:(int)[button tag] - 100+ 2];
        [self createButton:(int)[button tag] - 100];
        [self createBeginButton];
        [self createMusic];
        [self createTitle];
    }];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
