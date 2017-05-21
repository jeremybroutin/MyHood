//
//  Post.m
//  MyHoodObjC
//
//  Created by Jeremy Broutin on 5/21/17.
//  Copyright © 2017 Jeremy Broutin. All rights reserved.
//

#import "Post.h"

@implementation Post

- (id)init {
  return [super init]; // Probably not necessary.
}

- (id)initWithImagePath:(NSString*)path title:(NSString*) title description:(NSString*) desc {
  self.imagePath = path;
  self.title = title;
  self.postDesc = desc;
  self = [super init];
  return self;
}

- (id)initWithCoder:(NSCoder*)aDecoder {
  self = [super init];
  if(self) {
    self.imagePath = [aDecoder decodeObjectForKey:@"imagePath"];
    self.title = [aDecoder decodeObjectForKey:@"title"];
    self.postDesc = [aDecoder decodeObjectForKey:@"description"];
  }
  return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
  [aCoder encodeObject:self.imagePath forKey:@"imagePath"];
  [aCoder encodeObject:self.title forKey:@"title"];
  [aCoder encodeObject:self.postDesc forKey:@"description"];
}

@end
