//
//  ViewController.m
//  FWPresentViewController
//
//  Created by net263 on 2020/4/15.
//  Copyright © 2020 net263. All rights reserved.
//

#import "ViewController.h"
#import "FWPushViewController/FWPushViewController.h"
#import "sample/FWSimplelViewController.h"

@interface ViewController ()
@property(nonatomic, strong)UIButton *btnSimple;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.btnSimple = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btnSimple setTitle:@"简单" forState:UIControlStateNormal];
    [self.view addSubview:_btnSimple];
    [self.btnSimple mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(60);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(200, 100));
    }];
    
    [self.btnSimple addTarget:self action:@selector(toSimple:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)toSimple:(UIButton*)button
{
    FWPushViewController *pushViewController = [[FWPushViewController alloc] init];
    FWSimplelViewController *simpleViewController = [[FWSimplelViewController alloc] init];
    pushViewController.childViewController = simpleViewController;
    pushViewController.bgColor = [UIColor redColor];
    pushViewController.contentSize = CGSizeMake(250, MAXFLOAT);
    pushViewController.pushType = FWPUSHTYPE_RIGHT;
    [self presentViewController:pushViewController animated:YES completion:^{
        
    }];
}
@end
