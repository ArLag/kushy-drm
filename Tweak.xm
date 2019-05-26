


@import Foundation;
@import UIKit;
@import AVFoundation;



BOOL hasPlayedApp = NO;

AVQueuePlayer *songPlayer = [[AVQueuePlayer alloc] init];
AVPlayerLooper *songLooper;
NSBundle *audio = [NSBundle bundleWithPath:@"/Library/Application Support/kushydrm/"];


%hook SpringBoard

-(void)applicationDidFinishLaunching:(id)arg1 {

    %orig;

if ([[NSFileManager defaultManager] fileExistsAtPath:@"/var/lib/dpkg/info/com.kushy.bestdrmeva.list"])
{

}
else
{
      if([[[NSBundle mainBundle] bundleIdentifier] isEqualToString:@"com.apple.springboard"]) {
          AVPlayerItem *song = [AVPlayerItem playerItemWithURL:[audio URLForResource:@"drm" withExtension:@"mp3"]];
          if (!hasPlayedApp) {
              songLooper = [[AVPlayerLooper alloc] initWithPlayer:songPlayer templateItem:song timeRange:kCMTimeRangeInvalid];
              songPlayer.volume = 0.3;
              [songPlayer play];
              hasPlayedApp = YES;
          }

          }

}}
%end

/*Kushy best drm dev */
