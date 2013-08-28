//
//  GameCore.h
//  fiestanator trial1
//
//  Created by Michael Giba on 7/3/13.
//  Copyright (c) 2013 Michael Giba. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LiqoursCore : NSObject
@property (strong, nonatomic) NSArray *SmallLiqourNameArray;
@property (strong, nonatomic) NSArray *SmallLiqourPriceArray;
@property (strong, nonatomic) NSArray *SevenFiftyLiqourNameArray;
@property (strong, nonatomic) NSArray *SevenFiftyLiqourPriceArray;
@property (strong, nonatomic) NSArray *BigLiqourNameArray;
@property (strong, nonatomic) NSArray *BigLiqourPriceArray;
@property (strong, nonatomic) NSArray *ExpensiveLiqourNameArray;
@property (strong, nonatomic) NSArray *ExpensiveLiqourPriceArray;


@property (strong, nonatomic) NSDictionary *AllLiqours;


@end
