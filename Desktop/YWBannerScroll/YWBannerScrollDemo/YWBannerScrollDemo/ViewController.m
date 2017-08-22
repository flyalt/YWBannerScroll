//
//  ViewController.m
//  YWBannerScrollDemo
//
//  Created by sai on 2017/8/22.
//  Copyright © 2017年 BJYWT. All rights reserved.
//

#import "ViewController.h"
#import "BannerRollingView.h"

@interface ViewController ()<BannerRollingDelegate, BannerRollingDataSource>{
    
    // 轮播图变量，其实作为局部变量也行
    BannerRollingView *carouseView;
    
    
    // 轮播图相关的数据
    NSArray *kvDataArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化一些数据
    kvDataArray = @[@"page 1", @"page 2", @"page3", @"page 4", @"page 5"];
    
    // 添加轮播图1
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 150, 30)];
    label1.text = @"两边加多余页方式";
    [self.view addSubview:label1];
    
    carouseView = [[BannerRollingView alloc] init];
    carouseView.frame = CGRectMake(0, 50, self.view.frame.size.width, 200);
    carouseView.dateSource = self;
    carouseView.delegate = self;
    [self.view addSubview:carouseView];
    
}

#pragma mark - 轮播图代理

-(NSInteger)countOfCellForBannerRollingView:(BannerRollingView *)bannerRollingView{
    
    return kvDataArray.count;
}

-(UIView *)bannerRollingView:(BannerRollingView *)bannerRollingView cellAtIndex:(NSInteger)index{
    // 先用空白页测试
    //    UIView *imageView = [[UIView alloc] init];
    //    int R = (arc4random() % 256) ;
    //    int G = (arc4random() % 256) ;
    //    int B = (arc4random() % 256) ;
    //    imageView.backgroundColor = [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1];
    
    // 填充view，可以是任意view
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg", (long)index + 1]];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 100, 50)];
    label.text = kvDataArray[index];
    [imageView addSubview:label];
    
    return imageView;
    
}

-(void)bannerRollingView:(BannerRollingView *)bannerRollingView didSelectedAtIndex:(NSInteger)index{
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"carouse1 msg"
                                                        message:kvDataArray[index]
                                                       delegate:nil
                                              cancelButtonTitle:@"ok"
                                              otherButtonTitles:nil, nil];
    [alertView show];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
