//
//  ViewController.m
//  appCartas
//
//  Created by Adriana Sofia on 24/11/24.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
//@property (nonatomic) int flipCount;
//@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (nonatomic) NSInteger lives; // Nueva propiedad para las vidas
    


@property (nonatomic) int index;
@end

@implementation ViewController

/*- (Deck *) deck {
    
    if(!_deck)
        _deck = [self createDeck];
    
    return _deck;
}*/

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lives = 5; // Inicializamos con 5 vidas
    [self updateLivesLabel];
}

- (void)updateLivesLabel {
    self.livesLabel.text = [NSString stringWithFormat:@"Vidas: %ld", (long)self.lives];
}



- (CardMatchingGame *) game {
    
    if(!_game)
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    
    return _game;
}

- (Deck *) createDeck {
    
    return [[PlayingCardDeck alloc] init];
}

/*- (void) setFlipCount:(int)flipCount {
    
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}*/

- (IBAction)btnCarta:(UIButton *)sender {
    NSInteger chosenButtonIndex = [self.cardButtons indexOfObject:sender];
       NSInteger previousScore = self.game.score; // Guardamos el puntaje anterior

       [self.game chooseCardAtIndex:chosenButtonIndex];
       [self updateUI];
       
       // Verificamos si hubo penalización
       if (self.game.score < previousScore) {
           self.lives--; // Perdemos una vida
           [self updateLivesLabel];
           
           // Si las vidas llegan a 0, termina el juego
           if (self.lives <= 0) {
               [self endGame];
           }
       }
}

- (void)endGame {
    for (UIButton *cardButton in self.cardButtons) {
        cardButton.enabled = NO; // Deshabilitamos todas las cartas
    }
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Perdiste 😔"
                                                                   message:@"Ya no tienes vidas"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *restartAction = [UIAlertAction actionWithTitle:@"Comenzar de nuevo"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * _Nonnull action) {
        [self restartGame];
    }];
    [alert addAction:restartAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)restartGame {
    self.lives = 5; // Reiniciamos las vidas
       [self updateLivesLabel];
       
       // Reinicia el juego creando un nuevo objeto CardMatchingGame
       self.game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                    usingDeck:[self createDeck]];
       [self updateUI];
}


- (void) updateUI {
    
    BOOL allCardsMatched = YES; // Asumimos que todas las cartas están emparejadas
       
       for (UIButton *cardButton in self.cardButtons) {
           NSInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
           Card *card = [self.game cardAtIndex:cardButtonIndex];
           [cardButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
           [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
           [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
           
           cardButton.enabled = !card.isMatched;
           if (!card.isMatched) {
               allCardsMatched = NO; // Si alguna carta no está emparejada, el jugador aún no gana
           }
       }
       
       self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", self.game.score];
       
       if (allCardsMatched) {
           [self handleVictory]; // Llamamos al método para manejar la victoria
       }
}

- (void)handleVictory {
    for (UIButton *cardButton in self.cardButtons) {
        cardButton.enabled = NO; // Deshabilitamos las cartas
    }
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Ganasteee!!!"
                                                                   message:@"Felicidades! Completaste todas las parejas!"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *restartAction = [UIAlertAction actionWithTitle:@"Jugar de nuevo"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * _Nonnull action) {
        [self restartGame];
    }];
    [alert addAction:restartAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (NSString *) titleForCard:(Card *) card {
    
    return card.isChosen ? card.contents : @"";
}

- (UIImage *) backgroundImageForCard:(Card *) card {
    
    return [UIImage imageNamed:card.isChosen ? @"frentehd" : @"back"];
}
@end
