//
//  PopupWindowManager.h
//  BetKeyboard
//
//  Created by jeff.liu on 2020/2/19.
//  Copyright © 2020 LAT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface PopupWindowManager : NSObject

+(instancetype)sharedInstance;

-(void)changeKeyWindow:(UIViewController * _Nonnull)rootVC;

@end

NS_ASSUME_NONNULL_END
