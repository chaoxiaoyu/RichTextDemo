//
//  CollectionViewCell.m
//  RichTextDemo
//
//  Created by abc on 2017/10/30.
//  Copyright © 2017年 xiangTian. All rights reserved.
//

#import "CollectionViewCell.h"
static NSString *identifier = @"tableViewIdentifier";
@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
      if (self = [super initWithFrame:frame])
      {
            self.tableView = [[BaseTableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
            self.tableView.delegate = self;
            self.tableView.dataSource = self;
          self.tableView.type = TableViewTypeSub;
            
            [self.contentView addSubview:self.tableView];
      }
      return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
      return 300;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
      return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
      return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
      UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
      if (!cell)
      {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cell.textLabel.text = [NSString stringWithFormat:@"第%ld行",indexPath.row];
            cell.detailTextLabel.text = @"dhhhhhhhhhhhhhhhhhhckykykykuiuccbcbc";
      }
      return cell;
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//      if (scrollView.contentOffset.y <= 0)
//      {
////            if (self.scrollDelegate && [self.scrollDelegate respondsToSelector:@selector(bottomTableViewScrollToTop)])
////            {
////                  [self.scrollDelegate bottomTableViewScrollToTop];
////            }
//            [[NSNotificationCenter defaultCenter] postNotificationName:@"scrollToTop" object:nil];
//      }
//}

@end
