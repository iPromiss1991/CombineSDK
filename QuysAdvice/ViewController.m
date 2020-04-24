//
//  ViewController.m
//  QuysAdvice
//
//  Created by quys on 2020/4/21.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "ViewController.h"
#import <QuysAdviceSDK/QuysAdviceSDK.h>

@interface ViewController ()<QuysSplashAdviceDelegate>
@property (nonatomic,strong) QuysBannerAdvice *banner;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    // Do any additional setup after loading the view.
    
    QuysBannerAdvice *banner = [[QuysBannerAdvice alloc]initWithID:@"banner_ios_qys_test" key:@"D0E8D293C79F627ABB15761662C65AB3" cgRect:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width , 200) eventDelegate:self parentView:self.view];
    self.banner = banner;
    
}

-(void)quys_requestStart:(QuysBaseAdvice *)service
{
    NSLog(@"%s",__FUNCTION__);
}

- (void)quys_requestSuccess:(QuysBaseAdvice *)service
{
    
}

- (void)quys_requestFial:(QuysBaseAdvice *)service error:(NSError *)error
{
    
}

@end
