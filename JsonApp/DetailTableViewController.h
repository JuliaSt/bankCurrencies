//
//  DetailTableViewController.h
//  JsonApp
//
//  Created by Taras Gudz on 29.04.15.
//  Copyright (c) 2015 JuliaSt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface DetailTableViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UITableView *detailTableView;
@property NSMutableData *webData;
@property NSURLConnection *connection;
@property NSMutableArray *arrayAsk;
@property NSMutableArray *arrayBid;
@property NSMutableArray *arrayCurrenciesKeys;
@property (strong, nonatomic) NSDictionary *identification;

@property (strong, nonatomic)NSString *city;


@end
