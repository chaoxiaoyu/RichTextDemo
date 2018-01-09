//
//  NextViewController.m
//  RichTextDemo
//
//  Created by abc on 2017/10/26.
//  Copyright © 2017年 xiangTian. All rights reserved.
//
#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#import "NextViewController.h"
#import "ScrollTableViewCell.h"

@interface NextViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollview;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
      
//      self.scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
//      self.scrollview.bounces = NO;
//      [self.view addSubview:self.scrollview];
//      self.navigationController.navigationBar.translucent = NO;
      self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
      self.navigationController.navigationBar.alpha = 1.0;
      _titleArray = @[@"首页", @"电视剧", @"地理位置", @"历史文化", @"美景",@"名胜古迹"];
      
      CGFloat imageHeight = 300;
      UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWidth, imageHeight)];
      imageView.backgroundColor = [UIColor redColor];
//      self.scrollview.contentSize = CGSizeMake(kWidth, kHeight+imageHeight);
//      [self.scrollview addSubview:imageView];
      
      self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight) style:UITableViewStylePlain];
      self.tableView.delegate = self;
      self.tableView.dataSource = self;
      self.tableView.bounces = NO;
//      self.tableView.tableFooterView = imageView;
      [self.view addSubview:self.tableView];
      [self getSub:self.navigationController.navigationBar andLevel:1];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
      return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
      if (indexPath.section == 0)
      {
            UITableViewCell *headerCell = [[UITableViewCell alloc] init];
            headerCell.backgroundColor = [UIColor redColor];
            return headerCell;
      }
      else
      {
            ScrollTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifier"];
            if (!cell)
            {
                  cell = [[ScrollTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"identifier"];
                  cell.titleArray = self.titleArray;
            }
//            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifier"];
//            if (!cell)
//            {
//                  cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"identifier"];
//            }
//            cell.textLabel.text = @"dgdgdgjssj";
            return cell;
      }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
      if (self.tableView.tableHeaderView.frame.origin.y > 0)
      {
            
      }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
      if (scrollView.contentOffset.y>=0)
      {
            self.navigationController.navigationBar.alpha = scrollView.contentOffset.y/100;
      }
      
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
      if (section == 0)
            return 0;
      return 30;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
   if (section == 1)
   {
         UIScrollView *headerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 30)];
         
         static CGFloat leftEdge = 20;
         CGFloat spaceWidth = 30;
         CGFloat topY = 5;
         for(int i = 0; i < [_titleArray count]; i++)
         {
               UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
               
               CGSize size = [_titleArray[i] sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0]}];
               [button setTitle:_titleArray[i] forState:UIControlStateNormal];
               [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
               button.titleLabel.font = [UIFont systemFontOfSize:14.0];
               button.frame = CGRectMake(leftEdge, topY, size.width, size.height);
               leftEdge += spaceWidth+size.width;
               [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
               [headerView addSubview:button];
         }
         headerView.backgroundColor = [UIColor lightGrayColor];
         headerView.delegate = self;
         headerView.contentSize = CGSizeMake(leftEdge+20, 30);
         headerView.bounces = NO;
         headerView.showsHorizontalScrollIndicator = NO;
         return  headerView;
   }
      return nil;
}

- (void)buttonTapped:(UIButton *)button
{
      
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
      return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
      if (indexPath.section == 0)
            return 100;
      else
            return kHeight-100;
}

//递归打印所有子视图
- (void)getSub:(UIView *)view andLevel:(int)level {
      NSArray *subviews = [view subviews];
      
      // 如果没有子视图就直接返回
      if ([subviews count] == 0) return;
      
      for (UIView *subview in subviews) {
            
            // 根据层级决定前面空格个数，来缩进显示
            NSString *blank = @"";
            for (int i = 1; i < level; i++) {
                  blank = [NSString stringWithFormat:@"  %@", blank];
            }
            
            // 打印子视图类名
            NSLog(@"%@%d: %@", blank, level, subview.class);
            
            // 递归获取此视图的子视图
            [self getSub:subview andLevel:(level+1)];
            
      }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
