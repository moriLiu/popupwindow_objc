//
//  BettingOrderViewController.m
//  BetKeyboard
//
//  Created by jeff.liu on 2020/2/14.
//  Copyright © 2020 LAT. All rights reserved.
//

#import "BettingOrderViewController.h"
#import "SingleBettingOrderView.h"
@interface BettingOrderViewController ()
@property (strong , nonatomic) PopupItem *popItem;
@property (strong , nonatomic) SingleBettingOrderView *singleBettingView;
@end

@implementation BettingOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self commonInit];
    
    PopupOption *bottomOption = [[PopupOption alloc] initWithShapeType:nonRounded margin:0 hasBlur:NO canTapDismiss:NO];
    
    self.popItem = [[PopupItem alloc] initWithView:self.singleBettingView height:self.singleBettingView.frame.size.height maxWidth:500 popupOption:bottomOption];
    
    [self configurePopupItem:self.popItem];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"self.view.frame = %@" , self.view);
}

- (void)commonInit
{
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSArray *loadedViews = [mainBundle loadNibNamed:@"SingleBettingOrderView" owner:self options:nil];
//    UIView *loadedSubview = [loadedViews firstObject];
    self.singleBettingView = [loadedViews firstObject];
    
//    [self.view addSubview:loadedSubview];
//    [loadedSubview setFrame: CGRectMake(0, 0, CGRectGetWidth(loadedSubview.frame), CGRectGetHeight(loadedSubview.frame))];
//    loadedSubview.center = self.view.center;
//    loadedSubview.translatesAutoresizingMaskIntoConstraints = NO;
    
//    [self addConstraint:[self pin:loadedSubview attribute:NSLayoutAttributeTop]];
//    [self addConstraint:[self pin:loadedSubview attribute:NSLayoutAttributeLeft]];
//    [self.view addConstraint:[self pin:loadedSubview attribute:NSLayoutAttributeBottom]];
//    [self.view addConstraint:[self pin:loadedSubview attribute:NSLayoutAttributeCenterX]];
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

- (IBAction)close:(id)sender {
    
    NSLog(@"關閉單筆投注pop");
    
}

- (IBAction)bettingButtonPressed:(id)sender {
    NSLog(@"投注檢測");
}

@end
