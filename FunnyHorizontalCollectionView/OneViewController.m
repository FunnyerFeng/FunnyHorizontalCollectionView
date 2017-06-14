//
//  OneViewController.m
//  FunnyHorizontalCollectionView
//
//  Created by Funny on 2017/4/13.
//  Copyright © 2017年 Funny. All rights reserved.
//

#import "OneViewController.h"
#import "YYBHorizontalCollectionView.h"
#import "YYBHCModel.h"
#import "YYBHorizontalCollectionCell.h"
#import "TwoViewController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface OneViewController ()<YYBHorizontalCollectionViewDelegate>

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
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
    
    //    hcollectionview.yybHorizontalCollectionBlock = ^(UICollectionView *collectionView, NSIndexPath *indexPath) {
    //        NSLog(@"点击了第：%ld 个item(block方式)",indexPath.item);
    //    };
    
}

#pragma mark - YYBHorizontalCollectionViewDelegate
- (void)YYBHorizontalcollectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
   YYBHorizontalCollectionCell *selectCell = (YYBHorizontalCollectionCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    UIImageView *moveImageview = [[UIImageView alloc]initWithImage:selectCell.displayImageView.image];

    if (!moveImageview) return;
    
    CGRect targetFrame = [selectCell convertRect:selectCell.displayImageView.frame toView:self.view];

    moveImageview.frame = targetFrame;
    
    [self.view addSubview:moveImageview];

    [UIView animateKeyframesWithDuration:.35f delay:0 options:UIViewKeyframeAnimationOptionLayoutSubviews animations:^{
        
        moveImageview.frame = CGRectMake(0, 0, kScreenWidth, 200);
        
        [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setShadowImage:[UIImage new]];
        
        
    } completion:^(BOOL finished) {
        
        if (finished) {
            
            TwoViewController *twoVC = [[TwoViewController alloc]init];
            twoVC.showImage = moveImageview.image;

            [twoVC setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
            
            [self presentViewController:twoVC animated:YES completion:^{
                moveImageview.alpha = 0;
                [moveImageview removeFromSuperview];
            }];

        }
        
    }];
    
}

@end
