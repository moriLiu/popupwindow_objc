//
//  PopupItem.h
//  BetKeyboard
//
//  Created by jeff.liu on 2020/2/19.
//  Copyright © 2020 LAT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, ShapeType) {
    nonRounded,
    rounded,
    roundedCornerTop,
    roundedCornerBottom
};

typedef NS_ENUM(NSInteger, ViewType) {
    toast,
    card,
};


@interface PopupOption : NSObject

@property (nonatomic) ShapeType shapeType;
@property (nonatomic) ViewType viewType;
@property (nonatomic) CGFloat margin;
@property (nonatomic) BOOL hasBlur;
@property (nonatomic) BOOL canTapDismiss;

-(instancetype)initWithShapeType:(ShapeType)shapeType
                viewType:(ViewType)viewType
                  margin:(CGFloat)margin
                 hasBlur:(BOOL)blur
           canTapDismiss:(BOOL)canTapDismiss;


@end

@interface PopupItem : NSObject
@property (strong, nonatomic) UIView *view;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGFloat maxWidth;
@property (nonatomic) CGSize landScapeSize;
@property (strong, nonatomic) PopupOption * popupOption;

- (void)initWithView:(UIView *)view
              height:(CGFloat)height
            maxWidth:(CGFloat)maxWidth
       landScapeSize:(CGSize)size
         popupOption:(PopupOption *)option;

@end



NS_ASSUME_NONNULL_END
