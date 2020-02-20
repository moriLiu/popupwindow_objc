//
//  PopupContainerWindow.h
//  BetKeyboard
//
//  Created by jeff.liu on 2020/2/19.
//  Copyright © 2020 LAT. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PopupContainerWindow : UIWindow

- (nullable UIView *)hitTest:(CGPoint)point withEvent:(nullable UIEvent *)event;

@end

NS_ASSUME_NONNULL_END
