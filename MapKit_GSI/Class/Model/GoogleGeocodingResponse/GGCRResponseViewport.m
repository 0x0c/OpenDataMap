//
//  GGCRResponseViewport.m
//
//  Created by 暁 松田 on 6/29/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "GGCRResponseViewport.h"
#import "GGCRResponseNortheast.h"
#import "GGCRResponseSouthwest.h"


NSString *const kGGCRResponseViewportNortheast = @"northeast";
NSString *const kGGCRResponseViewportSouthwest = @"southwest";


@interface GGCRResponseViewport ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GGCRResponseViewport

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
            self.northeast = [GGCRResponseNortheast modelObjectWithDictionary:[dict objectForKey:kGGCRResponseViewportNortheast]];
            self.southwest = [GGCRResponseSouthwest modelObjectWithDictionary:[dict objectForKey:kGGCRResponseViewportSouthwest]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.northeast dictionaryRepresentation] forKey:kGGCRResponseViewportNortheast];
    [mutableDict setValue:[self.southwest dictionaryRepresentation] forKey:kGGCRResponseViewportSouthwest];

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

    self.northeast = [aDecoder decodeObjectForKey:kGGCRResponseViewportNortheast];
    self.southwest = [aDecoder decodeObjectForKey:kGGCRResponseViewportSouthwest];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_northeast forKey:kGGCRResponseViewportNortheast];
    [aCoder encodeObject:_southwest forKey:kGGCRResponseViewportSouthwest];
}

- (id)copyWithZone:(NSZone *)zone
{
    GGCRResponseViewport *copy = [[GGCRResponseViewport alloc] init];
    
    if (copy) {

        copy.northeast = [self.northeast copyWithZone:zone];
        copy.southwest = [self.southwest copyWithZone:zone];
    }
    
    return copy;
}


@end
