//
//  CustomAlertView.m
//  CustomAlerView
//
//  Created by 木子 on 2017/3/18.
//  Copyright © 2017年 小白菜. All rights reserved.
//

#import "CustomAlertView.h"

#define Width 250
#define Height 150
//#define ScreenWidth   [UIScreen mainScreen].bounds.size.width 
//#define ScreenHeight   [UIScreen mainScreen].bounds.size.height

@interface CustomAlertView ()

{
    NSString *_titleStr;
    NSString *_messageStr; 
    NSString *_cancelStr;
    NSString *_sureStr;
}

@end

@implementation CustomAlertView



-(instancetype)initWithCreatCustomAlertViewTitle:(NSString *)title AndMessage:(NSString *)message andCancelButtonTitle:(NSString *)cancelTitle andSureButtonTitle:(NSString *)sureTitle{
    
    
    CGRect frame = CGRectMake(0, 0, ScreenWidth,ScreenHeight);
    self = [super initWithFrame:frame];
    if (self) {
        _titleStr = title;
        _messageStr = message;
        _cancelStr = cancelTitle;
        _sureStr = sureTitle;
        self.backgroundColor = [UIColor colorWithWhite:0.4 alpha:0.8];
      
        [self creatUI];
        
    }
    return self;
}

- (void)creatUI{
    
    UIView *alertView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width, Height)];
    alertView.center = self.center;
    alertView.backgroundColor = [UIColor whiteColor];
    alertView.layer.cornerRadius = 30;
    alertView.layer.masksToBounds = YES;
    alertView.layer.borderColor = [UIColor grayColor].CGColor;
    alertView.layer.borderWidth = 1;
    [self addSubview:alertView];
    
    UILabel *titleL = [[UILabel alloc] initWithFrame:CGRectMake((Width - 100) / 2 , 10 , 100 , 30 )];
    titleL.font = [UIFont systemFontOfSize:17];
    titleL.text = _titleStr;
    titleL.textAlignment = NSTextAlignmentCenter;
    titleL.textColor = [UIColor colorWithRed:0 / 255.0 green:122 / 255.0 blue:255 / 255.0 alpha:1];
    [alertView addSubview:titleL];
    
    UILabel *messageL = [[UILabel alloc] initWithFrame:CGRectMake(5, 50,alertView.bounds.size.width - 10 , 50)];
    messageL.font = [UIFont systemFontOfSize:14];
    messageL.textColor = [UIColor colorWithRed:10 / 255.0 green:9 / 255.0 blue:10 / 255.0 alpha:1];
    messageL.numberOfLines = 0;
    messageL.text = _messageStr;
    messageL.textAlignment = NSTextAlignmentCenter;
    [alertView addSubview:messageL];
    
    UILabel *lineL = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.bounds.size.width, 1)];
    lineL.backgroundColor = [UIColor colorWithRed:227 / 255.0 green:226 / 255.0 blue:230 / 255.0 alpha:1];
    [alertView addSubview:lineL];
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame = CGRectMake(0, 101,124.5 , 49);
    [cancelBtn setTitle:_cancelStr forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor colorWithRed:0 / 255.0 green:122 / 255.0 blue:255 / 255.0 alpha:1] forState:UIControlStateNormal];
    cancelBtn.tag = 0;
    [cancelBtn addTarget:self action:@selector(clickButn:) forControlEvents:UIControlEventTouchUpInside];
    [alertView addSubview:cancelBtn];
    
    UILabel *verLineL = [[UILabel alloc] initWithFrame:CGRectMake(124.5, 101, 1, 49)];
    verLineL.backgroundColor = [UIColor colorWithRed:227 / 255.0 green:226 / 255.0 blue:230 / 255.0 alpha:1];
    [alertView addSubview:verLineL];
    
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sureBtn.frame = CGRectMake(124.5, 101,125.5 , 49);
    [sureBtn setTitle:_sureStr forState:UIControlStateNormal];
    [sureBtn setTitleColor:[UIColor colorWithRed:0 / 255.0 green:122 / 255.0 blue:255 / 255.0 alpha:1] forState:UIControlStateNormal];
    sureBtn.tag = 1;
    [sureBtn addTarget:self action:@selector(clickButn:) forControlEvents:UIControlEventTouchUpInside];
    [alertView addSubview:sureBtn];

}

- (void)clickButn:(UIButton *)btn{
    
    [self hidden];
    
    if ([_delegate respondsToSelector:@selector(customClickButton:)]) {
        
        [_delegate customClickButton:btn.tag];
        
        [self hidden];
    }
}

- (void)show{
    
    self.hidden = NO;
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
//    CGPoint center = window.center;
//    self.center = center;
//    center.y -= 100;
//    self.center = ceter;
    [window addSubview:self];
    
    self.transform = CGAffineTransformMakeScale(0.5, 0.5);
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.transform = CGAffineTransformMakeScale(1.2, 1.20);
        
    } completion:^(BOOL finished) {
        
        if (finished) {
            
         [UIView animateWithDuration:0.1 animations:^{
             
             self.transform = CGAffineTransformIdentity;
             
         }];
            
            
        }
    }];

}
- (void)hidden{
    
    self.hidden = YES;

}
@end
