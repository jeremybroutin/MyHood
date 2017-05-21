//
//  PostCell.m
//  MyHoodObjC
//
//  Created by Jeremy Broutin on 5/21/17.
//  Copyright © 2017 Jeremy Broutin. All rights reserved.
//

#import "PostCell.h"
#import "Post.h"

@interface PostCell ()

@property (weak, nonatomic) IBOutlet UIImageView *postImg;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@end

@implementation PostCell

- (void)awakeFromNib {
  [super awakeFromNib];
  // Customize IBOutlets
  self.postImg.layer.cornerRadius = self.postImg.frame.size.width / 2;
  self.postImg.clipsToBounds = YES;

}

- (void)configureCellWithPost:(Post *)post {
  // Configure cell IBOutlets
  self.titleLabel.text = post.title;
  self.descLabel.text = post.postDesc;
  // Get image from path via DataService
}

@end
