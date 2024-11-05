//
//  ViewController.m
//  appJuego1Carta
//
//  Created by Adriana Sofia on 01/11/24.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipLabel;

@property (nonatomic) int flipCount;

//@property (strong, nonatomic) Deck *deck;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
}


-(void) setFlipCount: (int) flipCount{
    flipCount = _flipCount;
    _flipLabel.text = [NSString stringWithFormat:@"Flips: %d", _flipCount];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage: [UIImage imageNamed:@"Back-card-itl_tree"] forState: UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else{
        [sender setBackgroundImage:[UIImage imageNamed:@"Blank-card-hd"] forState:UIControlStateNormal];
        [sender setTitle:@"A♣️" forState:UIControlStateNormal];
    }
    [self setFlipCount: _flipCount++];
}

@end
