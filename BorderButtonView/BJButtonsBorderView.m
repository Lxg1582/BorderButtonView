//
//  BJButtonsBorderView.m
//  autoPrice
//
//  Created by dongdf on 2017/5/23.
//  Copyright © 2017年 Bitauto. All rights reserved.
//

#import "BJButtonsBorderView.h"
#import "MaskButton.h"
#import "BJRoundBorderButton.h"


@interface BJButtonsBorderView ()
@property (strong, nonatomic) BJRoundBorderButton *loanButton;//贷款
@property (strong, nonatomic) BJRoundBorderButton *replacementButton;//置换
@property (strong, nonatomic) BJRoundBorderButton *queryButton;//询价

@end

@implementation BJButtonsBorderView

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self loadButtons];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self loadButtons];
    }
    return self;
}

- (id)init {
    self = [super init];
    if (self) {
        [self loadButtons];
    }
    return self;
}

- (void)loadButtons {
    self.loanButton = [BJRoundBorderButton buttonWithType:UIButtonTypeCustom];
    self.loanButton.backgroundColor = [UIColor whiteColor];
    [self.loanButton setTitle:@"AAA" forState:UIControlStateNormal];
    [self.loanButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.loanButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.loanButton clipRoundWithBorderColor:[UIColor lightGrayColor]
                                    byCorners:UIRectCornerTopLeft | UIRectCornerBottomLeft
                                       radius:2];
    self.loanButton.tag = 100;
    [self.loanButton addTarget:self
                        action:@selector(buttonPressed:)
              forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.loanButton];
        
    self.replacementButton = [BJRoundBorderButton buttonWithType:UIButtonTypeCustom];
    self.replacementButton.backgroundColor = [UIColor whiteColor];
    [self.replacementButton setTitle:@"BBB" forState:UIControlStateNormal];
    [self.replacementButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.replacementButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.replacementButton clipRoundWithBorderColor:[UIColor lightGrayColor]
                                           byCorners:UIRectCornerAllCorners
                                              radius:0];
    self.replacementButton.tag = 101;
    [self.replacementButton addTarget:self
                               action:@selector(buttonPressed:)
                     forControlEvents:UIControlEventTouchUpInside];
    [self insertSubview:self.replacementButton atIndex:0];
    
    self.queryButton = [BJRoundBorderButton buttonWithType:UIButtonTypeCustom];
    self.queryButton.backgroundColor = [UIColor blueColor];
    [self.queryButton setTitle:@"CCC" forState:UIControlStateNormal];
    [self.queryButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.queryButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.queryButton clipRoundWithBorderColor:[UIColor blueColor]
                                     byCorners:UIRectCornerTopRight | UIRectCornerBottomRight
                                        radius:2];
    self.queryButton.tag = 102;
    [self.queryButton addTarget:self
                         action:@selector(buttonPressed:)
               forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.queryButton];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    float height = self.frame.size.height, width = self.frame.size.width;
    float itemWidth = width / 3.;
    
    self.loanButton.frame = CGRectMake(0, 0, itemWidth, height);
    self.replacementButton.frame = CGRectMake(itemWidth-1, 0, itemWidth+2, height);
    self.queryButton.frame = CGRectMake(itemWidth*2., 0, itemWidth, height);
}

- (void)buttonPressed:(UIButton *)button {
    if (self.actionBlock) {
        self.actionBlock(button);
    }
}




@end












