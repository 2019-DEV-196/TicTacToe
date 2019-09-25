//
//  PositionModel.m
//  TicTacToe
//
//  Created by 2019-DEV-196 on 24/09/2019.
//  Copyright © 2019 2019-DEV-196. All rights reserved.
//

@import Foundation;

typedef NS_ENUM(short, GameState) {
    GameStateInProgress = 0,
    GameStateXWon = 1,
    GameStateOWon = 2,
    GameStateDraw = 3
};
