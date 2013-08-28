//
//  FiestanatorModel.h
//  fiestanator trial1
//
//  Created by Michael Giba on 7/6/13.
//  Copyright (c) 2013 Michael Giba. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Liqours.h"
#import "BeersList.h"


@interface FiestanatorModel : NSObject
@property (strong,nonatomic) BeersList *Beers;
@property (strong,nonatomic) LiqoursCore *Liqours;
-(int)returnIntensityRating:(double)Intensity;
-(int)decideOnDownPaymentMethod:(double)downAmount;

-(NSDictionary *)priceListOne:(int)intensity withDownAmount:(double)downAmount;
-(NSDictionary *)priceListTwo:(int)intensity withDownAmount:(double)downAmount;
-(NSDictionary *)priceListThree:(int)intensity withDownAmount:(double)downAmount;
-(NSDictionary *)priceListFour:(int)intensity withDownAmount:(double)downAmount;
-(NSDictionary *)priceListFive:(int)intensity withDownAmount:(double)downAmount;
-(NSDictionary *)priceListSix:(int)intensity withDownAmount:(double)downAmount;
-(NSDictionary *)priceListSeven:(int)intensity withDownAmount:(double)downAmount;

@end

