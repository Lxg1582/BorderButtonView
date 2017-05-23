//
//  BJRoundBorderButton.h
//  BorderButtonView
//
//  Created by dongdf on 2017/5/23.
//  Copyright © 2017年 dongdf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MaskButton.h"

@interface BJRoundBorderButton : MaskButton
- (void)clipRoundWithBorderColor:(UIColor *)color
                       byCorners:(UIRectCorner)corners
                          radius:(CGFloat)radius;
@end
