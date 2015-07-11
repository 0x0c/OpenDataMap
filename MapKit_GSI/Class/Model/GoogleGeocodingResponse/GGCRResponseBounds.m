//
//  GGCRResponseBounds.m
//
//  Created by 暁 松田 on 6/29/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "GGCRResponseBounds.h"
#import "GGCRResponseNortheast.h"
#import "GGCRResponseSouthwest.h"


NSString *const kGGCRResponseBoundsNortheast = @"northeast";
NSString *const kGGCRResponseBoundsSouthwest = @"southwest";


@interface GGCRResponseBounds ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GGCRResponseBounds

@synthesize northeast = _northeast;
@synthesize southwest = _southwest;


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
            self.northeast = [GGCRResponseNortheast modelObjectWithDictionary:[dict objectForKey:kGGCRResponseBoundsNortheast]];
            self.southwest = [GGCRResponseSouthwest modelObjectWithDictionary:[dict objectForKey:kGGCRResponseBoundsSouthwest]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.northeast dictionaryRepresentation] forKey:kGGCRResponseBoundsNortheast];
    [mutableDict setValue:[self.southwest dictionaryRepresentation] forKey:kGGCRResponseBoundsSouthwest];

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

    self.northeast = [aDecoder decodeObjectForKey:kGGCRResponseBoundsNortheast];
    self.southwest = [aDecoder decodeObjectForKey:kGGCRResponseBoundsSouthwest];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_northeast forKey:kGGCRResponseBoundsNortheast];
    [aCoder encodeObject:_southwest forKey:kGGCRResponseBoundsSouthwest];
}

- (id)copyWithZone:(NSZone *)zone
{
    GGCRResponseBounds *copy = [[GGCRResponseBounds alloc] init];
    
    if (copy) {

        copy.northeast = [self.northeast copyWithZone:zone];
        copy.southwest = [self.southwest copyWithZone:zone];
    }
    
    return copy;
}


@end
