//
//  JQShelterView.m
//  JQShelterView
//
//  Created by Jinniu on 2018/7/6.
//  Copyright © 2018年 Jinniu. All rights reserved.
//

#import "JQShelterView.h"
@interface JQShelterView ()<UIGestureRecognizerDelegate>
@end
@implementation JQShelterView

static JQShelterView * v;
+(UIView*)shareView{
    return [self createView];
}
+(UIView*)createView{
    if (v==nil) {
        v = [[self alloc] initWithFrame:[[[UIApplication sharedApplication] delegate] window].bounds];
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(btnClick:)];
        tap.delegate = v;
        [v addGestureRecognizer:tap];
        UIWindow * w = [UIApplication sharedApplication].delegate.window;
        [w addSubview:v];
    }
    return v;
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"JQShelterView"]) {
        [JQShelterView dismiss];
        return YES;
    }else {
        return NO;
    }
}
+(void)btnClick:(UITapGestureRecognizer*)tap{}
+(void)dismissBlur:(UITapGestureRecognizer*)tap{
    [tap.view removeFromSuperview];
    [self dismiss];
}
+(void)dismiss{
    [v removeFromSuperview];
    v = nil;
}
+(void)dismissWithTimeInterval:(int)interval{
    [self performSelector:@selector(dismiss) withObject:nil afterDelay:interval];
}
+(void)blurType:(BlurType)type{
    UIBlurEffect * blur = [UIBlurEffect effectWithStyle:type==BlurTypeDark?UIBlurEffectStyleDark:UIBlurEffectStyleLight];
    UIVisualEffectView * effe = [[UIVisualEffectView alloc]initWithEffect:blur];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissBlur:)];
    [effe addGestureRecognizer:tap];
    effe.frame = [[[UIApplication sharedApplication] delegate] window].bounds;
    [[JQShelterView createView] addSubview:effe];
    [v sendSubviewToBack:effe];
    //惆怅要不要去掉背景色，不去掉感觉视觉效果有点差，去掉又要调用clearColor浪费一点不必要的性能
    v.backgroundColor = [UIColor clearColor];
}
+(void)isDark:(BOOL)isDark{
    if (isDark) {
        [JQShelterView createView].backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
    }else{
        [JQShelterView createView].backgroundColor = [UIColor colorWithWhite:1 alpha:0.7];
    }
}
@end
