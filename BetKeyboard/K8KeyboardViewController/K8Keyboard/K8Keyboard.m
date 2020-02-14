//
//  ReusableView.m
//  ReusableUIViewWithXib
//
//  Created by MORITA NAOKI on 2014/05/08.
//  Copyright (c) 2014年 molabo. All rights reserved.
//

#import "K8Keyboard.h"

@implementation K8Keyboard

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    
    return self;
}

- (void)commonInit
{
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSArray *loadedViews = [mainBundle loadNibNamed:NSStringFromClass(self.class) owner:self options:nil];
    UIView *loadedSubview = [loadedViews firstObject];
    
    [self addSubview:loadedSubview];
    
    loadedSubview.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addConstraint:[self pin:loadedSubview attribute:NSLayoutAttributeTop]];
    [self addConstraint:[self pin:loadedSubview attribute:NSLayoutAttributeLeft]];
    [self addConstraint:[self pin:loadedSubview attribute:NSLayoutAttributeBottom]];
    [self addConstraint:[self pin:loadedSubview attribute:NSLayoutAttributeRight]];
}

- (NSLayoutConstraint *)pin:(id)item attribute:(NSLayoutAttribute)attribute
{
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:attribute
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:item
                                        attribute:attribute
                                       multiplier:1.0
                                         constant:0.0];
}
- (IBAction)pressTheButton:(UIButton *)sender {
    NSLog(@"%@", sender.titleLabel.text);
}

@end
