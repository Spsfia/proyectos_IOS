//
//  CalculadoraMat.m
//  appSuperCALCULATOR
//
//  Created by Adriana Sofia on 29/09/24.
//

#import "CalculadoraMat.h"
#import "Matematicas.h"

@implementation CalculadoraMat

// Variable para almacenar la expresión
NSMutableString *expresion;

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Inicializa la cadena de expresión
    expresion = [[NSMutableString alloc] init];

}

//Botones numero

- (IBAction)boton0:(id)sender {
    [expresion appendString:@"0"];
       [_labelResultado setStringValue:expresion];
}
- (IBAction)boton1:(id)sender {
    [expresion appendString:@"1"];
        [_labelResultado setStringValue:expresion];
}

- (IBAction)boton2:(id)sender {
    [expresion appendString:@"2"];
        [_labelResultado setStringValue:expresion];
}

- (IBAction)boton3:(id)sender {
    [expresion appendString:@"3"];
        [_labelResultado setStringValue:expresion];
}

- (IBAction)boton4:(id)sender {
    [expresion appendString:@"4"];
        [_labelResultado setStringValue:expresion];
}

- (IBAction)boton5:(id)sender {
    [expresion appendString:@"5"];
        [_labelResultado setStringValue:expresion];
}

- (IBAction)boton6:(id)sender {
    [expresion appendString:@"6"];
        [_labelResultado setStringValue:expresion];
}

- (IBAction)boton7:(id)sender {
    [expresion appendString:@"7"];
        [_labelResultado setStringValue:expresion];
}

- (IBAction)boton8:(id)sender {
    [expresion appendString:@"8"];
        [_labelResultado setStringValue:expresion];
}

- (IBAction)boton9:(id)sender {
    [expresion appendString:@"9"];
        [_labelResultado setStringValue:expresion];
}


//Botones operaciones


- (IBAction)botonClear:(id)sender {
    [expresion setString:@""];
    [_labelResultado setStringValue:expresion];
}

- (IBAction)botonIgual:(id)sender {
    // Evalúa la expresión usando NSExpression
       NSExpression *expresionEvaluada = [NSExpression expressionWithFormat:expresion];
       NSNumber *resultado = [expresionEvaluada expressionValueWithObject:nil context:nil];

       [_labelResultado setStringValue:[resultado stringValue]];
}

- (IBAction)botonPunto:(id)sender {
    [expresion appendString:@"."];
        [_labelResultado setStringValue:expresion];
}

- (IBAction)botonDiv:(id)sender {[expresion appendString:@"/"];
    [_labelResultado setStringValue:expresion];
}

- (IBAction)botonMulti:(id)sender {
    [expresion appendString:@"*"];
        [_labelResultado setStringValue:expresion];
}

- (IBAction)botonResta:(id)sender {
    [expresion appendString:@"-"];
        [_labelResultado setStringValue:expresion];
}

- (IBAction)botonSuma:(id)sender {
    [expresion appendString:@"+"];
    [_labelResultado setStringValue:expresion];
}


- (IBAction)botonNuRomanos:(id)sender {
    NSString *text = self.labelResultado.stringValue;
    NSInteger decimalValue = [text integerValue];
    self.labelResultado.stringValue = [self convertirAromano:decimalValue];

}

- (IBAction)botonHexa:(id)sender {
    NSString *text = self.labelResultado.stringValue;
        NSInteger decimalValue = [text integerValue];
        self.labelResultado.stringValue = [self convertirAHexadecimal:decimalValue];
}

- (IBAction)botonBinario:(id)sender {
    NSString *text = self.labelResultado.stringValue;
    NSInteger decimalValue = [text integerValue];
    self.labelResultado.stringValue = [self convertirAbinario:decimalValue];
}

//Metodos para convertir el resultado

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

// Función para convertir a binario
- (NSString *)convertirAbinario:(NSInteger)numero {
    NSMutableString *binario = [NSMutableString string];
    while (numero > 0) {
        [binario insertString:((numero % 2 == 0) ? @"0" : @"1") atIndex:0];
        numero /= 2;
    }
    return binario.length > 0 ? binario : @"0";
}

- (NSString *)convertirAHexadecimal:(NSInteger)numero {
    return [NSString stringWithFormat:@"%lX", (long)numero];
}

@end
