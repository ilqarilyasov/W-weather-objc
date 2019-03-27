//
//  IIIWeatherController.m
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIWeatherController.h"
#import "../Model/IIIWeather.h"
#import "../Model/IIIForecast.h"

@interface IIIWeatherController()

@property (nonatomic, strong, readwrite) NSMutableArray *internalForecasts;
@property (nonatomic, strong, readwrite) IIIWeather *internalWeather;

@end


@implementation IIIWeatherController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalForecasts = [[NSMutableArray alloc] init];
        _internalWeather = [[IIIWeather alloc] init];
    }
    return self;
}

- (NSArray *)forecasts
{
    return self.internalForecasts;
}

- (IIIWeather *)weather
{
    return self.internalWeather;
}


- (void)fetchWeatherWithZip:(double)zip completion:(void (^)(NSError * error))completion
{
    NSURL *dailyForecastURL = [NSURL URLWithString: baseURLString];
    NSURLComponents *components = [NSURLComponents componentsWithURL: dailyForecastURL resolvingAgainstBaseURL: YES];
    
    NSNumber *zipNumber = [NSNumber numberWithDouble:zip];
    NSString *zipString = [zipNumber stringValue];
    NSURLQueryItem *zipQuery = [NSURLQueryItem queryItemWithName: @"zip" value: zipString];
    NSURLQueryItem *apiQuery = [NSURLQueryItem queryItemWithName: @"appid" value: defaultAPIKey];
    [components setQueryItems: @[zipQuery, apiQuery]];
    
    NSURL *componentURL = [components URL];
    NSURLRequest *requestURL = [NSURLRequest requestWithURL: componentURL];
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:requestURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error) {
            NSLog(@"Error fetching forcast: %@", error);
            completion(error);
            return;
        }
        
        if (data == nil) {
            NSLog(@"No data returned from server");
            completion([[NSError alloc] init]);
            return;
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData: data options:0 error:nil];
        IIIWeather *weather = [[IIIWeather alloc] initWithDictionary:jsonDictionary];
        [self setInternalWeather: weather];
        
        for (NSDictionary *dict in weather.list) {
            IIIForecast *forecast = [[IIIForecast alloc] initWithDictionary: dict];
            [[self internalForecasts] addObject:forecast];
        }
        completion(nil);
    }];
    
    [dataTask resume];
}


static NSString *const baseURLString = @"https://api.openweathermap.org/data/2.5/forecast/daily";
static NSString *const defaultAPIKey = @"1340d66bb372ff93adebd79d41eea048";

@end
