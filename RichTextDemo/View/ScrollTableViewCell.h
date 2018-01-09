//
//  ScrollTableViewCell.h
//  RichTextDemo
//
//  Created by abc on 2017/10/30.
//  Copyright © 2017年 xiangTian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionViewCell.h"

@interface ScrollTableViewCell : UITableViewCell<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, assign) BOOL cellCanScroll;
@property (nonatomic, strong) CollectionViewCell *cell;

- (void)scrollToConfirmItem:(NSInteger)index;

@end
