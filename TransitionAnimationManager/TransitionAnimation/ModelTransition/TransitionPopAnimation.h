//
//  TransitionPopAnimation.h
//  
//
//  Created by HF on 17/3/29.
//
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface TransitionPopAnimation : NSObject <UIViewControllerAnimatedTransitioning>

- (instancetype)init:(UIViewController *)fromVc toVc:(UIViewController *)toVc fromViewImg:(UIImageView *)fromViewImg toViewImg:(UIImageView *)toViewImg;
@end
