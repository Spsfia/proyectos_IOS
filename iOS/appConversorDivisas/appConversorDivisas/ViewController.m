//
//  ViewController.m
//  appConversorDivisas
//
//  Created by Adriana Sofia on 21/10/24.
//

#import "ViewController.h"

@interface ViewController (){
    NSArray *divisasPaises;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    divisasPaises = @[ @"🇪🇺 EUR", @"🇬🇧 GBP", @"🇺🇸 USD", @"🇮🇳 INR", @"🇨🇦 CAD", @"🇦🇺 AUD", @"🇨🇭 CHF", @"🇲🇽 MXN",@"🇦🇪 AED", @"🇦🇷 ARS", @"🇯🇵 JPY", @"🇰🇷 KRW", @"🇧🇷 BRL", @"🇿🇦 ZAR", @"🇳🇴 NOK", @"🇸🇪 SEK", @"🇳🇿 NZD", @"🇨🇱 CLP", @"🇨🇳 CNY", @"🇵🇭 PHP", @"🇸🇬 SGD", @"🇹🇭 THB", @"🇪🇬 EGP", @"🇹🇷 TRY",@"🇭🇰 HKD", @"🇵🇰 PKR", @"🇵🇱 PLN", @"🇷🇺 RUB", @"🇸🇦 SAR", @"🇺🇦 UAH", @"🇻🇪 VES", @"🇻🇳 VND"];
    
    _tipoDeCambios = [[NSArray alloc] initWithObjects:
        [NSNumber numberWithFloat:1.09], [NSNumber numberWithFloat:1.30], [NSNumber numberWithFloat:1.00], [NSNumber numberWithFloat:0.013],
        [NSNumber numberWithFloat:0.75], [NSNumber numberWithFloat:0.64], [NSNumber numberWithFloat:1.08], [NSNumber numberWithFloat:0.057],
        [NSNumber numberWithFloat:0.27], [NSNumber numberWithFloat:0.0027], [NSNumber numberWithFloat:0.0067], [NSNumber numberWithFloat:0.00074],
        [NSNumber numberWithFloat:0.20], [NSNumber numberWithFloat:0.053], [NSNumber numberWithFloat:0.089], [NSNumber numberWithFloat:0.093],
        [NSNumber numberWithFloat:0.59], [NSNumber numberWithFloat:0.0013], [NSNumber numberWithFloat:0.14], [NSNumber numberWithFloat:0.018],
        [NSNumber numberWithFloat:0.73], [NSNumber numberWithFloat:0.028], [NSNumber numberWithFloat:0.032], [NSNumber numberWithFloat:0.036],
        [NSNumber numberWithFloat:0.13], [NSNumber numberWithFloat:0.0036], [NSNumber numberWithFloat:0.22], [NSNumber numberWithFloat:0.010],
        [NSNumber numberWithFloat:0.27], [NSNumber numberWithFloat:0.027], [NSNumber numberWithFloat:0.00045], [NSNumber numberWithFloat:0.000041],
    nil];
    
    
    _tipoDeCambiosPesos = [[NSArray alloc] initWithObjects:
        [NSNumber numberWithFloat:21.86], [NSNumber numberWithFloat:26.04], [NSNumber numberWithFloat:18.89], [NSNumber numberWithFloat:0.25],
        [NSNumber numberWithFloat:14.29], [NSNumber numberWithFloat:12.00], [NSNumber numberWithFloat:20.39], [NSNumber numberWithFloat:1.00],
        [NSNumber numberWithFloat:5.09], [NSNumber numberWithFloat:0.050], [NSNumber numberWithFloat:0.13], [NSNumber numberWithFloat:0.014],
        [NSNumber numberWithFloat:3.76], [NSNumber numberWithFloat:0.98], [NSNumber numberWithFloat:1.63], [NSNumber numberWithFloat:1.70],
        [NSNumber numberWithFloat:10.81], [NSNumber numberWithFloat:0.023], [NSNumber numberWithFloat:2.60], [NSNumber numberWithFloat:0.33],
        [NSNumber numberWithFloat:13.63], [NSNumber numberWithFloat:0.53], [NSNumber numberWithFloat:0.60], [NSNumber numberWithFloat:0.68],
        [NSNumber numberWithFloat:2.45], [NSNumber numberWithFloat:0.068], [NSNumber numberWithFloat:4.13], [NSNumber numberWithFloat:0.19],
        [NSNumber numberWithFloat:5.09], [NSNumber numberWithFloat:0.50], [NSNumber numberWithFloat:0.0084], [NSNumber numberWithFloat:0.00077],
    nil];
    
    self.pickerDivisasPaises.dataSource = self;
    self.pickerDivisasPaises.delegate = self;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [divisasPaises count];
}


//Pesos o dólares

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    float valorEnDolares = [[_tipoDeCambios objectAtIndex:row] floatValue];
    float valorEnPesos = [[_tipoDeCambiosPesos objectAtIndex:row] floatValue];
    float cantidad = [_textoEntrada.text floatValue];
    
    // Ejemplo: Multiplicando cantidad por tipo de cambio
    float resultadoDolares = cantidad * valorEnDolares;
    float resultadoPesos = cantidad * valorEnPesos;
    
    NSString *resultString = [[NSString alloc] initWithFormat:@"%.2f USD = %.2f %@\n%.2f MXN = %.2f %@",
                              cantidad, resultadoDolares, [divisasPaises objectAtIndex:row],
                              cantidad, resultadoPesos, [divisasPaises objectAtIndex:row]];
    _labelResultado.text = resultString;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return divisasPaises[row];
}




@end
