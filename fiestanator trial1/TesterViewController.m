//
//  TesterViewController.m
//  fiestanator trial1
//
//  Created by Michael Giba on 7/3/13.
//  Copyright (c) 2013 Michael Giba. All rights reserved.
//

#import "TesterViewController.h"
#import "FiestanatorModel.h"
#import "BeersList.h"
#import "Liqours.h"
#import "TesterAppDelegate.h"
#import "Flurry.h"
#import "FlurryAds.h"
#import "TableView.h"
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
@interface TesterViewController (){
    
}

@end



@implementation TesterViewController

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if (newString.length > 3) {
        return NO;
    }
    return YES;
}

- (void)viewDidLoad
{
    
        [super viewDidLoad];
    counter = 3;
    [FlurryAds setAdDelegate:self];
    [FlurryAds fetchAdForSpace:@"Main Interstital" frame:self.view.frame size:FULLSCREEN];
    

    [FlurryAds fetchAndDisplayAdForSpace:@"Fiestanator" view:self.view size:BANNER_TOP];
    self.DownPaymentTextField.delegate = self;

        UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
        numberToolbar.barStyle = UIBarStyleBlackTranslucent;
        numberToolbar.items = [NSArray arrayWithObjects:
                               [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                               [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                               [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                               nil];
        [numberToolbar sizeToFit];
        self.DownPaymentTextField.inputAccessoryView = numberToolbar;
    [[[self imageView]layer] setBorderColor: [[UIColor blackColor] CGColor]];
    [[[self imageView] layer] setBorderWidth: 2.0];
    UIImage *patternImage = [UIImage imageNamed:@"black-Linen.png"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:patternImage];

    
    

    
    if(IS_IPHONE_5){
        
   
        CGRect rect3 = self.intensitySlider.frame;
        rect3.origin.y -= 10;
        self.intensitySlider.frame = rect3;
        CGRect rect2 = self.liqourImage.frame;
        CGRect rect1 = self.BeerImage.frame;
        CGRect rect0 = self.textfieldBB.frame;
        
        rect2.origin.y += 40;
        rect1.origin.y += 40;
        rect0.origin.y += 17;
        
        self.liqourImage.frame = rect2;
        self.BeerImage.frame = rect1;
        self.textfieldBB.frame = rect0;
        
    }
    
}


-(void)cancelNumberPad{
    [self.DownPaymentTextField resignFirstResponder];
    self.DownPaymentTextField.text = @"";
}
-(void)doneWithNumberPad{
    [self.DownPaymentTextField resignFirstResponder];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(FiestanatorModel *)model{
    if(!_model){
        
    FiestanatorModel *Model = [[FiestanatorModel alloc]init];
    _model = Model;
        
    }
    
    return _model;


}






- (IBAction)sendData:(UIButton *)sender {
    if([[self.DownPaymentTextField text] doubleValue]){
      
    int sliderVal = [self.model returnIntensityRating:[self.intensitySlider value]];
    double downValue = [[self.DownPaymentTextField text] doubleValue];
    int downValue1 = [self.model decideOnDownPaymentMethod:downValue];
    

    switch (downValue1) {
        case 0:{

           self.passedDict =  [self.model priceListOne:sliderVal withDownAmount:downValue];
            

            
            break;}
        case 1:{
            
            self.passedDict = [self.model priceListTwo:sliderVal withDownAmount:downValue];


            
            break;}
        case 2:{
           self.passedDict = [self.model priceListThree:sliderVal withDownAmount:downValue];


            
            break;}
        case 3:{
           self.passedDict = [self.model priceListFour:sliderVal withDownAmount:downValue];
            

            break;}
        case 4:{
           self.passedDict = [self.model priceListFive:sliderVal withDownAmount:downValue];
      

            break;}
        case 5:{
           self.passedDict = [self.model priceListSix:sliderVal withDownAmount:downValue];
     

            break;}
        case 6:{
           self.passedDict = [self.model priceListSeven:sliderVal withDownAmount:downValue];
           

            
            break;}
        default:
            break;
            
    }
    [self performSegueWithIdentifier: @"segueToTableview" sender: self];
    }
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"segueToTableview"]){
        TableView *controller = (TableView *)segue.destinationViewController;
        
        
        controller.dataFromDict = (NSMutableDictionary *)self.passedDict;
        if(counter % 3 == 0){
            controller.showAd = @"YES";
        }
        else{
            controller.showAd = @"NO";
        }

        counter++;
       
    }
}

-(void)spaceDidDismiss:(NSString *)adSpace interstitial:(BOOL)interstitial{
    if (interstitial) {
    
    [FlurryAds fetchAdForSpace:@"Main Interstital" frame:self.view.frame size:FULLSCREEN];
    }
}














@end //<< hey moosie...I love you a whole bunch! Don't ya forget it! COOL why is it purple?!' >>>
