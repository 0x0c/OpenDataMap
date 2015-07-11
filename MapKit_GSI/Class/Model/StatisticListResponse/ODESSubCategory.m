//
//  ODESSUBCATEGORY.m
//
//  Created by 暁 松田 on 6/29/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ODESSubCategory.h"

NSString *const kODESSUBCATEGORYCode = @"@code";
NSString *const kODESSUBCATEGORY = @"$";

@interface ODESSubCategory ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ODESSubCategory

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
		self.code = [self objectOrNilForKey:kODESSUBCATEGORYCode fromDictionary:dict];
		self.name = [self objectOrNilForKey:kODESSUBCATEGORY fromDictionary:dict];
	}

	return self;
}

- (NSDictionary *)dictionaryRepresentation
{
	NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
	[mutableDict setValue:self.code forKey:kODESSUBCATEGORYCode];
	[mutableDict setValue:self.name forKey:kODESSUBCATEGORY];

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

	self.code = [aDecoder decodeObjectForKey:kODESSUBCATEGORYCode];
	self.name = [aDecoder decodeObjectForKey:kODESSUBCATEGORY];
	return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

	[aCoder encodeObject:_code forKey:kODESSUBCATEGORYCode];
	[aCoder encodeObject:_name forKey:kODESSUBCATEGORY];
}

- (id)copyWithZone:(NSZone *)zone
{
	ODESSubCategory *copy = [[ODESSubCategory alloc] init];

	if (copy) {

		copy.code = [self.code copyWithZone:zone];
		copy.name = [self.name copyWithZone:zone];
	}

	return copy;
}

@end
