//
//  LSIWeatherForecast.h
//  DailyWeather
//
//  Created by Cody Morley on 8/20/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@class LSICurrentForecast;
@class LSIDailyForecast;
@class LSIHourlyForecast;

@interface LSIWeatherForecast : NSObject


@property (nonatomic) CLLocationCoordinate2D location;
@property (nonatomic) LSICurrentForecast *current;
@property (nonatomic, copy) NSArray<LSIDailyForecast *> *daily;
@property (nonatomic, copy) NSArray<LSIHourlyForecast *> *hourly;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end


NS_ASSUME_NONNULL_END
