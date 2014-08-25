//
//  TableViewController.h
//  Player
//
//  Created by Евгений Сергеев on 23.08.14.
//  Copyright (c) 2014 Евгений Сергеев. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface TableViewController : UITableViewController

@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (strong, nonatomic) NSTimer *sliderTimer;

@property (weak, nonatomic) IBOutlet UILabel *SongName;

@property (weak, nonatomic) IBOutlet UIButton *PlayPauseButton;
@property (weak, nonatomic) IBOutlet UISlider *VolumeSlider;
@property (weak, nonatomic) IBOutlet UISlider *ProgressSlider;
@property (weak, nonatomic) IBOutlet UILabel *currentTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *durationTimeLabel;

@end
