//
//  PopupWindowManager.m
//  BetKeyboard
//
//  Created by jeff.liu on 2020/2/19.
//  Copyright © 2020 LAT. All rights reserved.
//

#import "PopupWindowManager.h"
#import "PopupContainerWindow.h"
#import "BasePopupViewController.h"
@interface PopupWindowManager()

@property (strong , nonatomic) PopupContainerWindow *containerWindow;

@end

@implementation PopupWindowManager

//- (instancetype)init {
//    return [PopupWindowManager sharedInstance];
//}

+(instancetype)sharedInstance {
    
    static PopupWindowManager *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[PopupWindowManager alloc] init];
    });
    
    return instance;
}


-(void)changeKeyWindow:(UIViewController * _Nonnull)rootVC {

    if (rootVC) {
        self.containerWindow = [[PopupContainerWindow alloc] init];
        
        if (self.containerWindow && [rootVC isKindOfClass: [BasePopupViewController class]]) {
            
            
            UIWindow *keyWindow = [self keyWindow];
            
            self.containerWindow.frame = keyWindow.frame;
            self.containerWindow.backgroundColor = [UIColor clearColor];
            self.containerWindow.windowLevel = UIWindowLevelStatusBar +1;
            self.containerWindow.rootViewController = rootVC;
            rootVC.view.backgroundColor = [UIColor clearColor];
            [self.containerWindow makeKeyAndVisible];
            
        }else{
            return;
        }
    } else {
        self.containerWindow.rootViewController = nil;
        self.containerWindow = nil;
        [[self keyWindow] makeKeyAndVisible];
    }
    
}

- (UIWindow *) keyWindow {
    UIWindow *keyWindow;
    if (@available(iOS 13.0 , *)) {
        NSSet *scenes = [UIApplication sharedApplication].connectedScenes;
        
        for (UIWindowScene* scene in scenes) {
            if (scene.activationState == UISceneActivationStateForegroundActive) {
                
                for (UIWindow *window in scene.windows) {
                    if (window.keyWindow) {
                        keyWindow = window;
                    }
                }
                
                break;
            }
        }
    }else{
        keyWindow = [UIApplication sharedApplication].keyWindow;
    }
    return keyWindow;
}

@end
