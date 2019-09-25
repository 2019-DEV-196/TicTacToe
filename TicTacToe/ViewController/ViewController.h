//
//  ViewController.h
//  TicTacToe
//
//  Created by 2019-DEV-196 on 24/09/2019.
//  Copyright © 2019 2019-DEV-196. All rights reserved.
//

@import UIKit;

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;
- (IBAction)didTapButton:(id)sender;
- (IBAction)didTapRestart:(UIBarButtonItem *)sender;
@end

