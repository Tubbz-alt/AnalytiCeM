//
//  AddMuseViewController.swift
//  AnalytiCeM
//
//  Created by Gaël on 19/04/2017.
//  Copyright © 2017 Polytech. All rights reserved.
//

import ActionKit
import UIKit
import Spring

public protocol ChooseMuseDelegate {
    
    func didChoose(muse: IXNMuse)
    
}

class AddMuseViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, IXNMuseConnectionListener, IXNMuseListener {
    
    // MARK: - Constants
    
    let kCellIdentifier = "cellMuse"
    
    // MARK: - IBOutlet
    
    @IBOutlet var viewBackground: UIView!
    @IBOutlet var viewPopup: SpringView!
    @IBOutlet var btnClose: UIButton!
    @IBOutlet var labelTitre: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var viewNoMuseAvailable: UIView!
    
    // MARK: - Properties
    
    var manager: IXNMuseManagerIos?
    
    var listMuses = [IXNMuse]()
    
    var delegate: ChooseMuseDelegate?

    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // rounded corner
        self.viewPopup.layer.cornerRadius = 5
        
        // register the cell
        self.tableView.register(UINib(nibName: "AddMuseTableViewCell", bundle: nil), forCellReuseIdentifier: kCellIdentifier)
        
        // get the manager of Muse (singleton)
        manager = IXNMuseManagerIos.sharedManager()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // set the view as delegate
        manager?.museListener = self
        
        // opening
        self.viewPopup.animation = "zoomIn"
        self.viewPopup.duration	= 0.5
        self.viewPopup.animate()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        // get the muses found (if already launch elsewhere)
        listMuses = manager!.getMuses()
        // update tableView
        tableView.reloadData()
        
        // launch scan
        manager?.startListening()
        
    }
    
    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // closing
        self.viewPopup.animation = "zoomOut"
        self.viewPopup.duration	= 0.5
        self.viewPopup.animate()
        
        // unset the view as delegate
        manager?.museListener = nil
        
        // stop scan
        manager?.stopListening()
        
    }
    
    // MARK: - Muse
    
    func museListChanged() {
        // get the muses found
        listMuses = manager!.getMuses()
        // update tableView
        tableView.reloadData()
    }
    
    func receive(_ packet: IXNMuseConnectionPacket, muse: IXNMuse?) {}
    
    // MARK: - TableView
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // number of lines
        let lNbLines = self.listMuses.count
        
        // if no section
        if (lNbLines == 0) {
            
            // message
            tableView.backgroundView = self.viewNoMuseAvailable
            
        }
        else {
            
            // no message
            tableView.backgroundView = nil
            
        }

        return lNbLines
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // get cell
        let lCell = tableView.dequeueReusableCell(withIdentifier: kCellIdentifier, for: indexPath) as! AddMuseTableViewCell
        
        // get the current Muse
        let lMuse = self.listMuses[indexPath.row]
        
        // name of Muse
        lCell.labelName.text = lMuse.getName()
        
        // add button of Muse
        lCell.btnAdd.removeControlEvent(.touchUpInside)
        lCell.btnAdd.addControlEvent(.touchUpInside) {
            
            // if delegate
            if (self.delegate != nil) {
                
                // call delegate
                self.delegate!.didChoose(muse: lMuse)
                
            }
            
            // in any case, close popup
            self.actionClose(self.btnClose)
            
        }
        
        // cell is now properly config
        return lCell

    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 
    }
    
    // MARK: - Actions
    
    @IBAction func actionClose(_ sender: UIButton) {
        // close popup
        self.dismiss(animated: true, completion: nil)
    }


}
