//
//  bankTableViewCell.h
//  JsonApp
//
//  Created by Taras Gudz on 30.04.15.
//  Copyright (c) 2015 JuliaSt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface bankTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *bankNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;
@property (strong, nonatomic) IBOutlet UILabel *cityLabel;

@end
