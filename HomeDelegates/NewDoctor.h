//
//  NewDoctor.h
//  HomeDelegates
//
//  Created by MacBook on 11.10.17.
//  Copyright © 2017 Anton Sydorchuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Patient.h"

@interface NewDoctor : NSObject <PatientDelegate>

@property (assign, nonatomic) BOOL isHead;
@property (assign, nonatomic) BOOL isArms;
@property (assign, nonatomic) BOOL isLegs;
@property (assign, nonatomic) BOOL isStomach;

- (void) goAway;
- (void) fuckOff;
- (void) givePieceOfShit;
- (void) atLast;

- (void) raport;

@end
