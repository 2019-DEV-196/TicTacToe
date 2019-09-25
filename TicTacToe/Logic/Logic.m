//
//  Logic.m
//  TicTacToe
//
//  Created by 2019-DEV-196 on 24/09/2019.
//  Copyright © 2019 2019-DEV-196. All rights reserved.
//

@import Foundation;

#import "Logic.h"
#import "Matrix.h"
#import "Constants.h"

@implementation Logic {
    Matrix * _matrix;
    UInt8 _numMoves;
    GameStatus _gameStatus;
}

- (instancetype)init {
    if ((self = [super init])) {
        _matrix = [Matrix new];
        _gameStatus = GameStatusInProgress;
    }
    return self;
}

- (void)resetGame {
    [_matrix reset];
    _gameStatus = GameStatusInProgress;
    _numMoves = 0;
}

- (BOOL)addSymbol:(Symbol) symbol toPosition:(Position) position withError: (NSError **) error {

    bool currentCellIsEmpty = [_matrix isCellEmpty:position];
    bool currentSymbolIsX = symbol == SymbolX;
    bool isEvenTurn = _numMoves % 2 == 0;
    bool currentSymbolIsO = symbol == SymbolO;

    if (_gameStatus != GameStatusInProgress) {
        *error = [[NSError alloc] initWithDomain:ERROR_DOMAIN_LOGIC
                                            code:ERROR_CODE_GAME_NOT_IN_PROGRESS
                                        userInfo:nil];
        return NO;
    }
    
    if (!currentCellIsEmpty) {
        *error = [[NSError alloc] initWithDomain:ERROR_DOMAIN_LOGIC
                                            code:ERROR_CODE_CELL_IS_NOT_EMPTY
                                        userInfo:nil];
        return NO;
    }

    if (isEvenTurn && !currentSymbolIsX) {
        *error = [[NSError alloc] initWithDomain:ERROR_DOMAIN_LOGIC
                                            code:ERROR_CODE_SYMBOL_X_EXPECTED
                                        userInfo:nil];
        return NO;
    }

    if (!isEvenTurn && !currentSymbolIsO) {
        *error = [[NSError alloc] initWithDomain:ERROR_DOMAIN_LOGIC
                                            code:ERROR_CODE_SYMBOL_O_EXPECTED
                                        userInfo:nil];
        return NO;
    }

    [_matrix setSymbol:symbol atPosition:position];
    [self updateStatus];
    _numMoves += 1;
    return YES;
}

- (void)updateStatus {
    Symbol winner = _matrix.winner;
    switch (winner) {
        case SymbolEmpty:
            if (_numMoves == NUM_CELLS - 1) {
                _gameStatus = GameStatusDraw;
            } else {
                _gameStatus = GameStatusInProgress;
            }
            break;
        case SymbolX:
            _gameStatus = GameStatusXWon;
            break;
        case SymbolO:
            _gameStatus = GameStatusOWon;
            break;
    }
}

- (GameStatus)gameStatus {
    return _gameStatus;
}

- (Symbol)symbolByPosition:(Position) position {
    return [_matrix symbolByPosition:position];
}

- (Symbol)currentTurn {
    return (_numMoves % 2 == 0) ? SymbolX : SymbolO;
}

@end
