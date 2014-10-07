//
//  APPViewController.m
//  KultFM
//
//  Created by devility on 2014.03.03..
//  Copyright (c) 2014 devility. All rights reserved.
//

#import "APPViewController.h"

/*
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
*/
//#define STREAM_URL @"http://stream.radiojavan.com"
#define STREAM_URL @"http://stream.orientpress.hu:8000/kultfm"

@interface APPViewController ()

@end

@implementation APPViewController

- (void)viewDidLoad
{
    

 //   UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"kult-ios.jpg"]];
   // [self.view addSubview:backgroundView];
    
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"kult-ios.jpg"]];


    /*
    self.view = [[UIView alloc] initWithFrame: [UIScreen mainScreen].applicationFrame];
    self.view.backgroundColor = [UIColor greenColor];
    self.view.clipsToBounds = YES;
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    */
    
    radio = [[Radio alloc] init:@"my app"];
    [radio connect:STREAM_URL withDelegate:self withGain:(1.0)];
    playing = YES;
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage * buttonImage = [UIImage imageNamed:@"stop1.png"];
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    
//    [button setTitle:@"Stop" forState:UIControlStateNormal];
  //  button.titleLabel.font = [UIFont boldSystemFontOfSize:14];
     button.frame = CGRectMake((self.view.frame.size.width - 85) / 2, 328, 85, 85);
    [button addTarget:self action:@selector(toggleRadio) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
   
    /*
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 130, self.view.frame.size.width - 20, 50)];
    titleLabel.font = [UIFont boldSystemFontOfSize:14];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.numberOfLines = 0;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLabel];
    */
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)toggleRadio {
    if (playing) {
        playing = NO;
        [radio updatePlay:NO];
        UIImage * buttonImage = [UIImage imageNamed:@"play1.png"];
        [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    }
    else {
        playing = YES;
        [radio updatePlay:YES];
        UIImage * buttonImage = [UIImage imageNamed:@"stop1.png"];
        [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    }
}

#pragma mark -

- (void)updateBuffering:(BOOL)value {
    NSLog(@"delegate update buffering %d", value);
}

- (void)interruptRadio {
    NSLog(@"delegate radio interrupted");
}

- (void)resumeInterruptedRadio {
    NSLog(@"delegate resume interrupted radio");
}

- (void)networkChanged {
    NSLog(@"delegate network changed");
}

- (void)connectProblem {
    NSLog(@"delegate connection problem");
}

- (void)audioUnplugged {
    NSLog(@"delegate audio unplugged");
}

/*
- (void)metaTitleUpdated:(NSString *)title {
    NSLog(@"delegate title updated to %@", title);
    
    NSArray *chunks = [title componentsSeparatedByString:@";"];
    if ([chunks count]) {
        NSArray *streamTitle = [[chunks objectAtIndex:0] componentsSeparatedByString:@"="];
        if ([streamTitle count] > 1) {
            titleLabel.text = [streamTitle objectAtIndex:1];
        }
    }
}*/



@end
