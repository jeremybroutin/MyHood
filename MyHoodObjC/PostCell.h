//
//  PostCell.h
//  MyHoodObjC
//
//  Created by Jeremy Broutin on 5/21/17.
//  Copyright © 2017 Jeremy Broutin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Post.h"

@interface PostCell : UITableViewCell

- (void)configureCellWithPost:(Post *)post;

@end
