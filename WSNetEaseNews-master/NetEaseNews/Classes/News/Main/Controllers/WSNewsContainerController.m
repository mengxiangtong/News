//
//  WSNewsController.m
//  网易新闻
//
//  Created by WackoSix on 15/12/27.
//  Copyright © 2015年 WackoSix. All rights reserved.
//

#import "WSNewsContainerController.h"
#import "WSContainerController.h"
#import "WSNewsController.h"
#import "WSChannel.h"

@interface WSNewsContainerController ()

@property (strong, nonatomic) NSArray *news;

@end

@implementation WSNewsContainerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置新闻控制器
    NSMutableArray *vcs = [NSMutableArray arrayWithCapacity:self.news.count];
    
    for (WSChannel *ch in self.news) {
        
        WSNewsController *newVC = [WSNewsController newsController];
        newVC.channelUrl = ch.channelURL;
        newVC.title = ch.tname;
        newVC.channelID = ch.tid;
        [vcs addObject:newVC];
    }
    
    WSContainerController *containVC = [WSContainerController containerControllerWithSubControlers:vcs parentController:self];
    containVC.navigationBarBackgrourdColor = [UIColor yellowColor];
    
}


- (void)loadInterface {

}

- (void)leftItemClick {
    

}

- (void)rightItemClick {

    
}

#pragma mark - lazy loading

- (NSArray *)news{
    
    if (!_news) {
        
        NSArray *newArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"News.plist" ofType:nil]];
        NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:newArr.count];
        
        for (NSDictionary *dict in newArr) {
            
            WSChannel *ch = [WSChannel channelWithDict:dict];
            [arrM addObject:ch];
        }
        
        _news = arrM.copy;
        
    }
    return _news;
}



@end
