//
//  GameCore.m
//  fiestanator trial1
//
//  Created by Michael Giba on 7/3/13.
//  Copyright (c) 2013 Michael Giba. All rights reserved.
//

#import "Liqours.h"

@implementation LiqoursCore

-(NSArray *)SmallLiqourNameArray{
    

    if(!_SmallLiqourNameArray){
        NSLog(@"running");
        NSArray *SmallLiqourNameArray = [[NSArray alloc] initWithObjects:@"99 Bananas Schnapps 50 ml",@"99 Blackberries Schnapps 50 ml",@"99 Apples Schnapps 50 ml",@"Voli Vodka Lemon 50 ml",@"Smirnoff Apple Twist Vodka 50 ml",@"Kilbeggan Irish Whisky 50 ml",@"Smirnoff Iced Cake Vodka 50 ml",@"Smirnoff Vanilla Vodka 50 ml",@"Svedka Vodka 50 ml",@"Smirnoff Kissed Caramel 50 ml",@"Bicardi Light Rum 50 ml",@"Bicardi Gold Rum 50 ml",@"Smirnoff Watermelon Twist Vodka 50 ml",@"Skyy Vodka 50 ml",@"Margaritaville Tequila 50 ml ",@"Malibu Rum 50 ml",@"Capitan Morgan Rum 50 ml",@"Absolut Vodka 50 ml",@"Amaretto di Saronno 50 ml",@"Beefeater Gin 50 ml",@"Pendleton Canadian Whisky 50 ml",@"Baileys Irish Cream 50 ml",@"Patron  50 ml",@"Cotton Candy Liqueur 50 ml",@"Jameson Irish Whisky 50 ml",@"Herradura Silver Tequila 50 ml",@"Hpnotiq 50 ml",@"Grey Goose 50 ml",@"1800 Silver Tequila 50 ml",@"Kaluha 4 Pack",@"Jack Daniels 50 ml", nil];
        _SmallLiqourNameArray = SmallLiqourNameArray;
    }
    return _SmallLiqourNameArray;
    
}

