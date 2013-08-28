//
//  FiestanatorModel.m
//  fiestanator trial1
//
//  Created by Michael Giba on 7/6/13.
//  Copyright (c) 2013 Michael Giba. All rights reserved.
//

#import "FiestanatorModel.h"



@implementation FiestanatorModel

BOOL hasbeencalled = NO;
-(NSArray *)shuffleArray:(NSArray *)ArrayToBeShuffled{
    

    NSInteger count = [ArrayToBeShuffled count];
    NSMutableArray *Shuffler = [[NSMutableArray alloc] initWithArray:ArrayToBeShuffled];
    
    for (int n = 0; n < count - 1; n++) {
        
        NSInteger nElements = count - n;
        NSInteger k = (arc4random() % nElements) + n;
        
        [Shuffler exchangeObjectAtIndex:k withObjectAtIndex:n];
        
    }

    return Shuffler;
    
   
}
-(int)returnIntensityRating:(double)Intensity{
    
    if(Intensity < .15){
        return 0;
    }
    else if(Intensity >=.15 && Intensity <.4){
        return 1;
    }
    else if(Intensity >= .4 && Intensity < .6){
        return 2;
    }
    else if(Intensity >=.6 && Intensity < .8){
        return 3;
    }
    else if(Intensity >= .8){
        return 4;
    }
    else{
        return 5;
    }
}
-(int)decideOnDownPaymentMethod:(double)downAmount{
    if(!hasbeencalled){
        hasbeencalled = YES;
    self.Liqours.AllLiqours = self.Liqours.AllLiqours;
        self.Beers.AllBeers = self.Beers.AllBeers;
    }
    
    if(downAmount < 30){

        return 0;
        
    }else if(downAmount < 80 && downAmount >= 30){
    
        return 1;
        
    }else if(downAmount >= 80 && downAmount < 130){
        return 2;
        
    }else if (downAmount >= 130 && downAmount < 200){
       
       return 3;
    }else if (downAmount >= 200 && downAmount < 400){
      

       return 4;
        
    }else if (downAmount >= 400 && downAmount < 800){
      
        return 5;
    }else if (downAmount >= 800 && downAmount <= 1000){
       
        return 6;
        
    }
    else{
        
        
        return 0;
    }
    
    
}
-(BeersList *)Beers{
    if(!_Beers){
        BeersList *Beers = [[BeersList alloc] init];
        _Beers = Beers;
        
        
    }
    
    return _Beers;
    
}
-(LiqoursCore *)Liqours{
    
    if(!_Liqours){
        LiqoursCore *Beers = [[LiqoursCore alloc] init];
        _Liqours = Beers;
        
        
    }
    
    return _Liqours;



}


