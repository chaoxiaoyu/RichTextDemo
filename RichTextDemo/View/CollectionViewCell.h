//
//  CollectionViewCell.h
//  RichTextDemo
//
//  Created by abc on 2017/10/30.
//  Copyright © 2017年 xiangTian. All rights reserved.
//




#import <UIKit/UIKit.h>
#import "BaseTableView.h"

@protocol ScrollToTopDelegate <NSObject>

- (void)bottomTableViewScrollToTop;

@end


@interface CollectionViewCell : UICollectionViewCell<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) BaseTableView *tableView;
@property (nonatomic, strong) NSArray *listArray;
@property (nonatomic, weak) id <ScrollToTopDelegate> scrollDelegate;


@end
