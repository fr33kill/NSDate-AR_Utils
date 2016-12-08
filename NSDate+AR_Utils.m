//
//  NSDate+AR_Utils.m
//
//
//  Created by Aravind Raj Vijayakumar on 07/12/16.
//  Copyright © 2016 Aravind Raj Vijayakumar. All rights reserved.
//  Thanks to github, StackOverflow and all developers out there.

#import "NSDate+AR_Utils.h"

#define TIME_INTERVAL_FOR_HOURS 3600
#define TIME_INTERVAL_FOR_WEEKS 604800

@implementation NSDate(NSDate_AR_Utils)


#pragma mark - String Properties

- (NSString *) stringWithDateStyle: (NSDateFormatterStyle) dateStyle timeStyle: (NSDateFormatterStyle) timeStyle
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateStyle = dateStyle;
    formatter.timeStyle = timeStyle;
    return [formatter stringFromDate:self];
}

- (NSString *) shortDateAndTimeString
{
    return [self stringWithDateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle];
}

- (NSString *) mediumDateAndTimeString
{
    return [self stringWithDateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterMediumStyle ];
}

- (NSString *) longDateAndTimeString
{
    return [self stringWithDateStyle:NSDateFormatterLongStyle timeStyle:NSDateFormatterLongStyle ];
}

- (NSString *) shortDateString
{
    return  [self stringWithDateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle];
}

- (NSString *) mediumDateString
{
    return  [self stringWithDateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterNoStyle];
}

- (NSString *) longDateString
{
    return  [self stringWithDateStyle:NSDateFormatterLongStyle timeStyle:NSDateFormatterNoStyle];
}

- (NSString *) shortTimeString
{
    return  [self stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterShortStyle];
}

- (NSString *) mediumTimeString
{
    return  [self stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterMediumStyle];
}

- (NSString *) longTimeString
{
    return  [self stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterLongStyle];
}

- (NSString *) UTCString
{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
    NSString* dateTimeInIsoFormatForZuluTimeZone = [dateFormatter stringFromDate:self];
    return dateTimeInIsoFormatForZuluTimeZone;
}

#pragma mark - Date Comparison

- (BOOL) isSameDayAs: (NSDate *) givenDate
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dayComponent = [calendar components:NSCalendarUnitDay fromDate:self];
    NSDateComponents *givenDayComponent = [calendar components:NSCalendarUnitDay fromDate:givenDate];
    return ((dayComponent.day == givenDayComponent.day) && (dayComponent.month == givenDayComponent.month) && (dayComponent.year == givenDayComponent.year));
}

- (BOOL) isSameMonthAs: (NSDate *) givenDate
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *monthComponent = [calendar components:NSCalendarUnitMonth fromDate:self];
    NSDateComponents *givenMonthComponent = [calendar components:NSCalendarUnitMonth fromDate:givenDate];
    return ((monthComponent.month == givenMonthComponent.month) && (monthComponent.year == givenMonthComponent.year));
}

- (BOOL) isSameYearAs: (NSDate *) givenDate
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *yearComponent = [calendar components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *givenYearComponent = [calendar components:NSCalendarUnitYear fromDate:givenDate];
    return (yearComponent.year == givenYearComponent.year);

}

- (BOOL) isToday
{
    return [self isSameDayAs:[NSDate date]];

}

- (BOOL) isTomorrow
{
    return [self isSameDayAs:[NSDate tomorrow]];

}

- (BOOL) isYesterday
{
    return [self isSameDayAs:[NSDate yesterday]];
}

- (BOOL) isThisMonth
{
    return [self isSameMonthAs:[NSDate date]];

}

- (BOOL) isThisYear
{
    return [self isSameYearAs:[NSDate date]];

}

- (BOOL) isPastDate
{
    return  ([self compare:[NSDate date]] == NSOrderedAscending);
}

- (BOOL) isFutureDate
{
    return  ([self compare:[NSDate date]] == NSOrderedDescending);
}

#pragma mark - Relative Dates 

+ (NSDate *) relativeDatesToCurrentDate:(int)days
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setDay:days];
    NSDate *date = [calendar dateByAddingComponents:dateComponents toDate:[NSDate date] options:0];
    
    return date;
}

+ (NSDate *) yesterday
{
    return [NSDate relativeDatesToCurrentDate:-1];
}

+ (NSDate *) tomorrow
{
    return [NSDate relativeDatesToCurrentDate:1];
}

- (NSDate *) futureDateByAddingDays: (int) days months: (int) months years: (int) years
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setDay:days];
    [dateComponents setMonth:months];
    [dateComponents setYear:years];
    
    NSDate *futureDate = [calendar dateByAddingComponents:dateComponents toDate:[NSDate date] options:0];
    
    return futureDate;
}

- (NSDate *) firstDayOfMonth
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [calendar components:NSCalendarUnitYear |
                                                         NSCalendarUnitMonth |
                                                         NSCalendarUnitDay fromDate:self];
    [components setDay:1];
    
    NSDate *dayOneInCurrentMonth = [calendar dateFromComponents:components];
    return dayOneInCurrentMonth;
}

- (NSDate *) lastDayOfMonth
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSInteger dayCount = [self numberOfDaysInMonthCount];
    
    NSDateComponents *components = [calendar components:
                              NSCalendarUnitYear |
                              NSCalendarUnitMonth |
                              NSCalendarUnitDay fromDate:self];
    [components setDay:dayCount];
    
    NSDate *lastDayOfCurrentMonth = [calendar dateFromComponents:components];
    return lastDayOfCurrentMonth;
}

- (NSDate *) dateByAddingTimeIntervalAmount: (NSTimeInterval) interval
{
    NSDate *addedDate = [self dateByAddingTimeInterval:interval];
    return addedDate;
}

- (NSInteger) monthsSinceDate: (NSDate *) givenDate
{
    NSInteger months = [[[NSCalendar currentCalendar] components: NSCalendarUnitMonth
                                                       fromDate: [NSDate date]
                                                         toDate: givenDate
                                                        options: 0] month];
    return months;
}

- (NSInteger) daysSinceDate: (NSDate *) givenDate
{
    NSInteger days = [[[NSCalendar currentCalendar] components: NSCalendarUnitMonth
                                                        fromDate: [NSDate date]
                                                          toDate: givenDate
                                                         options: 0] day];
    return days;

}

- (NSInteger) yearsSinceDate: (NSDate *) givenDate
{
    NSInteger years = [[[NSCalendar currentCalendar] components: NSCalendarUnitMonth
                                                      fromDate: [NSDate date]
                                                        toDate: givenDate
                                                       options: 0] year];
    return years;

}

- (NSInteger) hoursSinceDate: (NSDate *) givenDate
{
    NSTimeInterval timeInterval = [self timeIntervalSinceDate:givenDate];
    return (NSInteger) (timeInterval / TIME_INTERVAL_FOR_HOURS);
}

- (NSInteger) weeksSinceDate: (NSDate *) givenDate
{
    NSTimeInterval timeInterval = [self timeIntervalSinceDate:givenDate];
    return (NSInteger) (timeInterval / TIME_INTERVAL_FOR_WEEKS);
}

-(NSInteger)numberOfDaysInMonthCount
{
    NSRange dayRange = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay
                                             inUnit:NSCalendarUnitMonth
                                            forDate:self];
    
    return dayRange.length;
}

@end