-(NSDictionary *)priceListOne:(int)intensity withDownAmount:(double)downAmount {
    
    NSMutableDictionary *retValue = [[NSMutableDictionary alloc] init];
    switch (intensity) {
        case 0:{
            
                self.Beers.SixPackNameArray = [self shuffleArray:self.Beers.SixPackNameArray];
                
                for (int i = 0; downAmount > 0; ++i) {

                 NSString *obj = [[self.Beers.AllBeers objectForKey:@"Six Packs"] objectForKey:[self.Beers.SixPackNameArray objectAtIndex:i]];
                    
                    downAmount = downAmount - [obj doubleValue];
                    
                    
                    if (downAmount < 0) {
                        downAmount = downAmount + [obj doubleValue];
                        NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                        [retValue setObject:newDown forKey:@"Remaining Money"];
                        break;
                    }
                    if(![retValue objectForKey:[self.Beers.SixPackNameArray objectAtIndex:i]]){
                    [retValue setObject:obj forKey:[self.Beers.SixPackNameArray objectAtIndex:i]];
                    }
                    else{
                        downAmount = downAmount + [obj doubleValue];
                    }
                    
                }
                break;
            }
        case 1:{
            double shell = downAmount;
            self.Beers.SixPackNameArray = [self shuffleArray:self.Beers.SixPackNameArray];
            self.Liqours.SmallLiqourNameArray = [self shuffleArray:self.Liqours.SmallLiqourNameArray];
            
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Beers.AllBeers objectForKey:@"Six Packs"] objectForKey:[self.Beers.SixPackNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount - (shell*.2) < 0) {
                  
                    downAmount = downAmount + [obj doubleValue];

                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Beers.SixPackNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Beers.SixPackNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Liqours.AllLiqours objectForKey:@"Small Liqour"] objectForKey:[self.Liqours.SmallLiqourNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Liqours.SmallLiqourNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Liqours.SmallLiqourNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            break;
            
            
            
            
        }
        case 2:{
            double shell = downAmount;
            self.Beers.SixPackNameArray = [self shuffleArray:self.Beers.SixPackNameArray];
            self.Liqours.SmallLiqourNameArray = [self shuffleArray:self.Liqours.SmallLiqourNameArray];
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Beers.AllBeers objectForKey:@"Six Packs"] objectForKey:[self.Beers.SixPackNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount - (shell*.5) < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Beers.SixPackNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Beers.SixPackNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Liqours.AllLiqours objectForKey:@"Small Liqour"] objectForKey:[self.Liqours.SmallLiqourNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Liqours.SmallLiqourNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Liqours.SmallLiqourNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            break;
            
            
            
            
        }
        case 3:{
            double shell = downAmount;
            self.Beers.SixPackNameArray = [self shuffleArray:self.Beers.SixPackNameArray];
            self.Liqours.SmallLiqourNameArray = [self shuffleArray:self.Liqours.SmallLiqourNameArray];
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Beers.AllBeers objectForKey:@"Six Packs"] objectForKey:[self.Beers.SixPackNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount - (shell*.75) < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Beers.SixPackNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Beers.SixPackNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Liqours.AllLiqours objectForKey:@"Small Liqour"] objectForKey:[self.Liqours.SmallLiqourNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Liqours.SmallLiqourNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Liqours.SmallLiqourNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
            }
            break;
            
            
            
            
        }
        case 4:{
            self.Liqours.SmallLiqourNameArray = [self shuffleArray:self.Liqours.SmallLiqourNameArray];

            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Liqours.AllLiqours objectForKey:@"SevenFifty Liqour"] objectForKey:[self.Liqours.SevenFiftyLiqourNameArray objectAtIndex:i]];

                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Liqours.SevenFiftyLiqourNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Liqours.SevenFiftyLiqourNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Liqours.AllLiqours objectForKey:@"Small Liqour"] objectForKey:[self.Liqours.SmallLiqourNameArray objectAtIndex:i]];

                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Liqours.SmallLiqourNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Liqours.SmallLiqourNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            break;
            
            
            
            
        }
        default:
            break;
    }
    
    
    

        return retValue;
    
    
}
-(NSDictionary *)priceListTwo:(int)intensity withDownAmount:(double)downAmount {

    NSMutableDictionary *retValue = [[NSMutableDictionary alloc] init];
    switch (intensity) {
        case 0:{

            
            self.Beers.TwelvePackNameArray = [self shuffleArray:self.Beers.TwelvePackNameArray];
            
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Beers.AllBeers objectForKey:@"Twelve Packs"] objectForKey:[self.Beers.TwelvePackNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Beers.TwelvePackNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Beers.TwelvePackNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            break;
        }
        case 1:{
            double shell = downAmount;
            self.Beers.TwelvePackNameArray = [self shuffleArray:self.Beers.TwelvePackNameArray];
            self.Liqours.SevenFiftyLiqourNameArray = [self shuffleArray:self.Liqours.SevenFiftyLiqourNameArray];
            
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Beers.AllBeers objectForKey:@"Twelve Packs"] objectForKey:[self.Beers.TwelvePackNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount - (shell*.2) < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Beers.TwelvePackNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Beers.TwelvePackNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Liqours.AllLiqours objectForKey:@"SevenFifty Liqour"] objectForKey:[self.Liqours.SevenFiftyLiqourNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Liqours.SevenFiftyLiqourNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Liqours.SevenFiftyLiqourNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            break;
            
            
            
            
        }
        case 2:{
            double shell = downAmount;
            self.Beers.SixPackNameArray = [self shuffleArray:self.Beers.SixPackNameArray];
            self.Liqours.SevenFiftyLiqourNameArray = [self shuffleArray:self.Liqours.SevenFiftyLiqourNameArray];
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Beers.AllBeers objectForKey:@"Six Packs"] objectForKey:[self.Beers.SixPackNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount - (shell*.5) < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Beers.SixPackNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Beers.SixPackNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Liqours.AllLiqours objectForKey:@"SevenFifty Liqour"] objectForKey:[self.Liqours.SevenFiftyLiqourNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Liqours.SevenFiftyLiqourNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Liqours.SevenFiftyLiqourNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            break;
            
            
            
            
        }
        case 3:{
            double shell = downAmount;
            self.Beers.SixPackNameArray = [self shuffleArray:self.Beers.SixPackNameArray];
            self.Liqours.SevenFiftyLiqourNameArray = [self shuffleArray:self.Liqours.SevenFiftyLiqourNameArray];
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Beers.AllBeers objectForKey:@"Six Packs"] objectForKey:[self.Beers.SixPackNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount - (shell*.75) < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Beers.SixPackNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Beers.SixPackNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Liqours.AllLiqours objectForKey:@"SevenFifty Liqour"] objectForKey:[self.Liqours.SevenFiftyLiqourNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Liqours.SevenFiftyLiqourNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Liqours.SevenFiftyLiqourNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            break;
            
            
            
            
        }
        case 4:{
            self.Liqours.BigLiqourNameArray = [self shuffleArray:self.Liqours.BigLiqourNameArray];
            self.Liqours.SevenFiftyLiqourNameArray = [self shuffleArray:self.Liqours.SevenFiftyLiqourNameArray];
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Liqours.AllLiqours objectForKey:@"Big Liqour"] objectForKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]];
                }
                
            }
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Liqours.AllLiqours objectForKey:@"SevenFifty Liqour"] objectForKey:[self.Liqours.SevenFiftyLiqourNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Liqours.SevenFiftyLiqourNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Liqours.SevenFiftyLiqourNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
             
                }
            }
            break;
            
            
            
            
        }
        default:
            break;
    }
    
    
    

    return retValue;
    
    
    
}
-(NSDictionary *)priceListThree:(int)intensity withDownAmount:(double)downAmount {
    NSMutableDictionary *retValue = [[NSMutableDictionary alloc] init];
    switch (intensity) {
        case 0:{
            
            self.Beers.ThirtyPackNameArray = [self shuffleArray:self.Beers.ThirtyPackNameArray];
            self.Beers.SixPackNameArray = [self shuffleArray:self.Beers.SixPackNameArray];
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Beers.AllBeers objectForKey:@"Thirty Packs"] objectForKey:[self.Beers.ThirtyPackNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Beers.ThirtyPackNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Beers.ThirtyPackNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Beers.AllBeers objectForKey:@"Six Packs"] objectForKey:[self.Beers.SixPackNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Beers.SixPackNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Beers.SixPackNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            break;
        }
        case 1:{
            double shell = downAmount;
            self.Beers.ThirtyPackNameArray = [self shuffleArray:self.Beers.ThirtyPackNameArray];
            self.Liqours.SevenFiftyLiqourNameArray = [self shuffleArray:self.Liqours.SevenFiftyLiqourNameArray];
            
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Beers.AllBeers objectForKey:@"Thirty Packs"] objectForKey:[self.Beers.ThirtyPackNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount - (shell*.1) < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Beers.ThirtyPackNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Beers.ThirtyPackNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Liqours.AllLiqours objectForKey:@"SevenFifty Liqour"] objectForKey:[self.Liqours.SevenFiftyLiqourNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Liqours.SevenFiftyLiqourNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Liqours.SevenFiftyLiqourNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
            }
            break;
            
            
            
            
        }
        case 2:{
            double shell = downAmount;
            self.Beers.ThirtyPackNameArray = [self shuffleArray:self.Beers.ThirtyPackNameArray];
            self.Liqours.BigLiqourNameArray = [self shuffleArray:self.Liqours.BigLiqourNameArray];
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Beers.AllBeers objectForKey:@"Thirty Packs"] objectForKey:[self.Beers.ThirtyPackNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount - (shell*.5) < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Beers.ThirtyPackNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Beers.ThirtyPackNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Liqours.AllLiqours objectForKey:@"Big Liqour"] objectForKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            break;
            
            
            
            
        }
        case 3:{
            double shell = downAmount;
            self.Beers.TwelvePackNameArray = [self shuffleArray:self.Beers.TwelvePackNameArray];
            self.Liqours.BigLiqourNameArray = [self shuffleArray:self.Liqours.BigLiqourNameArray];
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Beers.AllBeers objectForKey:@"Twelve Packs"] objectForKey:[self.Beers.TwelvePackNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount - (shell*.7) < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Beers.TwelvePackNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Beers.TwelvePackNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Liqours.AllLiqours objectForKey:@"Big Liqour"] objectForKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            break;
            
            
            
            
        }
        case 4:{
            self.Liqours.BigLiqourNameArray = [self shuffleArray:self.Liqours.BigLiqourNameArray];
            self.Liqours.SevenFiftyLiqourNameArray = [self shuffleArray:self.Liqours.SevenFiftyLiqourNameArray];
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Liqours.AllLiqours objectForKey:@"Big Liqour"] objectForKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Liqours.AllLiqours objectForKey:@"SevenFifty Liqour"] objectForKey:[self.Liqours.SevenFiftyLiqourNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Liqours.SevenFiftyLiqourNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Liqours.SevenFiftyLiqourNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            break;
            
            
            
            
        }
        default:
            break;
    }
    
    
    

    return retValue;
    
    
    
    
    
}
-(NSDictionary *)priceListFour:(int)intensity withDownAmount:(double)downAmount {
    NSMutableDictionary *retValue = [[NSMutableDictionary alloc] init];
    switch (intensity) {
        case 0:{
            
            self.Beers.ThirtyPackNameArray = [self shuffleArray:self.Beers.ThirtyPackNameArray];
            self.Beers.SixPackNameArray = [self shuffleArray:self.Beers.SixPackNameArray];
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Beers.AllBeers objectForKey:@"Thirty Packs"] objectForKey:[self.Beers.ThirtyPackNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Beers.ThirtyPackNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Beers.ThirtyPackNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                    
                }
                
            }
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Beers.AllBeers objectForKey:@"Six Packs"] objectForKey:[self.Beers.SixPackNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Beers.SixPackNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Beers.SixPackNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            break;
        }
        case 1:{
            double shell = downAmount;
            self.Beers.ThirtyPackNameArray = [self shuffleArray:self.Beers.ThirtyPackNameArray];
            self.Liqours.SevenFiftyLiqourNameArray = [self shuffleArray:self.Liqours.SevenFiftyLiqourNameArray];
            
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Beers.AllBeers objectForKey:@"Thirty Packs"] objectForKey:[self.Beers.ThirtyPackNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount - (shell*.05) < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Beers.ThirtyPackNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Beers.ThirtyPackNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Liqours.AllLiqours objectForKey:@"SevenFifty Liqour"] objectForKey:[self.Liqours.SevenFiftyLiqourNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Liqours.SevenFiftyLiqourNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Liqours.SevenFiftyLiqourNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            break;
            
            
            
            
        }
        case 2:{
            double shell = downAmount;
            self.Beers.ThirtyPackNameArray = [self shuffleArray:self.Beers.ThirtyPackNameArray];
            self.Liqours.BigLiqourNameArray = [self shuffleArray:self.Liqours.BigLiqourNameArray];
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Beers.AllBeers objectForKey:@"Thirty Packs"] objectForKey:[self.Beers.ThirtyPackNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount - (shell*.5) < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Beers.ThirtyPackNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Beers.ThirtyPackNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                    
                }
                
            }
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Liqours.AllLiqours objectForKey:@"Big Liqour"] objectForKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]];
                }
            else{
                downAmount = downAmount + [obj doubleValue];
            }
                
            }
            break;
            
            
            
            
        }
        case 3:{
            double shell = downAmount;
            self.Beers.TwelvePackNameArray = [self shuffleArray:self.Beers.TwelvePackNameArray];
            self.Liqours.BigLiqourNameArray = [self shuffleArray:self.Liqours.BigLiqourNameArray];
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Beers.AllBeers objectForKey:@"Twelve Packs"] objectForKey:[self.Beers.TwelvePackNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount - (shell*.7) < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Beers.TwelvePackNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Beers.TwelvePackNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                    
                }
                
            }
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Liqours.AllLiqours objectForKey:@"Big Liqour"] objectForKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            break;
            
            
            
            
        }
        case 4:{
            self.Liqours.BigLiqourNameArray = [self shuffleArray:self.Liqours.BigLiqourNameArray];
            self.Liqours.SevenFiftyLiqourNameArray = [self shuffleArray:self.Liqours.SevenFiftyLiqourNameArray];
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Liqours.AllLiqours objectForKey:@"Big Liqour"] objectForKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Liqours.AllLiqours objectForKey:@"SevenFifty Liqour"] objectForKey:[self.Liqours.SevenFiftyLiqourNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Liqours.SevenFiftyLiqourNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Liqours.SevenFiftyLiqourNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            break;
            
            
            
            
        }
        default:
            break;
    }
    
    
    

    return retValue;
    
    
}
-(NSDictionary *)priceListFive:(int)intensity withDownAmount:(double)downAmount {
    
    NSMutableDictionary *retValue = [[NSMutableDictionary alloc] init];
    switch (intensity) {
        case 0:{
       
            self.Beers.FifteenGallonNameArray = [self shuffleArray:self.Beers.FifteenGallonNameArray];
            self.Liqours.SevenFiftyLiqourNameArray = [self shuffleArray:self.Liqours.SevenFiftyLiqourNameArray];
            
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Beers.AllBeers objectForKey:@"Kegs"] objectForKey:[self.Beers.FifteenGallonNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount  < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Beers.FifteenGallonNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Beers.FifteenGallonNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
            }
            
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Liqours.AllLiqours objectForKey:@"SevenFifty Liqour"] objectForKey:[self.Liqours.SevenFiftyLiqourNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Liqours.SevenFiftyLiqourNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Liqours.SevenFiftyLiqourNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            break;
            
            
            
            
        }

        case 1:{
            double shell = downAmount;
            self.Beers.FifteenGallonNameArray = [self shuffleArray:self.Beers.FifteenGallonNameArray];
            self.Liqours.BigLiqourNameArray = [self shuffleArray:self.Liqours.BigLiqourNameArray];
            
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Beers.AllBeers objectForKey:@"Kegs"] objectForKey:[self.Beers.FifteenGallonNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount - (shell*.1) < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Beers.FifteenGallonNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Beers.FifteenGallonNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Liqours.AllLiqours objectForKey:@"Big Liqour"] objectForKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            break;
            
            
            
            
        }
        case 2:{
            double shell = downAmount;
            self.Beers.ThirtyPackNameArray = [self shuffleArray:self.Beers.ThirtyPackNameArray];
            self.Liqours.BigLiqourNameArray = [self shuffleArray:self.Liqours.BigLiqourNameArray];
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Beers.AllBeers objectForKey:@"Thirty Packs"] objectForKey:[self.Beers.ThirtyPackNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount - (shell*.5) < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Beers.ThirtyPackNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Beers.ThirtyPackNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Liqours.AllLiqours objectForKey:@"Big Liqour"] objectForKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            break;
            
            
            
            
        }
        case 3:{
            double shell = downAmount;
            self.Beers.TwelvePackNameArray = [self shuffleArray:self.Beers.TwelvePackNameArray];
            self.Liqours.BigLiqourNameArray = [self shuffleArray:self.Liqours.BigLiqourNameArray];
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Beers.AllBeers objectForKey:@"Thirty Packs"] objectForKey:[self.Beers.ThirtyPackNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount - (shell*.6) < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Beers.ThirtyPackNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Beers.ThirtyPackNameArray objectAtIndex:i]];
                 }
                else{
                    downAmount = downAmount + [obj doubleValue];
                    
                }
                
            }
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Liqours.AllLiqours objectForKey:@"Big Liqour"] objectForKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                                if(![retValue objectForKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]];
                                }
                                else{
                                    downAmount = downAmount + [obj doubleValue];
                                    
                                }
                
            }
            break;
            
            
            
            
        }
        case 4:{
            self.Liqours.BigLiqourNameArray = [self shuffleArray:self.Liqours.BigLiqourNameArray];
            self.Liqours.SevenFiftyLiqourNameArray = [self shuffleArray:self.Liqours.SevenFiftyLiqourNameArray];
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Liqours.AllLiqours objectForKey:@"Big Liqour"] objectForKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
    
            }
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Liqours.AllLiqours objectForKey:@"SevenFifty Liqour"] objectForKey:[self.Liqours.SevenFiftyLiqourNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Liqours.SevenFiftyLiqourNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Liqours.SevenFiftyLiqourNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            break;
            
            
            
            
        }
        default:
            break;
    }
    
    
    

    return retValue;
    
    
    
}
-(NSDictionary *)priceListSix:(int)intensity withDownAmount:(double)downAmount {
    
    NSMutableDictionary *retValue = [[NSMutableDictionary alloc] init];
    switch (intensity) {
        case 0:{
            
            self.Beers.FifteenGallonNameArray = [self shuffleArray:self.Beers.FifteenGallonNameArray];
            self.Liqours.BigLiqourNameArray = [self shuffleArray:self.Liqours.BigLiqourNameArray];
            
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Beers.AllBeers objectForKey:@"Kegs"] objectForKey:[self.Beers.FifteenGallonNameArray objectAtIndex:i]];
                
               
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount  < 0) {
                    
                    
                    downAmount = downAmount + [obj doubleValue];
                    
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Beers.FifteenGallonNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Beers.FifteenGallonNameArray objectAtIndex:i]];
                }
                else{
                    
                downAmount = downAmount + [obj doubleValue];
                
                }
            }
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Beers.AllBeers objectForKey:@"Thirty Packs"] objectForKey:[self.Beers.ThirtyPackNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    
                    downAmount = downAmount + [obj doubleValue];
                    
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Beers.ThirtyPackNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Beers.ThirtyPackNameArray objectAtIndex:i]];
                }
                
                else{
                    
                    downAmount = downAmount + [obj doubleValue];
                    
                }
                
                
            }
            break;
            
            
            
            
        }
            
        case 1:{
            double shell = downAmount;
            self.Beers.FifteenGallonNameArray = [self shuffleArray:self.Beers.FifteenGallonNameArray];
            self.Liqours.BigLiqourNameArray = [self shuffleArray:self.Liqours.BigLiqourNameArray];
            
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Beers.AllBeers objectForKey:@"Kegs"] objectForKey:[self.Beers.FifteenGallonNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount - (shell*.2) < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Beers.FifteenGallonNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Beers.FifteenGallonNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount +[obj doubleValue];
                }
                
            }
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Liqours.AllLiqours objectForKey:@"Big Liqour"] objectForKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            break;
            
            
            
            
        }
        case 2:{
            double shell = downAmount;
            self.Beers.FifteenGallonNameArray = [self shuffleArray:self.Beers.FifteenGallonNameArray];
            self.Liqours.BigLiqourNameArray = [self shuffleArray:self.Liqours.BigLiqourNameArray];
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Beers.AllBeers objectForKey:@"Kegs"] objectForKey:[self.Beers.FifteenGallonNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount - (shell*.5) < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Beers.FifteenGallonNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Beers.FifteenGallonNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Liqours.AllLiqours objectForKey:@"Big Liqour"] objectForKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            break;
            
            
            
            
        }
        case 3:{
            double shell = downAmount;
            self.Beers.FifteenGallonNameArray = [self shuffleArray:self.Beers.FifteenGallonNameArray];
            self.Liqours.BigLiqourNameArray = [self shuffleArray:self.Liqours.BigLiqourNameArray];
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Beers.AllBeers objectForKey:@"Kegs"] objectForKey:[self.Beers.FifteenGallonNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount - (shell*.5) < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Beers.FifteenGallonNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Beers.FifteenGallonNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Liqours.AllLiqours objectForKey:@"Big Liqour"] objectForKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            break;
            
            
            
            
        }
        case 4:{
            self.Liqours.BigLiqourNameArray = [self shuffleArray:self.Liqours.BigLiqourNameArray];
            self.Liqours.SevenFiftyLiqourNameArray = [self shuffleArray:self.Liqours.SevenFiftyLiqourNameArray];
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Liqours.AllLiqours objectForKey:@"Big Liqour"] objectForKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Liqours.AllLiqours objectForKey:@"SevenFifty Liqour"] objectForKey:[self.Liqours.SevenFiftyLiqourNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Liqours.SevenFiftyLiqourNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Liqours.SevenFiftyLiqourNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            break;
            
            
            
            
        }
        default:
            break;
    }
    
    
    

    return retValue;
    
    
    
}
-(NSDictionary *)priceListSeven:(int)intensity withDownAmount:(double)downAmount {
    
    NSMutableDictionary *retValue = [[NSMutableDictionary alloc] init];
    switch (intensity) {
        case 0:{
            
            self.Beers.FifteenGallonNameArray = [self shuffleArray:self.Beers.FifteenGallonNameArray];
            self.Liqours.BigLiqourNameArray = [self shuffleArray:self.Liqours.BigLiqourNameArray];
            
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Beers.AllBeers objectForKey:@"Kegs"] objectForKey:[self.Beers.FifteenGallonNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount  < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Beers.FifteenGallonNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Beers.FifteenGallonNameArray objectAtIndex:i]];
                }
                else{
                    downAmount =  downAmount +  [obj doubleValue];
                }
                
            }
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Beers.AllBeers objectForKey:@"Thirty Packs"] objectForKey:[self.Beers.ThirtyPackNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    
                    downAmount = downAmount + [obj doubleValue];
                    
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Beers.ThirtyPackNameArray objectAtIndex:i]]){
                    [retValue setObject:obj forKey:[self.Beers.ThirtyPackNameArray objectAtIndex:i]];
                }
                
                else{
                    
                    downAmount = downAmount + [obj doubleValue];
                    
                }
                
                
            }
            break;
            
            
            
            
        }
            
        case 1:{
            double shell = downAmount;
            self.Beers.FifteenGallonNameArray = [self shuffleArray:self.Beers.FifteenGallonNameArray];
            self.Liqours.BigLiqourNameArray = [self shuffleArray:self.Liqours.BigLiqourNameArray];
            
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Beers.AllBeers objectForKey:@"Kegs"] objectForKey:[self.Beers.FifteenGallonNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount - (shell*.2) < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Beers.FifteenGallonNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Beers.FifteenGallonNameArray objectAtIndex:i]];
                }
                else{
                    downAmount =    downAmount + [obj doubleValue];
                }
                
            }
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Liqours.AllLiqours objectForKey:@"Big Liqour"] objectForKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]];
                }
                else{
                    downAmount =  downAmount + [obj doubleValue];
                }
                
            }
            break;
            
            
            
            
        }
        case 2:{
            double shell = downAmount;
            self.Beers.FifteenGallonNameArray = [self shuffleArray:self.Beers.FifteenGallonNameArray];
            self.Liqours.BigLiqourNameArray = [self shuffleArray:self.Liqours.BigLiqourNameArray];
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Beers.AllBeers objectForKey:@"Kegs"] objectForKey:[self.Beers.FifteenGallonNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount - (shell*.5) < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Beers.FifteenGallonNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Beers.FifteenGallonNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                    
                }
                
            }
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Liqours.AllLiqours objectForKey:@"Big Liqour"] objectForKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            break;
            
            
            
            
        }
        case 3:{
            double shell = downAmount;
            self.Beers.FifteenGallonNameArray = [self shuffleArray:self.Beers.FifteenGallonNameArray];
            self.Liqours.BigLiqourNameArray = [self shuffleArray:self.Liqours.BigLiqourNameArray];
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Beers.AllBeers objectForKey:@"Kegs"] objectForKey:[self.Beers.FifteenGallonNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount - (shell*.65) < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    
                    break;
                }
                if(![retValue objectForKey:[self.Beers.FifteenGallonNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Beers.FifteenGallonNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            for (int i = 0; downAmount > 0; ++i) {
               
                NSString *obj = [[self.Liqours.AllLiqours objectForKey:@"Big Liqour"] objectForKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]];
                }
                else{
                    
                    downAmount = downAmount + [obj doubleValue];
                    if(i == 67){
                        break;
                    }
                }
                
            }
            
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Liqours.AllLiqours objectForKey:@"SevenFifty Liqour"] objectForKey:[self.Liqours.SevenFiftyLiqourNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Liqours.SevenFiftyLiqourNameArray objectAtIndex:i]]){
                    [retValue setObject:obj forKey:[self.Liqours.SevenFiftyLiqourNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            
            break;
            
            
        }
        case 4:{
            BOOL doit = YES;
            self.Liqours.ExpensiveLiqourNameArray = [self shuffleArray:self.Liqours.ExpensiveLiqourNameArray];
            self.Liqours.BigLiqourNameArray = [self shuffleArray:self.Liqours.BigLiqourNameArray];
            for (int i = 0; downAmount > 0 && doit; ++i) {
                
                NSString *obj = [[self.Liqours.AllLiqours objectForKey:@"Expensive Liqour"] objectForKey:[self.Liqours.ExpensiveLiqourNameArray objectAtIndex:i]];
            
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
               
                    break;
                }
                if(![retValue objectForKey:[self.Liqours.ExpensiveLiqourNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Liqours.ExpensiveLiqourNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            for (int i = 0; downAmount > 0; ++i) {
                
                NSString *obj = [[self.Liqours.AllLiqours objectForKey:@"Big Liqour"] objectForKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]];
                
                downAmount = downAmount - [obj doubleValue];
                
                
                if (downAmount < 0) {
                    downAmount = downAmount + [obj doubleValue];
                    NSString *newDown = [[NSString alloc] initWithFormat:@"%f",downAmount];
                    [retValue setObject:newDown forKey:@"Remaining Money"];
                    break;
                }
                if(![retValue objectForKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]]){
                [retValue setObject:obj forKey:[self.Liqours.BigLiqourNameArray objectAtIndex:i]];
                }
                else{
                    downAmount = downAmount + [obj doubleValue];
                }
                
            }
            break;
            
            
            
            
        }
        default:
            break;
    }
    
    
    
    
    return retValue;
    
    
    
}
-(id)init{
    self = [super init];

    
    
    
    return self;
    
    
}



@end
