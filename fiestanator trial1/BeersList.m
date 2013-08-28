//
//  BeersList.m
//  fiestanator trial1
//
//  Created by Michael Giba on 7/5/13.
//  Copyright (c) 2013 Michael Giba. All rights reserved.
//

#import "BeersList.h"

@implementation BeersList

-(NSArray *)ThirtyPackNameArray{
    
    if(!_ThirtyPackNameArray)
    {
        NSArray *ThirtyPackNameArray = [[NSArray alloc] initWithObjects:
                                        @"Tecate Thirty Pack",
                                        @"Budwieser Thirty Pack",
                                        @"Bud Light Thirty Pack",
                                        @"Coors Light Thirty Pack",
                                        @"Miller Genuine Draft Thirty Pack",
                                        @"Coors Thirty Pack",
                                        @"Coors Light Thirty Pack",
                                        @"Miller Lite Thirty Pack",
                                        @"Budwieser Thirty Pack",
                                        @"Bud Light Thirty Pack",
                                        @"Coors Light Thirty Pack",
                                        @"Miller Genuine Draft Thirty Pack",
                                        
                                        @"Coors Thirty Pack",
                                        @"Coors Light Thirty Pack",
                                        @"Miller Lite Thirty Pack", nil];
        _ThirtyPackNameArray = ThirtyPackNameArray;
        
        
    }
    
    return _ThirtyPackNameArray;
    
}
-(NSArray *)ThirtyPackPriceArray{
    
    if(!_ThirtyPackPriceArray)
    {
        NSArray *ThirtyPackPriceArray = [[NSArray alloc] initWithObjects:
                                         @"23.99",
                                         @"22.99",
                                         @"22.99",
                                         @"22.99",
                                         @"22.99",
            
                                         @"22.99",
                                         @"22.99",
                                         @"22.99",
                                         @"22.99",
                                         @"22.99",
                                         @"22.99",
                                         @"22.99",
                                        
                                         @"22.99",
                                         @"22.99",
                                         @"22.99", nil];
        _ThirtyPackPriceArray = ThirtyPackPriceArray;
        
        
    }
    
    return _ThirtyPackPriceArray;
    
}
-(NSArray *)SixPackPriceArray{
    
    if(!_SixPackPriceArray)
    {
        NSArray *SixPackPriceArray = [[NSArray alloc] initWithObjects:
                                      @"8.69",
                                      @"8.19",
                                      @"5.79",
                                      @"5.79",
                                      @"6.79",
                                      @"5.79",
                                      @"5.79",
                                      @"5.79",
                                      @"5.99",
                                      @"6.99",
                                      @"6.99",
                                      @"6.99",
                                      @"8.49",
                                      @"8.49", nil];
        _SixPackPriceArray = SixPackPriceArray;
        
        
    }
    
    return _SixPackPriceArray;
    
}
-(NSArray *)SixPackNameArray{
    
    if(!_SixPackNameArray)
    {
        NSArray *SixPackNameArray = [[NSArray alloc] initWithObjects:@"Blue Moon Six Pack",
                                     @"Bohemia Six Pack",
                                     @"Budwieser Six Pack",
                                     @"Bud Light Six Pack",
                                     @"Bud Light Platinum Six Pack",
                                     @"Coors Six Pack",
                                     @"Coors Light Six Pack",
                                     @"Miller Genuine Draft Six Pack",
                                     @"Miller Lite Six Pack",
                                     @"Michelob Ultra Six Pack",
                                     @"Michelob Lager Six Pack",
                                     @"Rolling Rock Six Pack",
                                     @"Shiner Bock Six Pack",
                                     @"Shiner Cheer Six Pack", nil];
        _SixPackNameArray = SixPackNameArray;
        
        
    }
    
    return _SixPackNameArray;
    
}
-(NSArray *)FifteenGallonNameArray{
    
    if(!_FifteenGallonNameArray)
    {
        NSArray *FifteenGallonNameArray = [[NSArray alloc] initWithObjects:
                                           @"Bud Light Keg (15.5gal)",
                                           @"Dos Equis Keg (15.5gal)",
                                           @"Miller Lite Keg (15.5gal)",
                                           @"Coors Light Keg (15.5gal)",
                                           @"Coors Keg(15.5gal)",
                                           @"Budwieser Keg (15.5gal)",
                                           @"Michelob (15.5gal)",
                                           @"Shock Top Keg(15.5gal)",
                                           @"Miller High Life Keg(15.5gal)",
                                           @"Miller Genuine Draft Keg(15.5gal)",
                                           @"Miller Lite Keg(15.5gal) ",
                                           @"Bud Light Keg (15.5gal)",
                                           @"Dos Equis Keg (15.5gal)",
                                           @"Miller Lite Keg (15.5gal)",
                                           @"Coors Light Keg (15.5gal)",
                                           @"Coors Keg(15.5gal)",
                                           @"Budwieser Keg (15.5gal)",
                                           @"Michelob (15.5gal)",
                                           @"Shock Top Keg(15.5gal)",
                                           @"Miller High Life Keg(15.5gal)",
                                           @"Miller Genuine Draft Keg(15.5gal)",
                                           @"Miller Lite Keg(15.5gal)", nil];
        _FifteenGallonNameArray = FifteenGallonNameArray;
        
        
    }
    
    return _FifteenGallonNameArray;
    
}
-(NSArray *)FifteenGallonPriceArray{
    
    if(!_FifteenGallonPriceArray)
    {
        NSArray *FifteenGallonPriceArray = [[NSArray alloc] initWithObjects:
                                            @"89.99",
                                            @"129.99",
                                            @"89.99",
                                            @"89.99",
                                            @"89.99",
                                            @"89.99",
                                            @"99.99",
                                            @"114.99",
                                            @"79.99",
                                            @"119.99",
                                            @"119.99",
                                            @"89.99",
                                            @"129.99",
                                            @"89.99",
                                            @"89.99",
                                            @"89.99",
                                            @"89.99",
                                            @"99.99",
                                            @"114.99",
                                            @"79.99",
                                            @"119.99",
                                            @"119.99", nil];
        _FifteenGallonPriceArray = FifteenGallonPriceArray;
        
        
    }
    
    return _FifteenGallonPriceArray;
    
}
-(NSArray *)TwelvePackNameArray{
    
    if(!_TwelvePackNameArray)
    {
        NSArray *TwelvePackNameArray = [[NSArray alloc] initWithObjects:
                                        @"Blue Moon 12 Pack",
                                        @"Bud Light 12 Pack",
                                        @"Bud Light Platinum 12 Pack",
                                        @"Coors 12 Pack",
                                        @"Coors Light 12 Pack",
                                        @"Miller Genuine Draft 12 Pack",
                                        @"Miller Lite 12 Pack",
                                        @"Michelob Ultra 12 Pack",
                                        @"Old Milwaukee 12 Pack",
                                        @"Rolling Rock 12 Pack", nil];
        _TwelvePackNameArray = TwelvePackNameArray;
        
        
    }
    
    return _TwelvePackNameArray;
    
}
-(NSArray *)TwelvePackPriceArray{
    
    if(!_TwelvePackPriceArray)
    {
        NSArray *TwelvePackPriceArray = [[NSArray alloc] initWithObjects:
                                         @"16.99",
                                         @"11.49",
                                         @"12.99",
                                         @"11.49",
                                         @"11.49",
                                         @"11.49",
                                         @"11.49",
                                         @"12.99",
                                         @"7.99",
                                         @"10.99", nil];
        _TwelvePackPriceArray = TwelvePackPriceArray;
        
        
    }
    
    return _TwelvePackPriceArray;
    
}

-(NSDictionary *)AllBeers{
    
    if(!_AllBeers){
        
        NSDictionary *Smalls = [[NSDictionary alloc] initWithObjects:self.ThirtyPackPriceArray forKeys:self.ThirtyPackNameArray];
        
        
        NSDictionary *Bigs = [[NSDictionary alloc] initWithObjects:self.TwelvePackPriceArray forKeys:self.TwelvePackNameArray];
        NSDictionary *SevenFives = [[NSDictionary alloc] initWithObjects:self.FifteenGallonPriceArray forKeys:self.FifteenGallonNameArray];
        NSDictionary *Expensive = [[NSDictionary alloc] initWithObjects:self.SixPackPriceArray forKeys:self.SixPackNameArray];
        NSDictionary *AllBeers = @{
                                     @"Thirty Packs": Smalls,
                                     @"Kegs": SevenFives,
                                     @"Twelve Packs": Bigs,
                                     @"Six Packs": Expensive
                                     };
        
        
        
        _AllBeers = AllBeers;
    }
    
    return _AllBeers;
    
    
    
}







@end
