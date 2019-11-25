//
//  APPColorFunction.m
//  APPBase
//
//  Created by 峰 on 2019/10/10.
//  Copyright © 2019 ishansong. All rights reserved.
//

#import "APPColorFunction.h"

#import "CALayer+XYColorOC.h"

@implementation APPColorFunction

/**
 *    @brief  颜色值转换为Color
 *
 *  @stringToConvert  16进制的值比如：646364
 *
 *    @return 返回UIColor
 */
+ (UIColor *)colorWithHexString:(NSString*)stringToConvert alpha:(CGFloat)alpha {
    
    stringToConvert = [stringToConvert stringByReplacingOccurrencesOfString:@"#" withString:@""];
    
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor blackColor];
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString length] != 6) return [UIColor blackColor];
    // Separate into r, g, b substrings
    NSRange range = (NSRange){0, 2};
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];

    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:alpha];
}

///动态颜色
+ (UIColor *)dynamicColorWithLightColor:(UIColor *)lightColor darkColor:(UIColor *)darkColor {
    
    //UITraitCollection.currentTraitCollection.userInterfaceStyle;
    UIColor *color = lightColor;
    if (@available(iOS 13.0, *)) {
        color = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleLight) {
                return lightColor;
            }else if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark){
                return darkColor;
            }else{
                return lightColor;
            }
        }];
    }
    
    return color;
}

///赋值layer 边框颜色
+ (void)layerSupView:(UIView *)supview layer:(CALayer *)layer dynamicBorderColor:(UIColor *)borderColor {
    
    [layer xy_setLayerBorderColor:borderColor with:supview];
}

///赋值layer 阴影颜色
+ (void)layerSupView:(UIView *)supview layer:(CALayer *)layer dynamicShadowColor:(UIColor *)shadowColor {
    
    [layer xy_setLayerShadowColor:shadowColor with:supview];
}

///赋值layer 背景颜色
+ (void)layerSupView:(UIView *)supview layer:(CALayer *)layer dynamicBackgrounColor:(UIColor *)backgrounColor {
    
    [layer xy_setLayerBackgroundColor:backgrounColor with:supview];
}


#pragma mark - ************************* 获取颜色 *************************
///基础黑色
+ (UIColor *)blackColor {
    
    return COLOR(@"000000");
}

///基础白色颜色
+ (UIColor *)whiteColor {
    
    return COLOR(@"FFFFFF");
}

///系统白亮文字颜色
+ (UIColor *)lightTextColor {
    
    return [UIColor lightTextColor];
}

///系统黑暗文字颜色
+ (UIColor *)drakTextColor {
    
    return [UIColor darkTextColor];
}


///APP内黑色文字颜色384A74
+ (UIColor *)textBlackColor {
    
    return COLOR(@"#384A74");
}

///APP内灰色C0C0C0
+ (UIColor *)textGrayColor {
    
    return COLOR(@"#C0C0C0");
}

///文字蓝色
+ (UIColor *)textBlueColor {
    
    return COLOR(@"#65BAFF");
}

///输入框背景颜色
+ (UIColor *)textFieldBgColor {
    
    return COLOR(@"#F6F6F6");
}

@end
