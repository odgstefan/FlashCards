//
//  ViewController.m
//  FlashCards
//
//  Created by Alin Tiganus on 11/3/12.
//  Copyright (c) 2012 Alin Tiganus. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	// Do any additional setup after loading the view, typically from a nib.
    self.array = [[NSArray alloc] initWithObjects: @"mar", @"minge",@"floare",@"copil",@"cos",@"masina",@"motor",@"roata",@"ceas",@"masa", nil];
    self.array1 = [[NSArray alloc] initWithObjects:@"apple",@"ball",@"flower",@"child",@"basket",@"car",@"engine",@"wheel",@"clock",@"table", nil];
    self.currentIndex = -1;
    self.esteFata = YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextCard:(id)sender {
    self.currentIndex = self.currentIndex + 1;
    if(self.currentIndex == [self.array count])
        self.currentIndex = 0;
    NSString* str = [self.array objectAtIndex:self.currentIndex];
    [self.card setTitle:str forState:UIControlStateNormal];
    
    self.esteFata = NO;

}

- (IBAction)changeText:(id)sender {
    if(self.currentIndex == -1)
        self.currentIndex = 0;
    NSString *string;
    if(self.esteFata)
        string = [self.array objectAtIndex:self.currentIndex];
    else
        string = [self.array1 objectAtIndex:self.currentIndex];
    self.esteFata = !self.esteFata;
    [self.card setTitle:string forState:UIControlStateNormal];
    
}
@end
