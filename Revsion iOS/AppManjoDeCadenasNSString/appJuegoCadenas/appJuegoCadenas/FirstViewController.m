//
//  ViewController.m
//  appJuegoCadenas
//
//  Created by Adriana Sofia on 12/10/24.
//

#import "FirstViewController.h"

@implementation FirstViewController{
    NSTimer *timer;
    int contadorMilisegundos;
    NSArray *letrasAbecedario;
    NSDictionary *pistasRespuestas;
    int indiceActual;
    int tiempoMaximo;
    BOOL temporizadorEnPausa;
}

- (void)viewDidLoad {
    [self mostrarPopupReglas];
    self.botonPausa.enabled = NO;
    tiempoMaximo = 300000;
    letrasAbecedario = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z"];
       
       // Pistas
       pistasRespuestas = @{
           @"A": @"Es un transporte aéreo muy utilizado ✈️",// Avión
           @"B": @"Es una muestra de afecto entre parejas 😘💋",// Beso
           @"C": @"Es el lugar donde duermes 🛌😴", // Cama
           @"D": @"Una criatura prehistórica que ya no existe 🦖", // Dinosaurio
           @"E": @"Es un animal grande con trompa y orejas enormes 🐘 ", //Elefante
           @"F": @"Es caliente, quema y necesita oxígeno para existir 🔥", //Fuego
           @"G": @"Es un animal doméstico que maúlla y tiene bigotes 😼", //Gato
           @"H": @"Un postre frío, que viene en muchos sabores 🍦", //Helado
           @"I": @"Un pedazo de tierra rodeado por agua 🏝️🌴", //Isla
           @"J": @"Es el animal terrestre más alto del mundo 🦒 ", //Jirafa
           @"K": @"Un pequeño animal que vive en Australia y parece un oso 🐨", //Koala
           @"L": @"Es el rey de la selva y tiene una gran melena 🦁", //Leon
           @"M": @"Es una elevación natural del terreno, alta y empinada ⛰️🗻", //Montaña
           @"N": @"Cae en invierno, es blanca y fría 🌨️❄️", //Nieve
           @"O": @"Es un animal grande que hiberna durante el invierno 🧸", //Oso
           @"P": @"Es una fruta amarilla y curva, rica en potasio 🍌", //Platano
           @"Q": @"Se obtiene de la leche y puede ser blando o duro 🧀", //Queso
           @"R": @"Es una corriente natural de agua que fluye hacia el mar 🌊", //Rio
           @"S": @"Es una estrella que nos da luz y calor ☀️🥵", //Sol
           @"T": @"Es un medio de transporte que viaja sobre rieles 🚂💨💨", //Tren
           @"U": @"Una fruta redonda y pequeña, se comen 12 en año nuevo 🍇", //Uva
           @"V": @"No se ve, pero se siente cuando sopla fuerte 🌬️🍃 ", //Viento
           @"W": @"Te conecta a internet sin necesidad de cables 🛜", //WiFi
           @"X": @"Un instrumento musical que se toca golpeando barras con baquetas 🎶", //Xilofono
           @"Y": @"Es un barco lujoso utilizado para paseos 🛥️", //Yate
           @"Z": @"Se usa para proteger los pies al caminar 👞👞", //Zapato
          
       };
    indiceActual = 0;
    contadorMilisegundos = 0;
     
     [self.textfieldEntrada addTarget:self action:@selector(textfieldEntrada:) forControlEvents:UIControlEventEditingChanged];
    //Desabilito el textfield si no ha comenzado el temporalizador
    self.textfieldEntrada.enabled = NO;
    
    // Oculta el teclado
       UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
       [self.view addGestureRecognizer:tap];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
        [self mostrarPopupReglas];
}

- (void)mostrarPopupReglas {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Reglas del juego 🃏"
     message:@"1. Debes completar las palabras correctamente. \n2. Tienes un límite de tiempo de 5 minutos.\n3. Si fallas en una palabra, podrás intentarlo de nuevo hasta acertar. \n4. Escribe todas las palabras en minuscula, sin espacios y sin acentos"
     preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Entendido 👌" style:UIAlertActionStyleDefault handler:nil];
    
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}


- (void)dismissKeyboard {
    [self.view endEditing:YES];
}

- (void)mostrarSiguienteLetra {
    //Dependiendo del indice que esté, es la letra que se maneja con su pista
    if (indiceActual < letrasAbecedario.count) {
           NSString *letraActual = letrasAbecedario[indiceActual];
           self.labelLetra.text = letraActual;
           self.labelPista.text = pistasRespuestas[letraActual];
           indiceActual++;
           //contadorMilisegundos = 0; // Reinicia el contador para la nueva letra
       } else {
           // Ganó
           [self mostrarAlertaGanador];
           [timer invalidate];
           timer = nil;
       }
}

