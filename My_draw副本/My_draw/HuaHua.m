//
//  HuaHua.m
//  My_draw
//
//  Created by geek-group on 14-6-12.
//  Copyright (c) 2014年 geek-group. All rights reserved.
//

#import "HuaHua.h"
@implementation HuaHua

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
      //  arr = [NSMutableArray array];
    }
    return self;
}

//给彩笔赋上颜色
-(void) setsegmentColor
{
	switch (Intsegmentcolor)
	{
		case 0:
			segmentColor=[[UIColor blackColor] CGColor];
			break;
		case 1:
			segmentColor=[[UIColor redColor] CGColor];
			break;
		case 2:
			segmentColor=[[UIColor blueColor] CGColor];
            
			break;
		case 3:
			segmentColor=[[UIColor greenColor] CGColor];
			break;
		case 4:
			segmentColor=[[UIColor yellowColor] CGColor];
			break;
		case 5:
			segmentColor=[[UIColor orangeColor] CGColor];
			break;
		case 6:
			segmentColor=[[UIColor grayColor] CGColor];
			break;
		case 7:
			segmentColor=[[UIColor purpleColor]CGColor];
			break;
		case 8:
			
			segmentColor=[[UIColor brownColor]CGColor];
			break;
		case 9:
			segmentColor=[[UIColor magentaColor]CGColor];
			break;
		case 10:
			segmentColor=[[UIColor whiteColor]CGColor];
			break;
            
		default:
			break;
	}
}


#pragma mark 画笔
- (void)drawRect:(CGRect)rect
{
	CGContextRef context=UIGraphicsGetCurrentContext();
	CGContextSetLineCap(context, kCGLineCapRound);
	//设置画线的连接处　拐点圆滑
	CGContextSetLineJoin(context, kCGLineJoinRound);
	//第一次时候个myallline开辟空间
	static BOOL allline=NO;
	if (allline==NO)
	{
        //设置内存大小
		myallline=[[NSMutableArray alloc] initWithCapacity:10];
		myallColor=[[NSMutableArray alloc] initWithCapacity:10];
		myallwidth=[[NSMutableArray alloc] initWithCapacity:10];
		allline=YES;
	}
	//画之前线
	if ([myallline count]>0)
	{
		for (int i=0; i<[myallline count]; i++)
		{
			NSArray* tempArray=[NSArray arrayWithArray:[myallline objectAtIndex:i]];

			if ([myallColor count]>0)
			{
				Intsegmentcolor=[[myallColor objectAtIndex:i] intValue];
				Intsegmentwidth=[[myallwidth objectAtIndex:i]floatValue]+1;
			}
		
			if ([tempArray count]>1)
			{
				CGContextBeginPath(context);
				CGPoint myStartPoint=[[tempArray objectAtIndex:0] CGPointValue];
				CGContextMoveToPoint(context, myStartPoint.x, myStartPoint.y);
				
				for (int j=0; j<[tempArray count]-1; j++)
				{
					CGPoint myEndPoint=[[tempArray objectAtIndex:j+1] CGPointValue];

					CGContextAddLineToPoint(context, myEndPoint.x,myEndPoint.y);
				}
                [self setsegmentColor];
				CGContextSetStrokeColorWithColor(context, segmentColor);
                CGContextSetLineWidth(context, Intsegmentwidth);
				CGContextStrokePath(context);
			}
		}
	}
	//画当前的线
	if ([myallpoint count]>1)
	{
		CGContextBeginPath(context);
		CGPoint myStartPoint=[[myallpoint objectAtIndex:0]   CGPointValue];
		CGContextMoveToPoint(context,    myStartPoint.x, myStartPoint.y);
		//把点全部加入数组
		for (int i=0; i<[myallpoint count]-1; i++)
		{
			CGPoint myEndPoint=  [[myallpoint objectAtIndex:i+1] CGPointValue];
			CGContextAddLineToPoint(context, myEndPoint.x,   myEndPoint.y);
		}
		//在颜色和画笔大小数组里面取不相应的值
		Intsegmentcolor=[[myallColor lastObject] intValue];
		Intsegmentwidth=[[myallwidth lastObject]floatValue]+1;
		
		//-------------------------------------------
		//画笔颜色
		[self setsegmentColor];
		CGContextSetStrokeColorWithColor(context, segmentColor);
		CGContextSetFillColorWithColor (context,  segmentColor);
		//-------------------------------------------
		//画笔宽度
		CGContextSetLineWidth(context, Intsegmentwidth);
		//全部画出来
		CGContextStrokePath(context);
	}
}

-(void)Introductionpoint1
{
	myallpoint=[[NSMutableArray alloc] initWithCapacity:10];
}

//把画过的当前线放入　存放线的数组
-(void)Introductionpoint2
{
	[myallline addObject:myallpoint];
}

//接受到窗体赋值后到值
-(void)Introductionpoint3:(CGPoint)sender
{
	NSValue* pointvalue=[NSValue valueWithCGPoint:sender];
	[myallpoint addObject:pointvalue];
}

//接收segment颜色反过来的值,然后擦掉
-(void)Introductionpoint4:(int)sender
{
	NSLog(@"颜色 sender:%i", sender);
	NSNumber* Numbersender= [NSNumber numberWithInt:sender];
	[myallColor addObject:Numbersender];
}

//接收线条宽度按钮反回来的值
-(void)Introductionpoint5:(int)sender
{
	NSLog(@"字体 sender:%i", sender);
	NSNumber* Numbersender= [NSNumber numberWithInt:sender];
	[myallwidth addObject:Numbersender];
}

//退回上一步
-(void) Chexiao{
    if([myallline count]>0)
    {
        [myallline removeLastObject];
        [myallColor removeLastObject];
        [myallpoint removeAllObjects];
        [myallwidth removeLastObject];
    }
    [self setNeedsDisplay];
}

//清空
-(void) Over
{
    if([myallline count] >0)
    {
        [myallline removeLastObject];//移除画的上一个线
        [myallColor removeLastObject];
        [myallpoint removeAllObjects];
        [myallwidth removeLastObject];
        myallline = [[NSMutableArray alloc]initWithCapacity:10];//再次重新刷新内存
        myallColor = [[NSMutableArray alloc]initWithCapacity:10];
        myallwidth = [[NSMutableArray alloc]initWithCapacity:10];
    }
    [self  setNeedsDisplay];
}
@end
