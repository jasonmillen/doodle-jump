//
//  Game.h
//  Doodle Jump
//
//  Created by Jason Millen on 9/13/14.
//  Copyright (c) 2014 Jason Millen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>



int ObjHeight;
float SideMovement;
int scoreNum;
int height;
float direction1;
float direction4;
int whatPlatform;
int fakeHeight1;
int fakeHeight2;
int direction;
int timer;
int timerCount;
int jetPackCount;

BOOL ObjLeft;
BOOL ObjRight;
BOOL StopSideMovement;

BOOL ObjDrop;
BOOL DontChangeImage;

char special;

@interface Game : UIViewController {
    
    SystemSoundID Boing;
    SystemSoundID PlatTouch;
    SystemSoundID PlatBreak;
    SystemSoundID jetpack;
    
    IBOutlet UIImageView *Obj;
    IBOutlet UIButton *Play;
    IBOutlet UIImageView *Platform1;
    IBOutlet UIImageView *Platform2;
    IBOutlet UIImageView *Platform3;
    IBOutlet UIImageView *Platform4;
    IBOutlet UIImageView *Platform5;
    IBOutlet UIButton *Exit;
    IBOutlet UILabel *Score;
    
    IBOutlet UIImageView *Flake1;
    IBOutlet UIImageView *Flake2;
    IBOutlet UIImageView *Flake3;
    IBOutlet UIImageView *Flake4;
    IBOutlet UIImageView *Flake5;
    IBOutlet UIImageView *Flake6;
    IBOutlet UIImageView *Flake7;
    IBOutlet UIImageView *Flake8;
    
    IBOutlet UIImageView *FakePlat1;
    IBOutlet UIImageView *FakePlat2;
    
    IBOutlet UIImageView *ClearPlat1;
    IBOutlet UIImageView *ClearPlat2;
    
    IBOutlet UIImageView *Spring1;
    IBOutlet UIImageView *JetPack;
    
    
    
    NSTimer *ObjMove;
    NSTimer *PlatMove;
    
}

-(IBAction)Start:(id)sender;
-(void)ObjMoving;
-(void)PlacePlatform1;
-(void)PlacePlatform2;
-(void)PlacePlatform3;
-(void)PlacePlatform4;
-(void)PlacePlatform5;
-(void)PlatformMoving;
-(void)GameOver;
-(void)Scoring;
-(void)MoveDown;
-(void)SpringTouch;
-(void)SpecialTouch;
-(void)Squish;
-(void)JetPack;
-(void)PlatformTouch;
-(void)PlatBreak;

@end
