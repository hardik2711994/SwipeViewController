//
//  YLSwipeViewController.m
//  SwipeViewController
//
//  Created by yl on 16/4/14.
//  Copyright © 2016年 yl. All rights reserved.
//

#import "YLSwipeViewController.h"
#import "YLScrollerViewController.h"
#import "YLSlideBar.h"
#import "Masonry.h"


#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

@interface YLSwipeViewController () {
    YLSlideBar *_slideBar;
    YLScrollerViewController *_bigScrollerView;
}

@end

@implementation YLSwipeViewController


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if ([self respondsToSelector:@selector(automaticallyAdjustsScrollViewInsets)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

- (instancetype)initWithViewControllers:(NSArray *)viewControllers titles:(NSArray *)titles {
    if (self = [super init]) {
        self.viewControllers = viewControllers;
        self.titles = titles;
        [self setSlideBar];
        [self setBigTableViewController];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _slideBar = [[YLSlideBar alloc] initWithFrame:CGRectZero buttonTitles:self.titles];
    [self.view addSubview:_slideBar];
    [_slideBar mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.right.equalTo(@0);
        make.top.equalTo(@64);
        make.height.equalTo(@30);
    }];
    
    
    _bigScrollerView = [[YLScrollerViewController alloc] initWithViewControllers:self.viewControllers];
    [self addChildViewController:_bigScrollerView];
    [self.view addSubview:_bigScrollerView.view];
    [_bigScrollerView.view mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_slideBar.mas_bottom);
        make.left.equalTo(@0);
        make.right.equalTo(@0);
        make.bottom.equalTo(@0);
    }];
    
    __weak YLScrollerViewController *bigViewController = _bigScrollerView;
    __weak YLSlideBar *slideBar = _slideBar;
    _slideBar.onClickTagBlock = ^(NSInteger index){
        [bigViewController scrollerWithIndex:index];
    };
    _bigScrollerView.scrollerViewEndDeceleratingBlock = ^(NSInteger index) {
        [slideBar setButtonSelectedWithTag:index];
    };
    
}

#pragma mark 设置slideBar
- (void)setSlideBar {
    
}

#pragma mark 设置tableViewController
- (void)setBigTableViewController {
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
