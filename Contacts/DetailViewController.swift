//
//  DetailViewController.swift
//  Contacts
//
//  Created by Руслан on 02.07.2021.
//

import UIKit

protocol DetailViewControllerDelegate: AnyObject {
    func saveNewDataOfContact(_ contact: ContactsCellData)
    func addNewDataOfContact(_ contact: ContactsCellData)
}

class DetailViewController: UIViewController {

    @IBOutlet weak var nameSurnameLabel: UILabel!
    @IBOutlet weak var placeOfWorkTextView: UITextField!
    @IBOutlet weak var phoneNumberTextView: UITextField!
    @IBOutlet weak var commentTextView: UITextView!
    
    var contact: ContactsCellData?
    weak var delegate: DetailViewControllerDelegate?
    var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let name = contact?.name, let surname = contact?.surname else { return }
        nameSurnameLabel.text = name + " " + surname
        placeOfWorkTextView.text = contact?.placeOfWork
        phoneNumberTextView.text = contact?.phoneNumber
        commentTextView.text = contact?.comment
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        
        if var contact = contact {
            contact.comment = commentTextView.text
            contact.phoneNumber = phoneNumberTextView.text ?? ""
            contact.placeOfWork = placeOfWorkTextView.text ?? ""
            delegate?.saveNewDataOfContact(contact)
        }
        
        tableView?.reloadData()
//        navigationController?.popViewController(animated: true)
        dismiss(animated: true)
    }

}

