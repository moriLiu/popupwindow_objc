//
//  BasePopupViewController.m
//  BetKeyboard
//
//  Created by jeff.liu on 2020/2/19.
//  Copyright © 2020 LAT. All rights reserved.
//

#import "BasePopupViewController.h"
#import "PopupContainerView.h"
#import "PopupItem.h"

@interface BasePopupViewController ()

@property (strong , nonatomic, nonnull) PopupItem *item;
@property (nonatomic) BOOL isShowedPopupView;
@property (strong , nonatomic) PopupContainerView *blurSpaceView;
@end

@implementation BasePopupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)loadView {
    [super loadView];
    [self configurePopupContainerView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (!_isShowedPopupView) {
        self.isShowedPopupView = YES;
        [self configureBlurSpaceView];
    }
}

- (void)makePopupViewWithItem: (PopupItem * _Nonnull)item {
    CGFloat viewWidth = self.view.frame.size.width - item.popupOption.margin * 2;
    CGFloat x = viewWidth > item.maxWidth ? (self.view.frame.size.width - item.maxWidth) / 2 : self.view.frame.origin.x + item.popupOption.margin;
    CGFloat y = self.view.frame.size.height - [self safeAreaInsets].bottom;
    CGFloat width = viewWidth > item.maxWidth ? item.maxWidth : viewWidth;
    CGFloat height = item.height + [self safeAreaInsets].bottom;
    
    self.item.view.frame = CGRectMake(x, -CGRectGetHeight(item.view.frame), width, height);
    self.item = item;
    [self convertShapeWithItem:item];
    [self.view addSubview:item.view];
}

- (void)convertShapeWithItem: (PopupItem *)item {
    CGSize viewSize = item.view.frame.size;
    UIView *maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, viewSize.width, viewSize.height)];
    UIView *topRoundedRect = [[UIView alloc] initWithFrame:item.view.frame];
    topRoundedRect.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    topRoundedRect.backgroundColor = [UIColor blackColor];
    topRoundedRect.clipsToBounds = YES;
    topRoundedRect.layer.cornerRadius = 8;
    [maskView addSubview:topRoundedRect];
    self.item.view.maskView = maskView;
}

- (void)configureBlurSpaceView {
    self.blurSpaceView = [[PopupContainerView alloc] init];
    self.blurSpaceView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
    self.blurSpaceView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.blurSpaceView];
}

- (void)configurePopupContainerView {
    self.view = [[PopupContainerView alloc] init];
    self.view.backgroundColor =  [UIColor clearColor];
}

- (UIEdgeInsets)safeAreaInsets {
    if (@available(iOS 11.0, *)) {
        return self.view.safeAreaInsets;
    }else{
        return UIEdgeInsetsZero;
    }
}

- (BOOL)canTipDismiss {
    return NO;
}

@end
