//
//  CalculadoraMat.h
//  appSuperCALCULATOR
//
//  Created by Adriana Sofia on 29/09/24.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
NS_ASSUME_NONNULL_BEGIN

@interface CalculadoraMat : NSObject
- (void)awakeFromNib;
//Label de resultado
@property (weak) IBOutlet NSTextField *labelResultado;
//Botones de numeros
- (IBAction)boton9:(id)sender;
- (IBAction)boton8:(id)sender;
- (IBAction)boton7:(id)sender;
- (IBAction)boton6:(id)sender;
- (IBAction)boton5:(id)sender;
- (IBAction)boton4:(id)sender;
- (IBAction)boton3:(id)sender;
- (IBAction)boton2:(id)sender;
- (IBAction)boton1:(id)sender;
- (IBAction)boton0:(id)sender;

//Botones de operación y extra
- (IBAction)botonSuma:(id)sender;
- (IBAction)botonResta:(id)sender;
- (IBAction)botonMulti:(id)sender;
- (IBAction)botonDiv:(id)sender;
- (IBAction)botonPunto:(id)sender;
- (IBAction)botonClear:(id)sender;
- (IBAction)botonIgual:(id)sender;

//Botones de cambio
- (IBAction)botonBinario:(id)sender;
- (IBAction)botonHexa:(id)sender;
- (IBAction)botonNuRomanos:(id)sender;

@end

NS_ASSUME_NONNULL_END
