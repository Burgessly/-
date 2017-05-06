//
//  LYmineViewController.m
//  音伴尔家听宝
//
//  Created by Burgess on 2017/4/10.
//  Copyright © 2017年 Burgess. All rights reserved.
//

#import "LYmineViewController.h"
#import "LYmineView.h"

@interface LYmineViewController ()

@end

@implementation LYmineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    self.tableView = [[UITableView alloc]initWithFrame:self.tableView.bounds style:UITableViewStyleGrouped];
#warning 这个属性时只读，想办法改变它
//    self.tableView.style = UITableViewStyleGrouped;
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 4;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        LYmineView * view1 = [LYmineView initmineview];
        view1.bounds = CGRectMake(0, 0, 375, 380);
        return view1;
    }
    return NULL;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 380;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell;
//        cell = [[[NSBundle mainBundle] loadNibNamed:@"LYmineViewcell" owner:NULL options:NULL]firstObject];
    NSArray  *array  = @[@"bag",@"heart",@"time",@"local"];
    NSArray * lebel = @[@"我的书包",@"我喜欢的",@"播放历史",@"所在城市"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
        if (cell == NULL) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"id"];
                    }
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    if (indexPath.row !=3) {
        UIView * view=  [[UIView alloc]initWithFrame:CGRectMake(0, 54, 375, 1)];
        view.alpha = 0.1;
        view.backgroundColor = [UIColor grayColor];
        [cell addSubview:view];
    }
    
    if (indexPath.row == 0) {
        cell.imageView.image = [UIImage imageNamed:array[0]];
        cell.textLabel.text = lebel[0];
    }else if (indexPath.row == 1)
    {
        cell.imageView.image = [UIImage imageNamed:array[1]];
        cell.textLabel.text = lebel[1];
    }else if (indexPath.row == 2)
    {
        cell.imageView.image = [UIImage imageNamed:array[2]];
        cell.textLabel.text = lebel[2];
    }else
    {
        cell.imageView.image = [UIImage imageNamed:array[3]];
        cell.textLabel.text = lebel[3];
    }
    if(indexPath.section == 1){
        cell.textLabel.text = @"第二个section。---   ";
    }
    cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 2) {
        return 100;
    }else
        return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 55;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
