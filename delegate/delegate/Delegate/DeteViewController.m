//
//  DeteViewController.m
//  delegate
//
//  Created by 最爱是深蓝 on 2017/12/4.
//  Copyright © 2017年 ProductTest. All rights reserved.
//

#import "DeteViewController.h"
#import "DateViewController.h"
#import "DataView.h"
@interface DeteViewController ()<Mydelegate1>
@property (nonatomic, strong) DataView * view1 ;
@end

@implementation DeteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor] ;
    
    //    UIButton * bt = [UIButton new] ;
    //    bt.frame = CGRectMake(100, 200, 100, 100) ;
    //    [bt addTarget:self action:@selector(fangfa) forControlEvents:UIControlEventTouchUpInside] ;
    //    bt.backgroundColor = [UIColor redColor] ;
    //    [self.view addSubview:bt] ;
    [self.view addSubview:self.view1] ;
    
    // Do any additional setup after loading the view.
}
//ViewController代理传值
- (void)fangfa
{
    //    DateViewController * vi = [[DateViewController alloc] init] ;
    //    vi.delegate = self ;
    //    [self presentViewController:vi animated:YES completion:nil] ;
}

//代理方法
- (void)eat:(NSString *)eat
{
    NSLog(@"---%@",eat) ;
}


//自定义View代理传值
- (DataView *)view1
{//get方法加载view
    if (!_view1) {
        _view1 = [[DataView alloc] initWithFrame:CGRectMake(100, 300, 200, 200)] ;
        _view1.delegate = self ;//设置代理
    }
    return _view1 ;
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
