//
//  ViewController.h
//  Tut Accelerometer
//
//  Created by Quix Creations Singapore iOS 1 on 23/8/15.
//  Copyright (c) 2015 Terry Chia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIAccelerometerDelegate>{
    
    float valueX;
    float valueY;
    
    
}

@property(nonatomic, strong) IBOutlet UIButton *buttonMoving;

-(void)awakeAccelerometer;
-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration;

@end