- (void)mostrarAlertaGanador {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"¡Felicidades!"
    message:@"Has completado todas las letras correctamente ¡Ganaste 🏆🥳!"
    preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *reiniciarAction = [UIAlertAction actionWithTitle:@"Reiniciar 🆕"
    style:UIAlertActionStyleDefault
    handler:^(UIAlertAction * _Nonnull action) {
    [self botonReiniciar:nil];
    }];
    
    // Acción para salir o finalizar
    UIAlertAction *salirAction = [UIAlertAction actionWithTitle:@"Salir ❌"
    style:UIAlertActionStyleCancel
    handler:nil];
    
    [alert addAction:reiniciarAction];
    [alert addAction:salirAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)iniciarTemporizador {
    if (!temporizadorEnPausa) {
            contadorMilisegundos = 0;
        }
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(contar) userInfo:nil repeats:YES];
}

- (IBAction)botonSalir:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)botonOk:(UIButton *)sender {
    NSString *textoEntrada = self.textfieldEntrada.text;
       NSString *letraActual = self.labelLetra.text;
       
       // Verifica si la palabra ingresada es correcta
       if ([letraActual isEqualToString:@"A"] && [textoEntrada.lowercaseString isEqualToString:@"avion"]) {
           // Correcto
           self.textfieldEntrada.text = @""; // Limpiar el textfield
           [self mostrarSiguienteLetra];     // Mostrar la siguiente letra
       } else if ([letraActual isEqualToString:@"B"] && [textoEntrada.lowercaseString isEqualToString:@"beso"]) {
           self.textfieldEntrada.text = @"";
           [self mostrarSiguienteLetra];
       } else if ([letraActual isEqualToString:@"C"] && [textoEntrada.lowercaseString isEqualToString:@"cama"]) {
           self.textfieldEntrada.text = @"";
           [self mostrarSiguienteLetra];
       } else if ([letraActual isEqualToString:@"D"] && [textoEntrada.lowercaseString isEqualToString:@"dinosaurio"]) {
           self.textfieldEntrada.text = @"";
           [self mostrarSiguienteLetra];
       } else if ([letraActual isEqualToString:@"E"] && [textoEntrada.lowercaseString isEqualToString:@"elefante"]) {
           self.textfieldEntrada.text = @"";
           [self mostrarSiguienteLetra];
       } else if ([letraActual isEqualToString:@"F"] && [textoEntrada.lowercaseString isEqualToString:@"fuego"]) {
           self.textfieldEntrada.text = @"";
           [self mostrarSiguienteLetra];
       } else if ([letraActual isEqualToString:@"G"] && [textoEntrada.lowercaseString isEqualToString:@"gato"]) {
           self.textfieldEntrada.text = @"";
           [self mostrarSiguienteLetra];
       } else if ([letraActual isEqualToString:@"H"] && [textoEntrada.lowercaseString isEqualToString:@"helado"]) {
           self.textfieldEntrada.text = @"";
           [self mostrarSiguienteLetra];
       } else if ([letraActual isEqualToString:@"I"] && [textoEntrada.lowercaseString isEqualToString:@"isla"]) {
           self.textfieldEntrada.text = @"";
           [self mostrarSiguienteLetra];
       } else if ([letraActual isEqualToString:@"J"] && [textoEntrada.lowercaseString isEqualToString:@"jirafa"]) {
           self.textfieldEntrada.text = @"";
           [self mostrarSiguienteLetra];
       } else if ([letraActual isEqualToString:@"K"] && [textoEntrada.lowercaseString isEqualToString:@"koala"]) {
           self.textfieldEntrada.text = @"";
           [self mostrarSiguienteLetra];
       } else if ([letraActual isEqualToString:@"L"] && [textoEntrada.lowercaseString isEqualToString:@"leon"]) {
           self.textfieldEntrada.text = @"";
           [self mostrarSiguienteLetra];
       } else if ([letraActual isEqualToString:@"M"] && [textoEntrada.lowercaseString isEqualToString:@"montaña"]) {
           self.textfieldEntrada.text = @"";
           [self mostrarSiguienteLetra];
       } else if ([letraActual isEqualToString:@"N"] && [textoEntrada.lowercaseString isEqualToString:@"nieve"]) {
           self.textfieldEntrada.text = @"";
           [self mostrarSiguienteLetra];
       } else if ([letraActual isEqualToString:@"O"] && [textoEntrada.lowercaseString isEqualToString:@"oso"]) {
           self.textfieldEntrada.text = @"";
           [self mostrarSiguienteLetra];
       } else if ([letraActual isEqualToString:@"P"] && [textoEntrada.lowercaseString isEqualToString:@"platano"]) {
           self.textfieldEntrada.text = @"";
           [self mostrarSiguienteLetra];
       } else if ([letraActual isEqualToString:@"Q"] && [textoEntrada.lowercaseString isEqualToString:@"queso"]) {
           self.textfieldEntrada.text = @"";
           [self mostrarSiguienteLetra];
       } else if ([letraActual isEqualToString:@"R"] && [textoEntrada.lowercaseString isEqualToString:@"rio"]) {
           self.textfieldEntrada.text = @"";
           [self mostrarSiguienteLetra];
       } else if ([letraActual isEqualToString:@"S"] && [textoEntrada.lowercaseString isEqualToString:@"sol"]) {
           self.textfieldEntrada.text = @"";
           [self mostrarSiguienteLetra];
       } else if ([letraActual isEqualToString:@"T"] && [textoEntrada.lowercaseString isEqualToString:@"tren"]) {
           self.textfieldEntrada.text = @"";
           [self mostrarSiguienteLetra];
       } else if ([letraActual isEqualToString:@"U"] && [textoEntrada.lowercaseString isEqualToString:@"uva"]) {
           self.textfieldEntrada.text = @"";
           [self mostrarSiguienteLetra];
       } else if ([letraActual isEqualToString:@"V"] && [textoEntrada.lowercaseString isEqualToString:@"viento"]) {
           self.textfieldEntrada.text = @"";
           [self mostrarSiguienteLetra];
       } else if ([letraActual isEqualToString:@"W"] && [textoEntrada.lowercaseString isEqualToString:@"wifi"]) {
           self.textfieldEntrada.text = @"";
           [self mostrarSiguienteLetra];
       } else if ([letraActual isEqualToString:@"X"] && [textoEntrada.lowercaseString isEqualToString:@"xilofono"]) {
           self.textfieldEntrada.text = @"";
           [self mostrarSiguienteLetra];
       } else if ([letraActual isEqualToString:@"Y"] && [textoEntrada.lowercaseString isEqualToString:@"yate"]) {
           self.textfieldEntrada.text = @"";
           [self mostrarSiguienteLetra];
       } else if ([letraActual isEqualToString:@"Z"] && [textoEntrada.lowercaseString isEqualToString:@"zapato"]) {
           self.textfieldEntrada.text = @"";
           [self mostrarSiguienteLetra];
       } else {
           // Mostrar popup si la respuesta es incorrecta
           [self mostrarAlertaIncorrecto];
       }
}

