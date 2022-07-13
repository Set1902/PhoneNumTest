//
//  ContentVC.swift
//  qw34
//
//  Created by Sergei Kovalev on 18.04.2022.
//

import UIKit
import FirebaseAuth
class ContentVC: UIViewController {

    @IBAction func logOut(_ sender: UIButton) {
        
        
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "close", sender: self)
        } catch {
            
        }
        
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
