//
//  BaseTableView.h
//  RichTextDemo
//
//  Created by abc on 2017/11/6.
//  Copyright © 2017年 xiangTian. All rights reserved.
//



#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TableViewType){
    TableViewTypeMain,
    TableViewTypeSub
};

@interface BaseTableView : UITableView<UIGestureRecognizerDelegate>

@property (nonatomic, assign) BOOL canScroll;
@property (nonatomic, assign) TableViewType type;

@end
