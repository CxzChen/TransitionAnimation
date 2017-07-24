//
//  TransitionPopAnimation.m
//  
//
//  Created by HF on 17/3/29.
//
//

#import "TransitionPopAnimation.h"
#import "TransitionFromViewController.h"
#import "TransitionToViewController.h"
//#import "TransitionCell.h"

@interface TransitionPopAnimation ()
{
    UIViewController *fromViewController,*toViewController;
    UIImageView *fromImg,*toImg;
    
}
@end
@implementation TransitionPopAnimation
- (instancetype)init:(UIViewController *)fromVc toVc:(UIViewController *)toVc fromViewImg:(UIImageView *)fromViewImg toViewImg:(UIImageView *)toViewImg
{
    self = [super init];
    if (self) {
        fromViewController = toVc;
        toViewController = fromVc;
        fromImg = toViewImg;
        toImg = fromViewImg;
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
    
    // Get a snapshot of the image view
    NSLog(@"%@",fromViewController.view.subviews);
    
    UIView *imageSnapshot = [fromImg snapshotViewAfterScreenUpdates:NO];
    imageSnapshot.frame = [containerView convertRect:fromImg.frame fromView:fromImg.superview];
    fromImg.hidden = YES;
    
    // Get the cell we'll animate to
//    TransitionCell *cell =  [toViewController tableViewCellForModel:fromViewController.index];
    toImg.hidden = YES;
    
    // Setup the initial view states
    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    [containerView insertSubview:toViewController.view belowSubview:fromViewController.view];
    [containerView addSubview:imageSnapshot];
    
    
    [UIView animateWithDuration:duration animations:^{
        // Fade out the source view controller
        fromViewController.view.alpha = 0.0;
        
        // Move the image view
        imageSnapshot.frame = [containerView convertRect:toImg.frame fromView:toImg.superview];
    } completion:^(BOOL finished) {
        if ([transitionContext transitionWasCancelled]) {
            fromViewController.view.alpha = 1.0;
        }
        // Clean up
        [imageSnapshot removeFromSuperview];
        fromImg.hidden = NO;
        toImg.hidden = NO;
        
        // Declare that we've finished
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}

@end
