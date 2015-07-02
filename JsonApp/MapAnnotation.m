//
//  MapAnnotation.m
//  JsonApp
//
//  Created by Taras Gudz on 04.05.15.
//  Copyright (c) 2015 JuliaSt. All rights reserved.
//

#import "MapAnnotation.h"

@implementation MapAnnotation
-(id)initWithTitle:(NSString *)title andCoordinate:
(CLLocationCoordinate2D)coordinate2d{
    self.title = title;
    self.coordinate =coordinate2d;
    return self;
}
@end