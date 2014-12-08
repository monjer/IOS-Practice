//
//  UIColor+FlatUIColor.m
//  FlatButton
//
//  Created by manjunhan on 14-11-15.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import "UIColor+FlatUIColor.h"

@implementation UIColor (FlatUIColor)

//钻石绿(turquoise)
//rgba(26, 188, 156,1.0)
//#1ABC9C
+ (UIColor*)turquoise
{
    return [self colorFromHexString:@"#1ABC9C"];
}

//石灰绿(emerland)
//rgba(46, 204, 113,1.0)
//#2ECC71
+ (UIColor*)emerland
{
    return [self colorFromHexString:@"#2ECC71"];
}

//彼得蓝(peter-river)
//rgba(52, 152, 219,1.0)
//#3498DB;
+ (UIColor*)peterRiver
{
    return [self colorFromHexString:@"#3498DB"];
}

//紫水晶(amethyst)
//rgba(155, 89, 182,1.0)
//#9B59B6
+ (UIColor*)amethyst
{
    return [self colorFromHexString:@"#9B59B6"];
}

//湿沥青(wet-asphalt)
//rgba(52, 73, 94,1.0)
//#34495E
+ (UIColor*)wetAsphalt
{
    return [self colorFromHexString:@"#34495E"];
}

//绿色海洋(green-sea)
//rgba(22, 160, 133,1.0)
//#16A085
+ (UIColor*)greenSea
{
    return [self colorFromHexString:@"#16A085"];
}

//肾炎(nephritis)
//rgba(39, 174, 96,1.0)
//#2ECC71
+ (UIColor*)nephritis
{
    return [self colorFromHexString:@"#2ECC71"];
}

//伯利兹大蓝洞(belize-hole)
//rgba(41, 128, 185,1.0)
//#2980B9
+ (UIColor*)belizeHole
{
    return [self colorFromHexString:@"#2980B9"];
}

//紫藤(wisteria)
//rgba(142, 68, 173,1.0)
//#8E44AD
+ (UIColor*)wisteria
{
    return [self colorFromHexString:@"#8E44AD"];
}

//午夜蓝(midnight-blue)
//rgba(44, 62, 80,1.0)
//#2C3E50
+ (UIColor*)midnightBlue
{
    return [self colorFromHexString:@"#2C3E50"];
}

//向日葵(sun-flower)
//rgba(241, 196, 15,1.0)
//#F1C40F
+ (UIColor*)sunFlower
{
    return [self colorFromHexString:@"#F1C40F"];
}

//胡萝卜(carrot)
//rgba(230, 126, 34,1.0)
//#E67E22
+ (UIColor*)carrot
{
    return [self colorFromHexString:@"#E67E22"];
}

//茜草色素(alizarin)
//rgba(231, 76, 60,1.0)
//#E74C3C
+ (UIColor*)alizarin
{
    return [self colorFromHexString:@"#E74C3C"];
}

//白云(clouds)
//rgba(236, 240, 241,1.0)
//#ECF0F1
+ (UIColor*)clouds
{
    return [self colorFromHexString:@"#ECF0F1"];
}

//混凝土(concrete)
//rgba(149, 165, 166,1.0)
//#95A5A6
+ (UIColor*)concrete
{
    return [self colorFromHexString:@"#95A5A6"];
}

//橘子(orange)
//rgba(243, 156, 18,1.0)
//#F39C12
+ (UIColor*)orange
{
    return [self colorFromHexString:@"#F39C12"];
}

//南瓜(pumpkin)
//rgba(211, 84, 0,1.0)
//#D35400
+ (UIColor*)pumpkin
{
    return [self colorFromHexString:@"#D35400"];
}

//石榴(pomegranate)
//rgba(192, 57, 43,1.0)
//#C0392B
+ (UIColor*)pomegranate
{
    return [self colorFromHexString:@"#C0392B"];
}

//白银(silver)
//rgba(189, 195, 199,1.0)
//#BDC3C7
+ (UIColor*)silver
{
    return [self colorFromHexString:@"#BDC3C7"];
}

//石棉(asbestos)
//rgba(127, 140, 141,1.0)
//#7F8C8D
+ (UIColor*)asbestos
{
    return [self colorFromHexString:@"#7F8C8D"];
}


+ (UIColor *)colorFromHexString:(NSString *)hexString
{
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    CGFloat r = ((rgbValue & 0xFF0000) >> 16)/255.0 ,
            g = ((rgbValue & 0xFF00) >> 8)/255.0 ,
            b = (rgbValue & 0xFF)/255.0 ;
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0];
}

@end
