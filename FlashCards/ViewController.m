//
//  ViewController.m
//  FlashCards
//
//  Created by Alin Tiganus on 11/3/12.
//  Copyright (c) 2012 Alin Tiganus. All rights reserved.
//

#import "ViewController.h"
#import "SettingsViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	// Do any additional setup after loading the view, typically from a nib.
  //self.array = [[NSArray alloc] initWithObjects: @"mar", @"minge",@"floare",@"copil",@"cos",@"masina",@"motor",@"roata",@"ceas",@"masa", nil];
  //self.array1 = [[NSArray alloc] initWithObjects:@"apple",@"ball",@"flower",@"child",@"basket",@"car",@"engine",@"wheel",@"clock",@"table", nil];
    self.currentIndex = -1;
    self.esteFata = YES;
    
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                              NSUserDomainMask,
                                                              YES) objectAtIndex:0];
    NSString *plistPath = [rootPath
                           stringByAppendingPathComponent:@"FlashCardsList.plist"];
    NSString *plistPath2 = [rootPath
                           stringByAppendingPathComponent:@"FlashCardsList2.plist"];
    bool result;
    if(![[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"FlashCardsList" ofType:@"plist"];
        self.array = [[NSArray alloc] initWithContentsOfFile:path];
        result = [self.array writeToFile:plistPath atomically:YES];
    }
    else
    {
        self.array = [[NSArray alloc] initWithContentsOfFile:plistPath];

    }
    if(![[NSFileManager defaultManager] fileExistsAtPath:plistPath2]) {
        NSString *path2 = [[NSBundle mainBundle] pathForResource:@"FlashCardsList2" ofType:@"plist"];
        self.array1 = [[NSArray alloc] initWithContentsOfFile:path2];
        result = [self.array1 writeToFile:plistPath2 atomically:YES];
    }
    else
    {
        self.array1 = [[NSArray alloc] initWithContentsOfFile:plistPath2];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextCard:(id)sender
{
    self.currentIndex = self.currentIndex + 1;
    if(self.currentIndex == [self.array count])
        self.currentIndex = 0;
    
    NSString* str = [self.array objectAtIndex:self.currentIndex];
    [self.card setTitle:str forState:UIControlStateNormal];
    
    self.esteFata = NO;

}

- (IBAction)previousCard:(id)sender
{
    self.currentIndex = self.currentIndex - 1;    
    if(self.currentIndex < 0)
     self.currentIndex = [self.array count] - 1;
    
    NSString* strn = [self.array objectAtIndex:self.currentIndex];
    [self.card setTitle:strn forState:UIControlStateNormal];
    
    
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

- (IBAction)addText:(id)sender {
    SettingsViewController *svc = [[SettingsViewController alloc] initWithNibName:@"SettingsViewController" bundle:nil];
    [UIApplication sharedApplication].keyWindow.rootViewController = svc;
    
}




@end
