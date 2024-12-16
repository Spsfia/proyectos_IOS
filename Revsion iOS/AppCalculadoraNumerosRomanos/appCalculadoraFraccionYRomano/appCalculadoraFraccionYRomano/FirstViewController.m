//
//  ViewController.m
//  appCalculadoraFraccionYRomano
//
//  Created by Adriana Sofia on 13/10/24.
//

#import "FirstViewController.h"
#include "Racionales.h"

@interface FirstViewController (){
    NSArray *operaciones;    
    NSInteger operacionSeleccionada;
    // Crear las fracciones con los valores ingresados
    Racionales *fraccion1;// = [[Racionales alloc] initWithNumerador:numerador1 denominador:denominador1 entero:entero1];
    Racionales *fraccion2;// = [[Racionales alloc] initWithNumerador:numerador2 denominador:denominador2 entero:entero2];

}

@end

@implementation FirstViewController
    

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pickerViewOperaciones.dataSource = self;
    self.pickerViewOperaciones.delegate = self;
    operaciones = @[@"Suma (+)", @"Resta (-)", @"Multiplicación (*)", @"Division (/)"];
    
    // Oculta el teclado
       UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
       [self.view addGestureRecognizer:tap];
}

- (void)dismissKeyboard {
    [self.view endEditing:YES];
}

- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return operaciones.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return operaciones[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    operacionSeleccionada = row;
}




- (IBAction)botonCalcular:(id)sender {
    // Valores de los TextFields
    //Fraccion No.1
    int entero1 = [_TFEntero1.text intValue];
    int numerador1 = [_TFNumerador1.text intValue];
    int denominador1 = [_TFDenominador1.text intValue];
    //Fraccion No.2
    int entero2 = [_TFEntero2.text intValue];
    int numerador2 = [_TFNumerador2.text intValue];
    int denominador2 = [_TFDenominador2.text intValue];
    
    // Crear las fracciones con los valores ingresados
    fraccion1 = [[Racionales alloc] initWithNumerador:numerador1 denominador:denominador1 entero:entero1];
     fraccion2 = [[Racionales alloc] initWithNumerador:numerador2 denominador:denominador2 entero:entero2];
      
    Racionales *resultado;
       
       // Realizar la operación seleccionada
    switch (operacionSeleccionada) {
        case 0:  // Suma
            resultado = [fraccion1 sumaCon:fraccion2];
            break;
        case 1:  // Resta
            resultado = [fraccion1 restaCon:fraccion2];
            break;
        case 2:  // Multiplicación
            resultado = [fraccion1 multiplicacionCon:fraccion2];
            break;
        case 3:  // División
            resultado = [fraccion1 divisionCon:fraccion2];
            break;
        default:
            break;
    }

    
      self.labelEnteroRes.text = [NSString stringWithFormat:@"%d", resultado.entero];
      self.labelNumeradorRes.text = [NSString stringWithFormat:@"%d", resultado.numerador];
      self.labelDenominadorRes.text = [NSString stringWithFormat:@"%d", resultado.denominador];
}
- (IBAction)botonClear:(id)sender {
        // Limpiar los TextFields de las fracciones
        self.TFEntero1.text = @"";
        self.TFNumerador1.text = @"";
        self.TFDenominador1.text = @"";
        
        self.TFEntero2.text = @"";
        self.TFNumerador2.text = @"";
        self.TFDenominador2.text = @"";
        
        // Limpiar las etiquetas del resultado
        self.labelEnteroRes.text = @"";
        self.labelNumeradorRes.text = @"";
        self.labelDenominadorRes.text = @"";
    
        fraccion1 = [[Racionales alloc] initWithNumerador:0 denominador:1 entero:0];
        fraccion2 = [[Racionales alloc] initWithNumerador:0 denominador:1 entero:0];

    }

- (IBAction)botonNumerosRomanos:(UIButton *)sender {
    //Primera fraccion
    int dVE1 = [self.TFEntero1.text intValue];
    self.TFEntero1.text = [self convertirAromano:dVE1];
    int dVN1 = [self.TFNumerador1.text intValue];
    self.TFNumerador1.text = [self convertirAromano:dVN1];
    int dVD1 = [self.TFDenominador1.text intValue];
    self.TFDenominador1.text = [self convertirAromano:dVD1];
    //Segunda fraccion
    int dVE2 = [self.TFEntero2.text intValue];
    self.TFEntero2.text = [self convertirAromano:dVE2];
    int dVN2 = [self.TFNumerador2.text intValue];
    self.TFNumerador2.text = [self convertirAromano:dVN2];
    int dVD2 = [self.TFDenominador2.text intValue];
    self.TFDenominador2.text = [self convertirAromano:dVD2];
    //Labels resultado
    int LER = [self.labelEnteroRes.text intValue];
    self.labelEnteroRes.text = [self convertirAromano:LER];
    int LNR = [self.labelNumeradorRes.text intValue];
    self.labelNumeradorRes.text = [self convertirAromano:LNR];
    int LDR = [self.labelDenominadorRes.text intValue];
    self.labelDenominadorRes.text = [self convertirAromano:LDR];
}

- (NSString *)convertirAromano:(NSInteger)numero {
    NSArray *numeros = @[@1000, @900, @500, @400, @100, @90, @50, @40, @10, @9, @5, @4, @1];
    NSArray *romanos = @[@"M", @"CM", @"D", @"CD", @"C", @"XC", @"L", @"XL", @"X", @"IX", @"V", @"IV", @"I"];

    NSMutableString *resultado = [NSMutableString string];
    for (int i = 0; i < numeros.count; i++) {
        NSInteger valor = [numeros[i] integerValue];
        while (numero >= valor) {
            [resultado appendString:romanos[i]];
            numero -= valor;
        }
    }
    return resultado;
}
@end
