//
//  ODESMAINCATEGORY.m
//
//  Created by 暁 松田 on 6/29/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ODESMainCategory.h"

NSString *const kODESMAINCATEGORYCode = @"@code";
NSString *const kODESMAINCATEGORY = @"$";

@interface ODESMainCategory ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ODESMainCategory

@synthesize code = _code;
@synthesize name = _name;

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
		self.code = [self objectOrNilForKey:kODESMAINCATEGORYCode fromDictionary:dict];
		self.name = [self objectOrNilForKey:kODESMAINCATEGORY fromDictionary:dict];
	}

	return self;
}

- (NSDictionary *)dictionaryRepresentation
{
	NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
	[mutableDict setValue:self.code forKey:kODESMAINCATEGORYCode];
	[mutableDict setValue:self.name forKey:kODESMAINCATEGORY];

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

	self.code = [aDecoder decodeObjectForKey:kODESMAINCATEGORYCode];
	self.name = [aDecoder decodeObjectForKey:kODESMAINCATEGORY];
	return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

	[aCoder encodeObject:_code forKey:kODESMAINCATEGORYCode];
	[aCoder encodeObject:_name forKey:kODESMAINCATEGORY];
}

- (id)copyWithZone:(NSZone *)zone
{
	ODESMainCategory *copy = [[ODESMainCategory alloc] init];

	if (copy) {

		copy.code = [self.code copyWithZone:zone];
		copy.name = [self.name copyWithZone:zone];
	}

	return copy;
}

@end
