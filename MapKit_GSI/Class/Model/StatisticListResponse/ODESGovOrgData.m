//
//  ODESGOVORG.m
//
//  Created by 暁 松田 on 6/29/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ODESGovOrgData.h"

NSString *const kODESGOVORGCode = @"@code";
NSString *const kODESGOVORG = @"$";

@interface ODESGovOrgData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ODESGovOrgData

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
		self.code = [self objectOrNilForKey:kODESGOVORGCode fromDictionary:dict];
		self.name = [self objectOrNilForKey:kODESGOVORG fromDictionary:dict];
	}

	return self;
}

- (NSDictionary *)dictionaryRepresentation
{
	NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
	[mutableDict setValue:self.code forKey:kODESGOVORGCode];
	[mutableDict setValue:self.name forKey:kODESGOVORG];

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

	self.code = [aDecoder decodeObjectForKey:kODESGOVORGCode];
	self.name = [aDecoder decodeObjectForKey:kODESGOVORG];
	return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

	[aCoder encodeObject:_code forKey:kODESGOVORGCode];
	[aCoder encodeObject:_name forKey:kODESGOVORG];
}

- (id)copyWithZone:(NSZone *)zone
{
	ODESGovOrgData *copy = [[ODESGovOrgData alloc] init];

	if (copy) {

		copy.code = [self.code copyWithZone:zone];
		copy.name = [self.name copyWithZone:zone];
	}

	return copy;
}

@end
