//
//  MyDataViewController.swift
//  Strawman
//
//  Created by wusuchen on 2016/1/16.
//
//

import UIKit

class MyDataViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = NSURL(string: "https://itunes.apple.com/search?term=apple&media=software")
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data:NSData?,
            res:NSURLResponse?, err:NSError?) -> Void in
            if let data = data {
            do {
            let dic = try NSJSONSerialization.JSONObjectWithData(data, options:
            NSJSONReadingOptions.MutableContainers) as! NSDictionary
            let array = dic["results"] as! NSArray
            for appDic in array {
            print("trackName \(appDic["trackName"])")
            }
        } catch {
            } }
        }
        task.resume()
    }
        
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
