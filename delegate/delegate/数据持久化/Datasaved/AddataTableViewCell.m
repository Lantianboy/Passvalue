//
//  AddataTableViewCell.m
//  delegate
//
//  Created by 最爱是深蓝 on 2018/1/4.
//  Copyright © 2018年 ProductTest. All rights reserved.
//

#import "AddataTableViewCell.h"

@implementation AddataTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.textf = [[UITextField alloc] initWithFrame:CGRectMake(80, 15, 110, 20)] ;
        self.textf.delegate = self ;
        [self addSubview:self.textf] ;
        
        self.btn = [UIButton buttonWithType:0];
        self.btn.frame=CGRectMake(240, 12, 25, 25);
        [self.btn setTitle:@"男" forState:0];
        self.btn.hidden = YES ;
        self.btn.layer.borderWidth=0.5;
        [self.btn setTitleColor:[UIColor blackColor] forState:0];
        [self.btn addTarget:self action:@selector(fangfa) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.btn];
        
        self.btn1 = [UIButton buttonWithType:0];
        self.btn1.frame=CGRectMake(267, 12, 25, 25);
        [self.btn1 setTitle:@"女" forState:0];
        self.btn1.hidden = YES ;
        self.btn1.layer.borderWidth=0.5;
        [self.btn1 setTitleColor:[UIColor blackColor] forState:0];
        [self.btn1 addTarget:self action:@selector(fangfa1) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.btn1];
            
        
    }
    return self ;
}

- (void)fangfa
{
    self.textf.text = @"男";
}

- (void)fangfa1
{
     self.textf.text = @"女";
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [self.textf resignFirstResponder] ;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
