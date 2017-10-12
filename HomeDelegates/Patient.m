//
//  Patient.m
//  HomeDelegates
//
//  Created by MacBook on 11.10.17.
//  Copyright © 2017 Anton Sydorchuk. All rights reserved.
//

#import "Patient.h"

@implementation Patient

- (void) isWorse {
    [self.delegate patientCallDoctor:self];
    self.isGoodDoctor = [self randomPain];
}

- (BOOL) randomPain {
    return arc4random() % 2;
}

- (void) pain {
    [self.delegate setPatientIsHead:[self randomPain]];
    [self.delegate setPatientIsArms:[self randomPain]];
    [self.delegate setPatientIsLegs:[self randomPain]];
    [self.delegate setPatientIsStomach:[self randomPain]];
}

@end
