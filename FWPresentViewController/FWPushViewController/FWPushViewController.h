//
//  FWPushViewController.h
//  FWPresentViewController
//
//  Created by net263 on 2020/4/15.
//  Copyright © 2020 net263. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FWPushViewController : UIViewController
-(instancetype)initWithChildViewController:(UIViewController*)childViewController;
@property(nonatomic, strong)UIViewController *childViewController;
@property(nonatomic, strong)UIColor *bgColor;
@property(nonatomic, strong)UIView *contentView;

/**
 (MAXFLOAT, MAXFLOAT)代表与父View大小一致
 */
@property(nonatomic, assign)CGSize contentSize;
@property(nonatomic, assign)FWPUSHTYPE pushType;
@end

NS_ASSUME_NONNULL_END
