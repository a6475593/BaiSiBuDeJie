//
//  UIBarButtonItem+WYKExtension.h
//  百思不得姐
//
//  Created by 王玉琨 on 16/3/27.
//  Copyright © 2016年 王玉琨. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (WYKExtension)

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;
@end
