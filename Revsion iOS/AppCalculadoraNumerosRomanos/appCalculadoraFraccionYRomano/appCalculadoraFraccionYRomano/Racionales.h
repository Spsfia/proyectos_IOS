//
//  Racionales.h
//  appCalculadoraFraccionYRomano
//
//  Created by Adriana Sofia on 13/10/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Racionales : NSObject

@property (nonatomic) int numerador;
@property (nonatomic) int denominador;
@property (nonatomic) int entero;

- (instancetype)initWithNumerador:(int)numerador denominador:(int)denominador entero:(int)entero;
- (void)simplificar;
- (NSString *)descripcion;

// Métodos para operaciones con fracciones
- (Racionales *)sumaCon:(Racionales *)otraFraccion;
- (Racionales *)multiplicacionCon:(Racionales *)otraFraccion;
- (Racionales *)divisionCon:(Racionales *)otraFraccion;
- (Racionales *)restaCon:(Racionales *)otraFraccion;




@end

NS_ASSUME_NONNULL_END
