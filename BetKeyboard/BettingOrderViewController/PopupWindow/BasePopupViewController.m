//
//  BasePopupViewController.m
//  BetKeyboard
//
//  Created by jeff.liu on 2020/2/19.
//  Copyright © 2020 LAT. All rights reserved.
//

#import "BasePopupViewController.h"
#import "PopupContainerView.h"
#import <ReactiveCocoa/ObjCRuntimeAliases.h>

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
    if (_isShowedPopupView) { return; }
    
    self.isShowedPopupView = YES;
    [self configureBlurSpaceView];
    [self makePopupViewWithItem:self.item];
    [self showPopupView:0.3 Delay:0.0];
    
}

- (void)configurePopupItem : (PopupItem *) popItem {
    if (_isShowedPopupView){ return; }
    self.item = popItem;
}

- (void)makePopupViewWithItem: (PopupItem * _Nonnull)popupItem {
    CGFloat viewWidth = self.view.frame.size.width - popupItem.popupOption.margin * 2;
    CGFloat x = viewWidth > popupItem.maxWidth ? (self.view.frame.size.width - popupItem.maxWidth) / 2 : self.view.frame.origin.x + popupItem.popupOption.margin;
    CGFloat y = self.view.frame.size.height - [self safeAreaInsets].bottom;
    CGFloat width = viewWidth > popupItem.maxWidth ? popupItem.maxWidth : viewWidth;
    CGFloat height = popupItem.height + [self safeAreaInsets].bottom;
    
    self.item.view.frame = CGRectMake(x, y, width, height);
    self.item = popupItem;
//    [self convertShapeWithItem:popupItem];
    [self.view addSubview:popupItem.view];
}

- (void)showPopupView: (NSTimeInterval)duration Delay:(CGFloat)delay {
    __weak typeof(self) weakSelf = self;
    
    UIViewPropertyAnimator *animator = [[UIViewPropertyAnimator alloc] initWithDuration:duration curve:UIViewAnimationCurveLinear animations:^{
        __strong typeof(self) strongSelf = weakSelf;
        if (strongSelf && strongSelf.item) {
            strongSelf.item.view.frame = [strongSelf updatePopupViewFrameWithItem:strongSelf.item];
        }
    }];
    [animator startAnimation];
    
    UIViewPropertyAnimator *backgroundAnimator = [[UIViewPropertyAnimator alloc] initWithDuration:duration curve:UIViewAnimationCurveLinear animations:^{
        __strong typeof(self) strongSelf = weakSelf;
        if (strongSelf && strongSelf.item) {
            [strongSelf addBlurWithPopItem:strongSelf.item];
        }
    }];
    [backgroundAnimator startAnimation];
    
    
}

- (void)dismissPopupView: (NSTimeInterval)duration Delay:(CGFloat)delay {
    __weak typeof(self) weakSelf = self;
    
    UIViewPropertyAnimator *animator = [[UIViewPropertyAnimator alloc] initWithDuration:duration curve:UIViewAnimationCurveLinear animations:^{
        __strong typeof(self) strongSelf = weakSelf;
        
        if (strongSelf && strongSelf.item) {
            strongSelf.view.backgroundColor = [UIColor clearColor];
            CGFloat y = strongSelf.item.view.frame.origin.y;
            strongSelf.item.view.frame = CGRectMake(CGRectGetMinX(strongSelf.view.frame), y - CGRectGetHeight(strongSelf.item.view.frame), CGRectGetWidth(strongSelf.item.view.frame), CGRectGetHeight(strongSelf.item.view.frame));
        }
    }];
    [animator startAnimation];
}

- (CGRect) updatePopupViewFrameWithItem:(PopupItem *)item {
    CGFloat viewWidth = self.view.frame.size.width - item.popupOption.margin *2;
    CGFloat x = viewWidth > item.maxWidth ? (self.view.frame.size.width - item.maxWidth)/2 : self.view.frame.origin.x + item.popupOption.margin;
    CGFloat y = self.view.frame.size.height - item.height - [self safeAreaInsets].bottom;
    CGFloat width = viewWidth > item.maxWidth ? item.maxWidth : viewWidth;
    CGFloat height = item.height + [self safeAreaInsets].bottom;
    return CGRectMake(x, y, width, height);
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

- (void) replacePopupViewWithItem:(PopupItem *)popItem {
    if (!popItem) {
        NSLog(@"popup item is empty.");
        return;
    }
    
    NSLog(@"Replace Popup view.");
    [self.item.view removeFromSuperview];
    popItem.view.frame = [self updatePopupViewFrameWithItem:popItem];
    [self.view addSubview:popItem.view];
    
    self.item = popItem;
    [self addBlurWithPopItem:popItem];
    [self convertShapeWithItem:popItem];
    
    UIViewPropertyAnimator *animator = [[UIViewPropertyAnimator alloc] initWithDuration:0.3 curve:UIViewAnimationCurveLinear animations:^{
        if ([self.item.view isKindOfClass:[PopupContainerView class]]) {
            ((PopupContainerView *)popItem.view).alpha = 1.0;
        }
    }];
    
    [animator startAnimation];
    
}

- (void)configureBlurSpaceView {
    self.blurSpaceView = [[PopupContainerView alloc] init];
    self.blurSpaceView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
    self.blurSpaceView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.blurSpaceView];
}

- (void)addBlurWithPopItem : (PopupItem *) popItem {
    
    if (popItem.popupOption.hasBlur) {
        self.view.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.8];
        
        if ([self.view isKindOfClass:[PopupContainerView class]]) {
            ((PopupContainerView *)self.view).isAbleToTouchLower = NO;
            self.blurSpaceView.isAbleToTouchLower = NO;
        }
        
    }else{
        
        self.view.backgroundColor = [UIColor clearColor];
        if ([self.view isKindOfClass:[PopupContainerView class]]) {
            ((PopupContainerView *)self.view).isAbleToTouchLower = YES;
            self.blurSpaceView.isAbleToTouchLower = YES;

        }
    }
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
