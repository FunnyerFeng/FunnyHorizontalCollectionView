//
//  YYBHorizontalCollectionCell.h
//  YouYouBao
//
//  Created by Funny on 2017/4/13.
//  Copyright © 2017年 Funny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYBHorizontalCollectionCell : UICollectionViewCell

/**
 用于展示的imageView
 */
@property(nonatomic,strong)UIImageView *displayImageView;

/**
 imageView的描述文字
 */
@property(nonatomic,strong)UILabel *descripLabel;

- (void)setDisplayImageString:(NSString *)displayImageString DescripLabelString:(NSString *)descripLabelStrig;

@end
