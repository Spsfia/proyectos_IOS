//
//  ViewController.h
//  appConversorDivisas
//
//  Created by Adriana Sofia on 21/10/24.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *textoEntrada;
@property (weak, nonatomic) IBOutlet UILabel *labelResultado;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerDivisasPaises;
@property (strong, nonatomic) NSArray *tipoDeCambios;
@property (strong, nonatomic) NSArray *tipoDeCambiosPesos;


@end

