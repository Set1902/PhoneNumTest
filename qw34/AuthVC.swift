//
//  AuthVC.swift
//  qw34
//
//  Created by Sergei Kovalev on 18.04.2022.
//

import UIKit
import FirebaseAuth

class AuthVC: UIViewController {

    @IBAction func close(_ sender: UIStoryboardSegue) {
        
    }
    
    @IBAction func authTapped () {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let dvc = storyboard.instantiateViewController(withIdentifier: "PhoneNumberVC") as! PhoneNumberVC
        self.present(dvc, animated: true)
    }
    
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        DispatchQueue.main.async {
            if Auth.auth().currentUser?.uid != nil {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let dvc = storyboard.instantiateViewController(withIdentifier: "ContentVC") as! ContentVC
                self.present(dvc, animated: true)
            }
        }
    }

}
