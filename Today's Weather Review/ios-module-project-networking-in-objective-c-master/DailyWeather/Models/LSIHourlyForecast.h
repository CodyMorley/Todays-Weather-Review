//
//  LSIHourlyForecast.h
//  DailyWeather
//
//  Created by Cody Morley on 8/21/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSIHourlyForecast : NSObject

@property (nonatomic) NSDate *date;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic) double temperature;

@property (nonatomic) double precipProbability;
@property (nonatomic, nullable, copy) NSString *precipType;

@property (nonatomic) double humidity;
@property (nonatomic) double windSpeed;
@property (nonatomic) double windBearing;
@property (nonatomic) double uvIndex;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;


@end

NS_ASSUME_NONNULL_END
