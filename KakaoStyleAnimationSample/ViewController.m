//
//  ViewController.m
//  KakaoStyleAnimationSample
//
//  Created by Lee jaeeun on 2013/11/26.
//  Copyright (c) 2013年 kjcode. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, strong) UIImageView *imoticon;


- (IBAction)showImoticon:(id)sender;
- (IBAction)showImoticon1:(id)sender;
- (IBAction)showImoticon2:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.imoticon = [[UIImageView alloc] initWithFrame:CGRectMake(85, 300, 120, 120)];
    _imoticon.backgroundColor = [UIColor grayColor];
    _imoticon.image = [UIImage imageNamed:@"Imoticon"];
    [self.view addSubview:_imoticon];
    _imoticon.alpha = 0.0f;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBAction method
- (IBAction)showImoticon:(id)sender {
    
    NSLog(@"%@",NSStringFromCGRect(_imoticon.frame));
    
    //alpha値設定
    [UIView animateWithDuration:.9f delay:0.0
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         _imoticon.alpha = 1.0f;
                     }
                     completion:^(BOOL finished){

                     }];
    
    
    //移動位置指定
    NSValue *boundFrom = [NSNumber numberWithFloat:300];
    NSValue *boundTo = [NSNumber numberWithFloat:320];
    NSValue *boundOneVia = [NSNumber numberWithFloat:270];
    NSValue *boundTwoVia = [NSNumber numberWithFloat:310];
    
    CAKeyframeAnimation * animation1 = [CAKeyframeAnimation animationWithKeyPath:@"position.y"];
    
    [animation1 setValues:[NSArray arrayWithObjects:
                           boundFrom,
                           boundOneVia,
                           boundTo,
                           boundTwoVia,
                           boundTo,
                           nil]];
    
    //０から１まで設定することになっている。各キーを再生タイムを指定
    [animation1 setKeyTimes:[NSArray arrayWithObjects:
                             [NSNumber numberWithFloat:.0], //start
                             [NSNumber numberWithFloat:.35], //up
                             [NSNumber numberWithFloat:.7], //down
                             [NSNumber numberWithFloat:.85], //up
                             [NSNumber numberWithFloat:1.0], //down
                             nil]];
    
    animation1.duration = .7f;
    
    [_imoticon.layer addAnimation:animation1 forKey:@"bounce"];
    [_imoticon.layer setValue:boundTo forKeyPath:@"position.y"];
    
}

- (IBAction)showImoticon1:(id)sender {
    
    //テスト用。現在実装してない
    [UIView animateWithDuration:.4 delay:0.0
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         //action1
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:.6f animations:^{
                             //action2
                         }];
                     }];
    
}

- (IBAction)showImoticon2:(id)sender {
    
    //テスト用まだ実装してない
    _imoticon.alpha = 1.0f;
    
    NSValue *boundFrom = [NSNumber numberWithFloat:300];
    NSValue *boundTo = [NSNumber numberWithFloat:320];
    NSString * keypath = @"position.y";
    
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:keypath];
    [animation setFromValue:boundFrom];
    [animation setToValue:boundTo];
    [animation setDuration:.6f];
    
    [animation setTimingFunction:[CAMediaTimingFunction functionWithControlPoints:.5 :1.8 :.8 :0.8]];
    
    
    [_imoticon.layer addAnimation:animation forKey:@"bounce"];
    [_imoticon.layer setValue:boundTo forKeyPath:keypath];
    
}

@end
