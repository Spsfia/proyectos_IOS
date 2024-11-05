//
//  ViewController.m
//  appGraficosiOS
//
//  Created by Adriana Sofia on 25/10/24.
//

#import "ViewController.h"
#import "Graficos.h"

@interface ViewController (){
    float y2;
    float x2;
    float x1;
    float y1;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)botonLinea:(id)sender {
    CGContextRef canvas = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(canvas,x1, y1);
    CGContextAddLineToPoint(canvas,x2, y2);
    
}

- (IBAction)y2:(id)sender {
    y2 = [self.tfy2.text floatValue];
}

- (IBAction)x2:(id)sender {
   x2 = [self.tfx2.text floatValue];
}

- (IBAction)y1:(id)sender {
    y1 = [self.tfy1.text floatValue];
}

- (IBAction)x1:(id)sender {
    x1 = [self.tfx1.text floatValue];

}
   


- (void)tfx2:(id)sender __attribute__((ibaction)) {
}

- (void)tfy1:(id)sender __attribute__((ibaction)) {
}

- (void)tfy2:(id)sender __attribute__((ibaction)) {
}

- (void)tfx1:(id)sender __attribute__((ibaction)) {
}

@end
