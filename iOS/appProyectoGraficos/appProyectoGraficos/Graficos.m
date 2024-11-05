//
//  Graficos.m
//  appProyectoGraficos
//
//  Created by Adriana Sofia on 29/10/24.
//

#import "Graficos.h"

@implementation Graficos

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self dibujarLinea:x1 :y1 :x2 :y2];
}



- (IBAction)botonLinea:(id)sender {
    
    x1 = _textoX1.text.intValue;
    y1 = _textoY1.text.intValue;
    x2 = _textoX2.text.intValue;
    y2 = _textoY2.text.intValue;
    [self setNeedsDisplay];
    
}

-(void) dibujarLinea: (int) x1 :(int) y1 :(int) x2 :(int) y2{
    
    CGContextRef canvas = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(canvas, [UIColor blueColor].CGColor);
    CGContextSetLineWidth(canvas, 2.5);
    CGContextMoveToPoint(canvas, x1, y1);
    CGContextAddLineToPoint(canvas, x2, y2);
    CGContextStrokePath(canvas);
    
}


@end
