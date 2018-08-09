//
//  MainView.m
//  Count
//
//  Created by JACK on 2017/10/6.
//  Copyright © 2017年 JACK. All rights reserved.
//

#import "MainView.h"
#import "Model.h"
#import "Masonry.h"

@implementation MainView{
}
- (id)init{
    self = [super init];
    if (self) {
        
        self.string=[[NSMutableString alloc]init];//初始化可变字符串，分配内存
        self.tf=[[UITextField alloc]init];
        self.tf.backgroundColor= [UIColor colorWithRed:224.0/255 green:224.0/255 blue:224.0/255 alpha:1];   //设置背景颜色
        self.tf.textColor=[UIColor blackColor];         //字体颜色
        self.tf.textAlignment = UITextAlignmentRight; //字体居右
        self.tf.font=[UIFont systemFontOfSize:32.4];    //设置字体
        self.tf.borderStyle = UITextBorderStyleNone;
        //1.首先，创建视图控件，添加到self.view上
        [self addSubview:_tf];
        //2.然后，记得要把AutoresizingMask布局关掉
        _tf.translatesAutoresizingMaskIntoConstraints = NO;
        //3.接着，添加约束
        __weak __typeof(self) weakSelf = self;//这里用一个弱引用来表示self，用于下面的Block中
        [_tf mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.mas_top); //_button1的上，距离self
            make.left.equalTo(weakSelf.mas_left); //_button1的左，距离self
            make.width.mas_equalTo(weakSelf.mas_width);
            make.height.mas_equalTo(weakSelf).multipliedBy(0.3);
        }];
        
        //添加1-9数字
        _button1=[UIButton buttonWithType:UIButtonTypeCustom];
         _button1.backgroundColor = [UIColor colorWithRed:224.0/255 green:224.0/255 blue:224.0/255 alpha:1];
        [_button1 setTitle:@"1" forState:UIControlStateNormal];
        [_button1 setAttributedTitle:[[NSAttributedString alloc]initWithString:@"1"] forState:UIControlStateNormal];
        _button1.layer.borderWidth = 0.5f;
        _button1.titleLabel.font = [UIFont systemFontOfSize:45];
        [self addSubview:_button1];
        _button1.translatesAutoresizingMaskIntoConstraints = NO;
        [_button1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.mas_bottom).multipliedBy(0.3); //_button1的上，距离self
            make.left.equalTo(weakSelf.mas_left); //_button1的左，距离self
            make.width.mas_equalTo(weakSelf).multipliedBy(0.25);
            make.height.mas_equalTo(weakSelf).multipliedBy(0.1);
        }];
        
        
        _button2=[UIButton buttonWithType:UIButtonTypeCustom];
        _button2.backgroundColor = [UIColor colorWithRed:224.0/255 green:224.0/255 blue:224.0/255 alpha:1];
        [_button2 setTitle:@"2" forState:UIControlStateNormal];
        [_button2 setAttributedTitle:[[NSAttributedString alloc]initWithString:@"2"] forState:UIControlStateNormal];
        _button2.layer.borderWidth = 0.5f;
        _button2.titleLabel.font = [UIFont systemFontOfSize:45];
        [self addSubview:_button2];
        _button2.translatesAutoresizingMaskIntoConstraints = NO;
        [_button2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.mas_bottom).multipliedBy(0.3); //_button1的上，距离self
            make.left.equalTo(weakSelf.mas_right).multipliedBy(0.25); //_button1的左，距离self
            make.width.mas_equalTo(weakSelf).multipliedBy(0.25);
            make.height.mas_equalTo(weakSelf).multipliedBy(0.1);
        }];
        
        _button3=[UIButton buttonWithType:UIButtonTypeCustom];
         _button3.backgroundColor = [UIColor colorWithRed:224.0/255 green:224.0/255 blue:224.0/255 alpha:1];
        [_button3 setTitle:@"3" forState:UIControlStateNormal];
        [_button3 setAttributedTitle:[[NSAttributedString alloc]initWithString:@"3"] forState:UIControlStateNormal];
        _button3.layer.borderWidth = 0.5f;
        _button3.titleLabel.font = [UIFont systemFontOfSize:45];
        [self addSubview:_button3];
        _button3.translatesAutoresizingMaskIntoConstraints = NO;
        [_button3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.mas_bottom).multipliedBy(0.3); //_button1的上，距离self
            make.left.equalTo(weakSelf.mas_right).multipliedBy(0.5); //_button1的左，距离self
            make.width.mas_equalTo(weakSelf).multipliedBy(0.25);
            make.height.mas_equalTo(weakSelf).multipliedBy(0.1);
        }];

        
        _button4=[UIButton buttonWithType:UIButtonTypeCustom];
         _button4.backgroundColor = [UIColor colorWithRed:224.0/255 green:224.0/255 blue:224.0/255 alpha:1];
        [_button4 setTitle:@"4" forState:UIControlStateNormal];
        [_button4 setAttributedTitle:[[NSAttributedString alloc]initWithString:@"4"] forState:UIControlStateNormal];
        _button4.layer.borderWidth = 0.5f;
        _button4.titleLabel.font = [UIFont systemFontOfSize:45];
        [self addSubview:_button4];
        _button4.translatesAutoresizingMaskIntoConstraints = NO;
        [_button4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.mas_bottom).multipliedBy(0.4); //_button1的上，距离self
            make.left.equalTo(weakSelf.mas_left); //_button1的左，距离self
            make.width.mas_equalTo(weakSelf).multipliedBy(0.25);
            make.height.mas_equalTo(weakSelf).multipliedBy(0.1);
        }];

        
        _button5=[UIButton buttonWithType:UIButtonTypeCustom];
             _button5.backgroundColor = [UIColor colorWithRed:224.0/255 green:224.0/255 blue:224.0/255 alpha:1];
        [_button5 setTitle:@"5" forState:UIControlStateNormal];
        [_button5 setAttributedTitle:[[NSAttributedString alloc]initWithString:@"5"] forState:UIControlStateNormal];
        _button5.layer.borderWidth = 0.5f;
        _button5.titleLabel.font = [UIFont systemFontOfSize:45];
        [self addSubview:_button5];
        _button5.translatesAutoresizingMaskIntoConstraints = NO;
        [_button5 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.mas_bottom).multipliedBy(0.4); //_button1的上，距离self
            make.left.equalTo(weakSelf.mas_right).multipliedBy(0.25); //_button1的左，距离self
            make.width.mas_equalTo(weakSelf).multipliedBy(0.25);
            make.height.mas_equalTo(weakSelf).multipliedBy(0.1);
        }];

        
        _button6=[UIButton buttonWithType:UIButtonTypeCustom];
         _button6.backgroundColor = [UIColor colorWithRed:224.0/255 green:224.0/255 blue:224.0/255 alpha:1];
        [_button6 setTitle:@"6" forState:UIControlStateNormal];
        [_button6 setAttributedTitle:[[NSAttributedString alloc]initWithString:@"6"] forState:UIControlStateNormal];
        _button6.layer.borderWidth = 0.5f;
        _button6.titleLabel.font = [UIFont systemFontOfSize:45];
        [self addSubview:_button6];
        _button6.translatesAutoresizingMaskIntoConstraints = NO;
        [_button6 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.mas_bottom).multipliedBy(0.4); //_button1的上，距离self
            make.left.equalTo(weakSelf.mas_right).multipliedBy(0.5); //_button1的左，距离self
            make.width.mas_equalTo(weakSelf).multipliedBy(0.25);
            make.height.mas_equalTo(weakSelf).multipliedBy(0.1);
        }];

        
        _button7=[UIButton buttonWithType:UIButtonTypeCustom];
             _button7.backgroundColor = [UIColor colorWithRed:224.0/255 green:224.0/255 blue:224.0/255 alpha:1];
        [_button7 setTitle:@"7" forState:UIControlStateNormal];
        [_button7 setAttributedTitle:[[NSAttributedString alloc]initWithString:@"7"] forState:UIControlStateNormal];
        _button7.layer.borderWidth = 0.5f;
        _button7.titleLabel.font = [UIFont systemFontOfSize:45];
        [self addSubview:_button7];
        _button7.translatesAutoresizingMaskIntoConstraints = NO;
        [_button7 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.mas_bottom).multipliedBy(0.5); //_button1的上，距离self
            make.left.equalTo(weakSelf.mas_left); //_button1的左，距离self
            make.width.mas_equalTo(weakSelf).multipliedBy(0.25);
            make.height.mas_equalTo(weakSelf).multipliedBy(0.1);
        }];

        
        _button8=[UIButton buttonWithType:UIButtonTypeCustom];
         _button8.backgroundColor = [UIColor colorWithRed:224.0/255 green:224.0/255 blue:224.0/255 alpha:1];
        [_button8 setTitle:@"8" forState:UIControlStateNormal];
        [_button8 setAttributedTitle:[[NSAttributedString alloc]initWithString:@"8"] forState:UIControlStateNormal];
        _button8.layer.borderWidth = 0.5f;
        _button8.titleLabel.font = [UIFont systemFontOfSize:45];
        [self addSubview:_button8];
        _button8.translatesAutoresizingMaskIntoConstraints = NO;
        [_button8 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.mas_bottom).multipliedBy(0.5); //_button1的上，距离self
            make.left.equalTo(weakSelf.mas_right).multipliedBy(0.25); //_button1的左，距离self
            make.width.mas_equalTo(weakSelf).multipliedBy(0.25);
            make.height.mas_equalTo(weakSelf).multipliedBy(0.1);
        }];

        
        _button9=[UIButton buttonWithType:UIButtonTypeCustom];
        _button9.backgroundColor = [UIColor colorWithRed:224.0/255 green:224.0/255 blue:224.0/255 alpha:1];
        [_button9 setTitle:@"9" forState:UIControlStateNormal];
        [_button9 setAttributedTitle:[[NSAttributedString alloc]initWithString:@"9"] forState:UIControlStateNormal];
        _button9.layer.borderWidth = 0.5f;
        _button9.titleLabel.font = [UIFont systemFontOfSize:45];
        [self addSubview:_button9];
        _button9.translatesAutoresizingMaskIntoConstraints = NO;
        [_button9 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.mas_bottom).multipliedBy(0.5); //_button1的上，距离self
            make.left.equalTo(weakSelf.mas_right).multipliedBy(0.5); //_button1的左，距离self
            make.width.mas_equalTo(weakSelf).multipliedBy(0.25);
            make.height.mas_equalTo(weakSelf).multipliedBy(0.1);
        }];

        
    //单独添加0
    _button0 = [UIButton buttonWithType:UIButtonTypeCustom];
    _button0.backgroundColor = [UIColor colorWithRed:224.0/255 green:224.0/255 blue:224.0/255 alpha:1];
    [_button0 setTitle:@"0" forState:UIControlStateNormal];
    _button0.titleLabel.textColor = [UIColor blackColor];
    [_button0 setAttributedTitle:[[NSAttributedString alloc]initWithString:@"0"] forState:UIControlStateNormal];
    _button0.layer.borderWidth = 0.5f;
    _button0.titleLabel.font = [UIFont systemFontOfSize:45];
    [self addSubview:_button0];
    [_button0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.mas_bottom).multipliedBy(0.6); //_button1的上，距离self
            make.left.equalTo(weakSelf.mas_left); //_button1的左，距离self
            make.width.mas_equalTo(weakSelf).multipliedBy(0.25);
            make.height.mas_equalTo(weakSelf).multipliedBy(0.1);
        }];
    
    
    //添加运算符
    _buttonJia=[UIButton buttonWithType:UIButtonTypeCustom];
    _buttonJia.backgroundColor = [UIColor colorWithRed:232.0/255 green:138.0/255 blue:46.0/255 alpha:1];
    [_buttonJia setTitle:[NSString stringWithFormat:@"+"] forState:UIControlStateNormal];
    [_buttonJia setAttributedTitle:[[NSAttributedString alloc]initWithString:@"+"] forState:UIControlStateNormal];
    _buttonJia.layer.borderWidth = 0.5f;
    _buttonJia.titleLabel.font = [UIFont systemFontOfSize:45];
        [self addSubview:_buttonJia];
        [_buttonJia mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.mas_bottom).multipliedBy(0.3); //_button1的上，距离self
            make.left.equalTo(weakSelf.mas_right).multipliedBy(0.75); //_button1的左，距离self
            make.width.mas_equalTo(weakSelf).multipliedBy(0.25);
            make.height.mas_equalTo(weakSelf).multipliedBy(0.1);
        }];
        
    _buttonJian=[UIButton buttonWithType:UIButtonTypeCustom];
     _buttonJian.backgroundColor = [UIColor colorWithRed:232.0/255 green:138.0/255 blue:46.0/255 alpha:1];
    [_buttonJian setTitle:[NSString stringWithFormat:@"-"] forState:UIControlStateNormal];
    [_buttonJian setAttributedTitle:[[NSAttributedString alloc]initWithString:@"-"] forState:UIControlStateNormal];
    _buttonJian.layer.borderWidth = 0.5f;
    _buttonJian.titleLabel.font = [UIFont systemFontOfSize:45];
    [self addSubview:_buttonJian];
        [_buttonJian mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.mas_bottom).multipliedBy(0.4); //_button1的上，距离self
            make.left.equalTo(weakSelf.mas_right).multipliedBy(0.75); //_button1的左，距离self
            make.width.mas_equalTo(weakSelf).multipliedBy(0.25);
            make.height.mas_equalTo(weakSelf).multipliedBy(0.1);
        }];
        
    _buttonCheng=[UIButton buttonWithType:UIButtonTypeCustom];
    _buttonCheng.backgroundColor = [UIColor colorWithRed:232.0/255 green:138.0/255 blue:46.0/255 alpha:1];
    [_buttonCheng setTitle:[NSString stringWithFormat:@"*"] forState:UIControlStateNormal];
    [_buttonCheng setAttributedTitle:[[NSAttributedString alloc]initWithString:@"x"] forState:UIControlStateNormal];
    _buttonCheng.layer.borderWidth = 0.5f;
    _buttonCheng.titleLabel.font = [UIFont systemFontOfSize:45];
    [self addSubview:_buttonCheng];
        [_buttonCheng mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.mas_bottom).multipliedBy(0.5); //_button1的上，距离self
            make.left.equalTo(weakSelf.mas_right).multipliedBy(0.75); //_button1的左，距离self
            make.width.mas_equalTo(weakSelf).multipliedBy(0.25);
            make.height.mas_equalTo(weakSelf).multipliedBy(0.1);
        }];
        
    _buttonChu=[UIButton buttonWithType:UIButtonTypeCustom];
    _buttonChu.backgroundColor = [UIColor colorWithRed:232.0/255 green:138.0/255 blue:46.0/255 alpha:1];
    [_buttonChu setTitle:[NSString stringWithFormat:@"/"] forState:UIControlStateNormal];
    [_buttonChu setAttributedTitle:[[NSAttributedString alloc]initWithString:@"÷"] forState:UIControlStateNormal];
    _buttonChu.layer.borderWidth = 0.5f;
    _buttonChu.titleLabel.font = [UIFont systemFontOfSize:45];
    [self addSubview:_buttonChu];
        [_buttonChu mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.mas_bottom).multipliedBy(0.6); //_button1的上，距离self
            make.left.equalTo(weakSelf.mas_right).multipliedBy(0.75); //_button1的左，距离self
            make.width.mas_equalTo(weakSelf).multipliedBy(0.25);
            make.height.mas_equalTo(weakSelf).multipliedBy(0.1);
        }];

        
    
    //添加=
    _buttonEqual = [UIButton buttonWithType:UIButtonTypeCustom];
    _buttonEqual.backgroundColor = [UIColor colorWithRed:224.0/255 green:224.0/255 blue:224.0/255 alpha:1];
    [_buttonEqual setTitle:@"=" forState:UIControlStateNormal];
    [_buttonEqual setAttributedTitle:[[NSAttributedString alloc]initWithString:@"="] forState:UIControlStateNormal];
    _buttonEqual.layer.borderWidth = 0.5f;
    _buttonEqual.titleLabel.font = [UIFont systemFontOfSize:45];
    [self addSubview:_buttonEqual];
        [_buttonEqual mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.mas_bottom).multipliedBy(0.7); //_button1的上，距离self
            make.left.equalTo(weakSelf.mas_right).multipliedBy(0.25); //_button1的左，距离self
            make.width.mas_equalTo(weakSelf).multipliedBy(0.25);
            make.height.mas_equalTo(weakSelf).multipliedBy(0.1);
        }];
    
    
    //添加清除键
    _buttonAC=[UIButton buttonWithType:UIButtonTypeCustom];
    _buttonAC.backgroundColor = [UIColor colorWithRed:224.0/255 green:224.0/255 blue:224.0/255 alpha:1];
    [_buttonAC setAttributedTitle:[[NSAttributedString alloc]initWithString:@"AC"] forState:UIControlStateNormal];
    _buttonAC.layer.borderWidth = 0.5f;
    _buttonAC.titleLabel.font = [UIFont systemFontOfSize:35];
    [_buttonAC setTitle:@"AC" forState:UIControlStateNormal];
    [self addSubview:_buttonAC];
        [_buttonAC mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.mas_bottom).multipliedBy(0.7); //_button1的上，距离self
            make.left.equalTo(weakSelf.mas_left); //_button1的左，距离self
            make.width.mas_equalTo(weakSelf).multipliedBy(0.25);
            make.height.mas_equalTo(weakSelf).multipliedBy(0.1);
        }];

        
    //添加"."
    _buttonPoint=[UIButton buttonWithType:UIButtonTypeCustom];
    _buttonPoint.backgroundColor = [UIColor colorWithRed:224.0/255 green:224.0/255 blue:224.0/255 alpha:1];
    [_buttonPoint setAttributedTitle:[[NSAttributedString alloc]initWithString:@"."] forState:UIControlStateNormal];
    _buttonPoint.layer.borderWidth = 0.5f;
    _buttonPoint.titleLabel.font = [UIFont systemFontOfSize:45];
    [_buttonPoint setTitle:@"." forState:UIControlStateNormal];
    [self addSubview:_buttonPoint];
        [_buttonPoint mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.mas_bottom).multipliedBy(0.6); //_button1的上，距离self
            make.left.equalTo(weakSelf.mas_right).multipliedBy(0.25); //_button1的左，距离self
            make.width.mas_equalTo(weakSelf).multipliedBy(0.25);
            make.height.mas_equalTo(weakSelf).multipliedBy(0.1);
        }];
    
    
    //后退
    _buttonBack=[UIButton buttonWithType:UIButtonTypeCustom];
    _buttonBack.backgroundColor = [UIColor colorWithRed:224.0/255 green:224.0/255 blue:224.0/255 alpha:1];
    [_buttonBack setAttributedTitle:[[NSAttributedString alloc]initWithString:@"<"] forState:UIControlStateNormal];
    _buttonBack.layer.borderWidth = 0.5f;
    _buttonBack.titleLabel.font = [UIFont systemFontOfSize:45];
    [_buttonBack setTitle:@"back" forState:UIControlStateNormal];
    [self addSubview:_buttonBack];
        [_buttonBack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.mas_bottom).multipliedBy(0.6); //_button1的上，距离self
            make.left.equalTo(weakSelf.mas_right).multipliedBy(0.5); //_button1的左，距离self
            make.width.mas_equalTo(weakSelf).multipliedBy(0.25);
            make.height.mas_equalTo(weakSelf).multipliedBy(0.1);
        }];
        
    //添加括号 (
    _buttonKuohao1 =[UIButton buttonWithType:UIButtonTypeCustom];
    _buttonKuohao1.backgroundColor = [UIColor colorWithRed:224.0/255 green:224.0/255 blue:224.0/255 alpha:1];
    [_buttonKuohao1 setAttributedTitle:[[NSAttributedString alloc]initWithString:@"("] forState:UIControlStateNormal];
    _buttonKuohao1.layer.borderWidth = 0.5f;
    _buttonKuohao1.titleLabel.font = [UIFont systemFontOfSize:45];
    [_buttonKuohao1 setTitle:@"(" forState:UIControlStateNormal];
    [self addSubview:_buttonKuohao1];
        [_buttonKuohao1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.mas_bottom).multipliedBy(0.7); //_button1的上，距离self
            make.left.equalTo(weakSelf.mas_right).multipliedBy(0.5); //_button1的左，距离self
            make.width.mas_equalTo(weakSelf).multipliedBy(0.25);
            make.height.mas_equalTo(weakSelf).multipliedBy(0.1);
        }];
        
    //添加括号 )
    _buttonKuohao2=[UIButton buttonWithType:UIButtonTypeCustom];
    _buttonKuohao2.backgroundColor = [UIColor colorWithRed:224.0/255 green:224.0/255 blue:224.0/255 alpha:1];
    [_buttonKuohao2 setAttributedTitle:[[NSAttributedString alloc]initWithString:@")"] forState:UIControlStateNormal];
    _buttonKuohao2.layer.borderWidth = 0.5f;
    _buttonKuohao2.titleLabel.font = [UIFont systemFontOfSize:45];
    [_buttonKuohao2 setTitle:@")" forState:UIControlStateNormal];
    [self addSubview:_buttonKuohao2];
        [_buttonKuohao2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.mas_bottom).multipliedBy(0.7); //_button1的上，距离self
            make.left.equalTo(weakSelf.mas_right).multipliedBy(0.75); //_button1的左，距离self
            make.width.mas_equalTo(weakSelf).multipliedBy(0.25);
            make.height.mas_equalTo(weakSelf).multipliedBy(0.1);
        }];
    
    //添加中缀转后缀
    _exchangeStringButton=[UIButton buttonWithType:UIButtonTypeCustom];
    _exchangeStringButton.backgroundColor = [UIColor lightGrayColor];
    [_exchangeStringButton setAttributedTitle:[[NSAttributedString alloc]initWithString:@"中缀转后缀"] forState:UIControlStateNormal];
    _exchangeStringButton.layer.borderWidth = 0.5f;
    _exchangeStringButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [self addSubview:_exchangeStringButton];
        [_exchangeStringButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.mas_bottom).multipliedBy(0.8); //_button1的上，距离self
            make.left.equalTo(weakSelf.mas_left); //_button1的左，距离self
            make.width.mas_equalTo(weakSelf).multipliedBy(0.5);
            make.height.mas_equalTo(weakSelf).multipliedBy(0.1);
        }];
    
    
    //后缀计算
    _countLaterStringButton=[UIButton buttonWithType:UIButtonTypeCustom];
    _countLaterStringButton.backgroundColor = [UIColor lightGrayColor];
    [_countLaterStringButton setAttributedTitle:[[NSAttributedString alloc]initWithString:@"后缀计算"] forState:UIControlStateNormal];
    _countLaterStringButton.layer.borderWidth = 0.5f;
    _countLaterStringButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [self addSubview:_countLaterStringButton];
        [_countLaterStringButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.mas_bottom).multipliedBy(0.8); //_button1的上，距离self
            make.left.equalTo(weakSelf.mas_right).multipliedBy(0.5); //_button1的左，距离self
            make.width.mas_equalTo(weakSelf).multipliedBy(0.5);
            make.height.mas_equalTo(weakSelf).multipliedBy(0.1);
        }];
        
    //添加十进制转二进制
        _tenToTwoButton=[UIButton buttonWithType:UIButtonTypeCustom];
        _tenToTwoButton.backgroundColor = [UIColor lightGrayColor];
        [_tenToTwoButton setAttributedTitle:[[NSAttributedString alloc]initWithString:@"二进制转换"] forState:UIControlStateNormal];
        _tenToTwoButton.layer.borderWidth = 0.5f;
        _tenToTwoButton.titleLabel.font = [UIFont systemFontOfSize:20];
        [self addSubview:_tenToTwoButton];
        [_tenToTwoButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.mas_bottom).multipliedBy(0.9); //_button1的上，距离self
            make.left.equalTo(weakSelf.mas_left); //_button1的左，距离self
            make.width.mas_equalTo(weakSelf).multipliedBy(0.5);
            make.height.mas_equalTo(weakSelf).multipliedBy(0.1);
        }];
        
    //添加二进制转十进制
        _twoToTenButton=[UIButton buttonWithType:UIButtonTypeCustom];
        _twoToTenButton.backgroundColor = [UIColor lightGrayColor];
        [_twoToTenButton setAttributedTitle:[[NSAttributedString alloc]initWithString:@"十进制转换"] forState:UIControlStateNormal];
        _twoToTenButton.layer.borderWidth = 0.5f;
        _twoToTenButton.titleLabel.font = [UIFont systemFontOfSize:20];
        [self addSubview:_twoToTenButton];
        [_twoToTenButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.mas_bottom).multipliedBy(0.9); //_button1的上，距离self
            make.left.equalTo(weakSelf.mas_right).multipliedBy(0.5); //_button1的左，距离self
            make.width.mas_equalTo(weakSelf).multipliedBy(0.5);
            make.height.mas_equalTo(weakSelf).multipliedBy(0.1);
        }];
    }
    return self;
}
@end
