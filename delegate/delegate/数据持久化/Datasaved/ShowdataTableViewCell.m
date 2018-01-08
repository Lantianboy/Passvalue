//
//  ShowdataTableViewCell.m
//  delegate
//
//  Created by 最爱是深蓝 on 2018/1/4.
//  Copyright © 2018年 ProductTest. All rights reserved.
//

#import "ShowdataTableViewCell.h"

@implementation ShowdataTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier] ;
    if (self) {
        
        NSArray * are = @[@"姓名:",@"性别:",@"年龄:",@"学号:",@"时间:"] ;
        for (int i = 0; i < 5; i ++) {
            UILabel * la = [[UILabel alloc] initWithFrame:CGRectMake(30, 10+25*(i%5), 60, 20)] ;
            la.text = are[i] ;
            la.font = [UIFont systemFontOfSize:20] ;
            [self addSubview:la] ;
        }
        
        for (int i=0; i<5; i++) {
            self.arrayLable=[[UILabel alloc]initWithFrame:CGRectMake(100, 10+25*(i/1), 120, 20)];
            self.arrayLable.tag=i+100;
            self.arrayLable.font=[UIFont systemFontOfSize:20];
            [self addSubview:self.arrayLable];
        }
    }
    return self ;
}

- (void)contentCellModel:(NSDictionary *)array
{
  
    UILabel * namela = (UILabel *)[self viewWithTag:100] ;
    namela.text = array[@"name"] ;
    
    UILabel * genderla = (UILabel *)[self viewWithTag:101] ;
    genderla.text = array[@"gender"] ;
    
    UILabel * agela = (UILabel *)[self viewWithTag:102] ;
    agela.text = array[@"age"] ;
    
    UILabel * numberla = (UILabel *)[self viewWithTag:103] ;
    numberla.text = array[@"number"] ;
    
    UILabel * timela = (UILabel *)[self viewWithTag:104] ;
    timela.text = array[@"time"] ;

    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
