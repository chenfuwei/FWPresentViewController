//
//  FWPushViewController+Transition.m
//  FWPresentViewController
//
//  Created by net263 on 2020/4/15.
//  Copyright © 2020 net263. All rights reserved.
//

#import "FWPushViewController+Transition.h"
#import "FWVCRToLTransition.h"

@implementation FWPushViewController (Transition)
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [[FWVCRToLTransition alloc] init];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [[FWVCRToLTransition alloc] init];
}
@end
