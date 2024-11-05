//
//  Matematicas.m
//  appSuperCALCULATOR
//
//  Created by Adriana Sofia on 29/09/24.
//

#import "Matematicas.h"

@implementation Matematicas

- (NSNumber *)multiplyA:(NSNumber *)a withB:(NSNumber *)b {
   float number1 = [a floatValue];
   float number2 = [b floatValue];
   float product = number1 * number2;
   return @(product);
}

- (NSNumber *)factorial:(NSNumber *)n {
    int num = [n intValue];
    int f = 1;
    if (num == 0 || num == 1) {
        return @(f);
    }
    for (int i = num; i > 1; i--) {
        f *= i;
    }
    return @(f);
}

- (NSNumber *)factorialR:(NSNumber *)n {
    int num = [n intValue];
    if (num == 0 || num == 1) {
        return @1;
    } else {
        return @([self factorialR:@(num - 1)].intValue * num);
    }
}

- (NSNumber *)factorialD:(NSNumber *)n {
    double num = [n doubleValue];
    double f = 1;
    if (num == 0 || num == 1) {
        return @(f);
    }
    for (int i = num; i > 1; i--) {
        f *= i;
    }
    return @(f);
}

- (NSNumber *)seno:(NSNumber *)angulo {
    double anguloRad = [self radianesAGrados:angulo].doubleValue;
    return @(sin(anguloRad));
}

- (NSNumber *)radianesAGrados:(NSNumber *)radianes {
    double rad = [radianes doubleValue];
    return @(rad * M_PI / 180);
}

- (NSNumber *)esPrimo:(NSNumber *)numero {
    int num = [numero intValue];
    if (num < 2) return @NO;
    for (int i = 2; i <= sqrt(num); i++) {
        if (num % i == 0) {
            return @NO;
        }
    }
    return @YES;
}

- (NSNumber *)suma:(NSNumber *)x su:(NSNumber *)y {
    double suma = [x doubleValue] + [y doubleValue];
    return @(suma);
}

- (NSNumber *)resta:(NSNumber *)x re:(NSNumber *)y {
    double resta = [x doubleValue] - [y doubleValue];
    return @(resta);
}

- (NSNumber *)divide:(NSNumber *)x de:(NSNumber *)y {
    double divisor = [y doubleValue];
    if (divisor == 0) return nil; // Manejo de división por cero
    double div = [x doubleValue] / divisor;
    return @(div);
}

- (NSNumber *)raizCubica:(NSNumber *)numero {
    double num = [numero doubleValue];
    if (num == 0) return @0;

    double aprox = num / 3.0; // Inicial de aproximación
    double pres = 0.00001;
    while (fabs(aprox * aprox * aprox - num) > pres) {
        aprox = ((2.0 * aprox) + (num / (aprox * aprox))) / 3.0;
    }
    return @(aprox);
}



@end
