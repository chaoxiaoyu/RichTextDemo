//
//  FirstPageView.h
//  RichTextDemo
//
//  Created by abc on 2017/10/31.
//  Copyright © 2017年 xiangTian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableView.h"
#import "ScrollTableViewCell.h"

@interface FirstPageView : UIView<UITableViewDelegate, UITableViewDataSource,ScrollToTopDelegate>

@property (nonatomic, strong) BaseTableView *bottomTableView;
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, assign) BOOL canScroll;

@end
