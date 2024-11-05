//
//  Graficos.m
//  appGraficosiOS
//
//  Created by Adriana Sofia on 25/10/24.
//

#import "Graficos.h"


@implementation Graficos

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef canvas = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(canvas, [UIColor blueColor].CGColor);
    CGContextSetLineWidth(canvas, 5.5);
    CGContextMoveToPoint(canvas, 0, 0);
    
    
    
    
    CGContextMoveToPoint(canvas, 0, 0);
    CGContextAddLineToPoint(canvas, 0, 0);
    
    
//    CGRect rectangulo = [self bounds];
//    NSLog(@"Ancho: %f \n Alto: %f", (float)rectangulo.size.width, rectangulo.size.height);
//    CGContextAddLineToPoint(canvas, 300, 300);
//    CGContextStrokePath(canvas);
    
    //Rombo

    //CGFloat width = canvas->bounds.size.width;
//    CGFloat height = canvas.size.height;
//
//    CGContextMoveToPoint(canvas, width/2, 0);
//    CGContextAddLineToPoint(canvas, width, 0);
//    CGContextStrokePath(canvas);
    
    
    //Rectangulo
//    CGRect rectangulo = CGRectMake(100, 100, 300, 300);
//    
//    CGContextAddRect(canvas, rectangulo);
//    CGContextStrokePath(canvas);
//    CGContextSetFillColorWithColor(canvas, [UIColor purpleColor].CGColor);
//    CGContextFillRect(canvas, rectangulo);
    
    //Curva de bezier
//    CGContextMoveToPoint(canvas, 50, 50);
//    CGContextAddCurveToPoint(canvas, 0, 50, 300, 250, 300, 400);
//    CGContextStrokePath(canvas);
//
    
    //Curva de bezier cubica
    CGContextMoveToPoint(canvas, 100, 100);
    CGContextAddQuadCurveToPoint(canvas, rectangulo.size.height/2.0, rectangulo.size.width/2.0, 300, 100);
    CGContextStrokePath(canvas);
    
    
    
    
}


@end
