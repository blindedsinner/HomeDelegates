//
//  Patient.h
//  HomeDelegates
//
//  Created by MacBook on 11.10.17.
//  Copyright © 2017 Anton Sydorchuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@protocol PatientDelegate;

@interface Patient : NSObject

@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) CGFloat temperature;
@property (assign, nonatomic) BOOL isSick;
@property (assign, nonatomic) BOOL isGoodDoctor;
@property (weak, nonatomic) id <PatientDelegate> delegate;

- (void) isWorse;
- (void) pain;
- (BOOL) randomPain;

@end

@protocol PatientDelegate <NSObject>

@property (assign, nonatomic) BOOL patientIsHead;
@property (assign, nonatomic) BOOL patientIsArms;
@property (assign, nonatomic) BOOL patientIsLegs;
@property (assign, nonatomic) BOOL patientIsStomach;

- (void) patientCallDoctor:(Patient*) patient;

@end

