//
//  BJRoundBorderButton.m
//  BorderButtonView
//
//  Created by dongdf on 2017/5/23.
//  Copyright © 2017年 dongdf. All rights reserved.
//

#import "BJRoundBorderButton.h"

@interface BJRoundBorderButton ()

@property (nonatomic, strong) UIColor *borderColor;
@property (nonatomic, assign) UIRectCorner corners;
@property (nonatomic, assign) CGFloat radius;

@property (nonatomic, weak) CAShapeLayer *borderLayer;

@end


@implementation BJRoundBorderButton

- (void)clipRoundWithBorderColor:(UIColor *)color
                       byCorners:(UIRectCorner)corners
                          radius:(CGFloat)radius {
    
    self.borderColor = color;
    self.corners = corners;
    self.radius = radius;
    
    [self layoutIfNeeded];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.borderLayer.superlayer) {
        [self.borderLayer removeFromSuperlayer];
        self.layer.mask = nil;
    }
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                               byRoundingCorners:self.corners
                                                     cornerRadii:CGSizeMake(self.radius, self.radius)];
    
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    borderLayer.lineWidth = 1. / [UIScreen mainScreen].scale;
    borderLayer.strokeColor = self.borderColor.CGColor;
    borderLayer.fillColor = self.backgroundColor.CGColor;
    borderLayer.path = path.CGPath;
    [self.layer insertSublayer:borderLayer atIndex:0];
    self.borderLayer = borderLayer;
    
    CAShapeLayer *clipLayer = [CAShapeLayer layer];
    clipLayer.path = path.CGPath;
    self.layer.mask = clipLayer;
}


@end
