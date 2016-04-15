//
//  YLScrollerViewController.h
//  SwipeViewController
//
//  Created by yl on 16/4/15.
//  Copyright © 2016年 yl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YLScrollerViewController : UIViewController

@property (nonatomic,strong) UIScrollView *scrollerView;
@property (nonatomic,strong) NSArray *viewControllers;

@property (nonatomic,copy) void (^scrollerViewEndDeceleratingBlock)(NSInteger index);

- (instancetype)initWithViewControllers:(NSArray *)viewControllers;

/**
 *  让scrollerView根据按钮滚动到对应位置
 *
 *  @param index 按钮的index
 */
- (void)scrollerWithIndex:(NSInteger)index;
@end
