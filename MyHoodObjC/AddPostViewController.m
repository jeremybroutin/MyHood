//
//  AddPostViewController.m
//  MyHoodObjC
//
//  Created by Jeremy Broutin on 5/22/17.
//  Copyright © 2017 Jeremy Broutin. All rights reserved.
//

#import "AddPostViewController.h"
#import <UIKit/UIKit.h>
#import "DataService.h"
#import "Post.h"

@interface AddPostViewController ()

@property (nonatomic, strong) UIImagePickerController *imagePicker;
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextField *descField;
@property (weak, nonatomic) IBOutlet UIImageView *postImg;

@end

@implementation AddPostViewController

#pragma mark - View life cycle

- (void)viewDidLoad {
  [super viewDidLoad];

  self.postImg.layer.cornerRadius = self.postImg.frame.size.width / 2;
  self.postImg.clipsToBounds = YES;
  self.imagePicker = [[UIImagePickerController alloc]init];
  self.imagePicker.delegate = self;
}

#pragma mark - IBActions

- (IBAction)addPicBtnPressed:(UIButton *)sender {
  [sender setTitle:@"" forState:UIControlStateNormal];
  [self presentViewController:self.imagePicker animated:YES completion:nil];
}

- (IBAction)makePostBtnPressed:(UIButton *)sender {
  if (self.titleField.text && self.descField.text && self.postImg.image) {
    NSString *imgPath = [[DataService sharedManager] saveImageandCreatePath:self.postImg.image];
    Post *post = [[Post alloc] initWithImagePath:imgPath title:self.titleField.text description:self.descField.text];
    [[DataService sharedManager] addPost:post];
    [self dismissViewControllerAnimated:YES completion:nil];
  }
}


#pragma mark - Delegate methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
  [picker dismissViewControllerAnimated:YES completion:nil];
  UIImage *pickedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
  self.postImg.image = pickedImage;
}

@end
