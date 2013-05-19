//
//  GyroManager.m
//  Madagascar
//
//  Created by Carlos on 5/19/13.
//  Copyright (c) 2013 appdev. All rights reserved.
//

#import "GyroManager.h"

@implementation GyroManager


CMMotionManager *motionManager;

-(void)startMonitoring
{
    
    NSLog(@"Starting... \n");
    
    if ([motionManager isGyroAvailable]) {// Check device has gyros.
        if (![motionManager isGyroActive]){
            [motionManager startGyroUpdatesToQueue:[NSOperationQueue mainQueue] withHandler: ^(CMGyroData *gyroData, NSError *error) {
                //Do whatever when gyro update;
                CMDeviceMotion *deviceMotion = motionManager.deviceMotion;
                CMAttitude *attitude = deviceMotion.attitude;
                double pitch = attitude.pitch;
                double roll = attitude.roll;
                double yaw = attitude.yaw;
                NSLog(@"Pitch; %.2f; Roll; %.2f; Yaw; %.2f\n", pitch, roll, yaw);
            }];
        }
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Gyro" message:@"There is not available gyro."  delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
}

@end
