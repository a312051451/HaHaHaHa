//
//  CMViewController.m
//  My_draw
//
//  Created by geek-group on 14-6-12.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "CMViewController.h"
#import "HuaHua.h"
@interface CMViewController ()

@end

@implementation CMViewController
@synthesize Segment;
@synthesize labelLoanshift;
@synthesize labelColor;


//-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
//{
//	[picker dismissModalViewControllerAnimated:YES];
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    HuaHua *hua = [[HuaHua alloc]initWithFrame:self.view.bounds];
//    [hua setBackgroundColor:[UIColor whiteColor]];
//    [self.view addSubview:hua];
    index = 1;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//手指开始触屏开始
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
	[ColorButton removeAllSegments];
	[WidthButton removeAllSegments];
	UITouch* touch=[touches anyObject];
	MyBeganpoint=[touch locationInView:self.view ];
	//画时给画笔附上属性
	[(HuaHua*)self.view Introductionpoint4:Segment];
	[(HuaHua*)self.view Introductionpoint5:SegmentWidth];
	[(HuaHua*)self.view Introductionpoint1];
	[(HuaHua*)self.view Introductionpoint3:MyBeganpoint];
	
	//NSLog(@"======================================");
	//(@"HuaHua~~~ Segment=%i",Segment);
}
//手指移动时候发出
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSArray* MovePointArray=[touches allObjects];
    //上下文闭合后画出线条
	MyMovepoint=[[MovePointArray objectAtIndex:0] locationInView:self.view];
	[(HuaHua*)self.view Introductionpoint3:MyMovepoint];
	[self.view setNeedsDisplay];
}
//当手指离开屏幕时候
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	[(HuaHua*)self.view Introductionpoint2];
	[self.view setNeedsDisplay];
}

- (IBAction)Yanse:(UIButton *)sender {
    
    [self setsColor];
}
-(void)setsColor
{
    //设置窗口颜色按钮
    NSArray *arrColor = [[NSArray alloc]initWithObjects:
                        [NSString stringWithString:@"黑"],
                        [NSString stringWithString:@"红"],
                        [NSString stringWithString:@"蓝"],
                        [NSString stringWithString:@"绿"],
                        [NSString stringWithString:@"黄"],
                        [NSString stringWithString:@"橙"],
                        [NSString stringWithString:@"灰"],
                        [NSString stringWithString:@"紫"],
                        [NSString stringWithString:@"棕"],
                        [NSString stringWithString:@"粉红"],nil];
    //颜色按钮
    ColorButton=[[UISegmentedControl alloc] initWithItems:arrColor];
	CGRect ButtonRect=CGRectMake(0, 0, 320, 40);
	[ColorButton setFrame:ButtonRect];
	[ColorButton setMomentary:YES];
	[ColorButton addTarget:self action:@selector(ColorBtu:)
		  forControlEvents:UIControlEventValueChanged];
	
	[ColorButton setSegmentedControlStyle:UISegmentedControlStyleBar];
	
	[ColorButton setTintColor:[UIColor darkGrayColor]];
	
	[self.view addSubview:ColorButton];
}

#pragma mark 设置颜色按钮
-(void) ColorBtu: (id)sender
{
    Segment =[sender selectedSegmentIndex];
	switch (Segment)
	{
		case 0:
			labelColor.text=@"颜色:黑色";
			labelColor.textColor=[UIColor blackColor];
			break;
		case 1:
			labelColor.text=@"颜色:红色";
			labelColor.textColor=[UIColor redColor];
			break;
		case 2:
			labelColor.text=@"颜色:蓝色";
			labelColor.textColor=[UIColor blueColor];
			break;
		case 3:
			labelColor.text=@"颜色:绿色";
			labelColor.textColor=[UIColor greenColor];
			break;
		case 4:
			labelColor.text=@"颜色:黄色";
			labelColor.textColor=[UIColor yellowColor];
			break;
		case 5:
			labelColor.text=@"颜色:橙色";
			labelColor.textColor=[UIColor orangeColor];
			break;
		case 6:
			labelColor.text=@"颜色:灰色";
			labelColor.textColor=[UIColor grayColor];
			break;
		case 7:
			labelColor.text=@"颜色:紫色";
			labelColor.textColor=[UIColor purpleColor];
			break;
		case 8:
			labelColor.text=@"颜色:棕色";
			labelColor.textColor=[UIColor brownColor];
			break;
		case 9:
			labelColor.text=@"颜色:粉红色";
			labelColor.textColor=[UIColor magentaColor];
			break;
		default:
			break;
	}
}

