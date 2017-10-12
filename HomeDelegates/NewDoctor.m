//
//  NewDoctor.m
//  HomeDelegates
//
//  Created by MacBook on 11.10.17.
//  Copyright © 2017 Anton Sydorchuk. All rights reserved.
//

#import "NewDoctor.h"

@implementation NewDoctor

@synthesize patientIsHead;
@synthesize patientIsArms;
@synthesize patientIsLegs;
@synthesize patientIsStomach;

- (void) goAway {
    NSLog (@"GO AWAY!");
}

- (void) fuckOff {
    NSLog (@"I DON'T WANT TO SEE YOU!");
}

- (void) givePieceOfShit {
    NSLog (@"Take this shit and GET OUT!");
}

- (void) atLast {
    NSLog (@"At last you dead :)");
}

- (void) raport {
    if (self.patientIsHead) {
        NSLog(@"Patient told about pain in FUCKING head");
    }
    if (self.patientIsLegs) {
        NSLog(@"Patient told about pain in FUCKING legs");
    }
    if (self.patientIsArms) {
        NSLog(@"Patient told about pain in FUCKING arms");
    }
    if (self.patientIsStomach) {
        NSLog(@"Patient told about pain in FUCKING stomach");
    }
}

# pragma mark - PatientDelegate

- (void) patientCallDoctor:(Patient*) patient {
    if (patient.temperature > 37 && patient.temperature < 39 && patient.isSick == NO) {
        [self goAway];
    }
    else if (patient.temperature > 37 && patient.temperature < 39 && patient.isSick == YES) {
        [self fuckOff];
    }
    else if (patient.temperature < 37 && patient.isSick == NO ) {
        [self givePieceOfShit];
    }
    else if (patient.temperature < 37 && patient.isSick == YES ) {
        [self goAway];
    }
    else if (patient.temperature > 39 && patient.isSick == NO) {
        [self fuckOff];
    }
    else if (patient.temperature > 39 && patient.isSick == YES) {
        [self atLast];
    }
}





@end
