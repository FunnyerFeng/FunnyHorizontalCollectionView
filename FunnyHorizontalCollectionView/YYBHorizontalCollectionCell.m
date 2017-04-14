//
//  YYBHorizontalCollectionCell.m
//  YouYouBao
//
//  Created by Funny on 2017/4/13.
//  Copyright © 2017年 Funny. All rights reserved.
//

#import "YYBHorizontalCollectionCell.h"


#define Image_Label_Space 5
#define DescripLabelFont [UIFont systemFontOfSize:15]

@interface YYBHorizontalCollectionCell ()



@end

@implementation YYBHorizontalCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self.contentView addSubview:self.displayImageView];
        
        [self.contentView addSubview:self.descripLabel];
    }
    return self;
}

- (void)setDisplayImageString:(NSString *)displayImageString DescripLabelString:(NSString *)descripLabelStrig {
    
    self.displayImageView.image = [UIImage imageNamed:displayImageString];
    
    self.descripLabel.text = descripLabelStrig;
}

- (UIImageView *)displayImageView {
    if (!_displayImageView) {
        _displayImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height-20)];
        
    }
    return _displayImageView;
}

- (UILabel *)descripLabel{
    if (!_descripLabel) {
        _descripLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.displayImageView.frame) + Image_Label_Space, self.frame.size.width, 20)];
        _descripLabel.textColor = [UIColor whiteColor];
        _descripLabel.textAlignment = NSTextAlignmentCenter;
        _descripLabel.font = DescripLabelFont;
    }
    return _descripLabel;
}
@end