#pragma mark 字体的设置
-(void) setsWithSize
{
    NSArray *size = [[NSArray alloc]initWithObjects:
                     [NSString stringWithString:@"1.0"],
                     [NSString stringWithString:@"2.5"],
                     [NSString stringWithString:@"4.0"],
                     [NSString stringWithString:@"5.5"],
                     [NSString stringWithString:@"7.0"],
                     [NSString stringWithString:@"8.5"],
                     [NSString stringWithString:@"9.0"],
                     [NSString stringWithString:@"10.0"],
                     [NSString stringWithString:@"11.5"],nil];
    WidthButton = [[UISegmentedControl alloc]initWithItems:size];//实例化屏幕最上方的字体控间
    CGRect ButtoRect = CGRectMake(0, 0, 320, 40);//设置初始位置
    [WidthButton setFrame:ButtoRect];
    [WidthButton setMomentary:YES];
    //选定后的点击事件
	[WidthButton addTarget:self action:@selector(SizeBtu:)
		  forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:WidthButton];
    
}

#pragma mark 字体大小的赋值，给按钮显示文字
-(void) SizeBtu: (id)sender
{
    SegmentWidth =[sender selectedSegmentIndex];
	switch (SegmentWidth)
	{
		case 0:
			labelLoanshift.text=@"字号:1.0";
            //	labelColor.textColor=[UIColor blackColor];
			break;
		case 1:
			labelLoanshift.text=@"字号:2.0";
            //	labelColor.textColor=[UIColor redColor];
			break;
		case 2:
			labelLoanshift.text=@"字号:3.0";
            //	labelColor.textColor=[UIColor blueColor];
			break;
		case 3:
			labelLoanshift.text=@"字号:4.0";
            //	labelColor.textColor=[UIColor greenColor];
			break;
		case 4:
			labelLoanshift.text=@"字号:5.0";
            ///	labelColor.textColor=[UIColor yellowColor];
			break;
		case 5:
			labelLoanshift.text=@"字号:6.0";
            //	labelColor.textColor=[UIColor orangeColor];
			break;
		case 6:
			labelLoanshift.text=@"字号:7.0";
            //	labelColor.textColor=[UIColor grayColor];
			break;
		case 7:
			labelLoanshift.text=@"字号:8.0";
            //	labelColor.textColor=[UIColor purpleColor];
			break;
		case 8:
			labelLoanshift.text=@"字号:9.0";
            //	labelColor.textColor=[UIColor brownColor];
			break;
		case 9:
			labelLoanshift.text=@"字号:12.0";
            //	labelColor.textColor=[UIColor magentaColor];
			break;
		default:
			break;
	}

}
- (IBAction)Size:(UIButton *)sender {

    [self setsWithSize];
}

- (IBAction)Xiangpi:(UIButton *)sender {
    Segment = 10;
}

- (IBAction)Chexiao:(UIButton *)sender {
    [(HuaHua *) self.view Chexiao];
    
}

- (IBAction)Over:(UIButton *)sender {
    
    [(HuaHua *) self.view Over];
}

- (IBAction)BaoCun:(UIButton *)sender {
    NSArray *arr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSLog(@"%@", arr);
    
    [[self.view subviews] makeObjectsPerformSelector:@selector (setAlpha:)];
	
	UIGraphicsBeginImageContext(self.view.bounds.size);
	
	[self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
	
	UIImage* image=UIGraphicsGetImageFromCurrentImageContext();
	
	UIGraphicsEndImageContext();
	
	UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);
    
    NSString *path = [NSString stringWithFormat:@"%@/%i.png", arr[0], index];
    NSLog(@"地址path ====== %@", path);
    NSData *data = UIImagePNGRepresentation(image);
    if ([data writeToFile:path atomically:YES]) {
        NSLog(@"saved success!!!");
    }
	
    //遍历view全部按钮在把他们改为１
	for (UIView* temp in [self.view subviews])
	{
		[temp setAlpha:1.0];
	}
}

@end
