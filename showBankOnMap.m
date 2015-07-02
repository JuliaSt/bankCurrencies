//
//  showBankOnMap.m
//  JsonApp
//
//  Created by Taras Gudz on 04.05.15.
//  Copyright (c) 2015 JuliaSt. All rights reserved.
//

#import "showBankOnMap.h"
#import "MapAnnotation.h"


@interface showBankOnMap ()

@end

@implementation showBankOnMap
@synthesize identification,city;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSString *street=[identification objectForKey:@"address"];
    NSString *temp=[city stringByAppendingString:@" , "];
    NSString *bankLocation=[temp stringByAppendingString:street];
    
    
    NSRange range = [bankLocation rangeOfString:@"-"];
    if(range.location!=NSNotFound)
    {
        bankLocation = [bankLocation substringToIndex:range.location];
    }
    
    range = [bankLocation rangeOfString:@"/"];
    if(range.location!=NSNotFound)
    {
        bankLocation = [bankLocation substringToIndex:range.location];
    }
    
    
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:bankLocation completionHandler:^(NSArray* placemarks, NSError* error)
     {
         if (placemarks && placemarks.count > 0)
         {
             CLPlacemark *topResult = [placemarks objectAtIndex:0];
             MKPlacemark *placemark = [[MKPlacemark alloc] initWithPlacemark:topResult];
             
             [self.mapView setRegion:(MKCoordinateRegionMakeWithDistance(placemark.coordinate, 5000, 5000)) animated:YES];
             [self.mapView addAnnotation:placemark];
         }
     }
     ];
    
}

- (IBAction)changeMapType:(id)sender {
    if (_mapView.mapType == MKMapTypeStandard)
        _mapView.mapType = MKMapTypeSatellite;
    else
        _mapView.mapType = MKMapTypeStandard;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

