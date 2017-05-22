//
//  ViewController.m
//  MyHoodObjC
//
//  Created by Jeremy Broutin on 5/21/17.
//  Copyright © 2017 Jeremy Broutin. All rights reserved.
//

#import "ViewController.h"
#import "DataService.h"
#import "PostCell.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  [[DataService sharedManager] loadPosts];
  [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(onPostsLoaded:) name:@"postsLoaded" object:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [DataService sharedManager].loadedPosts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  Post *post = [DataService sharedManager].loadedPosts[indexPath.row];
  PostCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostCell"];
  if (cell) {
    [cell configureCellWithPost:post];
    return cell;
  } else {
    PostCell *cell = [[PostCell alloc]init];
    [cell configureCellWithPost:post];
    return cell;
  }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return 87.0;
}

- (void)onPostsLoaded:(id*)notif {
  [self.tableView reloadData];
}

@end
