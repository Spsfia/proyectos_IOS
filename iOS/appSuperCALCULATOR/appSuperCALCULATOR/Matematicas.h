//
//  Matematicas.h
//  appSuperCALCULATOR
//
//  Created by Adriana Sofia on 29/09/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Matematicas : NSObject
- (NSNumber *)multiplyA:(NSNumber *)a withB:(NSNumber *)b;
- (NSNumber *)factorial:(NSNumber *)n;
- (NSNumber *)factorialR:(NSNumber *)n;
- (NSNumber *)factorialD:(NSNumber *)n;
- (NSNumber *)seno:(NSNumber *)angulo;
- (NSNumber *)radianesAGrados:(NSNumber *)radianes;
- (NSNumber *)esPrimo:(NSNumber *)numero;
- (NSNumber *)suma:(NSNumber *)x su:(NSNumber *)y;
- (NSNumber *)resta:(NSNumber *)x re:(NSNumber *)y;
- (NSNumber *)divide:(NSNumber *)x de:(NSNumber *)y;
- (NSNumber *)raizCubica:(NSNumber *)numero;


@end

NS_ASSUME_NONNULL_END
