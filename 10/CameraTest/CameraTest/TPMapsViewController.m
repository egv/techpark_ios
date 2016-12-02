//
//  TPMapsViewController.m
//  CameraTest
//
//  Created by d.taraev on 01.12.16.
//  Copyright © 2016 mail.ru. All rights reserved.
//

#import "TPMapsViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface TPMapsViewController () <CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;
@end

@implementation TPMapsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager requestWhenInUseAuthorization];
    self.locationManager.delegate = self;
    
    [self.locationManager startMonitoringSignificantLocationChanges];
}




#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    
    NSLog(@"location updated");
}

@end
