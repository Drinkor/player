//
//  ViewController.h
//  Player
//
//  Created by Евгений Сергеев on 21.08.14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController : UIViewController <AVAudioPlayerDelegate>
- (IBAction)PlayPause:(id)sender;
- (IBAction)Stop:(id)sender;
- (IBAction)Volume:(id)sender;
- (IBAction)Progress:(id)sender;
- (IBAction)NextSong:(id)sender;
- (IBAction)PreviousSong:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *PlayPauseButton;
@property (weak, nonatomic) IBOutlet UISlider *VolumeSlider;
@property (weak, nonatomic) IBOutlet UISlider *ProgressSlider;
@property (weak, nonatomic) IBOutlet UILabel *currentTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *durationTimeLabel;

@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (strong, nonatomic) NSTimer *sliderTimer;

@property (weak, nonatomic) IBOutlet UILabel *SongName;

@property NSString *str;
@property NSArray *arr;

- (NSString*)stringFromInterval:(NSTimeInterval)interval;
- (void) updateSlider;

@end
