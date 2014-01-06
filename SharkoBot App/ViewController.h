//
//  ViewController.h
//  SharkoBot App
//
//  Created by Adil Rahman on 1/4/14.
//  Copyright (c) 2014 Adil Rahman. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface ViewController : UIViewController <MFMailComposeViewControllerDelegate> {
    IBOutlet UITextField *textf;
    IBOutlet UILabel *temp;
    // add GPS?
   // IBOutlet CLLocationManager *locationManager;
    //IBOutlet UILabel *latLabel;
    //IBOutlet UILabel *longLabel;
   
}
@property(nonatomic, retain) IBOutlet UILabel *temp;


-(IBAction)safe:(id)sender;
-(IBAction)danger:(id)sender;
-(IBAction)returnKey:(id)sender;

@end
