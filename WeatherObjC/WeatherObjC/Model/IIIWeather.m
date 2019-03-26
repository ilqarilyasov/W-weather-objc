//
//  IIIWeather.m
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIWeather.h"

@implementation IIIWeather

- (instancetype)initWithCityName:(NSString *)cityName temp:(double)temp
                         tempMin:(double)tempMin tempMax:(double)tempMax humidity:(double)humidity
                            icons:(NSMutableArray *)icons descriptions:(NSMutableArray *)descriptions
{
    self = [super init];
    
    if (self) {
        _cityName = cityName;
        _temp = temp;
        _tempMin = tempMin;
        _tempMax = tempMax;
        _humidity = humidity;
        _icons = icons;
        _descriptions = descriptions;
    }
    
    return  self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *cityName = dictionary[@"name"];
    
    NSDictionary *main = dictionary[@"main"];
    double temp = [main[@"temp"] doubleValue];
    double tempMin = [main[@"temp_min"] doubleValue];
    double tempMax = [main[@"temp_max"] doubleValue];
    double humidity = [main[@"humidity"] doubleValue];
    
    NSArray *weather = dictionary[@"weather"];
    NSMutableArray *descriptions = [[NSMutableArray alloc] init];
    NSMutableArray *icons = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dict in weather) {
        NSString *main = dict[@"main"];
        [descriptions addObject: main];
        
        NSString *icon = dict[@"icon"];
        [icons addObject: icon];
    }
    
    self = [self initWithCityName:cityName temp:temp tempMin:tempMin tempMax:tempMax
                         humidity:humidity icons:icons descriptions:descriptions];
    
    return self;
}

@end
