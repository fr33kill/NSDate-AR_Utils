//
//  NSDate+AR_Utils.h
//  
//
//  Created by Aravind Raj Vijayakumar on 07/12/16.
//  Copyright © 2016 Aravind Raj Vijayakumar. All rights reserved.
//  Thanks to github, StackOverflow and all developers out there.

#import <Foundation/Foundation.h>


@interface NSDate(NSDate_AR_Utils)

/**
 * Date formats
 **/
- (NSString *) shortDateString;
- (NSString *) mediumDateString;
- (NSString *) longDateString;
- (NSString *) UTCString;

/**
 * Time formats
 **/
- (NSString *) shortTimeString;
- (NSString *) mediumTimeString;
- (NSString *) longTimeString;

/**
 * Date and Time formats
 **/
- (NSString *) shortDateAndTimeString;
- (NSString *) mediumDateAndTimeString;
- (NSString *) longDateAndTimeString;

/**
 * Date Comparison
 **/
- (BOOL) isSameDayAs: (NSDate *) date;
- (BOOL) isSameMonthAs: (NSDate *) date;
- (BOOL) isSameYearAs: (NSDate *) date;

- (BOOL) isToday;
- (BOOL) isTomorrow;
- (BOOL) isYesterday;
- (BOOL) isThisMonth;
- (BOOL) isThisYear;
- (BOOL) isPastDate;
- (BOOL) isFutureDate;

/**
 * Relative Dates
 **/
+ (NSDate *) tomorrow;
+ (NSDate *) yesterday;
+ (NSDate *) relativeDatesToCurrentDate:(int)days;
- (NSDate *) futureDateByAddingDays: (int) days months: (int) months years: (int) years;
- (NSDate *) firstDayOfMonth;
- (NSDate *) lastDayOfMonth;
- (NSDate *) dateByAddingTimeIntervalAmount: (NSTimeInterval) interval;

- (NSInteger) monthsSinceDate: (NSDate *) date;
- (NSInteger) daysSinceDate: (NSDate *) date;
- (NSInteger) yearsSinceDate: (NSDate *) date;
- (NSInteger) hoursSinceDate: (NSDate *) date;
- (NSInteger)numberOfDaysInMonthCount;

@end
