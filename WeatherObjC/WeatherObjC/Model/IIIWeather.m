//
//  IIIWeather.m
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIWeather.h"

@implementation IIIWeather

- (instancetype)initWithName:(NSString *)name country:(NSString *)country list:(NSArray *)list
{
    self = [super init];
    
    if (self) {
        _name = name;
        _country = country;
        _list = list;
    }
    
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSDictionary *city = dictionary[@"city"];
    NSString *name = city[@"name"];
    NSString *country = city[@"country"];
    
    NSArray *list = dictionary[@"list"];
    
    self = [self initWithName:name country:country list:list];
    
    return self;
}

@end
