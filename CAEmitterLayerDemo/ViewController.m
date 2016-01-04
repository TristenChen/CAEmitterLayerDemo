//
//  ViewController.m
//  CAEmitterLayerDemo
//
//  Created by Tristen on 1/4/16.
//  Copyright © 2016 yumi. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    CAEmitterLayer *emitter = [CAEmitterLayer layer];
    //例子发射位置
    emitter.emitterPosition = CGPointMake(self.view.bounds.size.width / 4, -20);
    //发射源的尺寸大小
    emitter.emitterSize = CGSizeMake(self.view.bounds.size.width, 20);
    //发射模式
    emitter.emitterMode = kCAEmitterLayerVolume;
    //发射源的形状
    emitter.emitterShape = kCAEmitterLayerLine;
    emitter.preservesDepth = YES;
    
    CAEmitterCell *cell = [CAEmitterCell emitterCell];
    //粒子发生率
    cell.birthRate = 100;
    //粒子生命周期
    cell.lifetime = 5;
    //粒子速度（初始速度）
    cell.velocity = 10;
    //粒子的速度范围
    //cell.velocityRange = 10;
    //粒子xy方向的加速度分量, 决定粒子的发射方向,以及速度
    cell.yAcceleration = 200;
    cell.xAcceleration = 50;
    cell.emissionLongitude = -M_PI_4;
    
    UIImage *image= [self imageWithColor:[UIColor whiteColor]
                                    size:CGSizeMake(10, 10)];
    
    cell.contents = (id)[image CGImage];
    
    emitter.emitterCells = [NSArray arrayWithObjects:cell,nil];
    [self.view.layer insertSublayer:emitter
                            atIndex:0];
}

- (UIImage *)imageWithColor:(UIColor *)color
                       size:(CGSize)imageSize
{
    CGRect rect=CGRectMake(0.0f, 0.0f, imageSize.width, imageSize.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

@end
