//
//  ViewController.h
//  JsonApp
//
//  Created by Taras Gudz on 28.04.15.
//  Copyright (c) 2015 JuliaSt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailTableViewController.h"

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDelegate, NSURLConnectionDataDelegate>


@property (strong, nonatomic) IBOutlet UITableView *myTableView;

@property (strong, nonatomic) NSDictionary *orgName;
@property (strong, nonatomic) NSString *cityName;






@end

