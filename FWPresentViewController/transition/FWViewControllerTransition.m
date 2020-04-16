//
//  FWViewControllerTransition.m
//  FWPresentViewController
//
//  Created by net263 on 2020/4/15.
//  Copyright © 2020 net263. All rights reserved.
//

#import "FWViewControllerTransition.h"

@implementation FWViewControllerTransition

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    BOOL isPresenting = toViewController.presentingViewController == fromViewController;
    if(isPresenting)
    {
        [self presentViewController:transitionContext];
    }else{
        [self dismissViewController:transitionContext];
    }
}

-(void)presentViewController:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
}

-(void)dismissViewController:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 4.0;
}
@end
