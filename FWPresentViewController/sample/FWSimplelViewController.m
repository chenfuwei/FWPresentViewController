//
//  FWSimplelViewController.m
//  FWPresentViewController
//
//  Created by net263 on 2020/4/15.
//  Copyright © 2020 net263. All rights reserved.
//

#import "FWSimplelViewController.h"

@interface FWSimplelViewController ()

@end

@implementation FWSimplelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    [label setText:@"Simple"];
    [label setTextColor:[UIColor greenColor]];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(60);
        make.width.mas_equalTo(@200);
        make.height.mas_equalTo(@100);
        make.centerX.mas_equalTo(self.view.mas_centerX);
    }];
    // Do any additional setup after loading the view.
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
