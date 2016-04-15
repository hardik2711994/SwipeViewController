//
//  YLSlideBar.h
//  SwipeViewController
//
//  Created by yl on 16/4/14.
//  Copyright © 2016年 yl. All rights reserved.
//

#import <UIKit/UIKit.h>

//顶部的标题栏
@interface YLSlideBar : UIScrollView

@property (nonatomic,strong) NSArray *buttonTitles;

- (instancetype)initWithFrame:(CGRect)frame buttonTitles:(NSArray *)titles;

- (void)setButtonSelectedWithTag:(NSInteger)tag;
/**
 *  点击按钮的block,将点击按钮的tag传出去
 */
@property (nonatomic,copy) void (^onClickTagBlock)(NSInteger buttonTag);

@end
