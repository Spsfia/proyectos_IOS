//
//  Graficos.h
//  appProyectoGraficos
//
//  Created by Adriana Sofia on 29/10/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Graficos : UIView
{
    int x1, x2, y1, y2;
}

@property (strong, nonatomic) IBOutlet UITextField *textoX1;
@property (strong, nonatomic) IBOutlet UITextField *textoX2;
@property (strong, nonatomic) IBOutlet UITextField *textoY1;
@property (strong, nonatomic) IBOutlet UITextField *textoY2;
@property (strong, nonatomic) IBOutlet UITextField *textoPC1;
@property (strong, nonatomic) IBOutlet UITextField *textoPC2;
@property (strong, nonatomic) IBOutlet UITextField *textoPC3;
@property (strong, nonatomic) IBOutlet UITextField *textoPC4;


- (IBAction)botonLinea:(UIButton *)sender;
-(void) dibujarLinea: (int) x1 :(int) y1 :(int) x2 :(int) y2;

@end

NS_ASSUME_NONNULL_END
