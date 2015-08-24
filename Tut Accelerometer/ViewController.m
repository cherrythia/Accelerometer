//
//  ViewController.m
//  Tut Accelerometer
//
//  Created by Quix Creations Singapore iOS 1 on 23/8/15.
//  Copyright (c) 2015 Terry Chia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//synthesis
@synthesize buttonMoving;

//awake accelerometer
-(void)awakeAccelerometer{
    
    //start accelerometer
    [[UIAccelerometer sharedAccelerometer]setUpdateInterval:1.0/60.0];
    [[UIAccelerometer sharedAccelerometer] setDelegate:self];
    
    NSLog(@"Accelerometer Started");
    
}

-(void) accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration{
    
    #define MovingObjectRadius 34
    
    //accekeration for player
    valueX = acceleration.x * 45.0;
    valueY = acceleration.y * 45.0;
    
    //create new integers
    int intPlayerNewPosX = (int)(buttonMoving.center.x + valueX);
    int intPlayerNewPosY = (int)(buttonMoving.center.y + valueY);
    
    //position validation
    if (intPlayerNewPosX > (self.view.frame.size.width - MovingObjectRadius)) {
        intPlayerNewPosX = (self.view.frame.size.width - MovingObjectRadius);
    }
    
    if(intPlayerNewPosX < (0 + MovingObjectRadius)){
        intPlayerNewPosX = (0 + MovingObjectRadius);
    }
    
    if (intPlayerNewPosY > (self.view.frame.size.height - MovingObjectRadius)) {
        intPlayerNewPosY = (self.view.frame.size.height - MovingObjectRadius);
    }
    
    if (intPlayerNewPosY <(0 + MovingObjectRadius)) {
        intPlayerNewPosY = (0 + MovingObjectRadius);
    }
    
    //Make the new point
    CGPoint buttonNewMake = CGPointMake(intPlayerNewPosX, intPlayerNewPosY);
    buttonMoving.center = buttonNewMake;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated{
    [self awakeAccelerometer];
}

-(void)viewDidDisappear:(BOOL)animated{
    //Kill accelerometer
    [[UIAccelerometer sharedAccelerometer]setDelegate:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
