//
//  DataService.h
//  MyHoodObjC
//
//  Created by Jeremy Broutin on 5/21/17.
//  Copyright © 2017 Jeremy Broutin. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Post;

@interface DataService : NSObject

@property (nonatomic, strong) NSMutableArray<Post *> *loadedPosts;

+ (DataService*)sharedManager;

@end
