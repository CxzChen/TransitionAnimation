//
//  ViewController.m
//  TransitionAnimation
//
//  Created by zhchen on 2017/7/24.
//  Copyright © 2017年 zhchen. All rights reserved.
//

#import "ViewController.h"
#import "TransitionFromViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)btn:(id)sender {
    NSLog(@"%@",self.navigationController);
    TransitionFromViewController *vc = [[TransitionFromViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
