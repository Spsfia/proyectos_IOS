//
//  ProductosViewController.m
//  appTienda
//
//  Created by Adriana Sofia on 27/10/24.
//

#import "ProductosViewController.h"
#import "DetallesViewController.h"


@interface ProductosViewController ()

@end

@implementation ProductosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Configuración de layout para UICollectionView
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(100, 150); // Ajusta el tamaño de la celda
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        
        // Inicializa el UICollectionView
        self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
        [self.view addSubview:self.collectionView];
        
        // Carga tus datos
        [self loadData];
    
}

- (void)loadData {
    // Aquí puedes cargar los datos de los artículos (nombre, precio, imagen, etc.)
    self.items = @[
        @{@"title": @"El grito", @"price": @"$190,000", @"size": @"91 cm × 74 cm", @"image": @"grito"},
        @{@"title": @"El nacimiento de Venus", @"price": @"$300,000", @"size": @"1,72 m x 2,78 m", @"image": @"venus"},
        @{@"title": @"La joven de la perla", @"price": @"$500,000", @"size": @"46,5 × 40 cm", @"image": @"areteperla"},
        @{@"title": @"La Gioconda", @"price": @"$1,000,000", @"size": @"79 cm × 53 cm", @"image": @"gioconda"},
        @{@"title": @"Guernica", @"price": @"$2,500,000", @"size": @"776,6 cm × 349,3 cm", @"image": @"guernica"},
        @{@"title": @"El beso", @"price": @"$900,000", @"size": @"180 cm × 180 cm", @"image": @"kiss"},
        @{@"title": @"Las meninas", @"price": @"$1,950,000", @"size": @"320,5 cm × 281,5 cm", @"image": @"meninas"},
        @{@"title": @"Los nenúfares", @"price": @"$8,000,000", @"size": @"219 cm × 602", @"image": @"nenufares"},
        @{@"title": @"La noche estrellada", @"price": @"$100,000,000", @"size": @"73,7 cm × 92,1 cm", @"image": @"starrynight"},
        @{@"title": @"La persistencia de la memoria", @"price": @"$100,000", @"size": @"24cm × 33cm", @"image": @"tiempo"},
        @{@"title": @"La creación de Adán", @"price": @"No adquirible", @"size": @"280 cm × 570 cm", @"image": @"tink"},
        @{@"title": @"El astrónomo", @"price": @"$900,000", @"size": @"51 cm × 45 cm", @"image": @"Johannes_Vermeer_-_The_Astronomer_-_1668"},
        @{@"title": @"La gran ola de Kanagawa", @"price": @"$5,000,000", @"size": @"25 cm × 37 cm", @"image": @"ola"},
        @{@"title": @"La siesta", @"price": @"$9,000,000", @"size": @"73 cm × 91 cm", @"image": @"siesta"},
        @{@"title": @"Noctámbulos", @"price": @"$100,000", @"size": @"84,1 × 152,4 cm", @"image": @"Noctambulos"}
    ];
    [self.collectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    NSDictionary *item = self.items[indexPath.row];
    
    // Elimina las vistas anteriores para evitar duplicación
    for (UIView *subview in cell.contentView.subviews) {
        [subview removeFromSuperview];
    }

    // Configuración de la imagen
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, cell.bounds.size.width, cell.bounds.size.height - 70)];
    imageView.image = [UIImage imageNamed:item[@"image"]];
    imageView.clipsToBounds = YES;
    [cell.contentView addSubview:imageView];
    
    // Configuración del título con ajuste de texto
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, cell.bounds.size.height - 70, cell.bounds.size.width, 30)];
    titleLabel.text = item[@"title"];
    titleLabel.font = [UIFont systemFontOfSize:12];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.clipsToBounds = YES;
    titleLabel.numberOfLines = 0; // Permitir múltiples líneas
    [cell.contentView addSubview:titleLabel];
    
    // Configuración del tamaño
    UILabel *sizeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, cell.bounds.size.height - 40, cell.bounds.size.width, 20)];
    sizeLabel.text = item[@"size"]; // Asegúrate de que "size" esté en el diccionario
    sizeLabel.font = [UIFont systemFontOfSize:12];
    sizeLabel.textAlignment = NSTextAlignmentCenter;
    sizeLabel.clipsToBounds = YES;
    [cell.contentView addSubview:sizeLabel];
    
    // Configuración del precio
    UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, cell.bounds.size.height - 20, cell.bounds.size.width, 20)];
    priceLabel.text = item[@"price"];
    priceLabel.font = [UIFont boldSystemFontOfSize:12];
    priceLabel.textAlignment = NSTextAlignmentCenter;
    priceLabel.clipsToBounds = YES;
    [cell.contentView addSubview:priceLabel];
    
    return cell;
}

// Implementación de didSelectItemAtIndexPath
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    // Obtén los detalles del elemento seleccionado
    NSDictionary *item = self.items[indexPath.row];
    
    // Inicializa el DetallesViewController
    DetallesViewController *detallesVC = [[DetallesViewController alloc] init];
    
    // Pasa los detalles del ítem al controlador de detalles
    detallesVC.itemDetails = item;
    
    // Muestra el controlador de detalles
    [self.navigationController pushViewController:detallesVC animated:YES];
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
