//
//  SettingsViewController.h
//  FlashCards
//
//  Created by Alin Tiganus on 11/4/12.
//  Copyright (c) 2012 Alin Tiganus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textInput;
@property (weak, nonatomic) IBOutlet UITableView *tabel;
@property NSMutableArray *cuvinte;
@property NSMutableArray *cuvinteTraduse;
@property (weak, nonatomic) IBOutlet UITextField *textInputTranslate;
@end
