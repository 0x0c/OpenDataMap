//
//  ODESCLASSINF.m
//
//  Created by 暁 松田 on 6/29/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ODESDataClassInfo.h"

NSString *const kODESCLASSINFCLASSOBJ = @"CLASS_OBJ";


@interface ODESDataClassInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ODESDataClassInfo

@synthesize classObjects = _classObjects;


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
    NSObject *receivedODESCLASSOBJ = [dict objectForKey:kODESCLASSINFCLASSOBJ];
    NSMutableArray *parsedODESCLASSOBJ = [NSMutableArray array];
    if ([receivedODESCLASSOBJ isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedODESCLASSOBJ) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedODESCLASSOBJ addObject:[ODESDataClassObject modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedODESCLASSOBJ isKindOfClass:[NSDictionary class]]) {
       [parsedODESCLASSOBJ addObject:[ODESDataClassObject modelObjectWithDictionary:(NSDictionary *)receivedODESCLASSOBJ]];
    }

    self.classObjects = [NSArray arrayWithArray:parsedODESCLASSOBJ];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForCLASSOBJ = [NSMutableArray array];
    for (NSObject *subArrayObject in self.classObjects) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCLASSOBJ addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCLASSOBJ addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCLASSOBJ] forKey:kODESCLASSINFCLASSOBJ];

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

    self.classObjects = [aDecoder decodeObjectForKey:kODESCLASSINFCLASSOBJ];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_classObjects forKey:kODESCLASSINFCLASSOBJ];
}

- (id)copyWithZone:(NSZone *)zone
{
    ODESDataClassInfo *copy = [[ODESDataClassInfo alloc] init];
    
    if (copy) {

        copy.classObjects = [self.classObjects copyWithZone:zone];
    }
    
    return copy;
}


@end
