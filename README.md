# TicTacToe

This is an implementation of the game Tic Tac Toe. It is written in Objective-C and uses the MVC Architecture.

![](https://user-images.githubusercontent.com/55791451/65599067-3eeba180-df9d-11e9-80eb-dacef79aea8b.gif)


## How to run the project

Steps:

1. Clone the repository
2. Open the file `TicTacToe.xcodeproj` with Xcode 11 
3. From Xcode select `Product` > `Run`

## Tests
The project contains the following Unit Tests:

```
- testXAlwaysGoesFirst
- testPlayersCannotPlayOnAPlayedPosition
- testWinRow0
- testWinRow1
- testWinRow2
- testWinCol0
- testWinCol1
- testWinCol2
- testWinDiagonal0
- testWinDiagonal1
```

## Position

This enum contains one case for each cell of the 3x3 grid.

```
typedef NS_ENUM(short, Position) {

    PositionTopLeft = 0,
    PositionTopCenter = 1,
    PositionTopRight = 2,
    
    PositionMidLeft = 3,
    PositionMidCenter = 4,
    PositionMidRight = 5,
    
    PositionBottomLeft = 6,
    PositionBottomCenter = 7,
    PositionBottomRight = 8,

};
```

## Symbol

This enum represents the content of a cell (`Empty`, `X` or `O).

```
typedef NS_ENUM(short, Symbol) {
    SymbolEmpty = 0,
    SymbolO = 1,
    SymbolX = 2
};
```


## GameState
This enum represents the possible state of the game.

```
typedef NS_ENUM(short, GameState) {
    GameStateInProgress = 0,
    GameStateXWon = 1,
    GameStateOWon = 2,
    GameStateDraw = 3
};
```

## Matrix

This class provides an abstraction of the TicTacToe 3x3 grid.
Internally the grid is represented as a unidimensional array of `Symbol` values.

```
Symbol _matrix[9];
```

However this low level detail is not exposed to other classes.
External objects can interact with Matrix using the following high level methods:

```
- (void)reset;
- (void)setSymbol:(Symbol) symbol atPosition: (Position) position;
- (Symbol)symbolByPosition:(Position) position;
- (bool)isCellEmpty:(Position) position;
- (Symbol)winner;
```

## Logic
This class contains the rules of the game.
It has 3 instance variables.

```
@implementation Logic {
    Matrix * _matrix;
    UInt8 _numMoves;
    GameStatus _gameStatus;
}
```

Finally it exposes the following high level methods

```
- (void)resetGame;
- (BOOL)addSymbol:(Symbol) symbol
       toPosition:(Position) position
        withError:(NSError **) error;
- (GameStatus)gameStatus;
- (Symbol)symbolByPosition:(Position) position;
- (Symbol)currentTurn;
```

## ViewController

This class is the connection between the UI and the Logic.

It receives 2 events from the UI:

```
- (IBAction)didTapButton:(id)sender;
- (IBAction)didTapRestart:(UIBarButtonItem *)sender;
```

When an event is received the related methods from Logic are called and the the UI is updated accordingly.

## UIViewController (AlertMessage)

This category adds 2 methods to the UIViewController class.

```
- (void)showAlertWithTitle: (NSString*_Nullable) title
                   message: (NSString*_Nullable) message
         completionHandler: (void (^ __nullable)(void))handler;
- (void)showErrorMessage:(NSError *_Nonnull)error;
```

## Constants
All the constants are defined into the Constants.h file.

## Error management

The following method from Logic could produce an error.

```
- (BOOL)addSymbol:(Symbol) symbol toPosition:(Position) position withError: (NSError **) error;
```

The following Objective-C convention is used:

1. the method returns `YES` is it succeed
2. the method returns `NO` is if fails
3. the method receives a reference to a refernce to an error object. The reference gets populated **if and only if** the methods returns `NO`.

The following `error domain` and 4 `error codes` are defined into the `Constants.h file.
```
static NSString * const ERROR_DOMAIN_LOGIC = @"Logic";
static NSInteger const ERROR_CODE_CELL_IS_NOT_EMPTY = 1;
static NSInteger const ERROR_CODE_SYMBOL_X_EXPECTED = 2;
static NSInteger const ERROR_CODE_SYMBOL_O_EXPECTED = 3;
static NSInteger const ERROR_CODE_GAME_NOT_IN_PROGRESS = 4;
```



