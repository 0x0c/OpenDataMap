//
//  GGCRResponseBaseClass.m
//
//  Created by 暁 松田 on 6/29/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "GGCRGeocodingResponse.h"

NSString *const kGGCRResponseBaseClassResults = @"results";
NSString *const kGGCRResponseBaseClassStatus = @"status";


@interface GGCRGeocodingResponse ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GGCRGeocodingResponse

@synthesize results = _results;
@synthesize status = _status;


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
    NSObject *receivedGGCRResponseResults = [dict objectForKey:kGGCRResponseBaseClassResults];
    NSMutableArray *parsedGGCRResponseResults = [NSMutableArray array];
    if ([receivedGGCRResponseResults isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedGGCRResponseResults) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedGGCRResponseResults addObject:[GGCRResponseResults modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedGGCRResponseResults isKindOfClass:[NSDictionary class]]) {
       [parsedGGCRResponseResults addObject:[GGCRResponseResults modelObjectWithDictionary:(NSDictionary *)receivedGGCRResponseResults]];
    }

    self.results = [NSArray arrayWithArray:parsedGGCRResponseResults];
            self.status = [self objectOrNilForKey:kGGCRResponseBaseClassStatus fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForResults = [NSMutableArray array];
    for (NSObject *subArrayObject in self.results) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForResults addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForResults addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForResults] forKey:kGGCRResponseBaseClassResults];
    [mutableDict setValue:self.status forKey:kGGCRResponseBaseClassStatus];

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

    self.results = [aDecoder decodeObjectForKey:kGGCRResponseBaseClassResults];
    self.status = [aDecoder decodeObjectForKey:kGGCRResponseBaseClassStatus];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_results forKey:kGGCRResponseBaseClassResults];
    [aCoder encodeObject:_status forKey:kGGCRResponseBaseClassStatus];
}

- (id)copyWithZone:(NSZone *)zone
{
    GGCRGeocodingResponse *copy = [[GGCRGeocodingResponse alloc] init];
    
    if (copy) {

        copy.results = [self.results copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
    }
    
    return copy;
}


@end
