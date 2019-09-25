//
//  ViewController.m
//  TicTacToe
//
//  Created by 2019-DEV-196 on 24/09/2019.
//  Copyright © 2019 2019-DEV-196. All rights reserved.
//

#import "ViewController.h"
#import "Logic.h"
#import "Constants.h"
#import "UIViewController+AlertMessage.h"

@implementation ViewController {
    Logic * _logic;
}

#pragma mark - UIViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    assert(NUM_CELLS == self.buttons.count);
    _logic = [Logic new];
    for (UIButton * button in self.buttons) {
        button.layer.borderColor = UIColor.blackColor.CGColor;
        button.layer.borderWidth = 2;
    }
}

#pragma mark - IBAction
- (IBAction)didTapButton:(id)sender {
    NSUInteger index = [self.buttons indexOfObject:sender];
    assert(index <= NUM_CELLS);
    Position position = POSITIONS[index];
    NSError * error;
    Symbol symbol = [_logic currentTurn];
    bool success = [_logic addSymbol:symbol toPosition:position withError:&error];
    if (success) {
        assert(error == nil);
        [self updateUI];
    } else {
        assert(error != nil);
        [self showErrorMessage:error];
    }
}

- (IBAction)didTapRestart:(UIBarButtonItem *)sender {
    [_logic resetGame];
    [self updateUI];
}

#pragma mark - UI refresh
- (void)updateUI {
    for (int i = 0; i< NUM_CELLS; i++) {
        Position position = POSITIONS[i];
        UIButton * button = self.buttons[i];
        Symbol symbol = [_logic symbolByPosition: position];
        switch (symbol) {
            case SymbolEmpty:
                [button setTitle:@"." forState:UIControlStateNormal];
                break;
            case SymbolX:
                [button setTitle:@"X" forState:UIControlStateNormal];
                break;
            case SymbolO:
                [button setTitle:@"O" forState:UIControlStateNormal];
                break;
        }
    }

    GameStatus gameStatus = [_logic gameStatus];
    switch (gameStatus) {
        case GameStatusDraw:
            [self showAlertWithTitle:@"Draw" message:nil completionHandler:nil];
            break;
        case GameStatusXWon:
            [self showAlertWithTitle:@"X WON!" message:nil completionHandler:nil];
            break;
        case GameStatusOWon:
            [self showAlertWithTitle:@"O WON!" message:nil completionHandler:nil];
            break;
        case GameStatusInProgress:
            break;
    }
}

@end
