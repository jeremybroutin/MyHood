//
//  DataService.h
//  MyHoodObjC
//
//  Created by Jeremy Broutin on 5/21/17.
//  Copyright © 2017 Jeremy Broutin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class Post;

@interface DataService : NSObject

@property (nonatomic, strong) NSMutableArray<Post *> *loadedPosts;

- (UIImage*)imageForPath:(NSString*)path;
- (void)loadPosts;
- (NSString*)saveImageandCreatePath:(UIImage*)image;
- (void)addPost:(Post*)post;

+ (DataService*)sharedManager;

@end
