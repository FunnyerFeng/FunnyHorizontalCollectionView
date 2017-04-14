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
#import "TwoViewController.h"
#import "YYBHorizontalCollectionCell.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface OneViewController ()<YYBHorizontalCollectionViewDelegate>

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    
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
    
    NSLog(@"点击了第：%ld 个item（delegate方式）",indexPath.item);
   YYBHorizontalCollectionCell *selectCell = (YYBHorizontalCollectionCell *)[collectionView cellForItemAtIndexPath:indexPath];
    UIImageView *moveImageview = selectCell.displayImageView;
    
    CGRect targetFrame = [selectCell convertRect:moveImageview.frame toView:self.view];
    
    NSLog(@"%@",NSStringFromCGRect(targetFrame));
   
    
    TwoViewController *twovc = [[TwoViewController alloc]init];
    
     [twovc setModalTransitionStyle:UIModalTransitionStylePartialCurl];
    
    [self presentViewController:twovc animated:YES completion:nil];
    
    
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
