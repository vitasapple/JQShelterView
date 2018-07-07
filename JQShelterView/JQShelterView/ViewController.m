//
//  ViewController.m
//  JQShelterView
//
//  Created by Jinniu on 2018/7/6.
//  Copyright © 2018年 Jinniu. All rights reserved.
//

#import "ViewController.h"
#import "JQShelterView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    for (int i =0; i<4; i++) {
        UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(50, 50+70*i, 40, 40)];
        btn.tag = 10+i;
        btn.backgroundColor = [UIColor blackColor];
        [btn addTarget:self action:@selector(topBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
        [self.view addSubview:btn];
    }
}
-(void)topBtnClick:(UIButton*)sender{
    if (sender.tag==10) {
        [self test1];
    }else if (sender.tag==11){
        [self test2];
    }else if (sender.tag==12){
        [self test3];
    }else if (sender.tag==13){
        [self test4];
    }
}
-(void)test1{
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 101, 100)];
    btn.backgroundColor = [UIColor redColor];
    [[JQShelterView shareView]addSubview:btn];
    [JQShelterView isDark:YES];//这行不写默认透明
}
-(void)test2{//深色模糊背景
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 101, 100)];
    btn.backgroundColor = [UIColor redColor];
    [[JQShelterView shareView]addSubview:btn];
    [JQShelterView blurType:BlurTypeDark];
}
-(void)test3{//亮色模糊背景
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 101, 100)];
    btn.backgroundColor = [UIColor redColor];
    [[JQShelterView shareView]addSubview:btn];
    [JQShelterView blurType:BlurTypeLight];
}
-(void)test4{
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 101, 100)];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [JQShelterView blurType:BlurTypeDark];
    [[JQShelterView shareView]addSubview:btn];
}
-(void)btnClick{
    [JQShelterView dismissWithTimeInterval:3];
}
@end
