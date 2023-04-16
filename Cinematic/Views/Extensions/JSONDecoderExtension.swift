//
//  JSONDecoderExtension.swift
//  Cinematic
//
//  Created by Shivam Bajaj on 2023-04-15.
//

import Foundation
extension JSONDecoder {
    
    func setCustomDateDecodingStrategy() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        self.dateDecodingStrategy = .formatted(formatter)
    }
}
// decoding data

