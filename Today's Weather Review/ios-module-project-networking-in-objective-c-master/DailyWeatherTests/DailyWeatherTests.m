//
//  DailyWeatherTests.m
//  DailyWeatherTests
//
//  Created by Paul Solt on 2/19/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LSILog.h"
#import "LSIFileHelper.h"
#import "LSIDailyForecast.h"
#import "LSIHourlyForecast.h"
#import "LSIWeatherForecast.h"
#import "LSICurrentForecast.h"

@interface DailyWeatherTests : XCTestCase

@end

@implementation DailyWeatherTests

- (void)testParseCurrentForecast {
    
    NSData *data = loadFile(@"Weather.json", [self class]);
    NSError *error = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    if (error) {
        NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"Error parsing JSON: %@", jsonString);
    }
    NSDate *firstDayTime = [NSDate dateWithTimeIntervalSince1970:1580976000];
    NSDate *firstHourTime = [NSDate dateWithTimeIntervalSince1970:1581001200];
    
    LSIWeatherForecast *weather = [[LSIWeatherForecast alloc] initWithDictionary:json];
    
    XCTAssertNotNil(weather);
    XCTAssertNotNil(weather.current);
    
    XCTAssertGreaterThan(weather.daily.count, 0);
    LSIDailyForecast *firstDay = weather.daily[0];
    XCTAssertEqualObjects(firstDayTime, firstDay.date);
    
    XCTAssertGreaterThan(weather.hourly.count, 0);
    LSIHourlyForecast *firstHour = weather.hourly[0];
    XCTAssertEqualObjects(firstHourTime, firstHour.date);
}


- (void)testParseDailyWeather {
    
    NSData *data = loadFile(@"DailyWeather.json", [self class]);
    NSError *error = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:1580976000];
    
    NSDate *sunrise = [NSDate dateWithTimeIntervalSince1970:1581001860];
    NSDate *sunset = [NSDate dateWithTimeIntervalSince1970:1581039540];
    
    LSIDailyForecast *daily = [[LSIDailyForecast alloc] initWithDictionary:json];
    
    XCTAssertNotNil(daily);
    
    XCTAssertEqualObjects(date, daily.date);
    XCTAssertEqualObjects(@"clear-day", daily.icon);
    XCTAssertEqualWithAccuracy(61.22, daily.high, 0.00001);
    XCTAssertEqualWithAccuracy(47.02, daily.low, 0.00001);
    XCTAssertEqualObjects(@"Clear throughout the day.", daily.summary);
    XCTAssertEqualObjects(sunrise, daily.sunrise);
    XCTAssertEqualObjects(sunset, daily.sunset);
    
    XCTAssertEqualWithAccuracy(0.0006, daily.precipIntensity, 0.00001);
    XCTAssertEqualWithAccuracy(0.13, daily.precipProbability, 0.00001);
    XCTAssertEqualObjects(@"rain", daily.precipType);
    
    XCTAssertEqualWithAccuracy(0.78, daily.humidity, 0.00001);
    XCTAssertEqualWithAccuracy(3.82, daily.windSpeed, 0.00001);
    XCTAssertEqualWithAccuracy(320, daily.windBearing, 0.00001);
    XCTAssertEqualWithAccuracy(4, daily.uvIndex, 0.00001);
}


- (void)testParseHourlyForecast {
    
    NSData *data = loadFile(@"HourlyWeather.json", [self class]);
    NSError *error = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:1581001200];
        
    LSIHourlyForecast *hourly = [[LSIHourlyForecast alloc] initWithDictionary:json];
    
    XCTAssertNotNil(hourly);
    
    XCTAssertEqualObjects(date, hourly.date);
    XCTAssertEqualObjects(@"Clear", hourly.summary);
    XCTAssertEqualObjects(@"clear-night", hourly.icon);
    XCTAssertEqualWithAccuracy(47.68, hourly.temperature, 0.00001);
    XCTAssertEqualWithAccuracy(0.0, hourly.precipProbability, 0.00001);
    XCTAssertTrue(hourly.precipType == NULL);
    
    XCTAssertEqualWithAccuracy(0.78, hourly.humidity, 0.00001);
    XCTAssertEqualWithAccuracy(3.57, hourly.windSpeed, 0.00001);
    XCTAssertEqualWithAccuracy(36, hourly.windBearing, 0.00001);
    XCTAssertEqualWithAccuracy(0, hourly.uvIndex, 0.00001);
}


@end
