//
//  ODESDataRequestResonse.m
//
//  Created by 暁 松田 on 6/29/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ODESDataRequestResponse.h"

NSString *const kODESDataRequestResonseGETSTATSDATA = @"GET_STATS_DATA";


@interface ODESDataRequestResponse ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ODESDataRequestResponse

@synthesize statsData = _statsData;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.statsData = [ODESDataStatsData modelObjectWithDictionary:[dict objectForKey:kODESDataRequestResonseGETSTATSDATA]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.statsData dictionaryRepresentation] forKey:kODESDataRequestResonseGETSTATSDATA];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.statsData = [aDecoder decodeObjectForKey:kODESDataRequestResonseGETSTATSDATA];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_statsData forKey:kODESDataRequestResonseGETSTATSDATA];
}

- (id)copyWithZone:(NSZone *)zone
{
    ODESDataRequestResponse *copy = [[ODESDataRequestResponse alloc] init];
    
    if (copy) {

        copy.statsData = [self.statsData copyWithZone:zone];
    }
    
    return copy;
}


@end
