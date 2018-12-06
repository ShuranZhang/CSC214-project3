//

//   PhotoItem.swift
//   StudentCenter
//
//  Created by: Shuran Zhang on 12/2/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//

import Foundation
import UIKit
class PhotoItem : NSObject, NSCoding{
    var photo: UIImage;
    enum CodingKeys: String, CodingKey {
        case image
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(photo, forKey: CodingKeys.image.rawValue)

    }
    override init() {
        print("init")
        photo = UIImage(named: "camera")!
    }
    required init?(coder aDecoder: NSCoder) {
        photo = aDecoder.decodeObject(forKey: CodingKeys.image.rawValue) as! UIImage

    }
    

  
}
