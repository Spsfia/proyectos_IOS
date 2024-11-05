//
//  ViewController.h
//  appGraficosiOS
//
//  Created by Adriana Sofia on 25/10/24.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)tfx1:(id)sender;
- (IBAction)tfy1:(id)sender;
- (IBAction)tfx2:(id)sender;
- (IBAction)tfy2:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *tfx1;
@property (strong, nonatomic) IBOutlet UITextField *tfy1;
@property (strong, nonatomic) IBOutlet UITextField *tfx2;
@property (strong, nonatomic) IBOutlet UITextField *tfy2;


- (IBAction)botonLinea:(id)sender;

@end

