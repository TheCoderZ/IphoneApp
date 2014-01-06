//
//  ViewController.m
//  SharkoBot App
//
//  Created by Adil Rahman on 1/4/14.
//  Copyright (c) 2014 Adil Rahman. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()

@end

@implementation ViewController

@synthesize temp;

int alertState = 0;
int rescueState = 0;


-(IBAction)returnKey:(id)sender{
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Click Send!"
                                                      message:@"Rescuers will recieve message when you hit send."
                                                     delegate: self
                                            cancelButtonTitle:@"Okay"
                                            otherButtonTitles: nil];
    
    UIAlertView *notMessage = [[UIAlertView alloc] initWithTitle:@"Message Recieved?"
                                                         message:@"You are not in danger."
                                                        delegate:self
                                               cancelButtonTitle:@"Okay"
                                               otherButtonTitles: nil];


    if (rescueState == 1){
        
        [message show];
        MFMailComposeViewController *composer = [[MFMailComposeViewController alloc] init];
        [composer setMailComposeDelegate:self];
        if ([MFMailComposeViewController canSendMail]) {
            
            [composer setToRecipients:[NSArray arrayWithObjects:@"thearstar@gmail.com", nil]];
            [composer setSubject:@"Message"];
            [composer setMessageBody:(@"%@" ,[textf text]) isHTML:NO];
            [composer setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
            [self presentModalViewController:composer animated:YES];
            } else {
        
        }
        
        textf.text = @"";
        
    } else if (rescueState == 0){
        
        [notMessage show];
        
        textf.text = @"";
        
    }
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    if (error){
        
        UIAlertView *alerterror = [[UIAlertView alloc] initWithTitle:@"Error!"
                                                             message: [NSString stringWithFormat:@"Error %@" ,[error description]]
                                                            delegate:Nil
                                                   cancelButtonTitle:@"Okay"
                                                   otherButtonTitles:nil];
        [alerterror show];
        [self dismissModalViewControllerAnimated:YES];
    }
    
    
}


-(IBAction)danger:(id)sender{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Danger!"
                                                    message:@"Are you sure?"
                                                   delegate:self
                                          cancelButtonTitle:@"YES"
                                          otherButtonTitles:@"NO", nil];
    [alert show];
    
    alertState = 1;
    rescueState = 1;
    
}

-(IBAction)safe:(id)sender{
    
    alertState = 0;
    
    if (rescueState == 1){
        
        temp.textColor = [UIColor greenColor];
    
        UIAlertView *notify = [[UIAlertView alloc] initWithTitle:@"Safe!"
                                                     message:@"Rescuers have been notified that the victim is safe"
                                                    delegate:self
                                           cancelButtonTitle:@"Okay"
                                           otherButtonTitles: nil];
        [notify show];
        rescueState = 0;
        
            } else if (rescueState == 0){
        
                    UIAlertView *notNotify = [[UIAlertView alloc] initWithTitle:@"Safe?"
                                                            message:@"Rescuers are not deployed..."
                                                           delegate:self
                                                  cancelButtonTitle:@"Okay"
                                                  otherButtonTitles: nil];
                [notNotify show];
                
        }
}

-(void)alertView:(UIAlertView *)actionsheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertState == 1){
        if (buttonIndex == 0){
           temp.textColor = [UIColor redColor];
            
        } else if (buttonIndex == 1){
                    temp.textColor = [UIColor whiteColor];
                }
        }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [textf resignFirstResponder];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
