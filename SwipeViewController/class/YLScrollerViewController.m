//
//  YLScrollerViewController.m
//  SwipeViewController
//
//  Created by yl on 16/4/15.
//  Copyright © 2016年 yl. All rights reserved.
//

#import "YLScrollerViewController.h"
#import "Masonry.h"

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

@interface YLScrollerViewController () <UIScrollViewDelegate>

@end

@implementation YLScrollerViewController

- (instancetype)initWithViewControllers:(NSArray *)viewControllers {
    self = [super init];
    if (self) {
        self.viewControllers = viewControllers;
        for (UIViewController *controller in viewControllers) {
            [self addChildViewController:controller];
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _scrollerView = [[UIScrollView alloc] init];
    _scrollerView.pagingEnabled = YES;
    _scrollerView.showsHorizontalScrollIndicator = NO;
    _scrollerView.showsVerticalScrollIndicator = NO;
    _scrollerView.contentSize = CGSizeMake(kWidth * self.viewControllers.count, self.view.frame.size.height);
    _scrollerView.bounces = NO;
    _scrollerView.delegate = self;
    [self.view addSubview:_scrollerView];
    [_scrollerView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.right.equalTo(@0);
        make.left.equalTo(@0);
        make.bottom.equalTo(@0);
    }];
    
    for (int i = 0; i < self.viewControllers.count; i++) {
        UIViewController *controller = self.viewControllers[i];
        [_scrollerView addSubview:controller.view];
        [controller.view mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@0);
            //make.height.equalTo(@(kHeight));
            make.bottom.equalTo(self.view);
            make.left.equalTo(@(kWidth * i));
            make.width.equalTo(@(kWidth));
        }];
        
        
    }
    
}

#pragma mark 让scrollerView根据按钮滚动到对应位置
- (void)scrollerWithIndex:(NSInteger)index {
    _scrollerView.contentOffset = CGPointMake(kWidth * index, 0);
    NSLog(@"contenOffest = %@",NSStringFromCGPoint(_scrollerView.contentOffset));
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x/kWidth;
    if (self.scrollerViewEndDeceleratingBlock) {
        self.scrollerViewEndDeceleratingBlock(index);
    }
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
