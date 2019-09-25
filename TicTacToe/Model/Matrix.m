//
//  Matrix.m
//  TicTacToe
//
//  Created by 2019-DEV-196 on 24/09/2019.
//  Copyright © 2019 2019-DEV-196. All rights reserved.
//

#import "Matrix.h"
#import "Constants.h"

@implementation Matrix {
    Symbol _matrix[9];
}

- (void)reset {
    for (int index = 0; index < NUM_CELLS; index++) {
        _matrix[index] = SymbolEmpty;
    }
}

- (Symbol)symbolByPosition:(Position) position {
    return _matrix[position];
}

- (void)setSymbol:(Symbol) symbol atPosition: (Position) position {
    _matrix[position] = symbol;
}

- (Symbol)winner {

    for (int i = 0; i< WINNING_SEQUENCES_COUNT; i++) {

        int index0 = WINNING_SEQUENCES[i][0];
        int index1 = WINNING_SEQUENCES[i][1];
        int index2 = WINNING_SEQUENCES[i][2];

        if (_matrix[index0] == _matrix[index1] &&
            _matrix[index0] == _matrix[index2] &&
            _matrix[index0] != SymbolEmpty) {
            return _matrix[index0];
        }
    }

    return SymbolEmpty;
}

- (bool)isCellEmpty:(Position) position {
    return _matrix[position] == SymbolEmpty;
}

@end
