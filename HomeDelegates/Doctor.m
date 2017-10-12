//
//  Doctor.m
//  HomeDelegates
//
//  Created by MacBook on 11.10.17.
//  Copyright © 2017 Anton Sydorchuk. All rights reserved.
//

#import "Doctor.h"
#import "Patient.h"

@implementation Doctor

@synthesize patientIsArms;
@synthesize patientIsStomach;
@synthesize patientIsLegs;
@synthesize patientIsHead;

- (void) giveCandy {
    NSLog (@"You are free!");
}

- (void) giveMedecine {
    NSLog (@"Tasty!");
    
}

- (void) putInHospital {
    NSLog (@"Take pillow.");
}

- (void) rip {
    NSLog (@"Rest In Peace");
}

- (void) raport {
    if (self.patientIsHead == YES) {
        NSLog(@"Patient told about pain in head");
    }
    if (self.patientIsLegs == YES) {
        NSLog(@"Patient told about pain in legs");
    }
    if (self.patientIsArms == YES) {
        NSLog(@"Patient told about pain in arms");
    }
    if (self.patientIsStomach == YES) {
        NSLog(@"Patient told about pain in stomach");
    }
}

#pragma mark - ParientDelegate

- (void) patientCallDoctor:(Patient *)patient {
    if (patient.temperature > 37 && patient.temperature < 39 && patient.isSick == NO) {
        [self giveMedecine];
    }
    else if (patient.temperature > 37 && patient.temperature < 39 && patient.isSick == YES) {
        [self putInHospital];
    }
    else if (patient.temperature < 37 && patient.isSick == NO ) {
        [self giveCandy];
    }
    else if (patient.temperature < 37 && patient.isSick == YES ) {
        [self giveMedecine];
    }
    else if (patient.temperature > 39 && patient.isSick == NO) {
        [self putInHospital];
    }
    else if (patient.temperature > 39 && patient.isSick == YES) {
        [self rip];
    }
}






@end
