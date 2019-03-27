//
//  IIIWeatherViewController.m
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIWeatherViewController.h"
#import "../Model Controller/IIIWeatherController.h"
#import "../Views/IIIWeatherCollectionViewCell.h"
#import "../Model/IIIWeather.h"
#import "../Model/IIIForecast.h"

@interface IIIWeatherViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation IIIWeatherViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _weatherController = [[IIIWeatherController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self collectionView] setDataSource: self];
    [[self searchBar] setDelegate: self];
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *zip = [searchBar text];
    [[self weatherController] fetchWeatherWithZip: [zip doubleValue] completion:^(NSError *error) {
        if (error) {
            NSLog(@"Error fetching weather");
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [[self collectionView] reloadData];
            NSString *city = [[[self weatherController] weather] name];
            [[self cityNameLabel] setText: city];
        });
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [[[self weatherController] forecasts] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    IIIWeatherCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WeatherCell" forIndexPath:indexPath];
    
    IIIForecast *forecast = [[[self weatherController] forecasts] objectAtIndex: [indexPath row]];
    [cell setForecast: forecast];
    
    return cell;
}

@end
