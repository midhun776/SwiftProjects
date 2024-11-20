//
//  AddressBookHelper.swift
//  ContactsAccess
//
//  Created by DDUKK on 02/11/24.
//

import Foundation
import Contacts

class AddresBookHelper{
    let store = CNContactStore()
    let keysToFetch = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey] as [CNKeyDescriptor]
    
    
    func fetchContacts() async -> [CNContact]{
        
        if(await requestPermision()){
            do {
//                let predicate = CNContact.predicateForContacts(matchingName: "Appleseed")
                let fetchReq = CNContactFetchRequest(keysToFetch: keysToFetch)
//                let contacts = try store.unifiedContacts(matching: predicate, keysToFetch: keysToFetch)
                var contacts = [CNContact]()
                try store.enumerateContacts(with: fetchReq) {
                    (contact, stop) in
                    contacts.append(contact)
                }
                //store.e
                print("Fetched contacts: \(contacts)")
                
                var allContacts: [ContactDetails] = []
                for contact in contacts {
                    
                    let num = contact.phoneNumbers.first?.value.stringValue
                    
                    
                    allContacts.append(ContactDetails(name: contact.givenName, familyName: contact.familyName, number: num))
                }
                return contacts
            } catch {
                print("Failed to fetch contact, error: \(error)")
                // Handle the error.
            }
        } else{
            print("Permission Denied")
        }
        return []
    }
    
    func requestPermision() async -> Bool {
        (try? await store.requestAccess(for: CNEntityType.contacts)) ?? false
    }
}
