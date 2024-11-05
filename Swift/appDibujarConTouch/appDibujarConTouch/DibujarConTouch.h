//
//  DibujarConTouch.h
//  appDibujarConTouch
//
//  Created by Guest User on 30/10/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DibujarConTouch : UIView
- (IBAction)btnBorrar:(UIButton *)sender;

@property (nonatomic, strong) UIColor *selectedColor;
@property (strong, nonatomic) IBOutlet UIImageView *imageView1;

- (IBAction)btnLetras:(id)sender;


@end

NS_ASSUME_NONNULL_END
