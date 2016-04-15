//
//  YLSlideBar.m
//  SwipeViewController
//
//  Created by yl on 16/4/14.
//  Copyright © 2016年 yl. All rights reserved.
//

#import "YLSlideBar.h"
#import "Masonry.h"
#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

@implementation YLSlideBar

- (instancetype)initWithFrame:(CGRect)frame buttonTitles:(NSArray *)titles {
    self = [super initWithFrame:frame];
    if (self) {
        self.buttonTitles = titles;
        //如果需要滑动的话根据按钮的宽度设置为
        //CGSizeMake(buttonWidth * titles.count, self.frame.size.height)
        self.contentSize = CGSizeMake(kWidth, 25);
        self.contentOffset = CGPointMake(0, 0);
        self.showsHorizontalScrollIndicator = NO;
        [self createMyTitleBar];
    }
    return self;
}

- (void)createMyTitleBar {
    
    
    CGFloat buttonWidth = (kWidth - (self.buttonTitles.count-1))/self.buttonTitles.count;
    CGFloat buttonHeight = 30;
    //按钮中间的分割线
    for (int i = 0; i < self.buttonTitles.count - 1; i++) {
        UIView *splitLine = [UIView new];
        splitLine.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:splitLine];
        [splitLine mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(buttonWidth*(i+1)));
            make.width.equalTo(@1);
            make.height.equalTo(@(buttonHeight * 2/3));
            make.centerY.equalTo(self);
        }];
    }
    
    
    [self.buttonTitles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:obj forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 100 + idx;
        [self addSubview:button];
        [button mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@((buttonWidth+1)*idx));
            make.height.equalTo(@(buttonHeight));
            make.width.equalTo(@(buttonWidth));
            make.top.equalTo(@0);
        }];
        if (!idx) {
            button.selected = YES;
        }
    }];
}


#pragma mark 设置按钮
- (void)setButtonSelectedWithTag:(NSInteger)tag {
    for (int i = 0; i < self.buttonTitles.count; i++) {
        UIButton *button = [self viewWithTag:100+i];
        button.selected = NO;
    }
    UIButton *button = (UIButton *)[self viewWithTag:100+tag];
    button.selected = YES;
}

#pragma mark 按钮的点击事件
- (void)onClick:(UIButton *)button {
    if (self.onClickTagBlock) {
        self.onClickTagBlock(button.tag - 100);
    }
    for (int i = 0; i < self.buttonTitles.count; i++) {
        UIButton *button = [self viewWithTag:i + 100];
        button.selected = NO;
    }
    button.selected = YES;
}


@end
