//
//  Post.swift
//  selfgram
//
//  Created by LH on 2016-01-22.
//  Copyright © 2016 LH-jonny. All rights reserved.
//

import Foundation
import UIKit
import Parse

class Post:PFObject, PFSubclassing {
    
    @NSManaged var image:PFFile
    @NSManaged var user:PFUser
    @NSManaged var comment:String
    var likes: PFRelation! {
        // PFRelations are a bit different from other properties
        // This is called a “computed property”, because it’s value is computed every time instead of stored.
        // The line below specifies that our relation column on Parse.com should be called “likes”
        return relationForKey("likes")
    }
    
    static func parseClassName() -> String {
        return "Post"
    }
    
    // convenience init method, because it’s building on top of PFObject’s init, rather than overriding it.
    convenience init(image:PFFile, user:PFUser, comment:String){
        // You can name the property you are passing into the function the
        // same name as the class' property. To distinguish the two
        // add "self." to the beginning of the class' property.
        self.init()
        self.image = image
        self.user = user
        self.comment = comment
    }
    
}
    
