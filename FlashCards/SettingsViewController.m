//
//  SettingsViewController.m
//  FlashCards
//
//  Created by Alin Tiganus on 11/4/12.
//  Copyright (c) 2012 Alin Tiganus. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{ 
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                              NSUserDomainMask,
                                                              YES) objectAtIndex:0];
    NSString *plistPath = [rootPath
                           stringByAppendingPathComponent:@"FlashCardsList.plist"];

    self.cuvinte = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];
    NSString *plistPath2 = [rootPath
                           stringByAppendingPathComponent:@"FlashCardsList2.plist"];

    self.cuvinteTraduse = [[NSMutableArray alloc] initWithContentsOfFile:plistPath2];
    
   }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addWord:(id)sender {
    NSString *text = self.textInput.text;
    if (self.textInput.text.length!=0){
    [self.cuvinte insertObject:text atIndex:0];
    [self.tabel reloadData];
    self.textInput.text = @"";
    }
    NSString *translate = self.textInputTranslate.text;
    if (self.textInputTranslate.text.length!=0){
    [self.cuvinteTraduse insertObject:translate atIndex:0];
    [self.tabel reloadData];
    self.textInputTranslate.text = @"";
        
        NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                                  NSUserDomainMask,
                                                                  YES) objectAtIndex:0];
        NSString *plistPath = [rootPath
                               stringByAppendingPathComponent:@"FlashCardsList.plist"];
        NSString *plistPath2 = [rootPath
                               stringByAppendingPathComponent:@"FlashCardsList2.plist"];


        [self.cuvinte writeToFile:plistPath atomically:YES];
        [self.cuvinteTraduse writeToFile:plistPath2 atomically:YES];
    }

    [self.textInput resignFirstResponder];
    [self.textInputTranslate resignFirstResponder];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cuvinte.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    cell.textLabel.text = [self.cuvinte objectAtIndex:indexPath.row];
    
    cell.detailTextLabel.text = [self.cuvinteTraduse objectAtIndex:indexPath.row];
   
    return cell;
    
}

- (void)viewDidUnload {
    [self setTextInput:nil];
    [self setTabel:nil];
    [self setTextInputTranslate:nil];
    [super viewDidUnload];
}
@end
