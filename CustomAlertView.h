//
//  CustomAlertView.h
//  CustomAlerView
//
//  Created by 木子 on 2017/3/18.
//  Copyright © 2017年 小白菜. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol customAlertViewDelegate <NSObject>

- (void)customClickButton:(NSInteger)buttonSelect;


@end

@interface CustomAlertView : UIView

@property (nonatomic,assign)id <customAlertViewDelegate>delegate;

-(instancetype)initWithCreatCustomAlertViewTitle:(NSString *)title AndMessage:(NSString *)message andCancelButtonTitle:(NSString *)cancelTitle andSureButtonTitle:(NSString *)sureTitle;

- (void)show;
- (void)hidden;

@end
