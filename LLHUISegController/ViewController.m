//
//  ViewController.m
//  LLHUISegController
//
//  Created by jit-mac on 16/10/10.
//  Copyright © 2016年 LLH. All rights reserved.
//

#import "ViewController.h"
#import "ValidationFirstController.h"
#import "ValidationSecendController.h"
#import "ValidationThirdController.h"


@interface ViewController ()

@property (nonatomic,strong) UIViewController *currentViewController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor blackColor];
    [self addChildViewControllers];
    [self initUI];
}
-(void)initUI{
    NSArray *items=@[@"界面一",@"这是界面二呀",@"爱是什么"];
    UISegmentedControl *segment=[[UISegmentedControl alloc]initWithItems:items];
    [segment setFrame:CGRectMake(35, 25, self.view.bounds.size.width-70, 30)];
    [segment addTarget:self action:@selector(segmentClick:) forControlEvents:UIControlEventValueChanged];
    segment.selectedSegmentIndex=0;//默认显示位置//和[self addChildViewControllers]是对应关系
    segment.tintColor=[UIColor whiteColor];
    segment.apportionsSegmentWidthsByContent=YES;//根据内容来调整每个按钮的宽度
    [self.view addSubview:segment];
    
}
-(void)segmentClick:(UISegmentedControl *)segment{
    
  //  NSLog(@"%ld",segment.selectedSegmentIndex);
    
    if (segment.selectedSegmentIndex>=self.childViewControllers.count) {
        return;
    }
    UIViewController *targetController = self.childViewControllers[segment.selectedSegmentIndex];
    if (self.currentViewController == targetController) {
        return;
    }
    //
    [self transitionFromViewController:self.currentViewController toViewController:targetController duration:0.35f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        
    } completion:^(BOOL finished) {
        self.currentViewController = targetController;
    }];
    
}

- (void)addChildViewControllers {
    CGRect frame = CGRectMake(0, 65, self.view.frame.size.width, self.view.frame.size.height-65);
    
    ValidationFirstController *validationFirst = [[ValidationFirstController alloc] init];
    validationFirst.view.frame = frame;
    validationFirst.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:validationFirst];
    [self.view addSubview:validationFirst.view]; // 默认当前显示红色视图
    self.currentViewController = validationFirst;
    
    ValidationSecendController *validationSecend = [[ValidationSecendController alloc] init];
    validationSecend.view.backgroundColor = [UIColor greenColor];
    validationSecend.view.frame = frame;
    [self addChildViewController:validationSecend];
    
    ValidationThirdController *validationThird = [[ValidationThirdController alloc] init];
    validationThird.view.backgroundColor = [UIColor blueColor];
    validationThird.view.frame = frame;
    [self addChildViewController:validationThird];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
