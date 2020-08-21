//
//  LSIDailyForecast.m
//  DailyWeather
//
//  Created by Cody Morley on 8/21/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "LSIDailyForecast.h"

@implementation LSIDailyForecast

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (!self) { return nil; }
    
    NSNumber *unixTime = dictionary[@"time"];
    NSString *icon = dictionary[@"icon"];
    NSNumber *highTemp = dictionary[@"temperatureHigh"];
    NSNumber *lowTemp = dictionary[@"temperatureLow"];
    NSString *summary = dictionary[@"summary"];
    NSNumber *sunriseUnixTime = dictionary[@"sunriseTime"];
    NSNumber *sunsetUnixTime = dictionary[@"sunsetTime"];
    
    NSNumber *precipIntensity = dictionary[@"precipIntensity"];
    NSNumber *precipProbability = dictionary[@"precipProbability"];
    NSString *precipType = dictionary[@"precipType"];
    
    NSNumber *humidity = dictionary[@"humidity"];
    NSNumber *windSpeed = dictionary[@"windSpeed"];
    NSNumber *windBearing = dictionary[@"windBearing"];
    NSNumber *uvIndex = dictionary[@"uvIndex"];
    
    if (unixTime == nil) {
        return nil;
    }
    
    _date = [NSDate dateWithTimeIntervalSince1970:unixTime.longValue];
    _icon = [icon copy];
    _high = [highTemp doubleValue];
    _low = [lowTemp doubleValue];
    _summary = [summary copy];
    
    if (sunriseUnixTime != nil) {
        _sunrise = [NSDate dateWithTimeIntervalSince1970:sunriseUnixTime.longValue];
    }
    
    if (sunsetUnixTime != nil) {
        _sunset = [NSDate dateWithTimeIntervalSince1970:sunsetUnixTime.longValue];
    }
    
    _precipIntensity = [precipIntensity doubleValue];
    _precipProbability = [precipProbability doubleValue];
    
    _precipType = [precipType copy];
    
    _humidity = [humidity doubleValue];
    _windSpeed = [windSpeed doubleValue];
    _windBearing = [windBearing doubleValue];
    _uvIndex = [uvIndex doubleValue];
    
    return self;
}

@end
