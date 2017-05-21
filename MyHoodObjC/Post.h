//
//  Post.h
//  MyHoodObjC
//
//  Created by Jeremy Broutin on 5/21/17.
//  Copyright © 2017 Jeremy Broutin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Post : NSObject

@property (nonatomic, strong) NSString *imagePath;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *postDesc;

- (id)initWithImagePath:(NSString*)path title:(NSString*) title description:(NSString*) desc;
- (id)initWithCoder:(NSCoder*)aDecoder;

@end
