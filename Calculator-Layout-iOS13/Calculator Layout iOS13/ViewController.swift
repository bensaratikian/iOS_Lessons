//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p: Person? = Person(name: "Mark")
        let a: Apartment? = Apartment()
        p?.apartment = a
        a?.person = p
    }

    
    class Person {
        
        init(name: String) {
            print("init called")
        }
        
        deinit {
            print("deinint called")
        }
        
        var apartment: Apartment?
    }
    
    class Apartment {
        
        init() {
            print("init called")
        }
        
        deinit {
            print("deinint called")
        }
        
        weak var person: Person?
    }

}

