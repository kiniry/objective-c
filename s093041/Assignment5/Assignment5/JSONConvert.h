//
//  JSONConvert.h
//  Assignment5
//
//  Created by Philip Nielsen on 23/01/13.
//  Copyright (c) 2013 Philip Nielsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONSerializerSettings.h"

@interface JSONConvert : NSObject

+ (id)deserializeJSONObjectFromString:(NSString *)JSONString; // DeserializeObject(String)
+ (id)deserializeJSONObjectFromString:(NSString *)JSONString forType:(Class)classType; // DeserializeObject(String, Type)
+ (id)deserializeJSONObjectFromString:(NSString *)JSONString forSerializerSettings:(JSONSerializerSettings *)settings; // DeserializeObject(String, JsonSerializerSettings)
+ (id)deserializeJSONObjectFromString:(NSString *)JSONString forType:(Class)classType andSerializerSettings:(JSONSerializerSettings *)settings; // DeserializeObject(String, Type, JsonSerializerSettings)

+ (id)deserializeJSONObjectAsynchronouslyFromString:(NSString *)JSONString; // DeserializeObjectAsync(String)
+ (id)deserializeJSONObjectAsynchronouslyFromString:(NSString *)JSONString forType:(Class)classType andSerializerSettings:(JSONSerializerSettings *)settings; // DeserializeObjectAsync(String, Type, JsonSerializerSettings)

+ (id)deserializeXMLNodeFromString:(NSString *)xmlString; // DeserializeXmlNode(String)
+ (id)deserializeXMLNodeFromString:(NSString *)xmlString forRootElement:(NSString *)rootElement; // DeserializeXmlNode(String, String)
+ (id)deserializeXMLNodeFromString:(NSString *)xmlString forRootElement:(NSString *)rootElement andArrayAtrributeFlag:(BOOL)arrayAttributeFlag; // DeserializeXmlNode(String, String, Boolean)

+ (void)populateObjectOfType:(Class)classType withJSONString:(NSString *)JSONString; // PopulateObject(String, Object)
+ (void)populateObjectOfType:(Class)classType withJSONString:(NSString *)JSONString andSerializerSettings:(JSONSerializerSettings *)settings; // PopulateObject(String, Object, JsonSerializerSettings)
+ (void)asyncronouslyPopulateObjectOfType:(Class)classType withJSONString:(NSString *)JSONString andSerializerSettings:(JSONSerializerSettings *)settings; // PopulateObjectAsync(String, Object, JsonSerializerSettings)

+ (NSString *)serializeObject:(id)object; // SerializeObject(Object)
+ (NSString *)serializeObject:(id)object withSerializerSettings:(JSONSerializerSettings *)settings; // SerializeObject(Object, JsonSerializerSettings)

+ (NSString *)asynchronouslySerializeObject:(id)object; // SerializeObjectAsync(Object)

@end
