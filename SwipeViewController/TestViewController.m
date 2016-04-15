//
//  TestViewController.m
//  SwipeViewController
//
//  Created by yl on 16/4/14.
//  Copyright © 2016年 yl. All rights reserved.
//

#import "TestViewController.h"
#import "AViewController.h"
#import "BViewController.h"
#import "CViewController.h"
#import "YLSlideBar.h"
#import "Masonry.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (instancetype)init {
    AViewController *a = [[AViewController alloc] init];
    BViewController *b = [[BViewController alloc] init];
    CViewController *c = [[CViewController alloc] init];
    NSArray *array = @[a,b,c];
    self = [super initWithViewControllers:array titles:@[@"a",@"b",@"c"]];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
