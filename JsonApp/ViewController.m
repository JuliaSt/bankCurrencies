//
//  ViewController.m
//  JsonApp
//
//  Created by Taras Gudz on 28.04.15.
//  Copyright (c) 2015 JuliaSt. All rights reserved.
//

#import "ViewController.h"
#import "DetailTableViewController.h"
#include "bankTableViewCell.h"

@interface ViewController ()
{
    NSMutableData *webData;
    NSURLConnection *connection;
    NSMutableArray *arrayBanks;
    NSMutableArray *arrayOfDict;
    NSMutableArray *arrayAdress;
    NSMutableArray *arrayCityId;
    
}

@end

@implementation ViewController
@synthesize orgName;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[self myTableView]setDelegate:self];
    [[self myTableView]setDataSource:self];
    arrayBanks=[[NSMutableArray alloc]init];
    arrayAdress=[[NSMutableArray alloc]init];
    arrayOfDict=[[NSMutableArray alloc]init];
    arrayCityId=[[NSMutableArray alloc]init];
    
    NSURL *url=[NSURL URLWithString:@"http://resources.finance.ua/ua/public/currency-cash.json"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    
    connection=[NSURLConnection connectionWithRequest:request delegate:self];
    
    if(connection)
    {
        webData=[[NSMutableData alloc]init];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [webData setLength:0];
    
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [webData appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"fail with error");
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSDictionary *allDataDictionary=[NSJSONSerialization JSONObjectWithData:webData options:0 error:nil];
    NSArray *organizations=[allDataDictionary objectForKey:@"organizations"];
    NSDictionary *cities=[allDataDictionary objectForKey:@"cities"];
    
    for(NSDictionary *diction in organizations)
    {
        [arrayOfDict addObject:diction];
        
        NSString *title=[diction objectForKey:@"title"];
        [arrayBanks addObject:title];
        
        NSString *address=[diction objectForKey:@"address"];
        [arrayAdress addObject:address];
        
        NSString *cityId=[diction objectForKey:@"cityId"];
        //[arrayCityId addObject:cityId];
        
        NSString *cityName=[cities objectForKey:cityId];
        [arrayCityId addObject:cityName];
        
        
    }
    
    
    [[self myTableView]reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrayBanks count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier=@"myBankCell";
    bankTableViewCell *myBankCell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(!myBankCell)
    {
        myBankCell=[[bankTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    
    
    myBankCell.bankNameLabel.text=[arrayBanks objectAtIndex:indexPath.row];
    myBankCell.addressLabel.text=[arrayAdress objectAtIndex:indexPath.row];
    myBankCell.cityLabel.text=[arrayCityId objectAtIndex:indexPath.row];
    return myBankCell;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    orgName=[arrayOfDict objectAtIndex:indexPath.row];
    _cityName=[arrayCityId objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"pushCurrencies" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([[segue identifier] isEqualToString:@"pushCurrencies"])
    {
        DetailTableViewController *vc = [segue destinationViewController];
        vc.identification = self.orgName;
        vc.city = self.cityName;
    }
}


@end
