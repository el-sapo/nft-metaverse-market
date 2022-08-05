//
//  ModelHelpers.swift
//  nft-meta-market
//
//  Created by Federico Lagarmilla on 4/8/22.
//

import Foundation
import Apollo

// Implement custom parsing of NFT metadata responses
public enum JSONScalar {
 case dictionary([String: Any])
 case array([Any])
}

extension JSONScalar: JSONDecodable {
    public init(jsonValue value: JSONValue) throws {

        if let dict = value as? [String: Any] {
          self = .dictionary(dict)

        } else if let array = value as? [Any] {
          self = .array(array)

        } else {
          throw JSONDecodingError.couldNotConvert(value: value, to: JSONScalar.self)
        }
    }
}