-(NSArray *)SmallLiqourPriceArray{
    
    
    if(!_SmallLiqourPriceArray){
        
        NSArray *SmallLiqourPriceArray = [[NSArray alloc] initWithObjects:@"1.69",@"1.69",@"1.69",@"1.69",@"1.99",@"1.99",@"1.99",@"1.99",@"1.99",@"1.99",@"1.99",@"1.99",@"1.99",@"2.49",@"2.49",@"2.59",@"2.99",@"2.99",@"2.99",@"2.99",@"2.99",@"3.49",@"3.59",@"3.99",@"3.99",@"3.99",@"4.49",@"4.99",@"4.99",@"4.99",@"5.49", nil];
        _SmallLiqourPriceArray = SmallLiqourPriceArray;
    }
    return _SmallLiqourPriceArray;
    
}
-(NSArray *)SevenFiftyLiqourNameArray{
    
    
    if(!_SevenFiftyLiqourNameArray){
        
        NSArray *SevenFiftyLiqourNameArray = [[NSArray alloc] initWithObjects:@"DeKuyper Triple Sec 750ml",@"E & J Brandy 750ml",@"Bradys Irish Cream 750ml",@"Gordons Gin 750ml",@"Svedka Clementine Vodka 750ml",@"Svedka Cherry Vodka 750ml",@"Kaluha Iced Mocha 4 Pack 750ml",@"Pearl Vodka 750ml",@"Jagermeister Liqueur 375ml",@"Korbel Brandy 750ml",
                                              @"Smirnoff Vodka 750ml",@"Seagram's Extra Dry Gin 750ml",@"Malibu Rum 750ml",@"Bicardi Rum 750ml",@"Pinnacle Cotton Candy 750ml",@"Pinnacle Gummy Vodka 750ml",@"Pinnacle Whipped Orange Vodka 750ml",@"Bicardi Select Rum 750ml",@"Hiram Walker Cherry Brandy 750ml",@"Hiram Walker Peach Brandy 750ml",@"Smirnoff Vanilla Twist Vodka 750ml",@"Amaretto di Amore 750ml",@"Smirnoff Vodka 750ml",@"Capitan Morgan Spiced Rum 750ml",@"Bellringer Gin 750ml",@"Skyy Vodka 750ml",@"Rebel Yell Bourbon 750ml",@"Jim Bean Bourbon 750ml",@"Baileys Irish Cream 750ml",@"Smirnoff Vodka 100 proof 750ml",@"Jim Beam Red Stag 750ml",@"Pucker Vodka 750ml",@"Everclear 190 proof 750ml",@"Capitan Morgan Silver Rum 750ml",@"Capitan Morgan 100 proof 750ml",@"Jagermeister Herbal Liqueur 750ml",@"Absolut Vodka 750ml",@"Kaluha Mocha 750ml",@"Cotton Candy Liqueur 750ml",@"Jack Daniel's Tennessee Honey 750ml",@"Jose Cuervo Tradicional 750ml",@"Hennessy Black 750ml",@"Absenthe Liqueur 750ml",@"Grey Goose Vodka 750ml", nil];
        _SevenFiftyLiqourNameArray = SevenFiftyLiqourNameArray;
    }
    return _SevenFiftyLiqourNameArray;
    
}
-(NSArray *)SevenFiftyLiqourPriceArray{
    
    
    if(!_SevenFiftyLiqourPriceArray){
        
        NSArray *SevenFiftyLiqourPriceArray = [[NSArray alloc] initWithObjects:
        @"9.99",@"9.99",@"11.99",@"11.99",@"12.99",@"12.99",@"9.99",@"9.99",@"11.99",@"9.99",@"13.99",@"10.99",@"10.99",@"11.99",@"12.99",@"12.99",@"12.99",@"10.99",@"12.99",@"12.99",@"13.99",@"11.99",@"11.99",@"16.99",@"13.99",@"16.99",@"14.99",@"16.99",@"18.99",@"16.99",@"19.99",@"16.99",@"16.99",@"16.99",@"19.99",@"19.99",@"20.99",@"20.99",@"18.99",@"19.99",@"49.99",@"42.99",@"39.99",@"29.98", nil];
        _SevenFiftyLiqourPriceArray = SevenFiftyLiqourPriceArray;
    }
    return _SevenFiftyLiqourPriceArray;
    
}
-(NSArray *)BigLiqourNameArray{
    
    
    if(!_BigLiqourNameArray){
        
        NSArray *BigLiqourNameArray = [[NSArray alloc] initWithObjects:
                @"Canadian Limited Canadian Whisky 1.75L",@"Rich & Rare Can Whisky 1.75L",@"Potters Amaretto 1.75L",@"Potter's Triple Sec 1.75L",@"Jose Cuervo Margarita 1.75L",@"St Elmo Rum Gold 1.75L",@"Old Crow Bourbon 1.75L",@"Seagram Extra Dry Gin 1.75L",@"Gordons Gin 1.75L",@"DeKuyper Liqueur 1.75L",@"Smirnoff Savannah Tea 1.75L",@"Evan Williams Black Label Bourbon 1.75L",@"Svedka Vodka 1.75L",@"Capitan Morgan Long Island Rtd. 1.75L",@"Pucker Sour Apple Vodka 1.75L",@"Canadian Mist Canadian Whisky 1.75L",@"Bicardi Gold Rum 1.75L",@"Svedka Clementine Vodka 1.75L",@"Svedka Citron  1.75L",@"Malibu Coconut Rum 1.75L",@"Makers Mark Whisky 1.75L",@"Jack Daniels Honey 1.75L",@"Jack Daniels Whiskey 1.75L",@"Potters Creme de Cassis Liqueur 1 Liter",@"Bols Triple Sec 1 Liter",@"Potter's Banana Schnapps 1 Liter",@"Potter's Black Raspberry Liqueur 1 Liter",@"Hiram Walker Ginger Brandy 1 Liter",@"Korbel Brandy 1 Liter",@"Malibu Coconut Rum 1 Liter",@"Johnnie Walker Scotch 12 year old 1 Liter",@"Kubler Absinthe 1 Liter",@"Bombay Sapphire Gin 1 Liter",@"Canadian Limited Canadian Whisky 1.75L",@"Rich & Rare Can Whisky 1.75L",@"Potters Amaretto 1.75L",@"Potter's Triple Sec 1.75L",@"Jose Cuervo Margarita 1.75L",@"St Elmo Rum Gold 1.75L",@"Old Crow Bourbon 1.75L",@"Seagram Extra Dry Gin 1.75L",@"Gordons Gin 1.75L",@"DeKuyper Liqueur 1.75L",@"Smirnoff Savannah Tea 1.75L",@"Evan Williams Black Label Bourbon 1.75L",@"Svedka Vodka 1.75L",@"Capitan Morgan Long Island Rtd. 1.75L",@"Pucker Sour Apple Vodka 1.75L",@"Canadian Mist Canadian Whisky 1.75L",@"Bicardi Gold Rum 1.75L",@"Svedka Clementine Vodka 1.75L",@"Svedka Citron  1.75L",@"Malibu Coconut Rum 1.75L",@"Makers Mark Whisky 1.75L",@"Jack Daniels Honey 1.75L",@"Jack Daniels Whiskey 1.75L",@"Potters Creme de Cassis Liqueur 1 Liter",@"Bols Triple Sec 1 Liter",@"Potter's Banana Schnapps 1 Liter",@"Potter's Black Raspberry Liqueur 1 Liter",@"Hiram Walker Ginger Brandy 1 Liter",@"Korbel Brandy 1 Liter",@"Malibu Coconut Rum 1 Liter",@"Johnnie Walker Scotch 12 year old 1 Liter",@"Kubler Absinthe 1 Liter",@"Bombay Sapphire Gin 1 Liter",@"Eagle Rare 10 Yr Single 1.75 Liter",@"Eagle Rare 10 Yr Single 1.75 Liter",nil];
        _BigLiqourNameArray = BigLiqourNameArray;
    }
    return _BigLiqourNameArray;
    
}
-(NSArray *)BigLiqourPriceArray{
    
    
    if(!_BigLiqourPriceArray){
        
        NSArray *BigLiqourPriceArray = [[NSArray alloc] initWithObjects:@"14.99",@"12.79",@"10.99",@"10.99",@"14.99",@"12.99",@"16.99",@"16.99",@"14.99",@"12.99",@"16.99",@"18.99",@"18.99",@"18.99",@"16.99",@"16.99",@"18.98",@"18.99",@"18.99",@"20.99",@"40.99",@"36.99",@"34.98",@"8.99",@"8.99",@"8.99",@"8.99",@"11.49",@"12.99",@"19.99",@"51.99",@"54.99",@"31.99",@"14.99",@"12.79",@"10.99",@"10.99",@"14.99",@"12.99",@"16.99",@"16.99",@"14.99",@"12.99",@"16.99",@"18.99",@"18.99",@"18.99",@"16.99",@"16.99",@"18.98",@"18.99",@"18.99",@"20.99",@"40.99",@"36.99",@"34.98",@"8.99",@"8.99",@"8.99",@"8.99",@"11.49",@"12.99",@"19.99",@"51.99",@"54.99",@"31.99",@"49.99",@"49.99", nil];
        _BigLiqourPriceArray = BigLiqourPriceArray;
    }
    return _BigLiqourPriceArray;
    
}
-(NSArray *)ExpensiveLiqourPriceArray{
    
    
    if(!_ExpensiveLiqourPriceArray){
        
        NSArray *ExpensiveLiqourPriceArray = [[NSArray alloc] initWithObjects:@"599.99",@"599.99",@"549.99",@"339.99",@"299.99"
                                              	, nil];
        _ExpensiveLiqourPriceArray = ExpensiveLiqourPriceArray;
    }
    return _ExpensiveLiqourPriceArray;
    
}
-(NSArray *)ExpensiveLiqourNameArray{
    
    
    if(!_ExpensiveLiqourNameArray){
        
        NSArray *ExpensiveLiqourNameArray = [[NSArray alloc] initWithObjects:@"Johnnie Walker Blue King Geo V 750 ml",
                                             @"Macallan Scotch 750ml",
                                             @"Highland Park 30 yr. Old Scotch 750ml",
                                             @"Remy Martin Cognac Louis XIII 50 ml",
                                             @"Don Julio Real 750 ml",
                                             	 nil];
        _ExpensiveLiqourNameArray = ExpensiveLiqourNameArray;
    }
    return _ExpensiveLiqourNameArray;
    
}


-(NSDictionary *)AllLiqours{
    
    if(!_AllLiqours){
        
    NSDictionary *Smalls = [[NSDictionary alloc] initWithObjects:self.SmallLiqourPriceArray forKeys:self.SmallLiqourNameArray];
       
        
    NSDictionary *Bigs = [[NSDictionary alloc] initWithObjects:self.BigLiqourPriceArray forKeys:self.BigLiqourNameArray];
    NSDictionary *SevenFives = [[NSDictionary alloc] initWithObjects:self.SevenFiftyLiqourPriceArray forKeys:self.SevenFiftyLiqourNameArray];
        NSDictionary *Expensive = [[NSDictionary alloc] initWithObjects:self.ExpensiveLiqourPriceArray forKeys:self.ExpensiveLiqourNameArray];
        NSDictionary *AllLiqours = @{
                                    @"Small Liqour": Smalls,
                                    @"SevenFifty Liqour": SevenFives,
                                    @"Big Liqour": Bigs,
                                    @"Expensive Liqour": Expensive
                                    };

       
    
        _AllLiqours = AllLiqours;
    }
    
    return _AllLiqours;
    
    
    
}







@end
