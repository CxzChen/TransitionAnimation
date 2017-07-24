//
//  TransitionFromViewController.m
//  TransitionAnimation
//
//  Created by zhchen on 2017/7/24.
//  Copyright © 2017年 zhchen. All rights reserved.
//

#import "TransitionFromViewController.h"
#import "TransitionNavigationPerformer.h"
#import "TransitionToViewController.h"
@interface TransitionFromViewController ()<UIViewControllerTransitioningDelegate,UINavigationControllerDelegate>
{
    TransitionNavigationPerformer *navPerformer;
}
@end

@implementation TransitionFromViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    self.iconImageView.userInteractionEnabled = YES;
    self.iconImageView.image = [UIImage imageNamed:@"timg"];
    [self.view addSubview:self.iconImageView];
    UITapGestureRecognizer *pan = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [self.iconImageView addGestureRecognizer:pan];
    
    navPerformer = [[TransitionNavigationPerformer alloc] initWithNav:self.navigationController fromVc:nil toVc:nil fromViewImg:nil toViewImg:nil];
    
    
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.delegate = nil;
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.delegate = nil;
    
}
- (void)panAction:(UITapGestureRecognizer *)sender
{
    self.navigationController.delegate = navPerformer;
    TransitionToViewController *vc = [[TransitionToViewController alloc] initWithNibName:@"TransitionToViewController" bundle:nil];
    vc.fromImg = self.iconImageView;
    vc.fromVc = self;
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
