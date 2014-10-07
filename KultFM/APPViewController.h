//
//  APPViewController.h
//  KultFM
//
//  Created by devility on 2014.03.03..
//  Copyright (c) 2014 devility. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Radio.h"

@interface APPViewController : UIViewController <RadioDelegate> {
 
    Radio *radio;
    UIButton *button;
//    UILabel *titleLabel;
    BOOL playing;
    
    
}

@end
