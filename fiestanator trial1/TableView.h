//
//  TableView.h
//  fiestanator trial1
//
//  Created by Michael Giba on 7/7/13.
//  Copyright (c) 2013 Michael Giba. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TesterViewController.h"


@interface TableView : UITableViewController <UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UINavigationItem *navigationBar;
@property (strong, nonatomic) NSMutableDictionary *dataFromDict;
@property (strong, nonatomic) NSString *remainingMoney;
@property (strong, nonatomic) NSString *showAd;

- (IBAction)backButton:(id)sender;

@end
