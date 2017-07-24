//
//  TransitionToViewController.m
//  TransitionAnimation
//
//  Created by zhchen on 2017/7/24.
//  Copyright © 2017年 zhchen. All rights reserved.
//

#import "TransitionToViewController.h"
#import "TransitionNavigationPerformer.h"
@interface TransitionToViewController ()
{
    TransitionNavigationPerformer *navPerformer;
}
@end

@implementation TransitionToViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    navPerformer = [[TransitionNavigationPerformer alloc]initWithNav:self.navigationController fromVc:self.fromVc toVc:self fromViewImg:self.fromImg toViewImg:self.iconImageView];
    [self setupViews];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.delegate = navPerformer;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.delegate = nil;
}
- (void)setupViews
{
    UITapGestureRecognizer *pan = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [self.view addGestureRecognizer:pan];
    [self.view addSubview:self.iconImageView];
    
    self.iconImageView.frame = CGRectMake(175/2, 300, 200, 200);
    
    //更新childView frame
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
}
- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"timg.jpg"]];
        _iconImageView.clipsToBounds = YES;
        _iconImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _iconImageView;
}
- (void)panAction:(UITapGestureRecognizer *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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
