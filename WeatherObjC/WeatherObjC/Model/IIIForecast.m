//
//  IIIForecast.m
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIForecast.h"

@implementation IIIForecast

- (instancetype)initWithTempDay:(double)tempDay tempNight:(double)tempNight humidity:(double)humidity icons:(NSArray *)icons descriptions:(NSArray *)descriptions
{
    self = [super init];
    
    if (self) {
        _tempDay = tempDay;
        _tempNight = tempNight;
        _humidity = humidity;
        _icons = icons;
        _descriptions = descriptions;
    }
    
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSDictionary *temp = dictionary[@"temp"];
    double tempDay = [temp[@"day"] doubleValue];
    double tempNight = [temp[@"night"] doubleValue];
    
    double humidity = [dictionary[@"humidity"] doubleValue];
    
    NSArray *weather = dictionary[@"weather"];
    NSMutableArray *descriptions = [[NSMutableArray alloc] init];
    NSMutableArray *icons = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dict in weather) {
        NSString *main = dict[@"main"];
        [descriptions addObject: main];
        
        NSString *icon = dict[@"icon"];
        [icons addObject: icon];
    }
    
    self = [self initWithTempDay:tempDay tempNight:tempNight humidity:humidity
                           icons:icons descriptions:descriptions];
    
    return self;
}

@end
