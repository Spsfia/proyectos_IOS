//
//  DibujarConTouch.m
//  appDibujarConTouch
//
//  Created by Guest User on 30/10/24.
//

#import "DibujarConTouch.h"

@implementation DibujarConTouch{
    NSMutableArray *pathSegments; // Array para almacenar cada segmento de trazo y su color
    UIColorWell *colorWell;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */

- (id)initWithCoder: (NSCoder *) coder{
    if(self = [super initWithCoder:coder]){
        [self setMultipleTouchEnabled:NO];
        [self setBackgroundColor:[UIColor whiteColor]];
        pathSegments = [NSMutableArray array];
        _selectedColor = [UIColor blackColor];

        colorWell = [[UIColorWell alloc] initWithFrame:CGRectMake(300, 750, 44, 44)];
        colorWell.selectedColor = _selectedColor;
        [colorWell addTarget:self action:@selector(colorWellDidChange:)
            forControlEvents:UIControlEventValueChanged];
        [self addSubview:colorWell];
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    // Dibuja cada segmento de trazo con su color correspondiente
       for (NSDictionary *segment in pathSegments) {
           UIColor *color = segment[@"color"];
           UIBezierPath *path = segment[@"path"];
           [color setStroke];
           [path stroke];
       }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
       CGPoint p = [touch locationInView:self];
       
       // Crea un nuevo trazo con el color seleccionado actual
       UIBezierPath *newPath = [UIBezierPath bezierPath];
       [newPath setLineWidth:5];
       [newPath moveToPoint:p];
       
       // Guarda el trazo y su color en el array
       NSDictionary *segment = @{@"color": self.selectedColor, @"path": newPath};
       [pathSegments addObject:segment];
       
       [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
       CGPoint p = [touch locationInView:self];
       
       // Agrega el punto al último trazo en el array
       UIBezierPath *currentPath = [pathSegments.lastObject objectForKey:@"path"];
       [currentPath addLineToPoint:p];
       
       [self setNeedsDisplay];}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self touchesMoved:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self touchesEnded:touches withEvent:event];
}

-(void)borrar{
    [pathSegments removeAllObjects];
       [self setNeedsDisplay];
}

- (IBAction)btnBorrar:(UIButton *)sender {
    [self borrar];

}

// Método para manejar el cambio de color en el UIColorWell
- (void)colorWellDidChange:(UIColorWell *)sender {
    self.selectedColor = sender.selectedColor;
    [self setNeedsDisplay];
}

- (IBAction)btnLetras:(id)sender {
    if (_imageView1.hidden == YES) {
        _imageView1.hidden = NO;
    }else{
        _imageView1.hidden = YES;
    }
    
}
@end
