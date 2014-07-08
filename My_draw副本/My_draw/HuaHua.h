//
//  HuaHua.h
//  My_draw
//
//  Created by geek-group on 14-6-12.
//  Copyright (c) 2014年 geek-group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HuaHua : UIView
{
    
    CGColorRef segmentColor;
    NSMutableArray *arr;//总数组
    
    int Intsegmentcolor; //把颜色赋上
	float Intsegmentwidth; //字体
    
    NSMutableArray* myallpoint;//画当前线的数组
    NSMutableArray* myallline; //画前的数组
    NSMutableArray* myallColor;//颜色
    NSMutableArray* myallwidth;//字体
    
}
@property float x;
@property float y;

#pragma mark 画板设置的方法
-(void)Introductionpoint1;
-(void)Introductionpoint2;
-(void)Introductionpoint3:(CGPoint)sender;
-(void)Introductionpoint4:(int)sender;
-(void)Introductionpoint5:(int)sender;
-(void) Chexiao;
-(void) Over;

@end

