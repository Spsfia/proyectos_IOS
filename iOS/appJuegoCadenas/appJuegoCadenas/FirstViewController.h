//
//  ViewController.h
//  appJuegoCadenas
//
//  Created by Adriana Sofia on 12/10/24.
//

#import <UIKit/UIKit.h>

NSTimer *timer;
int contadorMilisegundos;
@interface FirstViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textfieldEntrada;
@property (weak, nonatomic) IBOutlet UILabel *labelContador;
@property (weak, nonatomic) IBOutlet UILabel *labelLetra;
@property (weak, nonatomic) IBOutlet UILabel *labelPista;
@property (weak, nonatomic) IBOutlet UIButton *botonPausa;


- (IBAction)botonComenzar:(UIButton *)sender;
- (IBAction)botonPausa:(UIButton *)sender;
- (IBAction)botonReiniciar:(UIButton *)sender;
- (IBAction)textfieldEntrada:(UITextField *)sender;
- (IBAction)botonOk:(UIButton *)sender;

- (IBAction)botonSalir:(id)sender;

@end

