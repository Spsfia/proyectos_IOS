//
//  SecondViewController.h
//  appJuegoCadenas
//
//  Created by Adriana Sofia on 20/10/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SecondViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *textViewTexto;
@property (weak, nonatomic) IBOutlet UITextField *textFieldRegEx;
@property (weak, nonatomic) IBOutlet UILabel *labelResultado;
- (IBAction)botonBuscar:(id)sender;
- (IBAction)botonInformacion:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *botonSalir;
- (IBAction)botonSalir:(id)sender;

@end

NS_ASSUME_NONNULL_END
