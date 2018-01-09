//
//  ViewController.m
//  RichTextDemo
//
//  Created by abc on 2017/10/24.
//  Copyright © 2017年 xiangTian. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"
#import "testViewController.h"

@interface ViewController ()
{
      
}
@end

@implementation ViewController

- (void)viewDidLoad {
      [super viewDidLoad];
      NSString *string = @"落霞与孤鹜齐飞，秋水共长天一色，落霞与孤鹜齐飞，秋水共长天一色，落霞与孤鹜齐飞，秋水共长天一色，落霞与孤鹜齐飞，秋水共长天一色，落霞与孤鹜齐飞，秋水共长天一色，落霞与孤鹜齐飞，秋水共长天一色。";
      NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] init];
      NSAttributedString *attributedStr1 = [[NSAttributedString alloc] initWithString:[string substringToIndex:5] attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0],NSForegroundColorAttributeName:[UIColor redColor],NSKernAttributeName:@6.0,NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle),NSStrikethroughColorAttributeName:[UIColor blackColor]}];
      
      
      NSShadow *shadow = [[NSShadow alloc] init];
      shadow.shadowColor = [UIColor redColor];
      shadow.shadowBlurRadius = 5.0f;
      shadow.shadowOffset = CGSizeMake(1, 2);
      NSAttributedString *attributedStr2 = [[NSAttributedString alloc] initWithString:[string substringWithRange:NSMakeRange(5, 14)] attributes:@{NSForegroundColorAttributeName:[UIColor blueColor],NSBackgroundColorAttributeName:[UIColor grayColor],NSLigatureAttributeName:@1,NSKernAttributeName:@2.0,NSStrikethroughStyleAttributeName:@(NSUnderlineStyleDouble),NSStrikethroughColorAttributeName:[UIColor greenColor],NSStrokeWidthAttributeName:@3,NSStrokeColorAttributeName:[UIColor yellowColor],NSShadowAttributeName:shadow,NSForegroundColorAttributeName:[UIColor grayColor]}];
      NSAttributedString *attributedStr3 = [[NSAttributedString alloc] initWithString:[string substringWithRange:NSMakeRange(19, 10)] attributes:@{NSStrokeWidthAttributeName:@(-3),NSStrokeColorAttributeName:[UIColor yellowColor]}];
      NSAttributedString *attributedStr4 = [[NSAttributedString alloc] initWithString:[string substringWithRange:NSMakeRange(29, 11)] attributes:@{NSTextEffectAttributeName:NSTextEffectLetterpressStyle,NSShadowAttributeName:shadow,NSExpansionAttributeName:@-0.5}];
      NSAttributedString *attributedStr5 = [[NSAttributedString alloc] initWithString:[string substringWithRange:NSMakeRange(40, 2)] attributes:@{NSBaselineOffsetAttributeName:@6,NSObliquenessAttributeName:@0.5}];
      NSAttributedString *attributedStr6 = [[NSAttributedString alloc] initWithString:[string substringWithRange:NSMakeRange(42, 8)] attributes:@{NSBaselineOffsetAttributeName:@0,NSObliquenessAttributeName:@0.5}];
      NSAttributedString *attributedStr7 = [[NSAttributedString alloc] initWithString:[string substringWithRange:NSMakeRange(50, 2)] attributes:@{NSBaselineOffsetAttributeName:@-3}];
      NSAttributedString *attributedStr8 = [[NSAttributedString alloc] initWithString:[string substringWithRange:NSMakeRange(52, 10)] attributes:@{NSBaselineOffsetAttributeName:@0,NSObliquenessAttributeName:@-0.5}];
      NSAttributedString *attributedStr9 = [[NSAttributedString alloc] initWithString:[string substringWithRange:NSMakeRange(62, 10)] attributes:@{NSExpansionAttributeName:@1,NSVerticalGlyphFormAttributeName:@0}];
      NSAttributedString *attributedStr10 = [[NSAttributedString alloc] initWithString:[string substringWithRange:NSMakeRange(72, 10)] attributes:@{NSWritingDirectionAttributeName:@[@2,@3]}];
      
      [attributedStr appendAttributedString:attributedStr1];
      [attributedStr appendAttributedString:attributedStr2];
      [attributedStr appendAttributedString:attributedStr3];
      [attributedStr appendAttributedString:attributedStr4];
      [attributedStr appendAttributedString:attributedStr5];
      [attributedStr appendAttributedString:attributedStr6];
      [attributedStr appendAttributedString:attributedStr7];
      [attributedStr appendAttributedString:attributedStr8];
      [attributedStr appendAttributedString:attributedStr9];
      [attributedStr appendAttributedString:attributedStr10];

      self.label1.attributedText = attributedStr;
      self.label2.attributedText = attributedStr;
      self.label3.attributedText = attributedStr;
      self.label4.attributedText = attributedStr;
      self.label5.attributedText = attributedStr;
      self.label6.attributedText = attributedStr;
      self.label7.attributedText = attributedStr;
      self.label8.attributedText = attributedStr;
      self.label9.attributedText = attributedStr;
      
}
- (IBAction)goToNextPage:(UIButton *)sender {
//      NextViewController *next = [[NextViewController alloc] init];
//      UIPasteboard *copy = [UIPasteboard generalPasteboard];
//      copy.string = sender.titleLabel.text;
      testViewController *next = [[testViewController alloc] init];
      UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:next];
      [self presentViewController:nav animated:YES completion:nil];
      
}

- (void)didReceiveMemoryWarning {
      [super didReceiveMemoryWarning];
      // Dispose of any resources that can be recreated.
}


@end
