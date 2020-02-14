//
//  K8KeyboardViewController.m
//  YYxObjcProvingGround
//
//  Created by young.lu on 2019/12/17.
//  Copyright © 2019 young.lu. All rights reserved.
//

#import "K8KeyboardViewController.h"
#import "K8Keyboard.h"
//#import "KeyboardController.h"
@interface K8KeyboardViewController ()

@end

@implementation K8KeyboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self exampleK8Keyboard];
//    [self exampleKeyboardContrller];
    [self exampleK8Keyboard];
}
-(void)exampleKeyboardContrller
{
    CGFloat eachBtnH  = 39;
      UIView *aa = [[UIView alloc]initWithFrame:CGRectMake(5, 400, 365, eachBtnH*3 + 100)];//iphone8 w = 375 然後400是隨便打的
      [self.view addSubview:aa];
//    KeyboardController *rView = [[KeyboardController alloc] initWithFrame:aa.bounds];
//    [aa addSubview:rView];

//     K8Keyboard *keyboard = [[K8Keyboard alloc] initWithFrame:rView.containerView.bounds];
//    [rView.containerView addSubview:keyboard];
}
-(void)exampleK8Keyboard
{
   
    CGFloat eachBtnH  = 39;
    UIView *aa = [[UIView alloc]initWithFrame:CGRectMake(5, 400, 400, eachBtnH*3)];//iphone8 w = 375 然後400是隨便打的
    [self.view addSubview:aa];
       
       K8Keyboard *rView = [[K8Keyboard alloc] initWithFrame:aa.bounds];
         [aa addSubview:rView];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
