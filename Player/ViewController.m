//
//  ViewController.m
//  Player
//
//  Created by Евгений Сергеев on 21.08.14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSError *error = nil;
    
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Arctic Monkeys - Crying Lightning" ofType:@"mp3"]];
    
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    
    if(error) {
        NSLog(@"Error: %@", error.localizedDescription);
    } else {
        self.audioPlayer.delegate = self;
        self.ProgressSlider.value = 0.0;
        self.VolumeSlider.value = 0.5;
        self.durationTimeLabel.text = [self stringFromInterval:self.audioPlayer.duration];
        
        if (self.audioPlayer.duration <= 3600) {
            self.currentTimeLabel.text = [NSString stringWithFormat:@"00:00"];
        } else {
            self.currentTimeLabel.text = [NSString stringWithFormat:@"0:00:00"];
        }
        
        [self.currentTimeLabel sizeToFit];
        [self.audioPlayer prepareToPlay];
    }
}

- (NSString *)stringFromInterval:(NSTimeInterval)interval {
    
    NSInteger ti = (NSInteger)interval;
    
    int seconds = ti%60;
    int minutes = (ti/60)%60;
    int hours = (ti/3600);
    
    if (ti <= 3600) {
        return [NSString stringWithFormat:@"%02d:%02d", minutes, seconds];
    }
    
    return [NSString stringWithFormat:@"%d:%02d:%02d", hours, minutes, seconds];
}

- (void)updateSlider {
    self.ProgressSlider.value = self.audioPlayer.currentTime;
    self.currentTimeLabel.text = [self stringFromInterval:self.audioPlayer.currentTime];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)PlayPause:(id)sender {
    if (!self.audioPlayer.playing) {
        self.ProgressSlider.maximumValue = self.audioPlayer.duration;
        
        self.sliderTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateSlider) userInfo:nil repeats:YES];
        
        [self.ProgressSlider addTarget:self action:@selector(ProgressSlider) forControlEvents:UIControlEventValueChanged];
        
        [self.audioPlayer play];
        
        [self.PlayPauseButton setTitle:@"Pause" forState:UIControlStateNormal];
    } else if(self.audioPlayer.playing) {
        [self.audioPlayer pause];
        [self.PlayPauseButton setTitle:@"Play" forState:UIControlStateNormal];
    }
}

- (IBAction)Stop:(id)sender {
    if (self.audioPlayer.isPlaying) {
        [self.audioPlayer stop];
    }
    
    [self.audioPlayer setCurrentTime:0.0];
    [self.sliderTimer invalidate];
    self.ProgressSlider.value = 0.0;
    
    if (self.audioPlayer.duration <= 3600) {
        self.currentTimeLabel.text = [NSString stringWithFormat:@"00:00"];
    } else {
        self.currentTimeLabel.text = [NSString stringWithFormat:@"0:00:00"];
    }
    
    [self.currentTimeLabel sizeToFit];
    
    [self.PlayPauseButton setTitle:@"Play" forState:UIControlStateNormal];
}

- (IBAction)Volume:(id)sender {
    if (self.audioPlayer != nil) {
        self.audioPlayer.volume = self.VolumeSlider.value;
    }
}

- (IBAction)Progress:(id)sender {
    [self.audioPlayer stop];
    [self.audioPlayer setCurrentTime:self.ProgressSlider.value];
    [self.audioPlayer prepareToPlay];
    [self.audioPlayer play];
}

@end
