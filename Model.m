//
//  Model.m
//  Count
//
//  Created by JACK on 2017/10/6.
//  Copyright © 2017年 JACK. All rights reserved.
//

#import "Model.h"
typedef struct digitalStack
{
    double data;
    struct digitalStack *next;
}digitalType;

typedef struct arithmeticalStack
{
    char data;
    struct arithmeticalStack *next;
}arithmeticalType;

int Priority(char x)       //判断输入的运算符的优先级
{
    switch(x){
        case '+':   case '-':return 1;
        case '*':   case '/':return 2;
        default:    return -1;
    }
}

@implementation Model
//digital stack
double pushDigitalStack(digitalType *top,double x)
{
    digitalType *p = (digitalType *)malloc(sizeof(digitalType));
    if (!p) {
        return 0;
    }
    p->data = x;
    p->next = top->next;
    top->next = p;
    return 1;
}
double popDigitalStack(digitalType *top)
{
    double x = 0;
    digitalType *p;
    if(top->next == NULL){
        return 0;
    }
    p = top->next;
    x = p->data;
    top->next = p->next;
    free(p);
    return x;
}
int stackIsEmpty(digitalType *top)
{
    if (top->next == NULL) {
        return 1;
    }
    return 0;
}

//arithmetical stack
char pushArithmeticalStack(arithmeticalType *top,char x){
    arithmeticalType *p = (arithmeticalType *)malloc(sizeof(arithmeticalType));
    if (!p) {
        return 0;
    }
    p->data = x;
    p->next = top->next;
    top->next = p;
    return 1;
}
char popArithmeticalStack(arithmeticalType *top){
    arithmeticalType *p ;
    char x = '0';
    if (top->next == NULL) {
        return 0;
    }
    p = top->next;
    x = p->data;
    top->next = p->next;
    free(p);
    return x;
}
char getArithmeticalStackTop(arithmeticalType *top){
    if (top->next) {
        return top->next->data;
    }else
        return 0;
}

double count(digitalType *digitalStackTop,arithmeticalType *arithmeticalStackTop)
{
    double count1 ;
    double count2 ;
    double countSum = 0;
    count1 = popDigitalStack(digitalStackTop);
    count2 = popDigitalStack(digitalStackTop);
    switch (popArithmeticalStack(arithmeticalStackTop)) {
        case '+':
            countSum = count2 + count1;
            break;
        case '-':
            countSum = count2 - count1;
            break;
        case '*':
            countSum = count2 * count1;
            break;
        case '/':
            if (count1 == 0) {
                NSLog(@"555");
                return 456.789;
            }
            countSum = count2 / count1;
            break;
    }
    return countSum;
}
//中缀表达式的计算
- (NSMutableString *)main:(NSMutableString *)str {
    // insert code here...
    int i,j=-1;
    NSMutableString *numberString= [[NSMutableString alloc]init];
    NSMutableString *strd = [[NSMutableString alloc]init];
    double number,num;
    digitalType *digitalStackTop = (digitalType *)malloc(sizeof(digitalType));
    arithmeticalType *arithmeticalStackTop = (arithmeticalType *)malloc(sizeof(arithmeticalType));
    digitalStackTop->next = nil;
    arithmeticalStackTop->next = nil;
    pushArithmeticalStack(arithmeticalStackTop, '#');
    [str appendString:@"#"];
    [str appendString:@"&"];
    while([str characterAtIndex:++j] != '&') {
        switch ([str characterAtIndex:j]) {
            case '1':case '2':
            case '3':case '4':
            case '5':case '6':
            case '7':case '8':
            case '9':case '0':
            case '.':
                [numberString appendString:[NSString stringWithFormat:@"%c",[str characterAtIndex:j]]];
                if ([str characterAtIndex:j+1]<48&&[str characterAtIndex:j+1]!=46) {
                    number = [numberString doubleValue];
                    pushDigitalStack(digitalStackTop,number);
                    number = 0;
                    [numberString setString:@""];
                }
                break;
            case ' ':
                break;
            case '(':
                if ([str characterAtIndex:j-1]>'0'&&[str characterAtIndex:j-1]<'9') {
                    pushArithmeticalStack(arithmeticalStackTop, '*');
                }
                pushArithmeticalStack(arithmeticalStackTop, [str characterAtIndex:j]);
                break;
            case '+':case '-':
            case '*':case '/':
                if(Priority([str characterAtIndex:j]) > Priority(getArithmeticalStackTop(arithmeticalStackTop))){
                    pushArithmeticalStack(arithmeticalStackTop, [str characterAtIndex:j]);
                }else{
                    num = count(digitalStackTop, arithmeticalStackTop);
                    if (num == 456.789) {
                        [numberString setString:@"Error(0不能作除数 )"];
                        return numberString;
                    }
                    pushDigitalStack(digitalStackTop,num);
                    pushArithmeticalStack(arithmeticalStackTop,[str characterAtIndex:j]);
                }
                break;
            case ')':
                do
                {
                    num = count(digitalStackTop, arithmeticalStackTop);
                    if (num == 456.789) {
                        [numberString setString:@"Error(0不能作除数 )"];
                        return numberString;
                    }
                pushDigitalStack(digitalStackTop, num);
                }while (getArithmeticalStackTop(arithmeticalStackTop) != '('&&getArithmeticalStackTop(arithmeticalStackTop)!=0);
                if (getArithmeticalStackTop(arithmeticalStackTop)==0) {
                    [strd setString:@"Error(缺少左括号 )"];
                    return strd;
                }
                popArithmeticalStack(arithmeticalStackTop);
                break;
            case '#':
                while(getArithmeticalStackTop(arithmeticalStackTop) != '#'){
                    num = count(digitalStackTop, arithmeticalStackTop);
                    if (num == 456.789) {
                        [numberString setString:@"Error(0不能作除数 )"];
                        return numberString;
                    }
                    pushDigitalStack(digitalStackTop, num);
                };
                break;
        }
    }
    strd = [NSMutableString stringWithFormat:@"%f",popDigitalStack(digitalStackTop)];
    i = (int)[strd length]-1;
        while ([strd characterAtIndex:i] != '.') {
            if ([strd characterAtIndex:i] == '0') {
                NSRange range = {i,1};
                [strd deleteCharactersInRange:range];
            }else{
                break;
            }
            i--;
        }
        NSRange range = {i,1};
        [strd deleteCharactersInRange:range];
    return strd;
}

