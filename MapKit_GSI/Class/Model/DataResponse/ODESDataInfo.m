//
//  ODESDATAINF.m
//
//  Created by 暁 松田 on 6/29/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ODESDataInfo.h"

NSString *const kODESDATAINFVALUE = @"VALUE";
NSString *const kODESDATAINFNOTE = @"NOTE";


@interface ODESDataInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ODESDataInfo

@synthesize value = _value;
@synthesize note = _note;


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
    NSObject *receivedODESVALUE = [dict objectForKey:kODESDATAINFVALUE];
    NSMutableArray *parsedODESVALUE = [NSMutableArray array];
    if ([receivedODESVALUE isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedODESVALUE) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedODESVALUE addObject:[ODESValue modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedODESVALUE isKindOfClass:[NSDictionary class]]) {
       [parsedODESVALUE addObject:[ODESValue modelObjectWithDictionary:(NSDictionary *)receivedODESVALUE]];
    }

    self.value = [NSArray arrayWithArray:parsedODESVALUE];
    NSObject *receivedODESNOTE = [dict objectForKey:kODESDATAINFNOTE];
    NSMutableArray *parsedODESNOTE = [NSMutableArray array];
    if ([receivedODESNOTE isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedODESNOTE) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedODESNOTE addObject:[ODESNote modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedODESNOTE isKindOfClass:[NSDictionary class]]) {
       [parsedODESNOTE addObject:[ODESNote modelObjectWithDictionary:(NSDictionary *)receivedODESNOTE]];
    }

    self.note = [NSArray arrayWithArray:parsedODESNOTE];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForVALUE = [NSMutableArray array];
    for (NSObject *subArrayObject in self.value) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForVALUE addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForVALUE addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForVALUE] forKey:kODESDATAINFVALUE];
    NSMutableArray *tempArrayForNOTE = [NSMutableArray array];
    for (NSObject *subArrayObject in self.note) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForNOTE addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForNOTE addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForNOTE] forKey:kODESDATAINFNOTE];

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

    self.value = [aDecoder decodeObjectForKey:kODESDATAINFVALUE];
    self.note = [aDecoder decodeObjectForKey:kODESDATAINFNOTE];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_value forKey:kODESDATAINFVALUE];
    [aCoder encodeObject:_note forKey:kODESDATAINFNOTE];
}

- (id)copyWithZone:(NSZone *)zone
{
    ODESDataInfo *copy = [[ODESDataInfo alloc] init];
    
    if (copy) {

        copy.value = [self.value copyWithZone:zone];
        copy.note = [self.note copyWithZone:zone];
    }
    
    return copy;
}


@end
