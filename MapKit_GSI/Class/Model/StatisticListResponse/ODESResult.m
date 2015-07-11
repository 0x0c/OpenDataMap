//
//  ODESRESULT.m
//
//  Created by 暁 松田 on 6/29/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ODESResult.h"

NSString *const kODESRESULTSTATUS = @"STATUS";
NSString *const kODESRESULTERRORMSG = @"ERROR_MSG";
NSString *const kODESRESULTDATE = @"DATE";

@interface ODESResult ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ODESResult

@synthesize status = _status;
@synthesize errorMessage = _errorMessage;
@synthesize date = _date;

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
		self.status = [[self objectOrNilForKey:kODESRESULTSTATUS fromDictionary:dict] doubleValue];
		self.errorMessage = [self objectOrNilForKey:kODESRESULTERRORMSG fromDictionary:dict];
		self.date = [self objectOrNilForKey:kODESRESULTDATE fromDictionary:dict];
	}

	return self;
}

- (NSDictionary *)dictionaryRepresentation
{
	NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
	[mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kODESRESULTSTATUS];
	[mutableDict setValue:self.errorMessage forKey:kODESRESULTERRORMSG];
	[mutableDict setValue:self.date forKey:kODESRESULTDATE];

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

	self.status = [aDecoder decodeDoubleForKey:kODESRESULTSTATUS];
	self.errorMessage = [aDecoder decodeObjectForKey:kODESRESULTERRORMSG];
	self.date = [aDecoder decodeObjectForKey:kODESRESULTDATE];
	return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

	[aCoder encodeDouble:_status forKey:kODESRESULTSTATUS];
	[aCoder encodeObject:_errorMessage forKey:kODESRESULTERRORMSG];
	[aCoder encodeObject:_date forKey:kODESRESULTDATE];
}

- (id)copyWithZone:(NSZone *)zone
{
	ODESResult *copy = [[ODESResult alloc] init];

	if (copy) {

		copy.status = self.status;
		copy.errorMessage = [self.errorMessage copyWithZone:zone];
		copy.date = [self.date copyWithZone:zone];
	}

	return copy;
}

@end
