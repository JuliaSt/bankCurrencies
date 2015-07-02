//
//  showBankOnMap.h
//  JsonApp
//
//  Created by Taras Gudz on 04.05.15.
//  Copyright (c) 2015 JuliaSt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface showBankOnMap : UIViewController<MKMapViewDelegate>
@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@property NSDictionary *identification;
@property NSString *city;

@end
