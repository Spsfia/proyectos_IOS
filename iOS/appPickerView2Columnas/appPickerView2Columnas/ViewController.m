//
//  ViewController.m
//  appPickerView2Columnas
//
//  Created by Adriana Sofia on 22/10/24.
//

#import "ViewController.h"

@interface ViewController (){
    NSArray *productos;
    NSArray *colores;
    NSArray *vistas;
   
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    productos = @[@"Pantalla LCD", @"iPad", @"Bicicleta",@"Motocicleta",@"Carro", @"Camioneta"];
    
    colores = @[@"Rojo ❤️", @"Azul 💙", @"Verde 💚", @"Rosa 🩷", @"Amarillo💛", @"Morado💜", @"Naranja 🧡", @"Gris 🩶", @"Aleatorio 🌈"];
    vistas = @[@"Normal view",@"Top",@"Bottom",@"Left",@"Right",@"Top Left",@"Top Right",@"Bottom Right",@"Bottom Left"];
    _pickerView1.delegate = self;
    _pickerView1.dataSource = self;
    
    _label1.text = [NSString stringWithFormat:@"%@ , %@",[productos objectAtIndex:0], [colores objectAtIndex:0]];
    
    //_label1.text = [NSString stringWithFormat:@"%@ , %@", productos[_pickerView1 selectedR ]];
    
    _imageView1.image = [UIImage imageNamed: @"PantallaLCD"];
    
    UIColor *color = [UIColor colorWithRed:20 green:55 blue:50 alpha:1.0];
    
    self.view.backgroundColor = color;
    
    NSLog(@"%@", _label1.text);
}




- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0){
        return productos.count;
    }else{
        return colores.count;
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(component == 0){
        return [productos objectAtIndex:row];
    }else if (component == 1){
        return [colores objectAtIndex:row];
    }else if (component == 2){
        return [vistas objectAtIndex:row];
    }
    return 0;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    _label1.text =  [NSString stringWithFormat:@"%@ , %@", [productos objectAtIndex:[_pickerView1 selectedRowInComponent:0]], [colores objectAtIndex:[_pickerView1 selectedRowInComponent:1]]];
    //[productos objectAtIndex:0];
    
    unsigned long int color = [colores indexOfObject:[colores objectAtIndex:[_pickerView1 selectedRowInComponent:1]]];
    
    switch (color) {
        case 0:
            self.imageView1.backgroundColor = [UIColor redColor];
            break;
        case 1:
            self.imageView1.backgroundColor = [UIColor blueColor];
            break;
        case 2:
            self.imageView1.backgroundColor = [UIColor greenColor];
            break;
        case 3:
            self.imageView1.backgroundColor = [UIColor systemPinkColor];
            break;
        case 4:
            self.imageView1.backgroundColor = [UIColor yellowColor];
            break;
        case 5:
            self.imageView1.backgroundColor = [UIColor purpleColor];
            break;
        case 6:
            self.imageView1.backgroundColor = [UIColor orangeColor];
            break;
        case 7:
            self.imageView1.backgroundColor = [UIColor grayColor];
            break;
        case 8:
            srand((unsigned)time(NULL));
            UIColor *randomColor = [UIColor colorWithRed:(rand()%255/255.) green:(rand()%255/255.) blue:(rand()%255/255.) alpha:1.0];
               self.imageView1.backgroundColor = randomColor;
               break;
        
    }
    
    unsigned long int producto = [productos indexOfObject:[productos objectAtIndex:[_pickerView1 selectedRowInComponent:0]]];
    switch (producto) {
        case 0:
            self.imageView1.image = [UIImage imageNamed:@"PantallaLCD"];
            break;
        case 1:
            self.imageView1.image = [UIImage imageNamed:@"ipad"];
            break;
        case 2:
            self.imageView1.image = [UIImage imageNamed:@"bici_2"];
            break;
        case 3:
            self.imageView1.image = [UIImage imageNamed:@"moto1"];
            break;
        case 4:
            self.imageView1.image = [UIImage imageNamed:@"carro1"];
            break;
        case 5:
            self.imageView1.image = [UIImage imageNamed:@"camioneta1"];
           // self.imageView1.image = [UIViewContentModeScaleAspectFit ]
            break;
       
    }
    
    unsigned long int vista = [vistas indexOfObject:[vistas objectAtIndex:[_pickerView1 selectedRowInComponent:2]]];
    switch (vista) {
        case 0:
            [_imageView1 setContentMode:UIViewContentModeScaleAspectFit];
            break;
        case 1:
            [_imageView1 setContentMode:UIViewContentModeTop];
            break;
        case 2:
            [_imageView1 setContentMode:UIViewContentModeBottom];
            break;
        case 3:
            [_imageView1 setContentMode:UIViewContentModeLeft];
            break;
        case 4:
            [_imageView1 setContentMode:UIViewContentModeRight];
            break;
        case 5:
            [_imageView1 setContentMode:UIViewContentModeTopLeft];
            break;
        case 6:
            [_imageView1 setContentMode:UIViewContentModeTopRight];
            break;
        case 7:
            [_imageView1 setContentMode:UIViewContentModeBottomLeft];
            break;
        case 8:
            [_imageView1 setContentMode:UIViewContentModeBottomRight];
            break;
       
    }
}


@end
