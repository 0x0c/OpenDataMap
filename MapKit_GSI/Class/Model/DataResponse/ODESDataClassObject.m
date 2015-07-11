//
//  ODESCLASSOBJ.m
//
//  Created by 暁 松田 on 6/29/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ODESDataClassObject.h"

NSString *const kODESCLASSOBJId = @"@id";
NSString *const kODESCLASSOBJName = @"@name";
NSString *const kODESCLASSOBJCLASS = @"CLASS";


@interface ODESDataClassObject ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ODESDataClassObject

@synthesize classObjectIdentifier = _classObjectIdentifier;
@synthesize name = _name;
@synthesize classProperty = _classProperty;


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
            self.classObjectIdentifier = [self objectOrNilForKey:kODESCLASSOBJId fromDictionary:dict];
            self.name = [self objectOrNilForKey:kODESCLASSOBJName fromDictionary:dict];
    NSObject *receivedODESCLASSClass = [dict objectForKey:kODESCLASSOBJCLASS];
    NSMutableArray *parsedODESCLASSClass = [NSMutableArray array];
    if ([receivedODESCLASSClass isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedODESCLASSClass) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedODESCLASSClass addObject:[ODESDataClassClass modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedODESCLASSClass isKindOfClass:[NSDictionary class]]) {
       [parsedODESCLASSClass addObject:[ODESDataClassClass modelObjectWithDictionary:(NSDictionary *)receivedODESCLASSClass]];
    }

    self.classProperty = [NSArray arrayWithArray:parsedODESCLASSClass];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.classObjectIdentifier forKey:kODESCLASSOBJId];
    [mutableDict setValue:self.name forKey:kODESCLASSOBJName];
    NSMutableArray *tempArrayForCLASSProperty = [NSMutableArray array];
    for (NSObject *subArrayObject in self.classProperty) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCLASSProperty addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCLASSProperty addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCLASSProperty] forKey:kODESCLASSOBJCLASS];

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

    self.classObjectIdentifier = [aDecoder decodeObjectForKey:kODESCLASSOBJId];
    self.name = [aDecoder decodeObjectForKey:kODESCLASSOBJName];
    self.classProperty = [aDecoder decodeObjectForKey:kODESCLASSOBJCLASS];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_classObjectIdentifier forKey:kODESCLASSOBJId];
    [aCoder encodeObject:_name forKey:kODESCLASSOBJName];
    [aCoder encodeObject:_classProperty forKey:kODESCLASSOBJCLASS];
}

- (id)copyWithZone:(NSZone *)zone
{
    ODESDataClassObject *copy = [[ODESDataClassObject alloc] init];
    
    if (copy) {

        copy.classObjectIdentifier = [self.classObjectIdentifier copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.classProperty = [self.classProperty copyWithZone:zone];
    }
    
    return copy;
}


@end
