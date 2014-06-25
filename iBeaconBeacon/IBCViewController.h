//
//  IBCViewController.h
//  iBeaconBeacon
//
//  Created by Mauricio Meirelles on 6/25/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface IBCViewController : UIViewController <CBPeripheralManagerDelegate>
{
    NSDictionary *peripheralData;

}

@property CBPeripheralManager *peripheralManager;


@end
