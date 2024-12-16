//
//  Canvas.m
//  appGraficos1
//
//  Created by Adriana Sofia on 27/09/24.
//

#import "Canvas.h"

@implementation Canvas

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    NSRect rectangulo = [self bounds];
    [[NSColor blackColor]set];
    [NSBezierPath fillRect:rectangulo];
    
    [[NSColor orangeColor]set];
    
     //[self estrella];
    [self dibujaflor];
    
   // srandom((unsigned)time(NULL));
    // NSBezierPath *path = [[NSBezierPath alloc]init];
    // [path setLineWidth:3.0];
    
    
     //NSPoint p = [self randomPoint];
    // [path moveToPoint:p];
    // for (int i = 0; i < 15; i++) {
       //p = [self randomPoint];
     //    [path lineToPoint:p];
    // }
     
    // [path stroke];
}
- (NSPoint)randomPoint {
    NSPoint resultado;
    NSRect r = [self bounds];
    resultado.x = r.origin.x + random() % (int) r.size.width;
    resultado.y = r.origin.y + random() % (int) r.size.height;
    return resultado;
}

- (void)estrella {
    //[[NSColor colorWithDeviceRed:0.1f green:0.285f blue:0.785f alpha:1.0f] set ];
    [[NSColor colorWithDeviceRed:1.0f green:0.156 blue:0.217f alpha:1.0f]set];
    NSBezierPath *path = [[NSBezierPath alloc] init];
    [path setLineWidth:10.0];
    
    //int estrella[6][3] = {{0,0}, {250,500},{500, 0}, {0,250}, {500, 250}, {0,0}};
    int estrella[6][3] = {{250,400}, {150,150},{400,300}, {100,300}, {350,150}, {250,400}};
    //int estrella[6][3] = {{250,400}, {350,50},{100,250}, {400,250}, {150,50}, {250,400}};


NSPoint punto;
   
   punto.x = estrella[0][0];
   punto.y = estrella[0][1];
   
   [path moveToPoint:punto];
   
   for ( int i = 1; i < 6; i++) {
       punto.x = estrella[i][0];
       punto.y = estrella[i][1];
       
       [path lineToPoint:punto];
   }
   
   [path stroke];
    [path fill];//Rellena poligonos convexos

}

- (void)dibujaLinea {
    [NSColor orangeColor];
    [NSBezierPath setDefaultLineCapStyle:NSLineCapStyleButt];
    
    NSBezierPath *path = [NSBezierPath bezierPath];
    [path setLineWidth:5.0];
    [path moveToPoint:NSMakePoint(50.0,50.0)];
    [path lineToPoint:NSMakePoint(200.0, 200.0)];
    [path setLineCapStyle: NSLineCapStyleButt];
    
    [path stroke];
}

- (void)dibujaPoligono {
}

- (void)dibujaflor {
    
    [[NSColor colorWithDeviceRed:0.55f green:0.686f blue:0.517f alpha:1.0f]set];
    NSBezierPath *path = [[NSBezierPath alloc] init];
    [path setLineWidth:10.0];
    
    int flor[17][3] = {{250,0}, {250,100},{300, 100}, {350,150}, {300, 150}, {250,100}, {250,200}, {170,220},{150,300}, {150,400},{200,350}, {250,400},{300,350},{350,400},{350,300},{320,220}, {250,200}};


NSPoint punto;
   
   punto.x = flor[0][0];
   punto.y = flor[0][1];
   
   [path moveToPoint:punto];
   
   for ( int i = 1; i < 17; i++) {
       punto.x = flor[i][0];
       punto.y = flor[i][1];
       
       [path lineToPoint:punto];
   }
   
   [path stroke];
    [path fill];//Rellena poligonos convexos

}

@end
