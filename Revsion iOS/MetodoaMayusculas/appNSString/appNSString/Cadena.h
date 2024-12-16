//
//  Cadena.h
//  appNSString
//
//  Created by Adriana Sofia on 18/09/24.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface Cadena : NSObject{
    

    __weak IBOutlet NSTextField *labelConver;
    __weak IBOutlet NSTextField *texto1;
    __weak IBOutlet NSTextField *label1;
    __weak IBOutlet NSTextField *labelContar;
    __weak IBOutlet NSTextField *labelMayus;
}


- (IBAction)botonContar:(NSButton *)sender;
- (IBAction)boton1:(NSButton *)sender;
- (IBAction)botonMayus:(NSButton *)sender;
- (IBAction)botonConvertir:(id)sender;
- (NSMutableString *) aMayusculas:(NSMutableString *) cadena;

@property (weak) IBOutlet NSButton *botonMayus;
@property (weak) IBOutlet NSTextField *label1propiedad;
@property (weak) IBOutlet NSButton *botonContar;
@property (weak) IBOutlet NSButton *boton1propiedad;
@property (weak) IBOutlet NSButton *botonConvertir;

@end

NS_ASSUME_NONNULL_END
