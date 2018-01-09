//
//  ScrollTableViewCell.m
//  RichTextDemo
//
//  Created by abc on 2017/10/30.
//  Copyright © 2017年 xiangTian. All rights reserved.
//

#import "ScrollTableViewCell.h"

@interface ScrollTableViewCell()
{
      UICollectionView *collectionView;
}

@end

@implementation ScrollTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
      if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
      {
            UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
            [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
            collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) collectionViewLayout:layout];
            [collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"CollectionViewCell"];
            [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reuseHeaderView"];
            collectionView.delegate = self;
            collectionView.dataSource = self;
            collectionView.pagingEnabled = YES;
            self.cellCanScroll = NO;
            [self.contentView addSubview:collectionView];
      }
      return self;
}

- (void)setCellCanScroll:(BOOL)cellCanScroll
{
      _cellCanScroll = cellCanScroll;
      if (!_cellCanScroll)
      {
            self.cell.tableView.contentOffset = CGPointZero;
      }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
      collectionView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
      return self.titleArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
      self.cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
      self.cell.listArray = self.titleArray;
      return self.cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
      return  CGSizeMake(self.frame.size.width, self.frame.size.height); //
}

//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
//{
//      if ([kind isEqualToString:UICollectionElementKindSectionHeader])
//      {
//            UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reuseHeaderView" forIndexPath:indexPath];
//            UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, header.frame.size.width, header.frame.size.height)];
////            [header addSubview:scrollView];
//            header.frame = CGRectMake(0, 0, self.frame.size.width, 30);
//            header.backgroundColor = [UIColor grayColor];
//            static float leftEdge = 20;
//            float spaceWidth = 30;
//            float topEdge = 5;
//            
//            for (int i = 0;i < self.titleArray.count;i++)
//            {
//                  
//                  UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//                  [button setTitle:self.titleArray[i] forState:UIControlStateNormal];
//                  [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//                  button.titleLabel.font = [UIFont systemFontOfSize:14.0];
//                  CGSize btnSize = [button.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:button.titleLabel.font}];
//                  button.frame = CGRectMake(leftEdge, topEdge, btnSize.width+2, btnSize.height+2);
//                  [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
//                  [scrollView addSubview:button];
//                  leftEdge += btnSize.width+spaceWidth;
//            }
//            scrollView.contentSize = CGSizeMake(leftEdge, header.frame.size.height);
//            return header;
//      }
//      return nil;
//}

- (void)buttonTapped:(UIButton *)btn
{
      
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
      return 0;
}

- (void)scrollToConfirmItem:(NSInteger)index
{
      collectionView.contentOffset = CGPointMake(self.frame.size.width * index, collectionView.frame.origin.y);
}




//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
//{
//      CGSize size = CGSizeMake(self.frame.size.width, 30);
//      if (section == 0)
//        return size;
//      return CGSizeMake(0, 0);
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
