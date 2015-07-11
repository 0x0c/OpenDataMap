//
//  ODESRESULTINF.m
//
//  Created by 暁 松田 on 6/29/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ODESResultInfo.h"


NSString *const kODESRESULTINFTOTALNUMBER = @"TOTAL_NUMBER";
NSString *const kODESRESULTINFFROMNUMBER = @"FROM_NUMBER";
NSString *const kODESRESULTINFTONUMBER = @"TO_NUMBER";


@interface ODESResultInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ODESResultInfo

@synthesize totalNumber = _totalNumber;
@synthesize fromNumber = _fromNumber;
@synthesize toNumber = _toNumber;


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
            self.totalNumber = [[self objectOrNilForKey:kODESRESULTINFTOTALNUMBER fromDictionary:dict] doubleValue];
            self.fromNumber = [[self objectOrNilForKey:kODESRESULTINFFROMNUMBER fromDictionary:dict] doubleValue];
            self.toNumber = [[self objectOrNilForKey:kODESRESULTINFTONUMBER fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalNumber] forKey:kODESRESULTINFTOTALNUMBER];
    [mutableDict setValue:[NSNumber numberWithDouble:self.fromNumber] forKey:kODESRESULTINFFROMNUMBER];
    [mutableDict setValue:[NSNumber numberWithDouble:self.toNumber] forKey:kODESRESULTINFTONUMBER];

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

    self.totalNumber = [aDecoder decodeDoubleForKey:kODESRESULTINFTOTALNUMBER];
    self.fromNumber = [aDecoder decodeDoubleForKey:kODESRESULTINFFROMNUMBER];
    self.toNumber = [aDecoder decodeDoubleForKey:kODESRESULTINFTONUMBER];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_totalNumber forKey:kODESRESULTINFTOTALNUMBER];
    [aCoder encodeDouble:_fromNumber forKey:kODESRESULTINFFROMNUMBER];
    [aCoder encodeDouble:_toNumber forKey:kODESRESULTINFTONUMBER];
}

- (id)copyWithZone:(NSZone *)zone
{
    ODESResultInfo *copy = [[ODESResultInfo alloc] init];
    
    if (copy) {

        copy.totalNumber = self.totalNumber;
        copy.fromNumber = self.fromNumber;
        copy.toNumber = self.toNumber;
    }
    
    return copy;
}


@end
