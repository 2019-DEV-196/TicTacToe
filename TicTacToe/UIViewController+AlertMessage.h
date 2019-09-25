//
//  UIViewController+AlertMessage.h
//  TicTacToe
//
//  Created by 2019-DEV-196 on 25/09/2019.
//  Copyright © 2019 2019-DEV-196. All rights reserved.
//

@import UIKit;

@interface UIViewController (AlertMessage)
- (void)showAlertWithTitle: (NSString*_Nullable) title
                   message: (NSString*_Nullable) message
         completionHandler: (void (^ __nullable)(void))handler;
- (void)showErrorMessage:(NSError *_Nonnull)error;
@end

