//
//  Racionales.m
//  appCalculadoraFraccionYRomano
//
//  Created by Adriana Sofia on 13/10/24.
//

#import "Racionales.h"

@implementation Racionales
- (instancetype)initWithNumerador:(int)numerador denominador:(int)denominador entero:(int)entero {
    self = [super init];
    if (self) {
        _numerador = numerador;
        _denominador = denominador;
        _entero = entero;
        [self simplificar];
    }
    return self;
}

- (void)simplificar {
    int a = _numerador;
    int b = _denominador;
    
    while (b != 0) {
        int temp = b;
        b = a % b;
        a = temp;
    }
    int mcd = a;
    
    _numerador /= mcd;
    _denominador /= mcd;
    
    if (_numerador >= _denominador) {
        _entero += _numerador / _denominador;
        _numerador = _numerador % _denominador;
    }
}

- (NSString *)descripcion {
    if (_numerador == 0) {
        return [NSString stringWithFormat:@"%d", _entero];
    } else if (_entero == 0) {
        return [NSString stringWithFormat:@"%d/%d", _numerador, _denominador];
    } else {
        return [NSString stringWithFormat:@"%d %d/%d", _entero, _numerador, _denominador];
    }
}

//Metodo de suma
- (Racionales *)sumaCon:(Racionales *)otraFraccion {
    Racionales *resultado = [[Racionales alloc] init];
    resultado.numerador = self.numerador * otraFraccion.denominador + self.denominador * otraFraccion.numerador;
    resultado.denominador = self.denominador * otraFraccion.denominador;
    [resultado simplificar];
    resultado.entero += self.entero + otraFraccion.entero;
    return resultado;
    
}

// Metodo de multiplicación
- (Racionales *)multiplicacionCon:(Racionales *)otraFraccion {
    //fracciones impropias
    int numerador1 = self.entero * self.denominador + self.numerador;
    int numerador2 = otraFraccion.entero * otraFraccion.denominador + otraFraccion.numerador;
    Racionales *resultado = [[Racionales alloc] init];
    resultado.numerador = numerador1 * numerador2;
    resultado.denominador = self.denominador * otraFraccion.denominador;
    [resultado simplificar];
    
    return resultado;
}

// Metodo de división
- (Racionales *)divisionCon:(Racionales *)otraFraccion {
    // fracciones impropias
    int numerador1 = self.entero * self.denominador + self.numerador;
    int numerador2 = otraFraccion.entero * otraFraccion.denominador + otraFraccion.numerador;
    Racionales *resultado = [[Racionales alloc] init];
    resultado.numerador = numerador1 * otraFraccion.denominador;
    resultado.denominador = self.denominador * numerador2;
    [resultado simplificar];
    return resultado;
}
//Metodo de resta
- (Racionales *)restaCon:(Racionales *)otraFraccion {
    //fracciones impropias
       int numerador1 = self.entero * self.denominador + self.numerador;
       int numerador2 = otraFraccion.entero * otraFraccion.denominador + otraFraccion.numerador;
       Racionales *resultado = [[Racionales alloc] init];
       resultado.numerador = numerador1 * otraFraccion.denominador - self.denominador * numerador2;
       resultado.denominador = self.denominador * otraFraccion.denominador;
       [resultado simplificar];
       
       return resultado;
}




@end
