//
//  Deck.m
//  appCartas
//
//  Created by Adriana Sofia on 24/11/24.
//

#import "Deck.h"

@interface Deck()
@property (strong, nonatomic) NSMutableArray*cards;// de Card
@end

@implementation Deck

-(NSMutableArray *) cards{
    if(!_cards)
        _cards = [[NSMutableArray alloc]init];
    return _cards;
}

-(void)addCard:(Card *)card atTop:(BOOL)atTop{
    if(atTop){
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}

-(void) addCard:(Card *)card{
    [self.cards addObject:card];
}

-(Card *)drawRandomCard{
    Card *randomCard = nil;
    if([self.cards count]){
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;  
}

@end
