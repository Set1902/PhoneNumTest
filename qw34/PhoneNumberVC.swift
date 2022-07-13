//
//  PhoneNumberVC.swift
//  qw34
//
//  Created by Sergei Kovalev on 18.04.2022.
//

import UIKit
import FirebaseAuth
import FlagPhoneNumber

class PhoneNumberVC: UIViewController {

    var phoneNumber: String?
    
    
    var listController: FPNCountryListViewController!
    
    
    @IBOutlet weak var phoneNumberTextField: FPNTextField!
    
    
    
    @IBOutlet weak var fetchCodeButton: UIButton!
    
    private func showCodeValidVC (verificatonID: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let dvc = storyboard.instantiateViewController(withIdentifier: "CodeValidVC") as! CodeValidVC
        dvc .verificationID = verificatonID
        self.present(dvc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        setupConfig()
        
        
    }
    

    
    @IBAction func fetchCodeTapped(_ sender: UIButton) {
        
        
        guard phoneNumber != nil else {return}
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber!, uiDelegate: nil) {
            (verificationID, error) in
            if error != nil {
                print(error?.localizedDescription ?? "is empty")
            } else {
                self.showCodeValidVC(verificatonID: verificationID!)
            }
        }
        
        
     
        
    }
    
    
    
    private func setupConfig () {
        fetchCodeButton.alpha = 0.5
        fetchCodeButton.isEnabled = false
        
        
        
        phoneNumberTextField.displayMode = .list
        phoneNumberTextField.delegate = self
        
        listController = FPNCountryListViewController(style: .grouped)
        listController?.setup(repository: phoneNumberTextField.countryRepository)
        listController.didSelect = { country in
            self.phoneNumberTextField.setFlag(countryCode: country.code)
            
            
        }
        
    }
    
    

}


extension PhoneNumberVC: FPNTextFieldDelegate {
    
    
    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
        //
    }

    func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
        if isValid {
            fetchCodeButton.alpha = 1
            fetchCodeButton.isEnabled = true
            
            phoneNumber = textField.getFormattedPhoneNumber(format: .International)
        } else {
            fetchCodeButton.alpha = 0.5
            fetchCodeButton.isEnabled = false
        }
    }

    func fpnDisplayCountryList() {
        let navigationController = UINavigationController(rootViewController: listController)
        listController.title = "Страны"
        phoneNumberTextField.text = ""
        self.present(navigationController, animated: true)
    }
    
    
}






