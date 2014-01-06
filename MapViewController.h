//
//  MapViewController.h
//  SharkoBot App
//
//  Created by Adil Rahman on 1/5/14.
//  Copyright (c) 2014 Adil Rahman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController{
    MKMapView *mapView;
}

@property(nonatomic,retain) IBOutlet MKMapView *mapView;

-(IBAction)setmap:(id)sender;


@end
