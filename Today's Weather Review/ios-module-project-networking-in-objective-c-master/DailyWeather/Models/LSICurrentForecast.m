//
//  LSICurrentForecast.m
//  DailyWeather
//
//  Created by Cody Morley on 8/21/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "LSICurrentForecast.h"

@implementation LSICurrentForecast

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        
        NSTimeInterval unixTime = [dictionary[@"time"] doubleValue];
        _time = [NSDate dateWithTimeIntervalSince1970:unixTime];
        _summary = [dictionary[@"summary"] copy];
        _icon = [dictionary[@"icon"] copy];
        _temperature = [dictionary[@"temperature"] doubleValue];
        _windSpeed = [dictionary[@"windSpeed"] doubleValue];
        _windBearing = [dictionary[@"windBearing"] doubleValue];
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:
            @"Current Forecast:\n\ttemp: %0.2fºF, summary: %@, icon: %@, time: %@, ",
            self.temperature, self.summary, self.icon, self.time];
}

@end
