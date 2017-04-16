// AUTOGENERATED FILE - DO NOT MODIFY!
// This file generated by Djinni from muse_file.djinni

#import <Foundation/Foundation.h>

/**
 * This data structure contains fields, which describe the running machine. To
 * prevent confusion, field names should correspond to names in the protobuf
 * schema of the .muse file format: http://developer.choosemuse.com/file-formats/muse
 */
@interface IXNComputingDeviceConfiguration : NSObject
- (nonnull instancetype)initWithOsType:(nonnull NSString *)osType
                             osVersion:(nonnull NSString *)osVersion
                     hardwareModelName:(nonnull NSString *)hardwareModelName
                       hardwareModelId:(nonnull NSString *)hardwareModelId
                         processorName:(nonnull NSString *)processorName
                        processorSpeed:(nonnull NSString *)processorSpeed
                    numberOfProcessors:(int32_t)numberOfProcessors
                            memorySize:(nonnull NSString *)memorySize
                      bluetoothVersion:(nonnull NSString *)bluetoothVersion
                              timeZone:(nonnull NSString *)timeZone
                 timeZoneOffsetSeconds:(int32_t)timeZoneOffsetSeconds;
+ (nonnull instancetype)computingDeviceConfigurationWithOsType:(nonnull NSString *)osType
                                                     osVersion:(nonnull NSString *)osVersion
                                             hardwareModelName:(nonnull NSString *)hardwareModelName
                                               hardwareModelId:(nonnull NSString *)hardwareModelId
                                                 processorName:(nonnull NSString *)processorName
                                                processorSpeed:(nonnull NSString *)processorSpeed
                                            numberOfProcessors:(int32_t)numberOfProcessors
                                                    memorySize:(nonnull NSString *)memorySize
                                              bluetoothVersion:(nonnull NSString *)bluetoothVersion
                                                      timeZone:(nonnull NSString *)timeZone
                                         timeZoneOffsetSeconds:(int32_t)timeZoneOffsetSeconds;

/** Operation system type. For ex.: "Android", "iOS", "Windows" */
@property (nonatomic, readonly, nonnull) NSString * osType;

/** Operation system version. For ex.: "10.1", "4.4.2" */
@property (nonatomic, readonly, nonnull) NSString * osVersion;

/** Hardware model. For ex.: "Samsung Galaxy Note 3", "Macbook Pro" */
@property (nonatomic, readonly, nonnull) NSString * hardwareModelName;

/** Hardware model id. For ex.: "SM-N900W8", "MacBookPro-101" */
@property (nonatomic, readonly, nonnull) NSString * hardwareModelId;

/** Processor name. For ex.: "Intel", "ARM" */
@property (nonatomic, readonly, nonnull) NSString * processorName;

/** Processor frequency in Hz */
@property (nonatomic, readonly, nonnull) NSString * processorSpeed;

/** Number of cores */
@property (nonatomic, readonly) int32_t numberOfProcessors;

/** Memory size. For ex.: "500MB", "2000MB" */
@property (nonatomic, readonly, nonnull) NSString * memorySize;

/** Bluetooth version */
@property (nonatomic, readonly, nonnull) NSString * bluetoothVersion;

/** time zone indicator */
@property (nonatomic, readonly, nonnull) NSString * timeZone;

/** time zone offset in seconds */
@property (nonatomic, readonly) int32_t timeZoneOffsetSeconds;

@end