# JQShelterView
shelterView,遮罩
**就是一个遮罩的背景view，提供了暗色，明色，透明，暗模糊，明模糊，延时删除的功能**

```
 UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 101, 100)];
    btn.backgroundColor = [UIColor redColor];
    [[JQShelterView shareView]addSubview:btn];
    [JQShelterView isDark:YES];//这行不写默认透明
```
![3](https://github.com/vitasapple/JQShelterView/blob/master/JQShelterView/pic/3.jpeg)
```
UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 101, 100)];
    btn.backgroundColor = [UIColor redColor];
    [[JQShelterView shareView]addSubview:btn];
    [JQShelterView blurType:BlurTypeLight];
```
![1](https://github.com/vitasapple/JQShelterView/blob/master/JQShelterView/pic/1.png)
```
UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 101, 100)];
    btn.backgroundColor = [UIColor redColor];
    [[JQShelterView shareView]addSubview:btn];
    [JQShelterView blurType:BlurTypeDark];
```
![2](https://github.com/vitasapple/JQShelterView/blob/master/JQShelterView/pic/2.jpeg)
