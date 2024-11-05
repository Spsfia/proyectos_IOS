//
//  DetallesViewController.m
//  appTienda
//
//  Created by Adriana Sofia on 28/10/24.
//

#import "DetallesViewController.h"

@interface DetallesViewController ()

@end

@implementation DetallesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Configura la vista con los detalles del ítem
        self.view.backgroundColor = [UIColor whiteColor];
        
        // Ejemplo de cómo mostrar los datos en etiquetas
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, self.view.bounds.size.width - 40, 30)];
        titleLabel.text = self.itemDetails[@"title"];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont boldSystemFontOfSize:24];
        [self.view addSubview:titleLabel];
        
        UILabel *sizeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 150, self.view.bounds.size.width - 40, 20)];
        sizeLabel.text = [NSString stringWithFormat:@"Size: %@", self.itemDetails[@"size"]];
        sizeLabel.textAlignment = NSTextAlignmentCenter;
        sizeLabel.font = [UIFont systemFontOfSize:18];
        [self.view addSubview:sizeLabel];
        
        UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 200, self.view.bounds.size.width - 40, 20)];
        priceLabel.text = [NSString stringWithFormat:@"Price: %@", self.itemDetails[@"price"]];
        priceLabel.textAlignment = NSTextAlignmentCenter;
        priceLabel.font = [UIFont systemFontOfSize:18];
        [self.view addSubview:priceLabel];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.bounds.size.width - 200) / 2, 250, 200, 200)];
        imageView.image = [UIImage imageNamed:self.itemDetails[@"image"]];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.view addSubview:imageView];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
