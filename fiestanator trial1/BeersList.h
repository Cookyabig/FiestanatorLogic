//
//  BeersList.h
//  fiestanator trial1
//
//  Created by Michael Giba on 7/5/13.
//  Copyright (c) 2013 Michael Giba. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BeersList : NSObject


@property(strong,nonatomic) NSArray *ThirtyPackNameArray;
@property(strong,nonatomic) NSArray *ThirtyPackPriceArray;
@property(strong,nonatomic) NSArray *SixPackNameArray;
@property(strong,nonatomic) NSArray *SixPackPriceArray;
@property(strong,nonatomic) NSArray *FifteenGallonNameArray;
@property(strong,nonatomic) NSArray *FifteenGallonPriceArray;
@property(strong,nonatomic) NSArray *TwelvePackNameArray;
@property(strong,nonatomic) NSArray *TwelvePackPriceArray;
@property(strong,nonatomic) NSDictionary *AllBeers;


@end
