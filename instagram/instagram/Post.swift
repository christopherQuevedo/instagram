//
//  Post.swift
//  instagram
//
//  Created by Chris Q. on 10/6/18.
//  Copyright © 2018 Chris Q. All rights reserved.
//

import UIKit
import Parse

class Post: PFObject, PFSubclassing {
    
    @NSManaged var media : PFFile
    @NSManaged var author : PFUser
    @NSManaged var caption : String
    @NSManaged var likesCount : Int
    @NSManaged var commentsCount : Int
    
    class func parseClassName() -> String {
        return "Post"
    }
    
    class func postUserImage(image: UIImage?, withCaption caption: String?, withCompletion completion: PFBooleanResultBlock?) {
        
        let post = Post()
        post.media = getPFFileFromImage(image: image)!
        post.author = PFUser.current()!
        post.caption = caption!
        post.likesCount = 0
        post.commentsCount = 0
        
        post.saveInBackground(block: completion)
    }
    
    class func getPFFileFromImage(image: UIImage?) -> PFFile? {
        if let image = image {
            if let imageData = UIImagePNGRepresentation(image) {
                return PFFile(name: "image.png", data: imageData)
            }
        }
        return nil
    }

}
