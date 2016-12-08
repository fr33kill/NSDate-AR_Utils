# NSDate-AR_Utils

Category class for NSDate which has custom methods making life easier. Special thanks to other developers online who helped me on this. 
The methods that can be used are - 

-(NSString *) shortDateString;

-(NSString *) mediumDateString;

-(NSString *) longDateString;

-(NSString *) UTCString;

-(NSString *) shortTimeString;

-(NSString *) mediumTimeString;

-(NSString *) longTimeString;

-(NSString *) shortDateAndTimeString;

-(NSString *) mediumDateAndTimeString;

-(NSString *) longDateAndTimeString;


-(BOOL) isSameDayAs: (NSDate *) date;

-(BOOL) isSameMonthAs: (NSDate *) date;

-(BOOL) isSameYearAs: (NSDate *) date;

-(BOOL) isToday;

-(BOOL) isTomorrow;

-(BOOL) isYesterday;

-(BOOL) isThisMonth;

-(BOOL) isThisYear;

-(BOOL) isPastDate;

-(BOOL) isFutureDate;


+(NSDate *) tomorrow;

+(NSDate *) yesterday;

+(NSDate *) relativeDatesToCurrentDate:(int)days;

-(NSDate *) futureDateByAddingDays: (int) days months: (int) months years: (int) years;

-(NSDate *) firstDayOfMonth;

-(NSDate *) lastDayOfMonth;

-(NSDate *) dateByAddingTimeIntervalAmount: (NSTimeInterval) interval;


-(NSInteger) monthsSinceDate: (NSDate *) date;

-(NSInteger) daysSinceDate: (NSDate *) date;

-(NSInteger) yearsSinceDate: (NSDate *) date;

-(NSInteger) hoursSinceDate: (NSDate *) date;

-(NSInteger)numberOfDaysInMonthCount;

