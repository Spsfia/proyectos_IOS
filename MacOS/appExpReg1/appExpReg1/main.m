//
//  main.m
//  appExpReg1
//
//  Created by Guest User on 16/10/24.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSString *prueba = @"FACE";
        
        //E. R validar numeros hexadecimales con exp reg
        
        
        NSLog(@"Cadena a Analizar : %@", prueba);
        
        NSMutableString *cadenaPatron =[[NSMutableString alloc]init];
        
        
        //[cadenaPatron appendString:@"\\b(a|b|t)(c|d|e)(c)|(Tec)\\b"];
        //validar numeros hexa
        
        [cadenaPatron appendString:@"^[0-9a-fA-F]{1,8}$"];
        
        //[NSRegularExpression regularExpressionWithPattern:@"\\b(a|b)(c|d)\\b" options:NSRegularExpressionCaseInsensitive error:&error];
        
        NSError *error = NULL;
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:cadenaPatron
                                                                               options:1
                                                                                 error:&error];
        
        NSUInteger numberOfMatches = [regex numberOfMatchesInString:prueba
                                                            options:0
                                                              range:NSMakeRange(0, [prueba length])];
        
        
        NSLog(@
              "Numero de coincidencias : %lu", numberOfMatches);
        
        //EJEMPLO DE LAPAGINA DE AAPLE
        /*NSUInteger numberOfMatches = [regex numberOfMatchesInString:prueba
                                                            options:0
                                                              range:NSMakeRange(0, [prueba length])];
        */
        
        NSArray *matches = [regex matchesInString:prueba options:0 range:NSMakeRange(0,[prueba length])];
        
        for (NSTextCheckingResult *matchResult in matches) {
            NSString *match = [prueba substringWithRange:matchResult.range];
            NSLog(@"LA CADENA CONTIENE %@ ", match);
        }
    }
    return 0;
}
