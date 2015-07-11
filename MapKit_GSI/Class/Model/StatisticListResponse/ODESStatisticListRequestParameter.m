//
//  ODESPARAMETER.m
//
//  Created by 暁 松田 on 6/29/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ODESStatisticListRequestParameter.h"

NSString *const kODESPARAMETERLANG = @"LANG";
NSString *const kODESPARAMETERSEARCHKIND = @"SEARCH_KIND";
NSString *const kODESPARAMETERDATAFORMAT = @"DATA_FORMAT";

@interface ODESStatisticListRequestParameter ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ODESStatisticListRequestParameter

@synthesize language = _language;
@synthesize searchKind = _searchKind;
@synthesize dataFormat = _dataFormat;

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
		self.language = [self objectOrNilForKey:kODESPARAMETERLANG fromDictionary:dict];
		self.searchKind = [[self objectOrNilForKey:kODESPARAMETERSEARCHKIND fromDictionary:dict] doubleValue];
		self.dataFormat = [self objectOrNilForKey:kODESPARAMETERDATAFORMAT fromDictionary:dict];
	}

	return self;
}

- (NSDictionary *)dictionaryRepresentation
{
	NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
	[mutableDict setValue:self.language forKey:kODESPARAMETERLANG];
	[mutableDict setValue:[NSNumber numberWithDouble:self.searchKind] forKey:kODESPARAMETERSEARCHKIND];
	[mutableDict setValue:self.dataFormat forKey:kODESPARAMETERDATAFORMAT];

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

	self.language = [aDecoder decodeObjectForKey:kODESPARAMETERLANG];
	self.searchKind = [aDecoder decodeDoubleForKey:kODESPARAMETERSEARCHKIND];
	self.dataFormat = [aDecoder decodeObjectForKey:kODESPARAMETERDATAFORMAT];
	return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

	[aCoder encodeObject:_language forKey:kODESPARAMETERLANG];
	[aCoder encodeDouble:_searchKind forKey:kODESPARAMETERSEARCHKIND];
	[aCoder encodeObject:_dataFormat forKey:kODESPARAMETERDATAFORMAT];
}

- (id)copyWithZone:(NSZone *)zone
{
	ODESStatisticListRequestParameter *copy = [[ODESStatisticListRequestParameter alloc] init];

	if (copy) {

		copy.language = [self.language copyWithZone:zone];
		copy.searchKind = self.searchKind;
		copy.dataFormat = [self.dataFormat copyWithZone:zone];
	}

	return copy;
}

@end
