//
//  SecondViewController.m
//  appCalculadoraFraccionYRomano
//
//  Created by Adriana Sofia on 18/10/24.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [self.view addSubview:datePicker];

    
    [self.datePicker addTarget:self action:@selector(cambioEnFecha:) forControlEvents:UIControlEventValueChanged];

}



- (IBAction)obtenerFecha:(id)sender {
    NSDate *fechaSeleccionada = self.datePicker.date;

       // Convertir la fecha a un formato legible (opcional)
       NSDateFormatter *formatoFecha = [[NSDateFormatter alloc] init];
       [formatoFecha setDateFormat:@"dd/MM/yyyy"];
       NSString *fechaString = [formatoFecha stringFromDate:fechaSeleccionada];
    int LER = [self.labelRomanos.text intValue];
    self.labelRomanos.text = [self convertirAromano:LER];
    
    
}

- (void)cambioEnFecha:(UIDatePicker *)datePicker {
    NSDate *fechaSeleccionada = datePicker.date;
    
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
