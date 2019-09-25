//
//  TicTacToeTests.m
//  TicTacToeTests
//
//  Created by 2019-DEV-196 on 24/09/2019.
//  Copyright © 2019 2019-DEV-196. All rights reserved.
//

@import XCTest;

#import "Logic.h"
#import "Constants.h"

@interface TicTacToeTests : XCTestCase

@end

@implementation TicTacToeTests

// X always goes first.
- (void)testXAlwaysGoesFirst {
    Logic * logic = [Logic new];
    for (int index = 0; index < NUM_CELLS; index++) {
        NSError * error;
        Position position = POSITIONS[index];
        
        BOOL success = [logic addSymbol:SymbolX toPosition:position withError: &error];
        XCTAssertTrue(success);
        XCTAssertNil(error);
        [logic resetGame];
 
        success = [logic addSymbol:SymbolO toPosition:position withError:&error];
        XCTAssertFalse(success);
        XCTAssertNotNil(error);
        XCTAssertEqual(error.code, ERROR_CODE_SYMBOL_X_EXPECTED);
        [logic resetGame];
    }
}

// Players cannot play on a played position.
- (void)testPlayersCannotPlayOnAPlayedPosition {
    Logic * logic = [Logic new];
    for (int index = 0; index < NUM_CELLS; index++) {
        NSError * error;
        Position position = POSITIONS[index];
        bool success = [logic addSymbol:SymbolX toPosition:position withError:&error];
        XCTAssertTrue(success);
        XCTAssertNil(error);
        success = [logic addSymbol:SymbolX toPosition:position withError:&error];
        XCTAssertFalse(success);
        XCTAssertNotNil(error);
        XCTAssertEqual(error.code, ERROR_CODE_CELL_IS_NOT_EMPTY);
        [logic resetGame];
    }
}

- (void)testWinRow0 {
    Logic * logic = [Logic new];
    NSError * error;

    // x . .
    // . . .
    // . . .
    bool success = [logic addSymbol:SymbolX toPosition:PositionTopLeft withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);

    // x . .
    // o . .
    // . . .
    success = [logic addSymbol:SymbolO toPosition:PositionMidLeft withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);

    // x x .
    // o . .
    // . . .
    success = [logic addSymbol:SymbolX toPosition:PositionTopCenter withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);

    // x x .
    // o o .
    // . . .
    success = [logic addSymbol:SymbolO toPosition:PositionMidCenter withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);

    // x x x
    // o o .
    // . . .
    success = [logic addSymbol:SymbolX toPosition:PositionTopRight withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusXWon);
}

- (void)testWinRow1 {
    Logic * logic = [Logic new];
    NSError * error;

    // x . .
    // . . .
    // . . .
    bool success = [logic addSymbol:SymbolX toPosition:PositionTopLeft withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);

    // x . .
    // o . .
    // . . .
    success = [logic addSymbol:SymbolO toPosition:PositionMidLeft withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);

    // x x .
    // o . .
    // . . .
    success = [logic addSymbol:SymbolX toPosition:PositionTopCenter withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);

    // x x .
    // o o .
    // . . .
    success = [logic addSymbol:SymbolO toPosition:PositionMidCenter withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);

    // x x .
    // o o .
    // x . .
    success = [logic addSymbol:SymbolX toPosition:PositionBottomLeft withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);
    
    // x x .
    // o o o
    // x . .
    success = [logic addSymbol:SymbolO toPosition:PositionMidRight withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusOWon);

}

- (void)testWinRow2 {
    Logic * logic = [Logic new];
    NSError * error;

    // . . .
    // . . .
    // x . .
    bool success = [logic addSymbol:SymbolX toPosition:PositionBottomLeft withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);

    // . . .
    // o . .
    // x . .
    success = [logic addSymbol:SymbolO toPosition:PositionMidLeft withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);
    
    // . . .
    // o . .
    // x x .
    success = [logic addSymbol:SymbolX toPosition:PositionBottomCenter withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);
    
    // . . .
    // o o .
    // x x .
    success = [logic addSymbol:SymbolO toPosition:PositionMidCenter withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);
    
    // . . .
    // o o .
    // x x x
    success = [logic addSymbol:SymbolX toPosition:PositionBottomRight withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusXWon);
}

- (void)testWinCol0 {
    Logic * logic = [Logic new];
    NSError * error;

    // . . .
    // . . .
    // x . .
    bool success = [logic addSymbol:SymbolX toPosition:PositionBottomLeft withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);
    
    // . . .
    // . . .
    // x o .
    success = [logic addSymbol:SymbolO toPosition:PositionBottomCenter withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);
    
    // . . .
    // x . .
    // x o .
    success = [logic addSymbol:SymbolX toPosition:PositionMidLeft withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);
    
    // . . .
    // x o .
    // x o .
    success = [logic addSymbol:SymbolO toPosition:PositionMidCenter withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);
    
    // x . .
    // x o .
    // x o .
    success = [logic addSymbol:SymbolX toPosition:PositionTopLeft withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusXWon);
}

