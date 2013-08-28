//
//  TesterViewController.h
//  fiestanator trial1
//
//  Created by Michael Giba on 7/3/13.
//  Copyright (c) 2013 Michael Giba. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FiestanatorModel.h"
#import "BeersList.h"
#import "Liqours.h"
#import "TableView.h"
#import <QuartzCore/QuartzCore.h>
#import "FlurryAdDelegate.h"


@interface TesterViewController : UIViewController <UITextFieldDelegate, FlurryAdDelegate>
{

    int counter;
    BOOL adLoad;
}
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UIButton *liqourImage;
@property (weak, nonatomic) IBOutlet UIButton *BeerImage;
@property (weak, nonatomic) IBOutlet UIButton *textfieldBB;


@property (strong, nonatomic) FiestanatorModel *model;

@property (weak, nonatomic) IBOutlet UISlider *intensitySlider;
@property (weak, nonatomic) IBOutlet UITextField *DownPaymentTextField;
@property (strong, nonatomic) NSDictionary *passedDict;
- (IBAction)sendData:(UIButton *)sender;


@end
