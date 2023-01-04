//
//  Data.swift
//  Kitchen_helper
//
//  Created by Tomasz Piątek on 04/01/2023.
//

import Foundation

struct Data {
    
    let food:[(name: String, value: Double)] = [
        ("flour", 0.68),
        ("potato flour", 0.72),
        ("sugar", 0.88),
        ("icing sugar", 0.68),
        ("salt", 1.2),
        ("butter", 0.96),
        ("cocoa", 0.4),
        ("milk", 1.04),
        ("honey", 1.44)
    ]
    
    let grams = ["10g", "20g", "30g", "40g", "50g", "60g", "70g", "80g", "90g", "100g", "110g", "120g", "130g", "140g", "150g", "160g", "170g", "180g", "190g", "200g", "210g", "220g", "230g", "240g", "250g", "300g", "400g", "500g"]

    let cup:[(name: String, value: Double)] = [
        ("tea spoon", 5.0),
        ("table spoon", 15.0),
        ("250ml cup", 250.0),
        ("330ml cup", 330.0)
    ]
}



