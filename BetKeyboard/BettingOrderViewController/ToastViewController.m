//
//  ToastViewController.m
//  BetKeyboard
//
//  Created by jeff.liu on 2020/2/21.
//  Copyright © 2020 LAT. All rights reserved.
//

#import "ToastViewController.h"

static NSTimeInterval popupDuration = 0.3;
static NSTimeInterval transformDuration = 0.4;

@interface ToastViewController ()
@property (strong , nonatomic) PopupItem *popItem;


@end

@implementation ToastViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    PopupOption *bottomOption = [[PopupOption alloc] initWithShapeType:nonRounded margin:0 hasBlur:NO canTapDismiss:NO];
    
    self.popItem = [[PopupItem alloc] initWithView:self.view height:self.view.frame.size.height maxWidth:500 popupOption:bottomOption];
    
    [self configurePopupItem:self.popItem];
    
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
//    if (!self.popItem) {return;}
//
//    __weak typeof(self) weakSelf = self;
//    dispatch_async(dispatch_get_main_queue(), ^{
//        __strong typeof(self) strongSelf = weakSelf;
//
//    });
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
