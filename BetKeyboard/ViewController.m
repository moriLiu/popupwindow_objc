//
//  ViewController.m
//  BetKeyboard
//
//  Created by jeff.liu on 2020/2/14.
//  Copyright © 2020 LAT. All rights reserved.
//

#import "ViewController.h"
//#import "K8Keyboard.h"
#import "PopupWindowManager.h"
#import "BettingOrderViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    BettingOrderViewController *vc = [[BettingOrderViewController alloc] init];
    PopupWindowManager *manager = [PopupWindowManager sharedInstance];
    [manager changeKeyWindow:vc];
    
}

- (IBAction)addBetingOrder:(id)sender {
}

- (IBAction)removeBettingOrder:(id)sender {
}



@end