- (IBAction)textfieldEntrada:(UITextField *)sender {

    
}


- (void)mostrarAlertaIncorrecto {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Respuesta Incorrecta"
    message:@"No es correcto, inténtalo de nuevo ❌😩"
    preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
    style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
    self.textfieldEntrada.text = @"";
    
}

- (IBAction)botonReiniciar:(UIButton *)sender {
      self.botonPausa.enabled = NO;
      contadorMilisegundos = 0;
      self.labelContador.text = @"00:00.000";
      
      indiceActual = 0;
      [self mostrarSiguienteLetra];
      
      if (timer != nil) {
          [timer invalidate];
          timer = nil;
      }
    
    self.textfieldEntrada.text = @"";
    _labelLetra.text =@"Letra";
    _labelPista.text =@"Pista 👀";
}

- (IBAction)botonPausa:(UIButton *)sender {
    if (timer != nil) {
           [timer invalidate];
           timer = nil;
           temporizadorEnPausa = YES;
           [sender setTitle:@"Continuar" forState:UIControlStateNormal];
       } else {
           [self iniciarTemporizador];
           temporizadorEnPausa = NO;
           [sender setTitle:@"Pausa" forState:UIControlStateNormal];
       }
}

-(void)contar {
    contadorMilisegundos += 10; // Incrementa 10 ms
        int minutos = (contadorMilisegundos / 60000);
        int segundos = (contadorMilisegundos / 1000) % 60;
        int milisegundos = contadorMilisegundos % 1000;
        
        self.labelContador.text = [NSString stringWithFormat:@"%02d:%02d.%03d", minutos, segundos, milisegundos];
        
        
        if (contadorMilisegundos >= tiempoMaximo) {
            [self mostrarAlertaPerdedor];
            [timer invalidate];
            timer = nil;
            return;
        }
}

- (void)mostrarAlertaPerdedor {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"¡Tiempo agotado! ⌛️😥"
    message:@"¡Perdiste!"
    preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *reiniciarAction = [UIAlertAction actionWithTitle:@"Reiniciar 😩"
    style:UIAlertActionStyleDefault
    handler:^(UIAlertAction * _Nonnull action) {
    [self botonReiniciar:nil];
    }];
    
    UIAlertAction *salirAction = [UIAlertAction actionWithTitle:@"Salir ❌"
    style:UIAlertActionStyleCancel
    handler:nil];
    
    [alert addAction:reiniciarAction];
    [alert addAction:salirAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)botonComenzar:(UIButton *)sender {
    self.botonPausa.enabled = YES;
    self->indiceActual = 0;
    if (timer == nil) {
           [self iniciarTemporizador];
       }
       [self mostrarSiguienteLetra];
       
       self.textfieldEntrada.enabled = YES;
}



@end

