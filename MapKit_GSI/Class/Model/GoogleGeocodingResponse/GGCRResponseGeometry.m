//
//  GGCRResponseGeometry.m
//
//  Created by 暁 松田 on 6/29/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "GGCRResponseGeometry.h"
#import "GGCRResponseViewport.h"
#import "GGCRResponseBounds.h"
#import "GGCRResponseLocation.h"


NSString *const kGGCRResponseGeometryLocationType = @"location_type";
NSString *const kGGCRResponseGeometryViewport = @"viewport";
NSString *const kGGCRResponseGeometryBounds = @"bounds";
NSString *const kGGCRResponseGeometryLocation = @"location";


@interface GGCRResponseGeometry ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GGCRResponseGeometry

@synthesize locationType = _locationType;
@synthesize viewport = _viewport;
@synthesize bounds = _bounds;
@synthesize location = _location;


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
            self.locationType = [self objectOrNilForKey:kGGCRResponseGeometryLocationType fromDictionary:dict];
            self.viewport = [GGCRResponseViewport modelObjectWithDictionary:[dict objectForKey:kGGCRResponseGeometryViewport]];
            self.bounds = [GGCRResponseBounds modelObjectWithDictionary:[dict objectForKey:kGGCRResponseGeometryBounds]];
            self.location = [GGCRResponseLocation modelObjectWithDictionary:[dict objectForKey:kGGCRResponseGeometryLocation]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.locationType forKey:kGGCRResponseGeometryLocationType];
    [mutableDict setValue:[self.viewport dictionaryRepresentation] forKey:kGGCRResponseGeometryViewport];
    [mutableDict setValue:[self.bounds dictionaryRepresentation] forKey:kGGCRResponseGeometryBounds];
    [mutableDict setValue:[self.location dictionaryRepresentation] forKey:kGGCRResponseGeometryLocation];

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

    self.locationType = [aDecoder decodeObjectForKey:kGGCRResponseGeometryLocationType];
    self.viewport = [aDecoder decodeObjectForKey:kGGCRResponseGeometryViewport];
    self.bounds = [aDecoder decodeObjectForKey:kGGCRResponseGeometryBounds];
    self.location = [aDecoder decodeObjectForKey:kGGCRResponseGeometryLocation];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_locationType forKey:kGGCRResponseGeometryLocationType];
    [aCoder encodeObject:_viewport forKey:kGGCRResponseGeometryViewport];
    [aCoder encodeObject:_bounds forKey:kGGCRResponseGeometryBounds];
    [aCoder encodeObject:_location forKey:kGGCRResponseGeometryLocation];
}

- (id)copyWithZone:(NSZone *)zone
{
    GGCRResponseGeometry *copy = [[GGCRResponseGeometry alloc] init];
    
    if (copy) {

        copy.locationType = [self.locationType copyWithZone:zone];
        copy.viewport = [self.viewport copyWithZone:zone];
        copy.bounds = [self.bounds copyWithZone:zone];
        copy.location = [self.location copyWithZone:zone];
    }
    
    return copy;
}


@end
