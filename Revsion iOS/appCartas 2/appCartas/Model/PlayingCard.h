//
//  PlayingCard.h
//  appCartas
//
//  Created by Adriana Sofia on 24/11/24.
//

#import <Foundation/Foundation.h>
#import "Card.h"

NS_ASSUME_NONNULL_BEGIN

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+(NSArray *) validSuits;
+(NSUInteger)maxRank;

@end

NS_ASSUME_NONNULL_END
