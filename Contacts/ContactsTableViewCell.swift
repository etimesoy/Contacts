//
//  ContactsTableViewCell.swift
//  Contacts
//
//  Created by Руслан on 02.07.2021.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameSurnameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    func setData(contact: ContactsCellData) {
        nameSurnameLabel.text = contact.name + " " + contact.surname
        phoneNumberLabel.text = contact.phoneNumber
    }

}

