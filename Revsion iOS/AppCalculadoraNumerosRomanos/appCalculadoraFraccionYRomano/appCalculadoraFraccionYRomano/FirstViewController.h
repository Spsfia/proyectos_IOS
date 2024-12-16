//
//  ViewController.h
//  appCalculadoraFraccionYRomano
//
//  Created by Adriana Sofia on 13/10/24.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *pickerViewOperaciones;

//Outlets primera fraccion
@property (weak, nonatomic) IBOutlet UITextField *TFEntero1;
@property (weak, nonatomic) IBOutlet UITextField *TFNumerador1;
@property (weak, nonatomic) IBOutlet UITextField *TFDenominador1;


//Outlets segunda fraccion
@property (weak, nonatomic) IBOutlet UITextField *TFEntero2;
@property (weak, nonatomic) IBOutlet UITextField *TFNumerador2;
@property (weak, nonatomic) IBOutlet UITextField *TFDenominador2;



//Labels resultado
@property (weak, nonatomic) IBOutlet UILabel *labelEnteroRes;
@property (weak, nonatomic) IBOutlet UILabel *labelNumeradorRes;
@property (weak, nonatomic) IBOutlet UILabel *labelDenominadorRes;



//Calcular
- (IBAction)botonCalcular:(id)sender;

//Limpiar
- (IBAction)botonClear:(id)sender;
//Numeros romanos
- (IBAction)botonNumerosRomanos:(UIButton *)sender;

//Metodo numeros romanos
- (NSString *)convertirAromano:(NSInteger)numero;

@end

