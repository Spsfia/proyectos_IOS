//
//  Canvas.h
//  appGraficos1
//
//  Created by Adriana Sofia on 27/09/24.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface Canvas : NSView
-(NSPoint) randomPoint;
-(void)drawRect:(NSRect)dirtyRect;
-(void) estrella;
-(void) dibujaLinea;
-(void) dibujaPoligono;
-(void) dibujaflor;

@end

NS_ASSUME_NONNULL_END
