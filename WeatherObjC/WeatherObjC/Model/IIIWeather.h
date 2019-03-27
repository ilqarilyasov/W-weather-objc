//
//  IIIWeather.h
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class IIIForecast;
@interface IIIWeather : NSObject

- (instancetype)initWithName:(NSString *)name country:(NSString *)country
                        list:(NSArray *)list;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSArray *list;

@end

NS_ASSUME_NONNULL_END
