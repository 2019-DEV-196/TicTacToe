//
//  Matrix.h
//  TicTacToe
//
//  Created by 2019-DEV-196 on 24/09/2019.
//  Copyright © 2019 2019-DEV-196. All rights reserved.
//

@import Foundation;

#import "Symbol.h"
#import "Position.h"

@interface Matrix : NSObject

- (void)reset;
- (void)setSymbol:(Symbol) symbol atPosition: (Position) position;
- (Symbol)symbolByPosition:(Position) position;
- (bool)isCellEmpty:(Position) position;
- (Symbol)winner;

@end

