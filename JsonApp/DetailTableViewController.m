//
//  DetailTableViewController.m
//  JsonApp
//
//  Created by Taras Gudz on 29.04.15.
//  Copyright (c) 2015 JuliaSt. All rights reserved.
//

#import "DetailTableViewController.h"
#import "tableViewCellCurr.h"
#import "showBankOnMap.h"

@interface DetailTableViewController()
@property (nonatomic, strong) NSDictionary *currencies;
@end

@implementation DetailTableViewController
@synthesize webData,arrayAsk,arrayBid,connection,identification;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[self detailTableView]setDelegate:self];
    [[self detailTableView]setDataSource:self];
    arrayAsk=[[NSMutableArray alloc]init];
    arrayBid=[[NSMutableArray alloc]init];
    //arrayCurr=[[NSMutableArray alloc]init];
    self.currencies=[identification objectForKey:@"currencies"];
    self.arrayCurrenciesKeys = [self.currencies allKeys];
    
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

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSString *address=[identification objectForKey:@"address"];
    return address;
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_arrayCurrenciesKeys count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier=@"myCurrCell";
    tableViewCellCurr *myCurrCell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(!myCurrCell)
    {
        myCurrCell=[[tableViewCellCurr alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    
    myCurrCell.curNameLabel.text = self.arrayCurrenciesKeys[indexPath.row];
    
    NSDictionary *curr=[_currencies objectForKey:_arrayCurrenciesKeys[indexPath.row]];
    NSString *ask=[curr objectForKey:@"ask"];
    [arrayAsk addObject:ask];
    myCurrCell.askLabel.text=[arrayAsk objectAtIndex:indexPath.row];
    
    NSString *bid=[curr objectForKey:@"bid"];
    [arrayBid addObject:bid];
    myCurrCell.bidLabel.text=[arrayBid objectAtIndex:indexPath.row];
    
    return myCurrCell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self performSegueWithIdentifier:@"pushMap" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([[segue identifier] isEqualToString:@"pushMap"])
    {
        showBankOnMap *mapview = [segue destinationViewController];
        mapview.identification = self.identification;
        mapview.city = self.city;
    }
}





@end
