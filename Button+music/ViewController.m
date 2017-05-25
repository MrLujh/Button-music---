//
//  ViewController.m
//  Button+music
//
//  Created by lujh on 2017/4/24.
//  Copyright © 2017年 lujh. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(0, 0, 50, 50);
    btn.layer.cornerRadius = 25;
    btn.layer.masksToBounds = YES;
    btn.center = self.view.center;
    [btn setTitle:@"测试" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor cyanColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnClick {

    [self playSoundEffect:@"11.mp3"];
}
/**
 * 播放完成回调函数 *
 * @param soundID 系统声 ID
 * @param clientData 回调时传递的数据
 
 */

/**
 * 播放音效文件
 *
 * @param name 音频文件名称 */
-(void)playSoundEffect:(NSString *)name{
    
    NSString *audioFile=[[NSBundle mainBundle] pathForResource:name ofType:nil];
    NSURL *fileUrl=[NSURL fileURLWithPath:audioFile];
    //1.获得系统声音ID
    SystemSoundID soundID=0;
    /**
     * inFileUrl: 音频文件url
     * outSystemSoundID:声 id(此函数会将音效文件加入到系统音频服务中并返回一个长整形ID) */
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)(fileUrl), &soundID);
    //如果需要在播放完之后执行某些操作,可以调用如下方法注册一个播放完成回调函数 AudioServicesAddSystemSoundCompletion(soundID, NULL, NULL, soundCompleteCallback, NULL);
    //2.播放音频
    AudioServicesPlaySystemSound(soundID);//播放音效
    //AudioServicesPlayAlertSound(soundID);//播放音效并震动
}

@end
