#import "Game.h"

@interface Game ()

@end

@implementation Game

-(void)Scoring {
    
    scoreNum += (50 - ObjHeight);
    Score.text = [NSString stringWithFormat:@"%i", scoreNum];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    ObjLeft = NO;
    ObjRight = NO;
    StopSideMovement = YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    
    if(point.x < 160) {
        ObjLeft = YES;
    }
    else {
        ObjRight = YES;
    }
    
}

-(void)GameOver{
    
    [PlatMove invalidate];
    [ObjMove invalidate];
    
    Play.hidden = YES;
    Exit.hidden = NO;
    
}

-(IBAction)Start:(id)sender {
    
    
    Play.hidden = YES;
    Platform1.hidden = NO;
    //[self PlacePlatform1];
    direction1 = 1.5;
    direction4 = 1.5;
    
    
    scoreNum = 0;
    height = 0;
    
    
    ObjMove = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(ObjMoving) userInfo:nil repeats:YES];
    
    PlatMove = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(PlatformMoving) userInfo:nil repeats:YES];
    
    
}

-(void)ObjMoving {
    
    if(timer > timerCount + 3){
        if(SideMovement > 0){
            if(DontChangeImage == NO)
                Obj.image = [UIImage imageNamed:@"right.png"];
            direction = 1;
        }
        if(SideMovement < 0) {
            if(DontChangeImage == NO)
                Obj.image = [UIImage imageNamed:@"left.png"];
            direction = 0;
        }
    }
    
        
    Obj.center = CGPointMake(Obj.center.x + SideMovement, Obj.center.y - ObjHeight);
    
    if(ObjDrop == YES)
        ObjHeight = ObjHeight - 5;
    
    if(ObjHeight < -15)
        ObjHeight = -15;
    
    if(Obj.center.x > 300)
        Obj.center = CGPointMake(-25, Obj.center.y);
    if(Obj.center.x < -25)
        Obj.center = CGPointMake(300, Obj.center.y);
    
    if(ObjLeft == YES) {
        SideMovement = SideMovement - 1.2;
        if(SideMovement < -15) {
            SideMovement = -15;
        }
    }
    if(ObjRight == YES) {
        SideMovement = SideMovement + 1.2;
        if(SideMovement > 15) {
            SideMovement = 15;
        }
    }
    if(StopSideMovement == YES && SideMovement > 0) {
        SideMovement = SideMovement - .8;
        if(SideMovement < 0) {
            SideMovement = 0;
            StopSideMovement = NO;
        }
    }
    if(StopSideMovement == YES && SideMovement < 0) {
        SideMovement = SideMovement + .8;
        if(SideMovement > 0) {
            SideMovement = 0;
            StopSideMovement = NO;
        }
    }
    
}

-(void)PlacePlatform1 {
    
    Platform1.center = CGPointMake(arc4random() % 270 + 35, -45);
    Platform1.hidden = NO;
}

-(void)PlacePlatform2 {
    
    Platform2.center = CGPointMake(arc4random() % 270 + 35, -45);
    Spring1.image = [UIImage imageNamed:@"spring.png"];
}

-(void)PlacePlatform3 {
    
    Platform3.center = CGPointMake(arc4random() % 270 + 35, -45);
}

-(void)PlacePlatform4 {
    
    Platform4.center = CGPointMake(arc4random() % 270 + 35, -45);
}

-(void)PlacePlatform5 {
    
    Platform5.center = CGPointMake(arc4random() % 270 + 35, -45);
}



