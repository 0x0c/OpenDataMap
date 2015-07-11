//
//  ODESGETSTATSLIST.m
//
//  Created by 暁 松田 on 6/29/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ODESStatsList.h"
#import "ODESResult.h"
#import "ODESStatisticListRequestParameter.h"
#import "ODESDataListInfo.h"

NSString *const kODESGETSTATSLISTRESULT = @"RESULT";
NSString *const kODESGETSTATSLISTPARAMETER = @"PARAMETER";
NSString *const kODESGETSTATSLISTDATALISTINF = @"DATALIST_INF";

@interface ODESStatsList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ODESStatsList

@synthesize result = _result;
@synthesize parameter = _parameter;
@synthesize dataListInfo = _dataListInfo;

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
		self.result = [ODESResult modelObjectWithDictionary:[dict objectForKey:kODESGETSTATSLISTRESULT]];
		self.parameter = [ODESStatisticListRequestParameter modelObjectWithDictionary:[dict objectForKey:kODESGETSTATSLISTPARAMETER]];
		self.dataListInfo = [ODESDataListInfo modelObjectWithDictionary:[dict objectForKey:kODESGETSTATSLISTDATALISTINF]];
	}

	return self;
}

- (NSDictionary *)dictionaryRepresentation
{
	NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
	[mutableDict setValue:[self.result dictionaryRepresentation] forKey:kODESGETSTATSLISTRESULT];
	[mutableDict setValue:[self.parameter dictionaryRepresentation] forKey:kODESGETSTATSLISTPARAMETER];
	[mutableDict setValue:[self.dataListInfo dictionaryRepresentation] forKey:kODESGETSTATSLISTDATALISTINF];

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

	self.result = [aDecoder decodeObjectForKey:kODESGETSTATSLISTRESULT];
	self.parameter = [aDecoder decodeObjectForKey:kODESGETSTATSLISTPARAMETER];
	self.dataListInfo = [aDecoder decodeObjectForKey:kODESGETSTATSLISTDATALISTINF];
	return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

	[aCoder encodeObject:_result forKey:kODESGETSTATSLISTRESULT];
	[aCoder encodeObject:_parameter forKey:kODESGETSTATSLISTPARAMETER];
	[aCoder encodeObject:_dataListInfo forKey:kODESGETSTATSLISTDATALISTINF];
}

- (id)copyWithZone:(NSZone *)zone
{
	ODESStatsList *copy = [[ODESStatsList alloc] init];

	if (copy) {

		copy.result = [self.result copyWithZone:zone];
		copy.parameter = [self.parameter copyWithZone:zone];
		copy.dataListInfo = [self.dataListInfo copyWithZone:zone];
	}

	return copy;
}

@end
