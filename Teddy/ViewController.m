//
//  ViewController.m
//  Teddy
//
//  Created by mwang on 12/26/15.
//  Copyright © 2015 bear. All rights reserved.
//

#import "ViewController.h"
#import "ComAirAPI_V1.0.5.h"
#import <AVFoundation/AVFoundation.h>
#include <AudioToolbox/AudioToolbox.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController () <UIScrollViewDelegate>
{
    IBOutlet UIScrollView *scroller;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    scroller.pagingEnabled = YES;
    scroller.showsHorizontalScrollIndicator = NO;
    scroller.delegate =self;
    [scroller setContentSize:CGSizeMake(scroller.frame.size.width*10,scroller.frame.size.height)];
    
    UIImageView *p1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, scroller.frame.size.width,scroller.frame.size.height)];
    p1.image = [UIImage imageNamed: @"123.jpg"];
    
    UIImageView *p2 = [[UIImageView alloc]initWithFrame:CGRectMake(scroller.frame.size.width, 0, scroller.frame.size.width,scroller.frame.size.height)];
    p2.image = [UIImage imageNamed: @"one.png"];
    
    UIImageView *p3 = [[UIImageView alloc]initWithFrame:CGRectMake(scroller.frame.size.width*2, 0, scroller.frame.size.width,scroller.frame.size.height)];
    p3.image = [UIImage imageNamed: @"Two (1).jpg"];
    
    UIImageView *p4 = [[UIImageView alloc]initWithFrame:CGRectMake(scroller.frame.size.width*3, 0, scroller.frame.size.width,scroller.frame.size.height)];
    p4.image = [UIImage imageNamed: @"three (1).png"];
    
    UIImageView *p5 = [[UIImageView alloc]initWithFrame:CGRectMake(scroller.frame.size.width*4, 0, scroller.frame.size.width,scroller.frame.size.height)];
    p5.image = [UIImage imageNamed: @"four (1).png"];
    
    UIImageView *p6 = [[UIImageView alloc]initWithFrame:CGRectMake(scroller.frame.size.width*5, 0, scroller.frame.size.width,scroller.frame.size.height)];
    p6.image = [UIImage imageNamed: @"five (1).png"];
    
    UIImageView *p7 = [[UIImageView alloc]initWithFrame:CGRectMake(scroller.frame.size.width*6, 0, scroller.frame.size.width,scroller.frame.size.height)];
    p7.image = [UIImage imageNamed: @"muppet-alphabet-final-2.png"];
    
    UIImageView *p8 = [[UIImageView alloc]initWithFrame:CGRectMake(scroller.frame.size.width*7, 0, scroller.frame.size.width,scroller.frame.size.height)];
    p8.image = [UIImage imageNamed: @"How old are you (1).jpg"];
    
    UIImageView *p9 = [[UIImageView alloc]initWithFrame:CGRectMake(scroller.frame.size.width*8, 0, scroller.frame.size.width,scroller.frame.size.height)];
    p9.image = [UIImage imageNamed: @"whats your name.jpg"];
    
    UIImageView *p10 = [[UIImageView alloc]initWithFrame:CGRectMake(scroller.frame.size.width*9, 0, scroller.frame.size.width,scroller.frame.size.height)];
    p10.image = [UIImage imageNamed: @"what's your favorite food (1).png"];
    
    
    
    [scroller addSubview:p1];
    [scroller addSubview:p2];
    [scroller addSubview:p3];
    [scroller addSubview:p4];
    [scroller addSubview:p5];
    [scroller addSubview:p6];
    [scroller addSubview:p7];
    [scroller addSubview:p8];
    [scroller addSubview:p9];
    [scroller addSubview:p10];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) runCamAir {
    //route audio output to speaker
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    
    /*OSStatus propertySetError = 0;
     UInt32 allowMixing = true;
     propertySetError = AudioSessionSetProperty(kAudioSessionProperty_OverrideCategoryMixWithOthers, sizeof(allowMixing), &allowMixing);
     NSLog(@"Mixing: %x", propertySetError); // This should be 0 or there was an issue somewhere
     */
    UInt32 audioRouteOverride = kAudioSessionOverrideAudioRoute_Speaker;
    AudioSessionSetProperty (kAudioSessionProperty_OverrideAudioRoute,sizeof (audioRouteOverride),&audioRouteOverride);
    
    [[AVAudioSession sharedInstance] setActive:YES error:nil];
    [[UIApplication sharedApplication]setIdleTimerDisabled:YES];
    
    InitComAirAudio();
    
    [self PlayNumber:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(bool)	PlayNumber:(int)Number
{
    
    NSString *SoundIndex = [[NSString alloc]initWithFormat:@"n%d",Number];
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource: SoundIndex ofType: @"wav"];
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath: soundFilePath];
    
    PlaySoundWithComAirCmd(fileURL,1,Number);

    return true;
}

@end
