//
//  JQShelterView.h
//  JQShelterView
//
//  Created by Jinniu on 2018/7/6.
//  Copyright © 2018年 Jinniu. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, BlurType) {
    BlurTypeDark,
    BlurTypeLight,
};
@interface JQShelterView : UIView
//创建遮罩
+(UIView*)shareView;
//模糊类型。不实现该方法默认不模糊，一旦实现该方法，则isDark失效
+(void)blurType:(BlurType)type;
//是否是黑色背景，默认透明
+(void)isDark:(BOOL)isDark;
//移除遮罩
+(void)dismiss;
//延时移除
+(void)dismissWithTimeInterval:(int)interval;
@end
