//
//  ViewController.h
//  FlashCards
//
//  Created by Alin Tiganus on 11/3/12.
//  Copyright (c) 2012 Alin Tiganus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *card;
@property int currentIndex;
@property NSArray *array;
@property NSArray *array1;
@property bool esteFata;
- (IBAction)nextCard:(id)sender;


- (IBAction)previousCard:(id)sender;

- (IBAction)changeText:(id)sender;
    
- (IBAction)addText:(id)sender;

@end
