//
//  MapAnnotation.h
//  JsonApp
//
//  Created by Taras Gudz on 04.05.15.
//  Copyright (c) 2015 JuliaSt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapAnnotation : NSObject<MKAnnotation>
@property (nonatomic, strong) NSString *title;
@property (nonatomic, readwrite) CLLocationCoordinate2D coordinate;

- (id)initWithTitle:(NSString *)title andCoordinate:
(CLLocationCoordinate2D)coordinate2d;

@end