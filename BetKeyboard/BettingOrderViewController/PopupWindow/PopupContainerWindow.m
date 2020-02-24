//
//  PopupContainerWindow.m
//  BetKeyboard
//
//  Created by jeff.liu on 2020/2/19.
//  Copyright © 2020 LAT. All rights reserved.
//

#import "PopupContainerWindow.h"

@implementation PopupContainerWindow

- (nullable UIView *)hitTest:(CGPoint)point withEvent:(nullable UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    if (view && view != self ) {
        return view;
    };
    return nil;
}

@end
