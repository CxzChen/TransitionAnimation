//
//  TransitionPushAnimation.m
//  SectionDemo
//
//  Created by HF on 17/3/29.
//  Copyright © 2017年 HF-Liqun. All rights reserved.
//

#import "TransitionPushAnimation.h"
#import "TransitionFromViewController.h"
#import "TransitionToViewController.h"
//#import "TransitionCell.h"
@interface TransitionPushAnimation ()
{
    UIViewController *fromViewController,*toViewController;
    UIImageView *fromImg,*toImg;
    
}
@end


@implementation TransitionPushAnimation

- (instancetype)init:(UIViewController *)fromVc toVc:(UIViewController *)toVc fromViewImg:(UIImageView *)fromViewImg toViewImg:(UIImageView *)toViewImg
{
    self = [super init];
    if (self) {
        fromViewController = fromVc;
        toViewController = toVc;
        fromImg = fromViewImg;
        toImg = toViewImg;
    }
    return  self;
}



#pragma mark - UIViewControllerAnimatedTransitioning Delegate

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3;
}

/* 动画的内容 */
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    // Get a snapshot of the thing cell we're transitioning from
//    NSIndexPath *indexPath = [fromViewController.tableView indexPathForSelectedRow];
//    TransitionCell *cell =(TransitionCell*) [fromViewController.tableView cellForRowAtIndexPath:indexPath];

    UIView *cellImageSnapshot = [fromImg snapshotViewAfterScreenUpdates:NO];
    cellImageSnapshot.frame = [containerView convertRect:fromImg.frame fromView:fromImg.superview];
    fromImg.hidden = YES;
    
    // Setup the initial view states
    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    toViewController.view.alpha = 0;
    toImg.hidden = YES;
    
    [containerView addSubview:toViewController.view];
    [containerView addSubview:cellImageSnapshot];

    [UIView animateWithDuration:duration animations:^{
        // Fade in the second view controller's view
        toViewController.view.alpha = 1.0;
        
        // Move the cell snapshot so it's over the second view controller's image view
        CGRect frame = [containerView convertRect:toImg.frame fromView:toViewController.view];
        cellImageSnapshot.frame = frame;
    } completion:^(BOOL finished) {
        // Clean up
        toImg.hidden = NO;
//        cell.hidden = NO;
        fromImg.hidden = NO;
        [cellImageSnapshot removeFromSuperview];
        
        // Declare that we've finished
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}


@end
