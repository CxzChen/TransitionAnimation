//
//  TransitionToViewController.h
//  TransitionAnimation
//
//  Created by zhchen on 2017/7/24.
//  Copyright © 2017年 zhchen. All rights reserved.
//

#import "ViewController.h"
#import "TransitionFromViewController.h"
@interface TransitionToViewController : ViewController
@property (nonatomic, strong)  UIImageView *iconImageView;
@property (nonatomic, strong)  UIImageView *fromImg;
@property (nonatomic, strong) TransitionFromViewController *fromVc;
@end
