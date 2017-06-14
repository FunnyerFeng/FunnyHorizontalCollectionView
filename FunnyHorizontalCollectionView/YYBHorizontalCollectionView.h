//
//  YYBHorizontalCollectionView.h
//  YouYouBao
//
//  Created by Funny on 2017/4/13.
//  Copyright © 2017年 Funny. All rights reserved.
//
/**
 一个可以横向滑动的collectionview
 使用了两种collection的点击传值方式。可根据自己的需求配置
 由于本人水平有限，有任何代码上的建议都可以给我发issue或者发邮件联系我
 邮箱地址：funnyfengzl@163.com
 */

#import <UIKit/UIKit.h>


typedef void(^YYBHorizontalCollectionBlock)(UICollectionView *collectionView , NSIndexPath *indexPath);

@protocol YYBHorizontalCollectionViewDelegate <NSObject>

@optional

- (void)YYBHorizontalcollectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end


@interface YYBHorizontalCollectionView : UICollectionView


@property(nonatomic,strong) NSArray *models;

@property(nonatomic,copy)YYBHorizontalCollectionBlock yybHorizontalCollectionBlock;

@property(nonatomic,weak) id<YYBHorizontalCollectionViewDelegate> yybdelegate;


- (id)initWithFrame:(CGRect)frame ItemSize:(CGSize)itemSize MinimumLineSpacing:(CGFloat)minimumLineSpacing MinimumInteritemSpacing:(CGFloat)minimumInteritemSpacing;

@end
