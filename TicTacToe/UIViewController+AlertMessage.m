//
//  UIViewController+AlertMessage.m
//  TicTacToe
//
//  Created by 2019-DEV-196 on 25/09/2019.
//  Copyright © 2019 2019-DEV-196. All rights reserved.
//

#import "UIViewController+AlertMessage.h"
#import "Constants.h"

@import UIKit;

@implementation UIViewController (AlertMessage)

- (void)showAlertWithTitle: (NSString*_Nullable) title
                   message: (NSString*_Nullable) message
         completionHandler: (void (^ __nullable) (void)) handler {
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:title
                                                                              message:message
                                                                       preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (handler != nil) {
                handler();
            }
    }];
    [alertController addAction:action];
    [self presentViewController:alertController animated:YES completion:^{ }];
}

- (void)showErrorMessage:(NSError *_Nonnull)error {
    if ([error.domain isEqual: ERROR_DOMAIN_LOGIC]) {
        switch (error.code) {
            case ERROR_CODE_CELL_IS_NOT_EMPTY:
                [self showAlertWithTitle:@"Cell is not empty" message: nil completionHandler:nil];
                break;
            case ERROR_CODE_SYMBOL_X_EXPECTED:
                [self showAlertWithTitle:@"Symbol X is expected" message:nil completionHandler:nil];
                break;
            case ERROR_CODE_SYMBOL_O_EXPECTED:
                [self showAlertWithTitle:@"Symbol O is expected" message:nil completionHandler:nil];
                break;
            case ERROR_CODE_GAME_NOT_IN_PROGRESS:
                [self showAlertWithTitle:@"Game not in progress" message:@"Please tap restart" completionHandler:nil];
                break;
            default:
                [self showAlertWithTitle:@"Error" message:@"Something went wrong" completionHandler:nil];
        }
    } else {
        [self showAlertWithTitle:@"Error" message:@"Something went wrong" completionHandler:nil];
    }
}

@end
