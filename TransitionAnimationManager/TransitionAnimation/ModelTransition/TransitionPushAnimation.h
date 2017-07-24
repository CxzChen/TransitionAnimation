//
//  TransitionPushAnimation.h
//  SectionDemo
//
//  Created by HF on 17/3/29.
//  Copyright © 2017年 HF-Liqun. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface TransitionPushAnimation : NSObject <UIViewControllerAnimatedTransitioning>

- (instancetype)init:(UIViewController *)fromVc toVc:(UIViewController *)toVc fromViewImg:(UIImageView *)fromViewImg toViewImg:(UIImageView *)toViewImg;
@end
