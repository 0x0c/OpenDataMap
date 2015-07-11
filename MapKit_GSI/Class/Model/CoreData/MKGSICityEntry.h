//
//  MKGSICityEntry.h
//  
//
//  Created by Akira Matsuda on 6/30/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <MapKit/MapKit.h>

@interface MKGSICityEntry : NSManagedObject <MKAnnotation>

@property (nonatomic, retain) NSNumber * a2101;
@property (nonatomic, retain) NSNumber * a210101;
@property (nonatomic, retain) NSNumber * a210102;
@property (nonatomic, retain) NSNumber * a2201;
@property (nonatomic, retain) NSNumber * a2301;
@property (nonatomic, retain) NSNumber * a4101;
@property (nonatomic, retain) NSNumber * a4200;
@property (nonatomic, retain) NSNumber * a5101;
@property (nonatomic, retain) NSNumber * a5102;
@property (nonatomic, retain) NSNumber * a7103;
@property (nonatomic, retain) NSNumber * a9101;
@property (nonatomic, retain) NSNumber * a9201;
@property (nonatomic, retain) NSNumber * b1102;
@property (nonatomic, retain) NSNumber * b1103;
@property (nonatomic, retain) NSNumber * b1104;
@property (nonatomic, retain) NSNumber * c120110;
@property (nonatomic, retain) NSNumber * c120120;
@property (nonatomic, retain) NSNumber * c120130;
@property (nonatomic, retain) NSNumber * c3107;
@property (nonatomic, retain) NSNumber * d1202;
@property (nonatomic, retain) NSNumber * e1101;
@property (nonatomic, retain) NSNumber * e1501;
@property (nonatomic, retain) NSNumber * e2101;
@property (nonatomic, retain) NSNumber * e2401;
@property (nonatomic, retain) NSNumber * e2501;
@property (nonatomic, retain) NSNumber * e3101;
@property (nonatomic, retain) NSNumber * e3401;
@property (nonatomic, retain) NSNumber * e3501;
@property (nonatomic, retain) NSNumber * e4101;
@property (nonatomic, retain) NSNumber * e4501;
@property (nonatomic, retain) NSNumber * h7207;
@property (nonatomic, retain) NSNumber * h7208;
@property (nonatomic, retain) NSNumber * h7209;
@property (nonatomic, retain) NSNumber * h720901;
@property (nonatomic, retain) NSNumber * h720902;
@property (nonatomic, retain) NSNumber * h720903;
@property (nonatomic, retain) NSNumber * h720904;
@property (nonatomic, retain) NSNumber * h7210;
@property (nonatomic, retain) NSNumber * h721001;
@property (nonatomic, retain) NSNumber * h721002;
@property (nonatomic, retain) NSNumber * h7501;
@property (nonatomic, retain) NSNumber * h7701;
@property (nonatomic, retain) NSNumber * h770101;
@property (nonatomic, retain) NSNumber * j250502;
@property (nonatomic, retain) NSNumber * sb01101;
@property (nonatomic, retain) NSNumber * sb01301;
@property (nonatomic, retain) NSNumber * sd02206;
@property (nonatomic, retain) NSNumber * se0110201;
@property (nonatomic, retain) NSNumber * se0110202;
@property (nonatomic, retain) NSNumber * se0110203;
@property (nonatomic, retain) NSNumber * lat;
@property (nonatomic, retain) NSNumber * lng;
@property (nonatomic, retain) NSNumber * b1101;
@property (nonatomic, retain) NSString * name;

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, strong) NSString *annotationSubtitle;

- (NSString *)title;
- (NSString *)subtitle;

@end