//中缀转后缀
- (NSMutableString *)exchangeString:(NSMutableString *)str{
    int j=-1;
    NSMutableString *numberString= [[NSMutableString alloc]init];
    arithmeticalType *arithmeticalStackTop = (arithmeticalType *)malloc(sizeof(arithmeticalType));
    arithmeticalStackTop->next = nil;
    pushArithmeticalStack(arithmeticalStackTop, '#');
    [str appendString:@"#"];
    [str appendString:@"&"];
    while([str characterAtIndex:++j] != '&') {
        switch ([str characterAtIndex:j]) {
            case '1':case '2':
            case '3':case '4':
            case '5':case '6':
            case '7':case '8':
            case '9':case '0':
            case '.':
                [numberString appendString:[NSString stringWithFormat:@"%c",[str characterAtIndex:j]]];
                break;
            case ' ':
                break;
            case '(':
                pushArithmeticalStack(arithmeticalStackTop, [str characterAtIndex:j]);
                break;
            case '+':case '-':
            case '*':case '/':
                if(Priority([str characterAtIndex:j]) > Priority(getArithmeticalStackTop(arithmeticalStackTop))){
                    pushArithmeticalStack(arithmeticalStackTop, [str characterAtIndex:j]);
                }else{
                    do{
                     [numberString appendString:[NSString stringWithFormat:@"%c",popArithmeticalStack(arithmeticalStackTop)]];
                        if (getArithmeticalStackTop(arithmeticalStackTop)<[str characterAtIndex:j]) {
                            break;
                        }
                }while(getArithmeticalStackTop(arithmeticalStackTop)!='#'&&getArithmeticalStackTop(arithmeticalStackTop)!='('&&getArithmeticalStackTop(arithmeticalStackTop)>=[str characterAtIndex:j]);
                    pushArithmeticalStack(arithmeticalStackTop, [str characterAtIndex:j]);
                    
                }
                break;
            case ')':
                while (getArithmeticalStackTop(arithmeticalStackTop) != '('){
                   [numberString appendString:[NSString stringWithFormat:@"%c",popArithmeticalStack(arithmeticalStackTop)]];
                };
                popArithmeticalStack(arithmeticalStackTop);
                break;
            case '#':
                while (getArithmeticalStackTop(arithmeticalStackTop) != '#'){
                    [numberString appendString:[NSString stringWithFormat:@"%c",popArithmeticalStack(arithmeticalStackTop)]];
                }
                break;
        }
    }
    return numberString;
}
- (NSMutableString *)countLaterString:(NSMutableString *)str{
    double num1=0,num2=0;
    int i=-1,sum = 0;
    NSMutableString *sumString = [[NSMutableString alloc]init];
    [str appendString:@"#"];
    while ([str characterAtIndex:++i]!='#') {
        while ([str characterAtIndex:i]<48) {

            num1 = [str characterAtIndex:i-2]-'0';
            num2 = [str characterAtIndex:i-1]-'0';
            switch ([str characterAtIndex:i]) {
                case '+':
                    sum = num1 + num2;
                    break;
                case '-':
                    sum = num1 - num2;
                    break;
                case '*':
                    sum = num1 * num2;
                    break;
                case '/':
                    sum = num1 / num2;
                    break;
            }
            NSRange range1 = {i-2, 2};
            NSRange range2 = {i,1};
            [str replaceCharactersInRange:range2 withString:[NSString stringWithFormat:@"%d",sum]];
            [str deleteCharactersInRange:range1];
            i = i-2;
            if ([str length] == 2) {
                break;
            }
        }
        
    }
    [sumString setString:[NSString stringWithFormat:@"%d",sum]];
    return  sumString;
}
- (NSMutableString *)tenToTwo:(NSMutableString *)str{
    int num;
    NSMutableString *answer = [[NSMutableString alloc]init];
    num = [str doubleValue];
    do{
    [answer insertString:[NSString stringWithFormat:@"%d",num % 2] atIndex:0];
        num = num/2;
    }while (num>0);
    return answer;
}

- (NSMutableString *)twoToTen:(NSMutableString *)str{
    int j=0,sum = 0,k=1,num;
    NSMutableString *answer = [[NSMutableString alloc]init];
    j = [str doubleValue];
    do{
        num = j%10*k;
        sum += num;
        j = j/10;
        k = 2*k;
    }while (j>=1);
    [answer setString:[NSString stringWithFormat:@"%d",sum]];
    return answer;
}
@end
