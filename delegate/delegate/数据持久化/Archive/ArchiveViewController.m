//
//  ArchiveViewController.m
//  delegate
//
//  Created by 最爱是深蓝 on 2018/1/4.
//  Copyright © 2018年 ProductTest. All rights reserved.
//

#import "ArchiveViewController.h"
#import "ArchiveModel.h"

@interface ArchiveViewController ()
@property (nonatomic, strong) UITextField * textfield ;

@end

@implementation ArchiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor] ;
    for (int i = 0; i < 3; i ++) {
        self.textfield = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 50, 70 + 100*(i / 1), 100, 40)] ;
        self.textfield.textColor = [UIColor blackColor] ;
        self.textfield.backgroundColor = [UIColor lightGrayColor] ;
        self.textfield.tag = i + 10 ;
        [self.view addSubview:self.textfield] ;
    }
    
    UIButton * archive = [[UIButton alloc] initWithFrame:CGRectMake(85, 400, 50, 30)] ;
    archive.backgroundColor = [UIColor orangeColor] ;
    [archive setTitle:@"归档" forState:0] ;
    [archive addTarget:self action:@selector(archiveSel) forControlEvents:UIControlEventTouchUpInside] ;
    [self.view addSubview:archive] ;
    
    UIButton * unarchive = [[UIButton alloc] initWithFrame:CGRectMake(285, 400, 50, 30)] ;
    unarchive.backgroundColor = [UIColor orangeColor] ;
    [unarchive setTitle:@"解档" forState:0] ;
    [unarchive addTarget:self action:@selector(unarchiveSel) forControlEvents:UIControlEventTouchUpInside] ;
    [self.view addSubview:unarchive] ;
}


- (void)archiveSel
{
    UITextField * te1 = (UITextField *)[self.view viewWithTag:10] ;
    UITextField * te2 = (UITextField *)[self.view viewWithTag:11] ;
    UITextField * te3 = (UITextField *)[self.view viewWithTag:12] ;
    NSString * file = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"model.data"] ;
    ArchiveModel * model = [[ArchiveModel alloc] init] ;
    model.name = te1.text ;
    model.age = te2.text ;
    model.gender = te3.text ;
    //归档
    [NSKeyedArchiver archiveRootObject:model toFile:file] ;
    
}

- (void)unarchiveSel
{
    UITextField * te1 = (UITextField *)[self.view viewWithTag:10] ;
    UITextField * te2 = (UITextField *)[self.view viewWithTag:11] ;
    UITextField * te3 = (UITextField *)[self.view viewWithTag:12] ;
    NSString * file = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"model.data"] ;
    //解档
    ArchiveModel * model = [NSKeyedUnarchiver unarchiveObjectWithFile:file] ;
    te1.text = model.name ;
    te2.text = model.age ;
    te3.text = model.gender ;
}



@end
