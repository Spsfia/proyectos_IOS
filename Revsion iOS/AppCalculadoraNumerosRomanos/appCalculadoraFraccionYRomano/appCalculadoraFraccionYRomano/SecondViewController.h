//
//  SecondViewController.h
//  appCalculadoraFraccionYRomano
//
//  Created by Adriana Sofia on 18/10/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SecondViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

- (IBAction)obtenerFecha:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *labelRomanos;

- (NSString *)convertirAromano:(NSInteger)numero;

@end

NS_ASSUME_NONNULL_END
