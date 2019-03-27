//
//  IIIForecast.h
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IIIForecast : NSObject

- (instancetype)initWithTempDay:(double)tempDay tempNight:(double)tempNight humidity:(double)humidity
                            icons:(NSArray *)icons descriptions:(NSArray *)descriptions;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic) double tempDay;
@property (nonatomic) double tempNight;
@property (nonatomic) double humidity;
@property (strong, nonatomic) NSArray *icons;
@property (strong, nonatomic) NSArray *descriptions;

@end

NS_ASSUME_NONNULL_END
