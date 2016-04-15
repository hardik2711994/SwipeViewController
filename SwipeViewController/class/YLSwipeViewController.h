//
//  YLSwipeViewController.h
//  SwipeViewController
//
//  Created by yl on 16/4/14.
//  Copyright © 2016年 yl. All rights reserved.
//

#import <UIKit/UIKit.h>
//将slideBar和controller关联

@class YLScrollerViewController;
@class YLSlideBar;

@interface YLSwipeViewController : UIViewController

@property (nonatomic,strong) NSArray *viewControllers;
@property (nonatomic,strong) NSArray *titles;

- (instancetype)initWithViewControllers:(NSArray *)viewControllers titles:(NSArray *)titles;


@end
