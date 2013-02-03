//
//  JSONConvert.m
//  Assignment5
//
//  Created by Philip Nielsen on 23/01/13.
//  Copyright (c) 2013 Philip Nielsen. All rights reserved.
//

#import "JSONConvert.h"
#import "NSObject+Properties.h"

@implementation JSONConvert

#pragma mark - Deserialize string

+ (id)deserializeJSONObjectFromString:(NSString *)JSONString
{
    NSError *error = nil;
    
    id result = [NSJSONSerialization JSONObjectWithData:[JSONString dataUsingEncoding:NSUTF8StringEncoding] options:INT16_MIN error:&error];
    
    if (error) return nil;
    
    return result;
}

+ (id)deserializeJSONObjectFromString:(NSString *)JSONString forType:(Class)classType
{
    // Get Foundation representation, i.e. NSDicationary or NSArray
    id result = [self deserializeJSONObjectFromString:JSONString];
    
    // Get properties of given type
    NSArray *properties = [NSObject classPropertiesForClass:classType];
    
    // If root element is a dictionary it's probably a an object of specified type
    if ([result isKindOfClass:[NSDictionary class]]) {
        
        // Cast root element to dictionary
        NSDictionary *dictionaryResult = (NSDictionary *)result;
        
        // Check if name of class type is the same as the key of the root element
        if (![[dictionaryResult allKeys][0] isKindOfClass:[NSString class]]
            || ![[dictionaryResult allKeys][0] caseInsensitiveCompare:NSStringFromClass(classType)] == NSOrderedSame)
            return nil;
        
        // Now we know that the key of the pased dictionary is the same as the name of the passed in class type,
        // we can therefore retrieve the value of the key in the dictionary, expecting that is will be property mappings
        id proposedProperties = [self objectForCaseInsensitiveStringKey:NSStringFromClass(classType) inDictionary:dictionaryResult];
        
        // Check that the key did have some value
        if (!proposedProperties) return nil;
        
        // If the proposed properties are indeed a dictionary we can continue
        if ([proposedProperties isKindOfClass:[NSDictionary class]]) {
            
            // Cast to dictionary
            NSDictionary *jsonProperties = (NSDictionary *)proposedProperties;
            
            // Init an object of the passed in type
            id p = [[classType alloc] init];
            
            NSDictionary *propertiesAndTypes = [NSObject classPropertiesAndTypeForClass:classType];
            
            // Run through all its properties and set their value
            for (NSString *propertyName in properties) {
                id value = [self objectForCaseInsensitiveStringKey:propertyName inDictionary:jsonProperties];
                if (value && [value isKindOfClass:NSClassFromString(propertiesAndTypes[propertyName])]) [p setValue:value forKey:propertyName];
            }
            
            return p;
        }
    }
    
    return nil;
}

+ (id)deserializeJSONObjectFromString:(NSString *)JSONString forSerializerSettings:(JSONSerializerSettings *)settings
{
    @throw [NSException exceptionWithName:@"NotImplementedException" reason:@"This method is not yet implemented" userInfo:nil];
}

+ (id)deserializeJSONObjectFromString:(NSString *)JSONString forType:(Class)classType andSerializerSettings:(JSONSerializerSettings *)settings
{
    @throw [NSException exceptionWithName:@"NotImplementedException" reason:@"This method is not yet implemented" userInfo:nil];
}

#pragma mark - Async deserialize string

+ (id)deserializeJSONObjectAsynchronouslyFromString:(NSString *)JSONString
{
    @throw [NSException exceptionWithName:@"NotImplementedException" reason:@"This method is not yet implemented" userInfo:nil];
}

+ (id)deserializeJSONObjectAsynchronouslyFromString:(NSString *)JSONString forType:(Class)classType andSerializerSettings:(JSONSerializerSettings *)settings
{
    @throw [NSException exceptionWithName:@"NotImplementedException" reason:@"This method is not yet implemented" userInfo:nil];
}

#pragma mark - Deserialize XML

+ (id)deserializeXMLNodeFromString:(NSString *)xmlString
{
    @throw [NSException exceptionWithName:@"NotImplementedException" reason:@"This method is not yet implemented" userInfo:nil];
}

+ (id)deserializeXMLNodeFromString:(NSString *)xmlString forRootElement:(NSString *)rootElement
{
    @throw [NSException exceptionWithName:@"NotImplementedException" reason:@"This method is not yet implemented" userInfo:nil];
}

+ (id)deserializeXMLNodeFromString:(NSString *)xmlString forRootElement:(NSString *)rootElement andArrayAtrributeFlag:(BOOL)arrayAttributeFlag
{
    @throw [NSException exceptionWithName:@"NotImplementedException" reason:@"This method is not yet implemented" userInfo:nil];
}

#pragma mark - Object population

+ (void)populateObjectOfType:(Class)classType withJSONString:(NSString *)JSONString
{
    @throw [NSException exceptionWithName:@"NotImplementedException" reason:@"This method is not yet implemented" userInfo:nil];
}

+ (void)populateObjectOfType:(Class)classType withJSONString:(NSString *)JSONString andSerializerSettings:(JSONSerializerSettings *)settings
{
    @throw [NSException exceptionWithName:@"NotImplementedException" reason:@"This method is not yet implemented" userInfo:nil];
}

+ (void)asyncronouslyPopulateObjectOfType:(Class)classType withJSONString:(NSString *)JSONString andSerializerSettings:(JSONSerializerSettings *)settings
{
    @throw [NSException exceptionWithName:@"NotImplementedException" reason:@"This method is not yet implemented" userInfo:nil];
}

#pragma mark - Serialization

+ (NSString *)serializeObject:(id)object
{
    // Retrieve all properties of the class
    NSArray *properties = [NSObject classPropertiesForClass:[object class]];
    
    // Initialize a mutable dictionary which is to hold the property mappings
    NSMutableDictionary *serializedObject = [[NSMutableDictionary alloc] initWithCapacity:properties.count];
    
    // Convert properties to dictionary
    for (NSString* property in properties) {
        [serializedObject setObject:[object valueForKey:property] forKey:property];
    }
    
    // Convert dictionary to JSON
    NSError *error;
    NSString *result = [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:@{NSStringFromClass([object class]) : serializedObject} options:0 error:&error] encoding:NSUTF8StringEncoding];
    
    if (error) return nil;
    
    return result;
}

+ (NSString *)serializeObject:(id)object withSerializerSettings:(JSONSerializerSettings *)settings
{
    @throw [NSException exceptionWithName:@"NotImplementedException" reason:@"This method is not yet implemented" userInfo:nil];
}

+ (NSString *)asynchronouslySerializeObject:(id)object
{
    @throw [NSException exceptionWithName:@"NotImplementedException" reason:@"This method is not yet implemented" userInfo:nil];
}

#pragma mark - Utilities

+ (id)objectForCaseInsensitiveStringKey:(NSString *)key inDictionary:(NSDictionary *)dictionary
{
    NSPredicate *searchPred = [NSPredicate predicateWithFormat:@"self LIKE[cd] %@", key];
    NSArray *searchedKeys = [[dictionary allKeys] filteredArrayUsingPredicate:searchPred];
    
    if (searchedKeys.count != 1) return nil;
    
    return dictionary[searchedKeys[0]];
}

@end
