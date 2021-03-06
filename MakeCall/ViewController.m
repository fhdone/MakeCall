//
//  ViewController.m
//  MakeCall
//
//  Created by FHDone on 16/4/5.
//  Copyright © 2016年 fhdone. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,assign) BOOL reDial;

@end

@implementation ViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    self.reDial = NO;
    // Do any additional setup after loading the view, typically from a nib.
    //self.dailButton.backgroundColor = [UIColor grayColor];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //[self.dailButton sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(appDidBecomeActive:)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//http://stackoverflow.com/questions/15864364/viewdidappear-is-not-called-when-opening-app-from-background
- (void)appDidBecomeActive:(NSNotification *)notification {
    if(self.reDial){
        [self.dailButton sendActionsForControlEvents:UIControlEventTouchUpInside];
    }
}


- (IBAction)dailClick:(UIButton *)sender {
    self.reDial = YES;
    NSString *phoneNumber = [@"tel://" stringByAppendingString:self.dialNumber.text];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
}

- (IBAction)endDailClick:(UIButton *)sender {
    self.reDial = NO;
}



@end
