//
//  ViewController.h
//  Teddy
//
//  Created by mwang on 12/26/15.
//  Copyright © 2015 bear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

#define MAXTHRESHOLD	128

@interface ViewController : UIViewController{
    int								m_i32Threshold;
    AVAudioPlayer					*m_audioPlayer;
}

-(bool)		PlayNumber:(int)Number;

@end

