//
//  SecondViewController.m
//  appJuegoCadenas
//
//  Created by Adriana Sofia on 20/10/24.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textViewTexto.text = @"gato, mesa, elefante, árbol, perro, carro, león, computadora, jirafa, avión, casa, serpiente, lámpara, tigre, bicicleta, delfín, televisor, rana, alfombra, caballo";
    
    [self mostrarPopupReglas];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)botonInformacion:(id)sender {
    UIAlertController *felicitacionAlert = [UIAlertController alertControllerWithTitle:@"Ejemplos de expresiones regulares"
        message:@"1. \b[aeiouAEIOU]\w*: Encuentra palabras que empiezan con vocales.\n"
        "2.  \w*[aeiouAEIOU]\b: Encuentra palabras que terminan con vocales.\n"
         "3. (gato|perro|león|elefante|jirafa): Encuentra animales específicos.\n"
         "4. c\w*: Encuentra palabras que empiezan con 'c'."
        preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Si que si" style:UIAlertActionStyleDefault handler:nil];

    [felicitacionAlert addAction:okAction];
    [self presentViewController:felicitacionAlert animated:YES completion:nil];
    //(gato|perro|león|elefante|jirafa)
    //c\w* palabras que empiezan con c
}

- (IBAction)botonBuscar:(id)sender {
    NSString *palabrasTexto = self.textViewTexto.text;
        NSString *patronRegex = self.textFieldRegEx.text;
            
        if (patronRegex.length == 0) {
            self.labelResultado.text = @"Por favor ingresa un patrón regex.";
            return;
        }
        
        NSError *error = nil;
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:patronRegex options:0 error:&error];

        if (error) {
            self.labelResultado.text = @"El patrón regex no es válido.";
            return;
        }

        // Buscar coincidencias en la lista de palabras
        NSArray *matches = [regex matchesInString:palabrasTexto options:0 range:NSMakeRange(0, palabrasTexto.length)];
        
        if (matches.count == 0) {
            self.labelResultado.text = @"No se encontraron coincidencias.";
            return;
        }

        NSMutableString *resultados = [NSMutableString stringWithString:@"Palabras encontradas: "];
        NSArray *animales = @[@"gato", @"elefante", @"perro", @"león", @"jirafa", @"serpiente", @"tigre", @"delfín", @"rana", @"caballo"];

        BOOL seEncontraronAnimales = NO;
        for (NSTextCheckingResult *match in matches) {
            NSRange matchRange = [match range];
            NSString *palabraEncontrada = [palabrasTexto substringWithRange:matchRange];
            [resultados appendString:palabraEncontrada];
            [resultados appendString:@" |"];
            
            if ([animales containsObject:palabraEncontrada]) {
                seEncontraronAnimales = YES;
            }
        }

        self.labelResultado.text = resultados;

        if (seEncontraronAnimales) {
            [self mostrarMensajeFelicitaciones];
        }
}


- (void)mostrarMensajeFelicitaciones {
    UIAlertController *felicitacionAlert = [UIAlertController alertControllerWithTitle:@"¡Felicidades!"
        message:@"¡Has encontrado animales en la lista! Sigue adelante para salvar a todos."
        preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Si que si" style:UIAlertActionStyleDefault handler:nil];

    [felicitacionAlert addAction:okAction];
    [self presentViewController:felicitacionAlert animated:YES completion:nil];
}
- (void)mostrarPopupReglas {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"¡Los animales están en peligro!"
     message:@" Ayuda a salvarlos resolviendo. Usa tu habilidad para descubrirlos antes de que sea demasiado tarde. ¡Solo tú puedes ayudarlos a escapar de los apuros!"
     preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Yastas 😎" style:UIAlertActionStyleDefault handler:nil];
    
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}


- (IBAction)botonSalir:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
