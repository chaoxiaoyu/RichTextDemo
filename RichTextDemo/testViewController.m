//
//  testViewController.m
//  RichTextDemo
//
//  Created by abc on 2017/10/31.
//  Copyright © 2017年 xiangTian. All rights reserved.
//

#import "testViewController.h"

@interface testViewController ()

@end

@implementation testViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//      self.navigationController.navigationBar.hidden = YES;
      _titleArray = @[@"首页", @"电视剧", @"地理位置", @"历史文化", @"美景",@"名胜古迹"];
      self.firstView = [[FirstPageView alloc] initWithFrame:self.view.frame];
      self.firstView.titleArray = self.titleArray;
      [self.view addSubview:self.firstView];
      
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