-(void)MoveDown {
    Platform1.center = CGPointMake(Platform1.center.x + direction1, Platform1.center.y + height);
    Platform2.center = CGPointMake(Platform2.center.x, Platform2.center.y + height);
    Platform3.center = CGPointMake(Platform3.center.x, Platform3.center.y + height);
    Platform4.center = CGPointMake(Platform4.center.x + direction4, Platform4.center.y + height);
    Platform5.center = CGPointMake(Platform5.center.x, Platform5.center.y + height);
    
    Flake1.center = CGPointMake(Flake1.center.x, Flake1.center.y + height);
    Flake2.center = CGPointMake(Flake2.center.x, Flake2.center.y + height);
    Flake3.center = CGPointMake(Flake3.center.x, Flake3.center.y + height);
    Flake4.center = CGPointMake(Flake4.center.x, Flake4.center.y + height);
    Flake5.center = CGPointMake(Flake5.center.x, Flake5.center.y + height);
    Flake6.center = CGPointMake(Flake6.center.x, Flake6.center.y + height);
    Flake7.center = CGPointMake(Flake7.center.x, Flake7.center.y + height);
    Flake8.center = CGPointMake(Flake8.center.x, Flake8.center.y + height);
    
    FakePlat1.center = CGPointMake(FakePlat1.center.x, FakePlat1.center.y + height + fakeHeight1);
    FakePlat2.center = CGPointMake(FakePlat2.center.x, FakePlat2.center.y + height + fakeHeight2);
    
    ClearPlat1.center = CGPointMake(ClearPlat1.center.x, ClearPlat1.center.y + height);
    ClearPlat2.center = CGPointMake(ClearPlat2.center.x, ClearPlat2.center.y + height);
    
    Spring1.center = CGPointMake(Platform2.center.x, Platform2.center.y - 22);
    
    if(special == 'J') {
        JetPack.center = CGPointMake(JetPack.center.x, JetPack.center.y + 10 + height);
        if(JetPack.center.y > 585) {
            special = ' ';
            JetPack.hidden = YES;
        }
    }
    else if(special != 'j')
        JetPack.center = CGPointMake(Platform1.center.x, Platform1.center.y - 27);
    
}
-(void)PlatformMoving {
    
    timer++;
    
    if(DontChangeImage == NO) {
        if(timer == timerCount + 1)
            Obj.image = [UIImage imageNamed:@"squish.png"];
        if(timer == timerCount + 2)
            Obj.image = [UIImage imageNamed:@"squish2.png"];
        if(timer > timerCount + 3) {
            if(direction == 1)
                Obj.image = [UIImage imageNamed:@"right.png"];
            else
                Obj.image = [UIImage imageNamed:@"left.png"];
        }
    }
    
    
    if(ObjDrop == NO)
        [self SpecialTouch];

    [self MoveDown];
    
    if(special == 'j')
        [self JetPack];
    
    if(Platform1.center.y > 570){
        [self PlacePlatform1];
        if(scoreNum > 250 && special != 'j' && jetPackCount == 0)
            JetPack.hidden = NO;
    }
    if(Platform2.center.y > 570){
        [self PlacePlatform2];
        //if(scoreNum > 100)
            Spring1.hidden = NO;
        Spring1.image = [UIImage imageNamed:@"spring.png"];
    }
    if(Platform3.center.y > 570)
        [self PlacePlatform3];
    if(Platform4.center.y > 570)
        [self PlacePlatform4];
    if(Platform5.center.y > 570)
        [self PlacePlatform5];
    if(Platform1.center.x < 35)
        direction1 = 1.5;
    if(Platform1.center.x > 270)
        direction1 = -1.5;
    if(Platform4.center.x < 35)
        direction4 = 1.5;
    if(Platform4.center.x > 270)
        direction4 = -1.5;
    
    if(Flake1.center.y > 570)
        Flake1.center = CGPointMake(Flake1.center.x, -45);
    if(Flake2.center.y > 570)
        Flake2.center = CGPointMake(Flake2.center.x, -45);
    if(Flake3.center.y > 570)
        Flake3.center = CGPointMake(Flake3.center.x, -45);
    if(Flake4.center.y > 570)
        Flake4.center = CGPointMake(Flake4.center.x, -45);
    if(Flake5.center.y > 570)
        Flake5.center = CGPointMake(Flake5.center.x, -45);
    if(Flake6.center.y > 570)
        Flake6.center = CGPointMake(Flake6.center.x, -45);
    if(Flake7.center.y > 570)
        Flake7.center = CGPointMake(Flake7.center.x, -45);
    if(Flake8.center.y > 570)
        Flake8.center = CGPointMake(Flake8.center.x, -45);
    
    
    
    if(FakePlat1.center.y > 570) {
        FakePlat1.center = CGPointMake(arc4random() % 270 + 35, -45);
        FakePlat1.image = [UIImage imageNamed:@"Block2.png"];
        fakeHeight1 = 0;
    }
    if(CGRectIntersectsRect(Obj.frame, FakePlat1.frame) && ObjHeight < -2 && FakePlat1.image != [UIImage imageNamed:@"BlockBreak.png"]) {
        FakePlat1.image = [UIImage imageNamed:@"BlockBreak.png"];
        fakeHeight1 = 10;
        [self PlatBreak];
    }
    if(FakePlat2.center.y > 570) {
        FakePlat2.center = CGPointMake(arc4random() % 270 + 35, -45);
        FakePlat2.image = [UIImage imageNamed:@"Block2.png"];
        fakeHeight2 = 0;
    }
    if(CGRectIntersectsRect(Obj.frame, FakePlat2.frame) && ObjHeight < -2 && FakePlat2.image != [UIImage imageNamed:@"BlockBreak.png"]) {
        FakePlat2.image = [UIImage imageNamed:@"BlockBreak.png"];
        fakeHeight2 = 10;
        [self PlatBreak];
    }
    
    
    if(ClearPlat1.center.y > 570) {
        ClearPlat1.center = CGPointMake(arc4random() % 270 + 35, -45);
        ClearPlat1.hidden = NO;
    }
    if(CGRectIntersectsRect(Obj.frame, ClearPlat1.frame) && ObjHeight < -2 && ClearPlat1.hidden == NO) {
        [self Squish];
        height = 20;
        ObjHeight = 40 - ((500 - ClearPlat1.center.y)/10);
        [self Scoring];
        [self PlatformTouch];
        ClearPlat1.hidden = YES;
    }
    if(ClearPlat2.center.y > 570) {
        ClearPlat2.center = CGPointMake(arc4random() % 270 + 35, -45);
        ClearPlat2.hidden = NO;
    }
    if(CGRectIntersectsRect(Obj.frame, ClearPlat2.frame) && ObjHeight < -2 && ClearPlat2.hidden == NO) {
        [self Squish];
        height = 20;
        ObjHeight = 40 - ((500 - ClearPlat2.center.y)/10);
        [self Scoring];
        [self PlatformTouch];
        ClearPlat2.hidden = YES;
    }

    
    if(CGRectIntersectsRect(Obj.frame, Spring1.frame) && ObjHeight < -2 &&
       Spring1.hidden == NO && Spring1.center.y > Obj.center.y && Obj.center.y > Spring1.center.y - 20) {
        Spring1.image = [UIImage imageNamed:@"spring2"];
        [self Squish];
        //Obj.center = CGPointMake(Obj.center.x, 230);
        ObjDrop = NO;
        whatPlatform = 0;
        height = 35;
        ObjHeight = 0; //50 - ((500 - Spring1.center.y)/10);
        [self Scoring];
        [self SpringTouch];
        AudioServicesPlaySystemSound(Boing);
    }
    
    if(CGRectIntersectsRect(Obj.frame, JetPack.frame) && JetPack.hidden == NO && special != 'J') {
        height = 80;
        whatPlatform = 0;
        ObjHeight = 0;
        ObjDrop = NO;
        [self Scoring];
        JetPack.hidden = YES;
        DontChangeImage = YES;
        special = 'j';
        jetPackCount++;
        AudioServicesPlaySystemSound(jetpack);
    
    }
    
    if(Platform1.center.y > 570)
        [self PlacePlatform1];
    if(Platform2.center.y > 570)
        [self PlacePlatform2];
    if(Platform3.center.y > 570)
        [self PlacePlatform3];
    if(Platform4.center.y > 570)
        [self PlacePlatform4];
    if(Platform5.center.y > 570)
        [self PlacePlatform5];
    
    
    if(CGRectIntersectsRect(Obj.frame, Platform1.frame) && ObjHeight < -2 &&
       Platform1.center.y > Obj.center.y && Platform1.hidden == NO) {
        [self Squish];
        whatPlatform = 1;
        height = 20;
        ObjHeight = 40 - ((500 - Platform1.center.y)/10);
        [self Scoring];
        [self PlatformTouch];
    
    }
    
    if(CGRectIntersectsRect(Obj.frame, Platform2.frame) && ObjHeight < -2 &&
       Platform2.center.y > Obj.center.y && Platform2.hidden == NO) {
        [self Squish];
        whatPlatform = 2;
        height = 20;
        ObjHeight = 40 - ((500 - Platform2.center.y)/10);
        [self Scoring];
        [self PlatformTouch];
    }
    if(CGRectIntersectsRect(Obj.frame, Platform3.frame) && ObjHeight < -2 &&
       Platform3.center.y > Obj.center.y && Platform3.hidden == NO) {
        [self Squish];
        whatPlatform = 3;
        height = 20;
        ObjHeight = 40 - ((500 - Platform3.center.y)/10);
        [self Scoring];
        [self PlatformTouch];
    }
    if(CGRectIntersectsRect(Obj.frame, Platform4.frame) && ObjHeight < -2 &&
       Platform4.center.y > Obj.center.y && Platform4.hidden == NO) {
        [self Squish];
        whatPlatform = 4;
        height = 20;
        ObjHeight = 40 - ((500 - Platform4.center.y)/10);
        [self Scoring];
        [self PlatformTouch];
    }
    if(CGRectIntersectsRect(Obj.frame, Platform5.frame) && ObjHeight < -2 &&
       Platform5.center.y > Obj.center.y && Platform5.hidden == NO) {
        [self Squish];
        whatPlatform = 5;
        height = 20;
        ObjHeight = 40 - ((500 - Platform5.center.y)/10);
        [self Scoring];
        [self PlatformTouch];
    }
    if(Obj.center.y > 585)
        [self GameOver];
    
    //while(height > 0)
       // scoreNum ++;
    height = height - .000001;
    
    if(Platform1.center.y > 570)
        [self PlacePlatform1];
    if(Platform2.center.y > 570)
        [self PlacePlatform2];
    if(Platform3.center.y > 570)
        [self PlacePlatform3];
    if(Platform4.center.y > 570)
        [self PlacePlatform4];
    if(Platform5.center.y > 570)
        [self PlacePlatform5];
    
    if(height == 0) {
        ObjDrop = YES;
        DontChangeImage = NO;
        //special = ' ';
    }
    if(height < 0) {
        height = 0;
    }
    if(whatPlatform == 1 && Platform1.center.y > 500) {
        height = 0;
        whatPlatform = 0;
    }
    if(whatPlatform == 2 && Platform2.center.y > 500) {
        height = 0;
        whatPlatform = 0;
    }
    if(whatPlatform == 3 && Platform3.center.y > 500) {
        height = 0;
        whatPlatform = 0;
    }
    if(whatPlatform == 4 && Platform4.center.y > 500) {
        height = 0;
        whatPlatform = 0;
    }
    if(whatPlatform == 5 && Platform5.center.y > 500) {
        height = 0;
        whatPlatform = 0;
    }
        
}

