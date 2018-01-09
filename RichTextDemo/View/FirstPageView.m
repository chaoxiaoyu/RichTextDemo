//
//  FirstPageView.m
//  RichTextDemo
//
//  Created by abc on 2017/10/31.
//  Copyright © 2017年 xiangTian. All rights reserved.
//

#import "FirstPageView.h"


@interface FirstPageView ()

@property (nonatomic, strong) ScrollTableViewCell *scrollCell;

@end

@implementation FirstPageView

- (instancetype)initWithFrame:(CGRect)frame
{
      if (self = [super initWithFrame:frame])
      {
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(bottomTableViewScrollToTop) name:@"scrollToTop" object:nil];
            self.bottomTableView = [[BaseTableView alloc] initWithFrame:frame];
            self.bottomTableView.delegate = self;
            self.bottomTableView.dataSource = self;
            self.bottomTableView.bounces = NO;
          self.bottomTableView.type = TableViewTypeMain;
            self.canScroll = YES;
            [self addSubview:self.bottomTableView];
            
      }
      return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
      return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
      return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
      if (indexPath.section == 0)
            return 300;
      return self.frame.size.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
      if (indexPath.section == 0)
      {
            UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
            cell.backgroundColor = [UIColor redColor];
            return cell;
      }
      else if (indexPath.section == 1)
      {
            _scrollCell = [[ScrollTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"identifier"];
            _scrollCell.titleArray = self.titleArray;
//            _scrollCell.cell.scrollDelegate = self;
            return _scrollCell;
      }
      return  nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
      if (section == 1)
        return 30;
      return  0;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
      UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 30)];
      scrollView.bounces = NO;
      scrollView.showsHorizontalScrollIndicator = NO;
      scrollView.backgroundColor = [UIColor grayColor];
      CGFloat top = 5;
      CGFloat spaceWidth = 30;
      static CGFloat leftEdge = 20;
      for (int i = 0; i < self.titleArray.count; i++)
      {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.titleLabel.font = [UIFont systemFontOfSize:14.0];
            CGSize size = [self.titleArray[i] sizeWithAttributes:@{NSFontAttributeName:button.titleLabel.font}];
            button.frame = CGRectMake(leftEdge, top, size.width, size.height);
            [button setTitle:self.titleArray[i] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = 100 + i;
            [scrollView addSubview:button];
            leftEdge += size.width + spaceWidth;
      }
      scrollView.contentSize = CGSizeMake(leftEdge, 30);
      return scrollView;
}

- (void)buttonTapped:(UIButton *)button
{
      NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:1];
      
      ScrollTableViewCell *cell = [self.bottomTableView cellForRowAtIndexPath:indexPath];
      [cell scrollToConfirmItem:button.tag - 100];
}

//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
//{
//      // 输出点击的view的类名
//      NSLog(@"%@", NSStringFromClass([touch.view class]));
//
//      // 若为UITableViewCellContentView（即点击了tableViewCell），则不截获Touch事件
//      if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
//            return NO;
//      }
//      return  YES;
//}



//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
//      
//}
//
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//      CGFloat bottomCellTop = [self.bottomTableView rectForSection:1].origin.y;
//      if (scrollView.contentOffset.y >= bottomCellTop)
//      {
//            scrollView.contentOffset = CGPointMake(0, bottomCellTop);
//            if (self.canScroll)
//            {
//                  self.canScroll = NO;
//                  self.scrollCell.cellCanScroll = YES;
//            }
//      }
//      else
//      {
//            if (!self.canScroll)
//            {
//                  self.bottomTableView.contentOffset = CGPointMake(0, bottomCellTop);
//            }
//            
//      }
//}
//
//- (void)bottomTableViewScrollToTop
//{
//      self.canScroll = YES;
//      self.scrollCell.cellCanScroll = NO;
//}

@end
