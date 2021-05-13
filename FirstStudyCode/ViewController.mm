//
//  ViewController.m
//  FirstStudyCode
//
//  Created by zhangyuhui on 2021/5/10.
//

#import "ViewController.h"
#import "Mp3Encoder.hpp"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //MARK: 参数
    int sampleRate = 44100; // 采样频率
    int channels = 2;    //声道数
    int bitRate = 128 * 1024; //码率
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [path objectAtIndex:0];
    
    const char* pcmFilePath  = [[[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"testPcnToMp3.pcm"] cStringUsingEncoding:NSUTF8StringEncoding];
    const char *mp3FilePath = [[documentsDirectory stringByAppendingPathComponent:@"testPcnToMp3.mp3"] cStringUsingEncoding:NSUTF8StringEncoding];
    
    NSLog(@"pcmFilePath地址为%s",pcmFilePath);
    NSLog(@"mp3FilePath地址为%s",mp3FilePath);
    
    Mp3Encoder *encoder = new Mp3Encoder();
    
    encoder->Init(pcmFilePath, mp3FilePath, sampleRate, channels, bitRate);
    
    encoder->Encode();
    encoder->Destory();
    
    delete encoder;
    NSLog(@"完成-----");
    
}


@end
