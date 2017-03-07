//
//  ViewController1.swift
//  clothestyle
//
//  Created by Napatsorn Lam Sakulsuwan on 3/7/17.
//  Copyright © 2017 Napatsorn Lam Sakulsuwan. All rights reserved.
//

import UIKit

class ViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var clothes : [Clothes] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Do ay additioal setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            clothes = try context.fetch(Clothes.fetchRequest())
            tableView.reloadData()
        }catch {
            
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clothes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let cloth = clothes[indexPath.row]
        cell.textLabel?.text = cloth.title
        cell.imageView?.image = UIImage(data : cloth.image as! Data)
        return cell
        navigationController!.popViewController(animated: true)
    }
    
    
}



