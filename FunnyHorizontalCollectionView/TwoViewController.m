//
//  TwoViewController.m
//  FunnyHorizontalCollectionView
//
//  Created by Funny on 2017/4/13.
//  Copyright © 2017年 Funny. All rights reserved.
//

#import "TwoViewController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    self.view.backgroundColor = [UIColor redColor];
    
    UIImageView *topimageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
    topimageView.image = [UIImage imageNamed:@"show01.png"];
    [self.view addSubview:topimageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
