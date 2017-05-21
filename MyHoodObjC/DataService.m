//
//  DataService.m
//  MyHoodObjC
//
//  Created by Jeremy Broutin on 5/21/17.
//  Copyright © 2017 Jeremy Broutin. All rights reserved.
//

#import "DataService.h"
#import "UIKit/UIKit.h"

static NSString *const KEY_POSTS = @"posts";

@implementation DataService

#pragma mark Singleton methods

+ (id)sharedManager {
  static DataService *sharedDataService = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedDataService = [[self alloc] init];
  });
  return sharedDataService;
}

- (id)init {
  if (self = [super init]) {
    // Initiliaze any property
  }
  return self;
}

#pragma mark DataService methods

- (void)savePosts {
  NSData *postsData = [NSKeyedArchiver archivedDataWithRootObject:self.loadedPosts];
  [NSUserDefaults.standardUserDefaults setObject:postsData forKey:KEY_POSTS];
  [NSUserDefaults.standardUserDefaults synchronize];
}

- (void)loadPosts {
  NSData *postsData = [NSKeyedArchiver archivedDataWithRootObject:self.loadedPosts];
  if (postsData) {
    NSMutableArray<Post*> *postsArray = [NSKeyedUnarchiver unarchiveObjectWithData:postsData];
    if (postsArray) {
      self.loadedPosts = postsArray;
    }
  }
  [NSNotificationCenter.defaultCenter postNotificationName:@"postsLoaded" object:nil];
}

- (NSString*)saveImageandCreatePath:(UIImage*)image {
  NSData *imgData = UIImagePNGRepresentation(image);
  NSString *imgPath = [NSString stringWithFormat:@"image %f.png", [NSDate timeIntervalSinceReferenceDate]];
  NSString *fullPath = [self documentsPathForFileName:imgPath];
  @try {
    [imgData writeToURL:[NSURL fileURLWithPath:fullPath] atomically:YES];
  }
  @catch (NSException *exception) {
    NSLog(@"Could not write imgData to fullpath");
  }
  return imgPath;

}

- (UIImage*)imageForPath:(NSString*)path {
  NSString *fullPath = [self documentsPathForFileName:path];
  UIImage *image = [UIImage imageNamed:fullPath];
  return image;
}

- (NSString*)documentsPathForFileName:(NSString*)name {
  NSArray<NSString*> *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
  NSString *fullPath = paths[0];
  return [fullPath stringByAppendingPathComponent:name];
}

- (void)addPost:(Post*)post {
  [self.loadedPosts addObject:post];
  [self savePosts];
  [self loadPosts];
}

@end
