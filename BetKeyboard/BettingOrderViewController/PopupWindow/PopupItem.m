//
//  PopupItem.m
//  BetKeyboard
//
//  Created by jeff.liu on 2020/2/19.
//  Copyright © 2020 LAT. All rights reserved.
//

#import "PopupItem.h"
@implementation PopupOption

-(instancetype)initWithShapeType:(ShapeType)shapeType
     viewType:(ViewType)viewType
       margin:(CGFloat)margin
      hasBlur:(BOOL)blur
canTapDismiss:(BOOL)canTapDismiss {
    
    if (self = [super init]) {
        self.shapeType = shapeType;
        self.viewType = viewType;
        self.margin = margin;
        self.hasBlur = blur;
        self.canTapDismiss = canTapDismiss;
    }
    
    return self;
}

@end


@implementation PopupItem

- (void)initWithView:(UIView *)view
       height:(CGFloat)height
     maxWidth:(CGFloat)maxWidth
landScapeSize:(CGSize)size
  popupOption:(PopupOption *)option {
    self.view = view;
    self.height = height < 0 ? 0 : height;
    self.maxWidth = maxWidth;
    self.landScapeSize = size;
    self.popupOption = option;
}

@end
