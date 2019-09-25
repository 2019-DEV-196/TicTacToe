//
//  Logic.h
//  TicTacToe
//
//  Created by 2019-DEV-196 on 24/09/2019.
//  Copyright © 2019 2019-DEV-196. All rights reserved.
//

@import Foundation;

#import "GameStatus.h"
#import "Position.h"
#import "Symbol.h"

@interface Logic : NSObject

- (void)resetGame;
- (BOOL)addSymbol:(Symbol) symbol
       toPosition:(Position) position
        withError:(NSError **) error;
- (GameStatus)gameStatus;
- (Symbol)symbolByPosition:(Position) position;
- (Symbol)currentTurn;

@end