-(void)JetPack {
    if(direction == 1) {
        Obj.image = [UIImage imageNamed:@"jetright.png"];
        if(height < 5) {
            special = 'J';
            JetPack.center = CGPointMake(Obj.center.x - 30, JetPack.center.y + 8);
            Obj.image = [UIImage imageNamed:@"right.png"];
            JetPack.hidden = NO;
        }
    }
    else {
        Obj.image = [UIImage imageNamed:@"jetleft.png"];
        if(height < 5) {
            special = 'J';
            JetPack.center = CGPointMake(Obj.center.x + 30, JetPack.center.y + 8);
            Obj.image = [UIImage imageNamed:@"left.png"];
            JetPack.hidden = NO;
        }
    }
    if(JetPack.center.y > 585)
        special = ' ';
}

-(void)PlatformTouch {
    AudioServicesPlaySystemSound(PlatTouch);
}

-(void)PlatBreak {
    AudioServicesPlaySystemSound(PlatBreak);
}

-(void)Squish {
    Obj.image = [UIImage imageNamed:@"squish2.png"];
    timerCount = timer;
}

-(void)SpecialTouch {
    if(Obj.center.y > 250)
        Obj.center = CGPointMake(Obj.center.x, Obj.center.y - 15);
}

-(void)SpringTouch {
    if(Obj.center.y > 250)
        Obj.center = CGPointMake(Obj.center.x, Obj.center.y - 15);
    if(Spring1.image != [UIImage imageNamed:@"spring3"])
       Spring1.image = [UIImage imageNamed:@"spring3"];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    NSURL *SoundURL2 = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"boing" ofType:@"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef) SoundURL2, &Boing);
    
    NSURL *SoundURL3 = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"PlatTouch" ofType:@"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef) SoundURL3, &PlatTouch);
    
    NSURL *SoundURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"PlatBreak" ofType:@"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef) SoundURL, &PlatBreak);
    
    NSURL *SoundURL4 = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"jetpack" ofType:@"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef) SoundURL4, &jetpack);

    
    SideMovement = 0;
    jetPackCount = 0;
    JetPack.hidden = YES;
    timer = 0;
    direction = 1;
    ObjDrop = YES;
    Spring1.hidden = YES;
    //Platform1.hidden = YES;
    Exit.hidden = YES;
    /*Flake1.hidden = YES;
    Flake2.hidden = YES;
    Flake3.hidden = YES;
    Flake4.hidden = YES;
    Flake5.hidden = YES;
    Flake6.hidden = YES;
    Flake7.hidden = YES;
    Flake8.hidden = YES;*/
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"images.png"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
