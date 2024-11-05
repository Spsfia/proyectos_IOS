//
//  ProductosViewController.h
//  appTienda
//
//  Created by Adriana Sofia on 27/10/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProductosViewController : UIViewController  <UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *items;
@end

NS_ASSUME_NONNULL_END
