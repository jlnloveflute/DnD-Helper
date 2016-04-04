//
//  FirstViewController.swift
//  DnDHelper
//
//  Created by Rita Fang on 4/2/16.
//
//

import UIKit
import Alamofire
import Foundation //for debugging can take out so far

//static NSString* const kBaseURL = @"http://localhost:3000/";
let urlPath: String = "http://localhost:3000/"

class FirstViewController: UIViewController {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var strLabel: UILabel!
    @IBOutlet var dexLabel: UILabel!
    @IBOutlet var conLabel: UILabel!
    @IBOutlet var intLabel: UILabel!
    @IBOutlet var wisLabel: UILabel!
    @IBOutlet var chaLabel: UILabel!
    
    func writeName(name: String) {
        nameLabel.text = name
    
    }
    
    func grabSheet() {
        let urlRequest: String = "items"
        let fullurlPath: String = urlPath + urlRequest
        Alamofire.request(.GET, fullurlPath, parameters:nil, encoding:.JSON).responseString
            { response in switch response.result {
            case .Success(let JSON):
                print("Success with JSON: \(JSON)")
                
                let response = JSON as! NSDictionary
                
                //example if there is an id
                let userId = response.objectForKey("id")!
                print(userId)
                
            case .Failure(let error):
                print("Request failed with error: \(error)")
                }
        }

        /*
        let defaultSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())

        var dataTask: NSURLSessionDataTask?
        
        let urlRequest: String = "items"
        let fullurlPath: String = urlPath + urlRequest
        let url = NSURL(string: fullurlPath)!
        
        
        // Creaste URL Request
        let request = NSMutableURLRequest(URL: url);
        
        // Set request HTTP method to GET. It could be POST as well
        request.HTTPMethod = "GET"
        
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: config, delegate: nil, delegateQueue: nil)
        */
        /*
        dataTask = defaultSession.dataTaskWithURL(url) {
            data, response, error in
            // 6
            dispatch_async(dispatch_get_main_queue()) {
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            }
            // 7
            if let error = error {
                print(error.localizedDescription)
            } else if let httpResponse = response as? NSHTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    print("Everyone is fine, file downloaded successfully.")
                    
                    //print(data)
                    
                    do {
                        let json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments)
                        
                        if let test = json["title"] as? [[String: AnyObject]] {
                            
                            print(test)
                        }
                        
                    }catch {
                        print("Error with Json: \(error)")
                    }
 
                }
            }
        }
        
        dataTask?.resume()
 */
    }

    
    func writeStr(n: Int) {
        strLabel.text = "STR: \(n)"
    }
    
    func writeDex(n: Int) {
        dexLabel.text = "DEX: \(n)"
    }
    
    func writeCon(n: Int) {
        conLabel.text = "CON: \(n)"
    }
    
    func writeInt(n: Int) {
        intLabel.text = "INT: \(n)"
    }
    
    func writeWis(n: Int) {
        wisLabel.text = "WIS: \(n)"
    }
    
    func writeCha(n: Int) {
        chaLabel.text = "CHA: \(n)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        grabSheet()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

