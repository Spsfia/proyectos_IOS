//
//  ViewController.m
//  appTienda
//
//  Created by Adriana Sofia on 27/10/24.
//

#import "InicioViewController.h"

@interface InicioViewController ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) NSArray *imagenes;
@property (nonatomic, assign) NSInteger indiceActual;

@end

@implementation InicioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Inicializamos el índice y las imágenes
       self.indiceActual = 0;
       self.imagenes = @[
           [UIImage imageNamed:@"areteperla"],
           [UIImage imageNamed:@"grito"],
           [UIImage imageNamed:@"guernica"],
           [UIImage imageNamed:@"kiss"],
           [UIImage imageNamed:@"meninas"],
           [UIImage imageNamed:@"nenufares"],
           [UIImage imageNamed:@"starrynight"],
           [UIImage imageNamed:@"tiempo"],
           [UIImage imageNamed:@"tink"],
           [UIImage imageNamed:@"venus"]

       ];
    self.imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
     self.imageView.contentMode = UIViewContentModeScaleAspectFit;
       self.imageView.image = self.imagenes[self.indiceActual];
       [self.view addSubview:self.imageView];

       [NSTimer scheduledTimerWithTimeInterval:3.0
                                        target:self
                                      selector:@selector(cambiarImagen)
                                      userInfo:nil
                                       repeats:YES];
   }

   - (void)cambiarImagen {
       // Actualizamos el índice de la siguiente imagen
       self.indiceActual = (self.indiceActual + 1) % self.imagenes.count;
       
       [UIView transitionWithView:self.imageView
                         duration:1.0
                          options:UIViewAnimationOptionTransitionCrossDissolve
                       animations:^{
                           self.imageView.image = self.imagenes[self.indiceActual];
                       }
                       completion:nil];
}


@end
