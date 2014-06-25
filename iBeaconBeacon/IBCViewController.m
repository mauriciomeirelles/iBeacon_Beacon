//
//  IBCViewController.m
//  iBeaconBeacon
//
//  Created by Mauricio Meirelles on 6/25/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "IBCViewController.h"

#define BEACON_UUID [[NSUUID alloc] initWithUUIDString:@"A3D35CE7-048E-4749-A9EB-5D651191669B"]
#define BEACON_IDENTIFIER @"BEPiD.iBeaconClass"


@interface IBCViewController ()

@end

@implementation IBCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    self.peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self queue:nil options:nil];

    CLBeaconRegion *region = [[CLBeaconRegion alloc] initWithProximityUUID:BEACON_UUID major:10 identifier:BEACON_IDENTIFIER];
    
    peripheralData = [region peripheralDataWithMeasuredPower:[NSNumber numberWithInt:-59]];
    
    
}

-(void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral {
    if (peripheral.state == CBPeripheralManagerStatePoweredOn) {
        NSLog(@"Powered On");
        [self.peripheralManager startAdvertising:peripheralData];
    } else if (peripheral.state == CBPeripheralManagerStatePoweredOff) {
        NSLog(@"Powered Off");
        [self.peripheralManager stopAdvertising];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
