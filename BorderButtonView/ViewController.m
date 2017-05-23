//
//  ViewController.m
//  BorderButtonView
//
//  Created by dongdf on 2017/5/23.
//  Copyright © 2017年 dongdf. All rights reserved.
//

#import "ViewController.h"
#import "BJButtonsBorderView.h"
#import "BJRoundBorderButton.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.view.backgroundColor = [UIColor lightGrayColor];
    
    BJButtonsBorderView *vi = [[BJButtonsBorderView alloc] initWithFrame:CGRectMake(10, 100, self.view.frame.size.width-20, 30)];
    [self.view addSubview:vi];
    
    float width = self.view.frame.size.width - 30;
    UIView *content = [[UIView alloc] initWithFrame:CGRectMake(15, 200, width, width)];
    [self.view addSubview:content];
    
    //--------------------------------------------------------------------------------------------
    NSArray *corners = @[@(UIRectCornerTopLeft),
                         @(UIRectCornerTopRight),
                         @(UIRectCornerBottomLeft),
                         @(UIRectCornerBottomRight),
                         @(UIRectCornerAllCorners),
                         @(UIRectCornerTopLeft | UIRectCornerTopRight),
                         @(UIRectCornerTopLeft | UIRectCornerBottomRight),
                         @(UIRectCornerTopRight | UIRectCornerBottomLeft),
                         @(UIRectCornerTopLeft | UIRectCornerBottomLeft | UIRectCornerTopRight),];
    //---------------------------------------------------------------------------------------------
    float space = 9;
    float itemWidth = (content.frame.size.width - 2*space) / 3.;
    for (int i = 0; i < 9; i++) {
        
        float red = 1. / (arc4random() % 9);
        float green = 1. / (arc4random() % 7);
        float blue = 1. / (arc4random() % 5);
        UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1];
        
        NSInteger lint = i / 3;
        NSInteger column = i % 3;
        
        BJRoundBorderButton *bt = [BJRoundBorderButton buttonWithType:UIButtonTypeCustom];
        bt.frame = CGRectMake(column*(itemWidth+space),
                              lint*(itemWidth+space),
                              itemWidth, itemWidth);
        [bt setTitle:[@(i+1) description] forState:UIControlStateNormal];
        [bt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        bt.titleLabel.font = [UIFont boldSystemFontOfSize:40];
        
        [bt clipRoundWithBorderColor:color
                           byCorners:[corners[i] integerValue]
                              radius:10];
        [content addSubview:bt];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
