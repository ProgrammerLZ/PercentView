//
//  ViewController.m
//  PercentView
//
//  Created by 刘哲 on 2018/2/12.
//  Copyright © 2018年 刘哲. All rights reserved.
//

#import "ViewController.h"
#import "PercentView.h"
@interface ViewController ()
@property (nonatomic,strong) PercentView *percentView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.percentView = [[PercentView alloc] init];
    self.percentView.bounds = CGRectMake(0, 0, 300, 300);
    self.percentView.center = self.view.center;
    self.percentView.totalValue = 1000;
    self.percentView.differentValue = 100;
    [self.view addSubview:self.percentView];
    
}

- (IBAction)subClick:(id)sender
{
    self.percentView.differentValue = -100;
}

- (IBAction)addClick:(id)sender
{
    self.percentView.differentValue = +100;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
