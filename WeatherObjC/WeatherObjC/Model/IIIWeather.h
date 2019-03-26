//
//  IIIWeather.h
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IIIWeather : NSObject

- (instancetype)initWithCityName:(NSString *)cityName temp:(double)temp
                         tempMin:(double)tempMin tempMax:(double)tempMax humidity:(double)humidity
                            icons:(NSMutableArray *)icons descriptions:(NSMutableArray *)descriptions;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (strong, nonatomic) NSString *cityName;
@property (nonatomic) double temp;
@property (nonatomic) double tempMin;
@property (nonatomic) double tempMax;
@property (nonatomic) double humidity;
@property (strong, nonatomic) NSMutableArray *icons;
@property (strong, nonatomic) NSMutableArray *descriptions;

@end

NS_ASSUME_NONNULL_END
