//
//  Cadena.m
//  appNSString
//
//  Created by Adriana Sofia on 18/09/24.
//

#import "Cadena.h"

@implementation Cadena
//Botón hola
- (IBAction)botonMayus:(NSButton *)sender {
    //Contar cuantas mayúsculas hay en el texto1
    NSString *cad = texto1.stringValue;
    NSInteger leng = texto1.stringValue.length;
    
    int i , cont;
    i = cont = 0;
    
    while (i < leng) {
        unichar letra = [cad characterAtIndex:i];
        if (letra >= 'A' && letra <= 'Z') {
            cont++;
        }
        i++;
        labelMayus.intValue = cont;
    }
    
}

- (IBAction)boton1:(NSButton *)sender {
    NSString *saludo = @"Hola ";
    NSString *cad1 = [saludo stringByAppendingString:texto1.stringValue];
//    [label1 stringValue: cad1];
    [_label1propiedad setStringValue:cad1];
    
}

- (IBAction)botonContar:(NSButton *)sender {
    _botonContar.font = [NSFont fontWithName:@"Shobhika" size:16];
    _botonContar.title = @"Contado 🔢";
    
    long int leng = texto1.stringValue.length;
    labelContar.intValue = (int) leng;
}

- (NSMutableString *) aMayusculas:(NSMutableString *) cadena{
    NSMutableString *cadenaFin= [[NSMutableString alloc] init];
    for (NSInteger i = 0; i < cadena.length; i++) {
        unichar letra = [cadena characterAtIndex:(i)];
        if ('a'<= letra && letra<= 'z') {
             letra = letra - 32;
            [cadenaFin appendFormat: @"%c",letra];
        } else{
            [cadenaFin appendFormat: @"%c",letra];
        }
    }
    return cadenaFin;
}

- (IBAction)botonConvertir:(id)sender {
    //IMPLEMENTAR UN METODO PARA CONVERTIR UNA CADENA A MAYUSCULAS
    //NO USAR EL METODO uppercaseString
    
    NSMutableString *cadAux = [texto1.stringValue mutableCopy];
   
    [labelConver setStringValue: [self aMayusculas:cadAux]];

}




@end
