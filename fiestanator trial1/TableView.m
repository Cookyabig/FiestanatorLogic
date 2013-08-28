//
//  TableView.m
//  fiestanator trial1
//
//  Created by Michael Giba on 7/7/13.
//  Copyright (c) 2013 Michael Giba. All rights reserved.
//

#import "TableView.h"
#import "TesterViewController.h"
#import "TesterAppDelegate.h"
#import "DataTableCell.h"
#import "FlurryAds.h"




@interface TableView ()

@end

@implementation TableView
{
    NSMutableArray* keys;
    NSMutableArray *images;
    NSMutableArray *names;
    NSMutableArray *prices;

    
}





- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    
    [super viewDidLoad];
    
    int temp;

    

    
    
    keys = [[NSMutableArray alloc] initWithArray:[self.dataFromDict allKeys]];
    
    for (int i = 0; i < [keys count]; i++){
        if([keys[i] isEqual: @"Remaining Money"]){
            temp = i;
        }
    }

    self.remainingMoney = [[NSString alloc] initWithFormat:@"%@",[self.dataFromDict objectForKey:@"Remaining Money"]];

    [keys removeObjectAtIndex:temp];
    images = [[NSMutableArray alloc] init];
    for (int e  = 0; e < [keys count]; e++) {
        
        UIImage *temp = [UIImage imageNamed:[[NSString alloc] initWithFormat:@"%@.jpg",[keys objectAtIndex:e]]];
        

        [images addObject:temp];
    }
    names = [[NSMutableArray alloc] init];
    for (int e  = 0; e < [keys count]; e++) {
        NSString *temp = [[NSString alloc] initWithFormat:@"%@.jpg",[keys objectAtIndex:e]];
        [names addObject:temp];
    
    }
    prices = [[NSMutableArray alloc] init];
    for (int e  = 0; e < [keys count]; e++) {
        NSString *temp = [[NSString alloc] initWithFormat:@"%@",[self.dataFromDict objectForKey:[keys objectAtIndex:e]]];
        [prices addObject:temp];
        
    }
    
 
    
}

- (void)viewDidAppear:(BOOL)animated
{
    if([self.showAd isEqualToString:@"YES"]){
    [FlurryAds displayAdForSpace:@"Main Interstital" onView:self.view];
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

  
    return [keys count] +1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
   
    NSString *CellIdentifier = @"DataTableCell";
    
    SimpleTableCell *cell = (SimpleTableCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
    
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        
    }
    
    if(indexPath.row == 0){
        cell.thumbnailImage.image = [UIImage imageNamed:@"money-sign-hi.png"];
        cell.priceOrCash.text = @"Amount:";
        cell.nameLabel.text = @"Remaining Cash";
        NSNumberFormatter * nf = [[NSNumberFormatter alloc] init];
        [nf setMaximumFractionDigits:2];
        [nf setMinimumFractionDigits:2];
        NSString * trimmed = [nf stringFromNumber:[NSNumber numberWithDouble:[self.remainingMoney doubleValue]]];
        cell.PriceLabel.text = [[NSString alloc] initWithFormat:@"%@",trimmed];
       
    }
    
    else{
         
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
        dispatch_async(queue, ^{
            UIImage *image = [images objectAtIndex:indexPath.row-1];
            dispatch_sync(dispatch_get_main_queue(), ^{
                cell.thumbnailImage.image = image;
                cell.PriceLabel.text = [prices objectAtIndex:indexPath.row-1];
                cell.nameLabel.text = [names objectAtIndex:indexPath.row-1];
                [cell setNeedsLayout];
            });
        });
    }
    
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 104;
}





// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0){
    return NO;
    }
    else{
        return YES;
    }
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        double amount = [[self.dataFromDict objectForKey:[keys objectAtIndex:indexPath.row - 1]] doubleValue];
        double new_amount = amount + [self.remainingMoney doubleValue];
        self.remainingMoney = [[NSString alloc] initWithFormat:@"%f",new_amount];
        [self.dataFromDict removeObjectForKey:[keys objectAtIndex:indexPath.row - 1]];
        [keys removeObjectAtIndex:indexPath.row-1];
        [prices removeObjectAtIndex:indexPath.row -1];
        [images removeObjectAtIndex:indexPath.row-1];
        [names removeObjectAtIndex:indexPath.row-1];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView reloadData];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (IBAction)backButton:(id)sender {
        
    [self dismissViewControllerAnimated:YES completion:nil];
    
}








@end
