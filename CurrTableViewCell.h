//
//  CurrTableViewCell.h
//  JsonApp
//
//  Created by Taras Gudz on 30.04.15.
//  Copyright (c) 2015 JuliaSt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CurrTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *currLabel;
@property (strong, nonatomic) IBOutlet UILabel *askLabel;
@property (strong, nonatomic) IBOutlet UILabel *bidLabel;

@end
