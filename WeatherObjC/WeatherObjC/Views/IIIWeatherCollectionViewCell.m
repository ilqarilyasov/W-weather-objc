//
//  IIIWeatherCollectionViewCell.m
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIWeatherCollectionViewCell.h"
#import "../Model/IIIForecast.h"

@interface IIIWeatherCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *weatherImageView;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;

@end

@implementation IIIWeatherCollectionViewCell

- (void)updateViews
{
    if (self.forecast) {
        NSNumber *tempDayNumber = [NSNumber numberWithDouble: self.forecast.tempDay];
        NSString *tempDayString = [tempDayNumber stringValue];
        [[self temperatureLabel] setText: tempDayString];
        
        NSString *firstIcon = [[[self forecast] icons] firstObject];
        UIImage *icon = [UIImage imageNamed: firstIcon];
        [[self weatherImageView] setImage: icon];
    }
}

- (void)setForecast:(IIIForecast *)forecast
{
    _forecast = forecast;
    [self updateViews];
}

@end
