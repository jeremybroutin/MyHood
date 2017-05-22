//
//  ViewController.m
//  MyHoodObjC
//
//  Created by Jeremy Broutin on 5/21/17.
//  Copyright © 2017 Jeremy Broutin. All rights reserved.
//

#import "ViewController.h"
#import "DataService.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return DataService.sharedManager.loadedPosts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  return [[UITableViewCell alloc] init];
}

@end
