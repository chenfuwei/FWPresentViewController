//
//  FWVCRToLTransition.m
//  FWPresentViewController
//
//  Created by net263 on 2020/4/16.
//  Copyright © 2020 net263. All rights reserved.
//

#import "FWVCRToLTransition.h"

@implementation FWVCRToLTransition
-(void)presentViewController:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    NSLog(@"presentViewController fromViewController:%@ toViewController:%@", fromViewController, toViewController);
    
    CGRect fromeFrame = [transitionContext initialFrameForViewController:fromViewController];
    CGRect toFrame = [transitionContext initialFrameForViewController:toViewController];
    NSLog(@"presentViewController fromeFrame:%f:%f toFrame:%f:%f", fromeFrame.size.width, fromeFrame.size.height, toFrame.size.width, toFrame.size.height);
    
    CGAffineTransform transform;
    transform = CGAffineTransformMakeTranslation(toView.bounds.size.width, 0);
    toView.transform = CGAffineTransformConcat(CGAffineTransformIdentity, transform);
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toView];
    
    [UIView animateWithDuration:0.25 animations:^{
        toView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
}

-(void)dismissViewController:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    NSLog(@"dismissViewController fromViewController:%@ toViewController:%@", fromViewController, toViewController);
    
    CGRect fromeFrame = [transitionContext initialFrameForViewController:fromViewController];
    CGRect toFrame = [transitionContext initialFrameForViewController:toViewController];
    NSLog(@"dismissViewController fromeFrame:%f:%f toFrame:%f:%f", fromeFrame.size.width, fromeFrame.size.height, toFrame.size.width, toFrame.size.height);
    
    [UIView animateWithDuration:0.25 animations:^{
        CGAffineTransform transform = CGAffineTransformMakeTranslation(fromView.bounds.size.width, 0);
        fromView.transform = CGAffineTransformConcat(CGAffineTransformIdentity, transform);
    } completion:^(BOOL finished) {
        
        [fromView removeFromSuperview];
        [transitionContext completeTransition:YES];
    }];
}
@end
