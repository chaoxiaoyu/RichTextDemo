//
//  BaseTableView.m
//  RichTextDemo
//
//  Created by abc on 2017/11/6.
//  Copyright © 2017年 xiangTian. All rights reserved.
//

#define headerHeight 236

#import "BaseTableView.h"

@implementation BaseTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(scrollStop:) name:@"scrollStop" object:nil];
    }
    return self;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    if (self.type == TableViewTypeMain)
    {
        return YES;
    }
    return NO;
}

- (void)setType:(TableViewType)type
{
    _type = type;
    if (type == TableViewTypeMain)
    {
        self.canScroll = YES;
    }
    else if (type == TableViewTypeSub)
    {
        self.canScroll = NO;
    }
}


- (void)setContentOffset:(CGPoint)contentOffset
{
    [super setContentOffset:contentOffset];
    CGFloat y = contentOffset.y;
    if (self.type == TableViewTypeMain)
    {
        if (self.canScroll)
        {
            
            if (y > headerHeight)
            {
                self.canScroll = NO;
                contentOffset.y = headerHeight;
                [super setContentOffset:contentOffset];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"scrollStop" object:self];
            }
            else
            {
                [super setContentOffset:contentOffset];
            }
        }
        else
        {
            contentOffset.y = headerHeight;
            [super setContentOffset:contentOffset];
        }
    }
    else if (self.type == TableViewTypeSub)
    {
        if (self.canScroll)
        {
            
            if (y < 0)
            {
                self.canScroll = NO;
//                contentOffset.y = 0;
                [super setContentOffset:contentOffset];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"scrollStop" object:self];
            }
            else
            {
                [super setContentOffset:contentOffset];
            }
        }
        else
        {
            contentOffset.y = 0;
            [super setContentOffset:contentOffset];
        }
        
    }
    
}

- (void)scrollStop:(NSNotification *)notification
{
    BaseTableView *table = notification.object;
    if (table.type == TableViewTypeSub && self.type == TableViewTypeSub)
    {
//        self.contentOffset = CGPointZero;
    }
    if (self != table)
    {
        self.canScroll = !table.canScroll;
    }
}








@end
