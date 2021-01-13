//
//  ViewController.swift
//  CinesofaMVVM
//
//  Created by Fabricio Rodrigo Baixo on 1/13/21.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate let viewModel = MainViewModel()

    @IBOutlet weak var UITableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
    }

}
