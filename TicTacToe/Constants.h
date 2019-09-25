//
//  Constants.h
//  TicTacToe
//
//  Created by 2019-DEV-196 on 24/09/2019.
//  Copyright © 2019 2019-DEV-196. All rights reserved.
//

#import "Symbol.h"
#import "Position.h"

static UInt8 const NUM_ROWS = 3;
static UInt8 const NUM_COLS = 3;
static UInt8 const NUM_CELLS = NUM_ROWS * NUM_COLS;

static Symbol const WINNING_SEQUENCES[8][3] = {
    // x x x
    // . . .
    // . . .
    {0, 1, 2},

    // . . .
    // x x x
    // . . .
    {3, 4, 5},
    
    // . . .
    // . . .
    // x x x
    {6, 7, 8},
    
    // x . .
    // x . .
    // x . .
    {0, 3, 6},
    
    // . x .
    // . x .
    // . x .
    {1, 4, 7},
    
    // . . x
    // . . x
    // . . x
    {2, 5, 8},
    
    // x . .
    // . x .
    // . . x
    {0, 4, 8},

    // . . x
    // . x .
    // x . .
    {2, 4, 6}
};

static int const WINNING_SEQUENCES_COUNT = 8;
static NSString * const ERROR_DOMAIN_LOGIC = @"Logic";
static NSInteger const ERROR_CODE_CELL_IS_NOT_EMPTY = 1;
static NSInteger const ERROR_CODE_SYMBOL_X_EXPECTED = 2;
static NSInteger const ERROR_CODE_SYMBOL_O_EXPECTED = 3;
static NSInteger const ERROR_CODE_GAME_NOT_IN_PROGRESS = 4;

static Position POSITIONS[NUM_CELLS] = {
    PositionTopLeft, PositionTopCenter, PositionTopRight,
    PositionMidLeft, PositionMidCenter, PositionMidRight,
    PositionBottomLeft, PositionBottomCenter, PositionBottomRight
};
