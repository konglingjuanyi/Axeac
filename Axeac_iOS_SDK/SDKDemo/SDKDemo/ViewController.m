//
//  ViewController.m
//  SDKDemo
//
//  Created by dnnta on 2016/11/17.
//  Copyright © 2016年 axeac. All rights reserved.
//

#import "ViewController.h"
#import <KHSDK/KHSDK.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clicked:(id)sender {
    UIViewController *vc = [KHSDK workCenterVC];
    [self presentViewController:vc animated:YES completion:nil];
}

@end
