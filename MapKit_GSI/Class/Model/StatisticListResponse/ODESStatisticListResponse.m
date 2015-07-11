//
//  ODESStatisticListResponse.m
//
//  Created by 暁 松田 on 6/29/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ODESStatisticListResponse.h"
#import "ODESStatsList.h"

NSString *const kODESStatisticListResponseGETSTATSLIST = @"GET_STATS_LIST";

@interface ODESStatisticListResponse ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ODESStatisticListResponse

@synthesize statsList = _statsList;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
	return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
	self = [super init];

	// This check serves to make sure that a non-NSDictionary object
	// passed into the model class doesn't break the parsing.
	if (self && [dict isKindOfClass:[NSDictionary class]]) {
		self.statsList = [ODESStatsList modelObjectWithDictionary:[dict objectForKey:kODESStatisticListResponseGETSTATSLIST]];
	}

	return self;
}

- (NSDictionary *)dictionaryRepresentation
{
	NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
	[mutableDict setValue:[self.statsList dictionaryRepresentation] forKey:kODESStatisticListResponseGETSTATSLIST];

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

	self.statsList = [aDecoder decodeObjectForKey:kODESStatisticListResponseGETSTATSLIST];
	return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

	[aCoder encodeObject:_statsList forKey:kODESStatisticListResponseGETSTATSLIST];
}

- (id)copyWithZone:(NSZone *)zone
{
	ODESStatisticListResponse *copy = [[ODESStatisticListResponse alloc] init];

	if (copy) {

		copy.statsList = [self.statsList copyWithZone:zone];
	}

	return copy;
}

@end
