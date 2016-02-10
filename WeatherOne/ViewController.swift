//
//  ViewController.swift
//  WeatherOne
//
//  Created by Gavril Tonev on 2/9/16.
//  Copyright © 2016 Gavril Tonev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    let people = [
        Person(name: "John", location: "Blago"),
        Person(name: "Anna", location: "Sofia"),
        Person(name: "Jack", location: "Plovdiv")
    ]
    
    var selectedPersonIndex = 0
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")!
        cell.textLabel?.text = people[indexPath.row].name
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedPersonIndex = indexPath.row
        performSegueWithIdentifier("gotoPerson", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "gotoPerson" {
            if let personVC = segue.destinationViewController as? PersonViewController {
                personVC.person = people[selectedPersonIndex]
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
        
    }
}

