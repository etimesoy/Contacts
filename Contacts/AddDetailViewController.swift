//
//  AddDetailViewController.swift
//  Contacts
//
//  Created by Руслан on 02.07.2021.
//

import UIKit

class AddDetailViewController: UIViewController {

    @IBOutlet weak var nameSurnameLabel: UITextField!
    @IBOutlet weak var placeOfWorkTextView: UITextField!
    @IBOutlet weak var phoneNumberTextView: UITextField!
    @IBOutlet weak var commentTextView: UITextView!
    
    var contact: ContactsCellData?
    weak var delegate: DetailViewControllerDelegate?
    
    override func viewDidLoad() {
        DetailViewController().viewDidLoad()
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        let nameSurname = nameSurnameLabel.text?.split(separator: " ")
        guard let name = nameSurname?[0], let surname = nameSurname?[1] else { return }
        
        contact?.name = String(name)
        contact?.surname = String(surname)
        contact?.comment = commentTextView.text
        contact?.phoneNumber = phoneNumberTextView.text ?? ""
        contact?.placeOfWork = placeOfWorkTextView.text ?? ""
        
        if let contact = contact {
            delegate?.addNewDataOfContact(contact)
        }
        
//        navigationController?.popViewController(animated: true)
        dismiss(animated: true)
    }

}
