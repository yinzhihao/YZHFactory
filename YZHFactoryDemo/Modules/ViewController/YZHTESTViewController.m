//
//  ;ViewController.m
//  YZHFactoryDemo
//
//  Created by NO NAME on 2021/9/2.
//  Copyright © 2021 yzh. All rights reserved.
//

#import "YZHTESTViewController.h"

@interface YZHTESTViewController ()

@end

@implementation YZHTESTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"text vc";
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(doBack)];
    
    UIButton *button = [UIButton yzh_buttonWithTitle:@"next" font:FONT_SYSTEM(20) normalColor:UIColor.whiteColor backgroundColor:RGB_COLOR(60, 120, 240) image:nil];
    [button addTarget:self action:@selector(onNext) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (void)doBack
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)onNext
{
    YZHTESTViewController *vc = [[YZHTESTViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
