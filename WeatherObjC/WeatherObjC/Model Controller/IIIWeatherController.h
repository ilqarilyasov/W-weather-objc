//
//  IIIWeatherController.h
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class IIIWeather;
@interface IIIWeatherController : NSObject

- (void)fetchWeatherWithZip:(double)zip completion:(void (^)(NSError *error))completion;

@property (nonatomic, strong, readonly) NSArray *forecasts;
@property (nonatomic, strong, readonly) IIIWeather *weather;

@end

NS_ASSUME_NONNULL_END
