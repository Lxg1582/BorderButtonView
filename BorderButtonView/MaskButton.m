//
//  MaskButton.m
//  autoPrice
//
//  Created by dongdf on 16/8/30.
//  Copyright © 2016年 Bitauto. All rights reserved.
//

#import "MaskButton.h"

#define kViewTag 11111

@implementation MaskButton

+ (MaskButton *)buttonWithType:(UIButtonType)buttonType {
    MaskButton *bt = [super buttonWithType:buttonType];
    bt.clipsToBounds = YES;

    UIView *maskView = [[UIView alloc] initWithFrame:bt.bounds];
    maskView.userInteractionEnabled = NO;
    maskView.backgroundColor = [UIColor clearColor];
    maskView.tag = kViewTag;
    [bt addSubview:maskView];
    
    return bt;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.clipsToBounds = YES;
        
        UIView *maskView = [[UIView alloc] initWithFrame:self.bounds];
        maskView.userInteractionEnabled = NO;
        maskView.backgroundColor = [UIColor clearColor];
        maskView.tag = kViewTag;
        [self addSubview:maskView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    UIView *maskView = [self viewWithTag:kViewTag];
    maskView.frame = self.bounds;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIView *maskView = [self viewWithTag:kViewTag];
    maskView.backgroundColor = [UIColor colorWithWhite:.9 alpha:.7];
    
    [super touchesBegan:touches withEvent:event];
}
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIView *maskView = [self viewWithTag:kViewTag];
    maskView.backgroundColor = [UIColor clearColor];

    [super touchesCancelled:touches withEvent:event];
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIView *maskView = [self viewWithTag:kViewTag];
    maskView.backgroundColor = [UIColor clearColor];

    [super touchesEnded:touches withEvent:event];
}


@end