- (void)testWinCol1 {
    Logic * logic = [Logic new];
    NSError * error;

    // . . .
    // . . .
    // x . .
    bool success = [logic addSymbol:SymbolX toPosition:PositionBottomLeft withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);
    
    // . . .
    // . . .
    // x o .
    success = [logic addSymbol:SymbolO toPosition:PositionBottomCenter withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);
    
    // . . .
    // . . .
    // x o x
    success = [logic addSymbol:SymbolX toPosition:PositionBottomRight withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);
    
    // . . .
    // . o .
    // x o x
    success = [logic addSymbol:SymbolO toPosition:PositionMidCenter withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);
    
    // . . .
    // x o .
    // x o x
    success = [logic addSymbol:SymbolX toPosition:PositionMidLeft withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);
    
    // . o .
    // x o .
    // x o x
    success = [logic addSymbol:SymbolO toPosition:PositionTopCenter withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusOWon);
}

- (void)testWinCol2 {
    Logic * logic = [Logic new];
    NSError * error;

    // . . .
    // . . .
    // . . x
    bool success = [logic addSymbol:SymbolX toPosition:PositionBottomRight withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);
    
    // . . .
    // . . .
    // . o x
    success = [logic addSymbol:SymbolO toPosition:PositionBottomCenter withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);

    // . . .
    // . . x
    // . o x
    success = [logic addSymbol:SymbolX toPosition:PositionMidRight withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);

    // . . .
    // . o x
    // . o x
    success = [logic addSymbol:SymbolO toPosition:PositionMidCenter withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);
    
    // . . x
    // . o x
    // . o x
    success = [logic addSymbol:SymbolX toPosition:PositionTopRight withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusXWon);

}

- (void)testWinDiagonal0 {
    Logic * logic = [Logic new];
    NSError * error;

    // . . .
    // . . .
    // . . x
    bool success = [logic addSymbol:SymbolX toPosition:PositionBottomRight withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);
    
    // . . .
    // . . .
    // . o x
    success = [logic addSymbol:SymbolO toPosition:PositionBottomCenter withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);
    
    // . . .
    // . x .
    // . o x
    success = [logic addSymbol:SymbolX toPosition:PositionMidCenter withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);
    
    // . . .
    // . x .
    // o o x
    success = [logic addSymbol:SymbolO toPosition:PositionBottomLeft withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);
    
    // x . .
    // . x .
    // o o x
    success = [logic addSymbol:SymbolX toPosition:PositionTopLeft withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusXWon);
}

- (void)testWinDiagonal1 {
    Logic * logic = [Logic new];
    NSError * error;

    // . . .
    // . . .
    // . . x
    bool success = [logic addSymbol:SymbolX toPosition:PositionBottomRight withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);
    
    // . . .
    // . . .
    // o . x
    success = [logic addSymbol:SymbolO toPosition:PositionBottomLeft withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);
    
    // . . .
    // . . .
    // o x x
    success = [logic addSymbol:SymbolX toPosition:PositionBottomCenter withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);

    // . . .
    // . o .
    // o x x
    success = [logic addSymbol:SymbolO toPosition:PositionMidCenter withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);

    // . . .
    // . o x
    // o x x
    success = [logic addSymbol:SymbolX toPosition:PositionMidRight withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);
    
    // . . o
    // . o x
    // o x x
    success = [logic addSymbol:SymbolO toPosition:PositionTopRight withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusOWon);
}


// If all nine squares are filled and neither player has three in a row, the game is a draw.
- (void)testNineSquaresAreFilledWithoutWin {
    Logic * logic = [Logic new];
    NSError * error;

    // x
    //
    //
    bool success = [logic addSymbol:SymbolX toPosition:PositionTopLeft withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);

    // x o
    //
    //
    success = [logic addSymbol:SymbolO toPosition:PositionTopCenter withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);
    
    // x o x
    //
    //
    success = [logic addSymbol:SymbolX toPosition:PositionTopRight withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);

    // x o x
    //   o
    //
    success = [logic addSymbol:SymbolO toPosition:PositionMidCenter withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);
    
    // x o x
    // x o
    //
    success = [logic addSymbol:SymbolX toPosition:PositionMidLeft withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);

    // x o x
    // x o
    //     o
    success = [logic addSymbol:SymbolO toPosition:PositionBottomRight withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);
    
    // x o x
    // x o x
    //     o
    success = [logic addSymbol:SymbolX toPosition:PositionMidRight withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);

    // x o x
    // x o x
    // o   o
    success = [logic addSymbol:SymbolO toPosition:PositionBottomLeft withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusInProgress);

    // x o x
    // x o x
    // o x o
    success = [logic addSymbol:SymbolX toPosition:PositionBottomCenter withError:&error];
    XCTAssertTrue(success);
    XCTAssertNil(error);
    XCTAssertEqual(logic.gameStatus, GameStatusDraw);

}

@end
