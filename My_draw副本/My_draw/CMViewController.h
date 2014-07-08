//
//  CMViewController.h
//  My_draw
//
//  Created by geek-group on 14-6-12.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HuaHua.h"

@interface CMViewController : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
	UILabel* labelColor;//颜色选择
	UILabel* labelLoanshift;//字体大小选择
	CGPoint MyBeganpoint;
	CGPoint MyMovepoint;//移动的坐标
	int Segment;
	int SegmentWidth;
    
	//UIImageView* pickImage;
	UISegmentedControl* WidthButton; //窗体颜色控件
	UISegmentedControl* ColorButton;//字体控件
    NSInteger index;
}
@property int Segment;
@property (nonatomic,retain)IBOutlet UILabel* labelColor;
@property (nonatomic,retain)IBOutlet UILabel* labelLoanshift;

- (IBAction)Yanse:(UIButton *)sender;

- (IBAction)Size:(UIButton *)sender;

- (IBAction)Xiangpi:(UIButton *)sender;

- (IBAction)Chexiao:(UIButton *)sender;

- (IBAction)Over:(UIButton *)sender;

- (IBAction)BaoCun:(UIButton *)sender;

@end
