//
//  ViewController.m
//  FunnyHorizontalCollectionView
//
//  Created by Funny on 2017/4/13.
//  Copyright © 2017年 Funny. All rights reserved.
//

#import "ViewController.h"
#import "YYBHorizontalCollectionView.h"
#import "YYBHCModel.h"
#import "TwoViewController.h"


#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<YYBHorizontalCollectionViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray *dataArray = [NSMutableArray arrayWithCapacity:10];
    for (int i = 0; i < 10; i ++) {
        YYBHCModel *model = [[YYBHCModel alloc]init];
        model.imagestring = @"show01.png";
        model.labelstring = [NSString stringWithFormat:@"这是详情00%d",i];
        [dataArray addObject:model];
    }
    NSArray *models = (NSArray *)dataArray;
    
    
    YYBHorizontalCollectionView *hcollectionview = [[YYBHorizontalCollectionView alloc]initWithFrame:CGRectMake(0, 100, kScreenWidth, 100) ItemSize:CGSizeMake((kScreenWidth-20*3)/2, 80) MinimumLineSpacing:20 MinimumInteritemSpacing:0];
    hcollectionview.models = models;
    hcollectionview.yybdelegate = self;
    [self.view addSubview:hcollectionview];
    
    hcollectionview.yybHorizontalCollectionBlock = ^(UICollectionView *collectionView, NSIndexPath *indexPath) {
        NSLog(@"点击了第：%ld 个item(block方式)",indexPath.item);
    };
}

#pragma mark - YYBHorizontalCollectionViewDelegate
- (void)YYBHorizontalcollectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"点击了第：%ld 个item（delegate方式）",indexPath.item);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
