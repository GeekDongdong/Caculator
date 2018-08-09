//
//  ViewController.m
//  Count
//
//  Created by JACK on 2017/10/6.
//  Copyright © 2017年 JACK. All rights reserved.
//

#import "ViewController.h"
#import "MainView.h"
#import "Model.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController{
    MainView *view;
    NSString *keyString;
    NSMutableString *exchange;
    Model *model;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _key = [[NSMutableString alloc]init];
    keyString = [[NSString alloc]init];
    self.view.backgroundColor = [UIColor whiteColor];
    model = [[Model alloc]init];
    view = [[MainView alloc]init];
    [view.tf becomeFirstResponder];
    //添加点击事件
    [view.button0 addTarget:self action:@selector(shuzi:) forControlEvents:UIControlEventTouchUpInside];
    [view.button1 addTarget:self action:@selector(shuzi:) forControlEvents:UIControlEventTouchUpInside];
    [view.button2 addTarget:self action:@selector(shuzi:) forControlEvents:UIControlEventTouchUpInside];
    [view.button3 addTarget:self action:@selector(shuzi:) forControlEvents:UIControlEventTouchUpInside];
    [view.button4 addTarget:self action:@selector(shuzi:) forControlEvents:UIControlEventTouchUpInside];
    [view.button5 addTarget:self action:@selector(shuzi:) forControlEvents:UIControlEventTouchUpInside];
    [view.button6 addTarget:self action:@selector(shuzi:) forControlEvents:UIControlEventTouchUpInside];
    [view.button7 addTarget:self action:@selector(shuzi:) forControlEvents:UIControlEventTouchUpInside];
    [view.button8 addTarget:self action:@selector(shuzi:) forControlEvents:UIControlEventTouchUpInside];
    [view.button9 addTarget:self action:@selector(shuzi:) forControlEvents:UIControlEventTouchUpInside];
    [view.buttonJia addTarget:self action:@selector(fuhao:) forControlEvents:UIControlEventTouchUpInside];
    [view.buttonJian addTarget:self action:@selector(fuhao:) forControlEvents:UIControlEventTouchUpInside];
    [view.buttonCheng addTarget:self action:@selector(fuhao:) forControlEvents:UIControlEventTouchUpInside];
    [view.buttonChu addTarget:self action:@selector(fuhao:) forControlEvents:UIControlEventTouchUpInside];
    [view.buttonEqual addTarget:self action:@selector(go) forControlEvents:UIControlEventTouchUpInside];
    [view.buttonAC addTarget:self action:@selector(clean:) forControlEvents:UIControlEventTouchUpInside];
    [view.buttonBack addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [view.buttonPoint addTarget:self action:@selector(fuhao:) forControlEvents:UIControlEventTouchUpInside];
    [view.buttonKuohao1 addTarget:self action:@selector(fuhao:) forControlEvents:UIControlEventTouchUpInside];
    [view.buttonKuohao2 addTarget:self action:@selector(fuhao:) forControlEvents:UIControlEventTouchUpInside];
    [view.exchangeStringButton addTarget:self action:@selector(exchangeString) forControlEvents:UIControlEventTouchUpInside];
    [view.countLaterStringButton addTarget:self action:@selector(countLaterString) forControlEvents:UIControlEventTouchUpInside];
    [view.twoToTenButton addTarget:self action:@selector(twoToTen) forControlEvents:UIControlEventTouchUpInside];
    [view.tenToTwoButton addTarget:self action:@selector(tenToTwo) forControlEvents:UIControlEventTouchUpInside];
    [view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    //
    [self.view addSubview:view];
}
- (void)go{
    if ( (keyString != view.tf.text)) {
        exchange = view.string;
        if (![exchange isEqualToString:@""]) {
            exchange = [model main:exchange];
            view.string = exchange;
            view.tf.text = view.string;
        }
        keyString = view.tf.text;//检测是否有新输入
        [_key setString:@"1"];
    }
}
-(void)shuzi:(id)sender{
    if ([_key isEqualToString:@"1"]) {
        [view.string setString:@""];
        [_key setString:@""];
    }
    [view.string appendString:[sender currentTitle]];
    view.tf.text = view.string;
}
- (void)fuhao:(id)sender{
    [_key setString:@""];
    [view.string appendString:[sender currentTitle]];
    view.tf.text=[NSString stringWithString:view.string];
}
-(void)clean:(id)sender
{
    [view.string setString:@""];
    view.tf.text=view.string;
    
}
-(void)back:(id)sender
{
    if (![view.tf.text isEqualToString:@""])
    {
        [view.string deleteCharactersInRange:NSMakeRange
         ([view.string length]-1,1)];//删除最后一个字符
        view.tf.text = view.string;
    }
}

- (void)exchangeString{
    exchange = view.string;
    if (![exchange isEqualToString:@""]) {
    exchange = [model exchangeString:exchange];
    view.string = exchange;
    view.tf.text = view.string;
    }
    [_key setString:@"1"];
}
- (void)countLaterString{
    exchange = view.string;
    if (![exchange isEqualToString:@""]) {
    exchange = [model countLaterString:exchange];
    view.string = exchange;
    view.tf.text = view.string;
    }
    [_key setString:@"1"];
}
- (void)tenToTwo{
    exchange = view.string;
    if (![exchange isEqualToString:@""]) {
    exchange = [model tenToTwo:exchange];
    view.string = exchange;
    view.tf.text = view.string;
    }
    [_key setString:@"1"];
}
- (void)twoToTen{
    exchange = view.string;
    if (![exchange isEqualToString:@""]) {
    exchange = [model twoToTen:exchange];
    view.string = exchange;
    view.tf.text = view.string;
    }
    [_key setString:@"1"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
