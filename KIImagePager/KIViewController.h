//
//  KIViewController.h
//  KIImagePager
//
//  Created by Marcus Kida on 07.04.13.
//  Copyright (c) 2013 Marcus Kida. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KIImagePager.h"

@interface KIViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *left;
@property (strong, nonatomic) IBOutlet UIButton *right;
@property (strong, nonatomic) NSArray * arrImages;
@end
