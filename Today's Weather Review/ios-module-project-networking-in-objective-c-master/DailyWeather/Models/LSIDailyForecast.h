//
//  LSIDailyForecast.h
//  DailyWeather
//
//  Created by Cody Morley on 8/21/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSIDailyForecast : NSObject

@property (nonatomic) NSDate *date;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic) double high;
@property (nonatomic) double low;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic) NSDate *sunrise;
@property (nonatomic) NSDate *sunset;

@property (nonatomic) double precipIntensity;
@property (nonatomic) double precipProbability;
@property (nonatomic, copy, nullable) NSString *precipType;

@property (nonatomic) double humidity;
@property (nonatomic) double windSpeed;
@property (nonatomic) double windBearing;
@property (nonatomic) double uvIndex;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
