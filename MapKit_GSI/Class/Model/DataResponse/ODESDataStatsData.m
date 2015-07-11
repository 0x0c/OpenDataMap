//
//  ODESGETSTATSDATA.m
//
//  Created by 暁 松田 on 6/29/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ODESDataStatsData.h"

NSString *const kODESGETSTATSDATARESULT = @"RESULT";
NSString *const kODESGETSTATSDATAPARAMETER = @"PARAMETER";
NSString *const kODESGETSTATSDATASTATISTICALDATA = @"STATISTICAL_DATA";


@interface ODESDataStatsData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ODESDataStatsData

@synthesize result = _result;
@synthesize parameter = _parameter;
@synthesize statisticalData = _statisticalData;


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
            self.result = [ODESResult modelObjectWithDictionary:[dict objectForKey:kODESGETSTATSDATARESULT]];
            self.parameter = [ODESDataRequestResponseParameter modelObjectWithDictionary:[dict objectForKey:kODESGETSTATSDATAPARAMETER]];
            self.statisticalData = [ODESDataStatisticalData modelObjectWithDictionary:[dict objectForKey:kODESGETSTATSDATASTATISTICALDATA]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.result dictionaryRepresentation] forKey:kODESGETSTATSDATARESULT];
    [mutableDict setValue:[self.parameter dictionaryRepresentation] forKey:kODESGETSTATSDATAPARAMETER];
    [mutableDict setValue:[self.statisticalData dictionaryRepresentation] forKey:kODESGETSTATSDATASTATISTICALDATA];

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

    self.result = [aDecoder decodeObjectForKey:kODESGETSTATSDATARESULT];
    self.parameter = [aDecoder decodeObjectForKey:kODESGETSTATSDATAPARAMETER];
    self.statisticalData = [aDecoder decodeObjectForKey:kODESGETSTATSDATASTATISTICALDATA];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kODESGETSTATSDATARESULT];
    [aCoder encodeObject:_parameter forKey:kODESGETSTATSDATAPARAMETER];
    [aCoder encodeObject:_statisticalData forKey:kODESGETSTATSDATASTATISTICALDATA];
}

- (id)copyWithZone:(NSZone *)zone
{
    ODESDataStatsData *copy = [[ODESDataStatsData alloc] init];
    
    if (copy) {

        copy.result = [self.result copyWithZone:zone];
        copy.parameter = [self.parameter copyWithZone:zone];
        copy.statisticalData = [self.statisticalData copyWithZone:zone];
    }
    
    return copy;
}


@end
