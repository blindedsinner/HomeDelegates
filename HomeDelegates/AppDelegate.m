//
//  AppDelegate.m
//  HomeDelegates
//
//  Created by MacBook on 11.10.17.
//  Copyright © 2017 Anton Sydorchuk. All rights reserved.
//

#import "AppDelegate.h"
#import "Patient.h"
#import "Doctor.h"
#import "NewDoctor.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//Ученик:
//
//1. Создать пару пациентов и доктора по тому же принципу что и в видео. (Доктор делегат у пациентов)
//2. У пациента пусть будет температура и другие симптомы, по которым доктор может принимать решение.
//3. У пациента сделайте метод типа стало хуже и пусть когда станет хуже, то он идет к доктору
//4. Всех пациентов объедините в массив и в цикле вызовите метод "стало хуже".
//5. Доктор должен лечить каждого согласно симптомам.
//
//Студент:
//
//6. Создайте другой класс доктора, не наследника от первого доктора, например друг :)
//7. этот друг должен лечить своих пациентов своими собственными методами и короче плохой он доктор
//8. пусть кто-то ходит к врачу, а кто-то к нему
//9. создайте пару разных объектов класса друг и пусть они лечат своих пациентов (чтобы понять что делегат это не класс, а объект)
//
//Мастер:
//
//10. Создайте список частей тела в делегате пациента (голова, живот, нога и тд) и когда пациент приходит к врачу, пусть говорит что болит.
//11. Доктор должен принимать во внимание что болит
//12. Создайте у доктора метод "рапорт". Пусть в конце дня, когда все уже нажаловались достаточно, доктор составит рапорт (выдаст имена) тех у кого болит голова, потом тех у кого болел живот и тд
//
//Супермен
//
//13. Создайте в классе пациента проперти - оценка доктору.
//14. Когда доктор вам назначает лечение некоторые пациенты должны стать недовольны.
//15. В конце дня после того как все лечение будет сделано и доктор напишет рапорт, надо пройтись по пациентам и всем недовольным поменять доктора.
//16. Начать новый день и убедиться что Недовольные пациенты таки поменяли доктора.

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    Patient* patient1 = [[Patient alloc] init];
    patient1.name = @"p1";
    patient1.temperature = 36.6f;
    patient1.isSick = NO;
    
    
    Patient* patient2 = [[Patient alloc] init];
    patient2.name = @"p2";
    patient2.temperature = 37.2f;
    patient2.isSick = NO;
    
    Patient* patient3 = [[Patient alloc] init];
    patient3.name = @"p3";
    patient3.temperature = 38.3f;
    patient3.isSick = YES;
    
    Patient* patient4 = [[Patient alloc] init];
    patient4.name = @"p4";
    patient4.temperature = 36.6f;
    patient4.isSick = YES;
    
    Patient* patient5 = [[Patient alloc] init];
    patient5.name = @"p5";
    patient5.temperature = 40.f;
    patient5.isSick = YES;
    
    Doctor* doctor = [[Doctor alloc] init];
    NewDoctor* newDoctor = [[NewDoctor alloc] init];
    
    patient1.delegate = doctor;
    patient2.delegate = newDoctor;
    patient3.delegate = doctor;
    patient4.delegate = newDoctor;
    patient5.delegate = doctor;
    
    NSArray* patients = [NSArray arrayWithObjects:patient1, patient2, patient3, patient4, patient5, nil];
    
    for (Patient* obj in patients) {
        NSLog (@"%@", obj.name);
        [obj isWorse];
        [obj pain];
        
        if ( obj.delegate == doctor ) {
            [doctor raport];
        }
        else if ( obj.delegate == newDoctor ) {
            [newDoctor raport];
        }
        
        if (obj.isGoodDoctor == NO && obj.delegate == doctor) {
            obj.delegate = newDoctor;
        }
        else if (obj.isGoodDoctor == NO && obj.delegate == newDoctor) {
            obj.delegate = doctor;
        }
        NSLog (@"%@", obj.delegate);
    }
    
    
    
    return YES;

}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
