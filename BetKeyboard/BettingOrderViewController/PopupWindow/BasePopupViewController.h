//
//  BasePopupViewController.h
//  BetKeyboard
//
//  Created by jeff.liu on 2020/2/19.
//  Copyright © 2020 LAT. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PopupItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface BasePopupViewController : UIViewController
- (void)configurePopupItem : (PopupItem *) popItem;
- (void)makePopupViewWithItem: (PopupItem * _Nonnull)popupItem;
- (void)replacePopupViewWithItem:(PopupItem *)popItem;
- (void)showPopupView: (NSTimeInterval)duration Delay:(CGFloat)delay;
- (void)dismissPopupView: (NSTimeInterval)duration Delay:(CGFloat)delay;
@end

NS_ASSUME_NONNULL_END
