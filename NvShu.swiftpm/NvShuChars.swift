//
//  NvShuChars.swift
//  NvShu
//
//  Created by m1e on 2024/2/25.
//

import Foundation
class NvShuChar: Hashable,Equatable{
    var name: String
    var english: String
    var image: String
    var story: String
    var points:[CGPoint]
    var maxDistance:Double
    init(){
        name = ""
        image = ""
        english = ""
        story = ""
        points = []
        maxDistance = 0.1
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(image)
    }
    
    static func ==(lhs: NvShuChar, rhs: NvShuChar) -> Bool {
        return lhs.name == rhs.name && lhs.image == rhs.image
    }
    
    func check(drawPoints:[CGPoint],height:Double,width:Double)->Bool{
        var offsetTop = 0.0
        var offsetLeft = 0.0
        var sizeUnit = 0.0
        if height>width*2{
            sizeUnit = width
            offsetTop = height/2-sizeUnit
        }else{
            sizeUnit = height/2
            offsetLeft = (width-sizeUnit)/2
        }
        if drawPoints.count>0{
            let testPoint = drawPoints[drawPoints.count-1]
            let tx = (testPoint.x - offsetLeft)/sizeUnit
            let ty = (testPoint.y - offsetTop)/sizeUnit/2
        }
        
        var contains:[CGPoint] = []
        for drawPoint in drawPoints{
            var inRange = false
            let maxDistance = self.maxDistance * sizeUnit
            for point in self.points{
                let deltaX = sizeUnit * point.x - (drawPoint.x-offsetLeft)
                let deltaY = sizeUnit*2*point.y - (drawPoint.y-offsetTop)
                let distance = sqrt(deltaX*deltaX + deltaY*deltaY)
                if distance < maxDistance{
                    if !contains.contains(point){
                        contains.append(point)
                    }
                    inRange = true
                }
            }
            if !inRange{
                return false
            }
        }
        if contains.count==self.points.count{
            return true
        }else{
            return false
        }
    }
}

class NvShuNv: NvShuChar{
    override init() {
        super.init()
        name = "女"
        image = "女"
        english = "Women,Female"
        points = [
            CGPoint(x: 0.38, y: 0.152),
            CGPoint(x: 0.436, y: 0.172),
            CGPoint(x: 0.488, y: 0.198),
            CGPoint(x: 0.54, y: 0.224),
            CGPoint(x: 0.584, y: 0.256),
            CGPoint(x: 0.628, y: 0.29),
            CGPoint(x: 0.668, y: 0.33),
            CGPoint(x: 0.692, y: 0.374),
            CGPoint(x: 0.716, y: 0.414),
            CGPoint(x: 0.716, y: 0.458),
            CGPoint(x: 0.708, y: 0.496),
            CGPoint(x: 0.684, y: 0.538),
            CGPoint(x: 0.672, y: 0.574),
            CGPoint(x: 0.644, y: 0.608),
            CGPoint(x: 0.612, y: 0.64),
            CGPoint(x: 0.572, y: 0.676),
            CGPoint(x: 0.532, y: 0.708),
            CGPoint(x: 0.488, y: 0.74),
            CGPoint(x: 0.428, y: 0.768),
            CGPoint(x: 0.372, y: 0.796),
            CGPoint(x: 0.536, y: 0.04),
            CGPoint(x: 0.568, y: 0.082),
            CGPoint(x: 0.572, y: 0.124),
            CGPoint(x: 0.576, y: 0.162),
            CGPoint(x: 0.584, y: 0.194),
            CGPoint(x: 0.524, y: 0.27),
            CGPoint(x: 0.492, y: 0.3),
            CGPoint(x: 0.448, y: 0.332),
            CGPoint(x: 0.408, y: 0.364),
            CGPoint(x: 0.348, y: 0.394),
            CGPoint(x: 0.372, y: 0.44),
            CGPoint(x: 0.428, y: 0.47),
            CGPoint(x: 0.464, y: 0.508),
            CGPoint(x: 0.504, y: 0.552),
            CGPoint(x: 0.536, y: 0.586),
            CGPoint(x: 0.556, y: 0.63),
            CGPoint(x: 0.596, y: 0.718),
            CGPoint(x: 0.612, y: 0.764),
            CGPoint(x: 0.616, y: 0.806),
            CGPoint(x: 0.608, y: 0.848),
            CGPoint(x: 0.576, y: 0.882),
            CGPoint(x: 0.544, y: 0.916),
            CGPoint(x: 0.504, y: 0.94),
            CGPoint(x: 0.464, y: 0.972),

        ]
        story="With great care, Pan Qiao penned a heartfelt letter, hiding it on her loyal hunting dog, which she had raised since it was a pup. She fervently prayed that the faithful dog would safely deliver the letter to her hometown, letting her family know about her plight and urging them to come to her rescue. The loyal dog obediently carried the letter, traversing mountains and crossing rivers, running tirelessly towards Pan Qiao's beloved village.As the dog with the letter arrived in the village, the people sensed something extraordinary was happening. The unfamiliar symbols on the letter puzzled them, leaving them unable to decipher Pan Qiao's newly created writing system."
    }
}

class NvShuShu: NvShuChar{
    override init() {
        super.init()
        name = "书"
        image = "书"
        english = "Script,Book"
        points = [
            CGPoint(x: 0.592, y: 0.044),
            CGPoint(x: 0.548, y: 0.084),
            CGPoint(x: 0.492, y: 0.124),
            CGPoint(x: 0.432, y: 0.154),
            CGPoint(x: 0.384, y: 0.186),
            CGPoint(x: 0.332, y: 0.216),
            CGPoint(x: 0.276, y: 0.244),
            CGPoint(x: 0.464, y: 0.206),
            CGPoint(x: 0.524, y: 0.238),
            CGPoint(x: 0.548, y: 0.28),
            CGPoint(x: 0.56, y: 0.324),
            CGPoint(x: 0.568, y: 0.362),
            CGPoint(x: 0.568, y: 0.4),
            CGPoint(x: 0.564, y: 0.44),
            CGPoint(x: 0.568, y: 0.482),
            CGPoint(x: 0.556, y: 0.528),
            CGPoint(x: 0.492, y: 0.314),
            CGPoint(x: 0.428, y: 0.35),
            CGPoint(x: 0.368, y: 0.38),
            CGPoint(x: 0.312, y: 0.416),
            CGPoint(x: 0.26, y: 0.442),
            CGPoint(x: 0.596, y: 0.256),
            CGPoint(x: 0.644, y: 0.232),
            CGPoint(x: 0.692, y: 0.202),
            CGPoint(x: 0.748, y: 0.17),
            CGPoint(x: 0.344, y: 0.504),
            CGPoint(x: 0.352, y: 0.484),
            CGPoint(x: 0.388, y: 0.514),
            CGPoint(x: 0.3, y: 0.51),
            CGPoint(x: 0.764, y: 0.344),
            CGPoint(x: 0.724, y: 0.326),
            CGPoint(x: 0.804, y: 0.338),
            CGPoint(x: 0.772, y: 0.366),
            CGPoint(x: 0.78, y: 0.476),
            CGPoint(x: 0.744, y: 0.512),
            CGPoint(x: 0.704, y: 0.548),
            CGPoint(x: 0.656, y: 0.578),
            CGPoint(x: 0.604, y: 0.612),
            CGPoint(x: 0.552, y: 0.636),
            CGPoint(x: 0.504, y: 0.668),
            CGPoint(x: 0.452, y: 0.7),
            CGPoint(x: 0.384, y: 0.73),
            CGPoint(x: 0.704, y: 0.614),
            CGPoint(x: 0.736, y: 0.656),
            CGPoint(x: 0.728, y: 0.69),
            CGPoint(x: 0.704, y: 0.734),
            CGPoint(x: 0.672, y: 0.766),
            CGPoint(x: 0.632, y: 0.814),
            CGPoint(x: 0.592, y: 0.854),
            CGPoint(x: 0.544, y: 0.886),
            CGPoint(x: 0.5, y: 0.922),
            CGPoint(x: 0.46, y: 0.958),
            CGPoint(x: 0.384, y: 0.98),
        ]
        story="However, they refused to give up easily. Gathering the village's girls together, they embarked on a collective quest to unravel the mystery. Collaborating and inspiring one another, they scrutinized each symbol, each stroke, and engaged in endless discussions.After relentless efforts, a clever young girl finally recognized a portion of the symbols, discovering a glimmer of hope. With more girls joining the endeavor, they gradually deciphered the meaning behind Pan Qiao's message. Their joy knew no bounds as they successfully understood that Pan Qiao was trapped in Daozhou Prefecture. From that day forward, Pan Qiao's invented writing system spread among the women in the village. It became their means of communication and a cherished cultural heritage. Pan Qiao's wisdom and courage were celebrated, and her name became a legend that continues to inspire."
    }
}

class NvShuNi: NvShuChar{
    override init() {
        super.init()
        name = "你"
        image = "你"
        english = "You,Your"
        points = [
            CGPoint(x: 0.548, y: 0.042),
            CGPoint(x: 0.532, y: 0.076),
            CGPoint(x: 0.516, y: 0.108),
            CGPoint(x: 0.5, y: 0.148),
            CGPoint(x: 0.484, y: 0.182),
            CGPoint(x: 0.464, y: 0.216),
            CGPoint(x: 0.432, y: 0.25),
            CGPoint(x: 0.412, y: 0.284),
            CGPoint(x: 0.556, y: 0.182),
            CGPoint(x: 0.572, y: 0.216),
            CGPoint(x: 0.572, y: 0.254),
            CGPoint(x: 0.568, y: 0.288),
            CGPoint(x: 0.556, y: 0.324),
            CGPoint(x: 0.532, y: 0.356),
            CGPoint(x: 0.504, y: 0.394),
            CGPoint(x: 0.48, y: 0.424),
            CGPoint(x: 0.432, y: 0.446),
            CGPoint(x: 0.568, y: 0.426),
            CGPoint(x: 0.58, y: 0.464),
            CGPoint(x: 0.572, y: 0.508),
            CGPoint(x: 0.58, y: 0.55),
            CGPoint(x: 0.576, y: 0.59),
            CGPoint(x: 0.58, y: 0.634),
            CGPoint(x: 0.484, y: 0.582),
            CGPoint(x: 0.712, y: 0.466),
            CGPoint(x: 0.712, y: 0.44),
            CGPoint(x: 0.312, y: 0.516),
            CGPoint(x: 0.328, y: 0.562),
            CGPoint(x: 0.304, y: 0.6),
            CGPoint(x: 0.292, y: 0.638),
            CGPoint(x: 0.276, y: 0.68),
            CGPoint(x: 0.368, y: 0.598),
            CGPoint(x: 0.376, y: 0.642),
            CGPoint(x: 0.388, y: 0.68),
            CGPoint(x: 0.384, y: 0.716),
            CGPoint(x: 0.392, y: 0.756),
            CGPoint(x: 0.4, y: 0.8),
            CGPoint(x: 0.404, y: 0.844),
            CGPoint(x: 0.404, y: 0.88),
            CGPoint(x: 0.396, y: 0.92),
            CGPoint(x: 0.388, y: 0.946)
        ]
        story = "Long, long ago, in a village called Shangjiang Wei in southern China, there lived a talented and graceful girl named Pan Qiao. She was known far and wide for her beautiful singing, graceful dancing, and exceptional embroidery skills. Her intricate needlework, whether it was weaving delicate lace or crafting exquisite shoe patterns, left everyone in awe.However, one fateful day, while Pan Qiao was diligently gathering firewood on the mountainside, she was spotted by the local authorities. They were captivated by her beauty and believed she could provide entertainment for them, so they seized her and locked her away in the distant Daozhou Prefecture. Pan Qiao found herself imprisoned, longing for her family and yearning to be rescued."
    }
}


class NvShuHao: NvShuChar{
    override init() {
        super.init()
        name = "好"
        image = "好"
        english = "Good,Hello"
        points = [
            CGPoint(x: 0.336, y: 0.05),
            CGPoint(x: 0.344, y: 0.094),
            CGPoint(x: 0.34, y: 0.14),
            CGPoint(x: 0.344, y: 0.18),
            CGPoint(x: 0.352, y: 0.22),
            CGPoint(x: 0.368, y: 0.26),
            CGPoint(x: 0.364, y: 0.298),
            CGPoint(x: 0.372, y: 0.34),
            CGPoint(x: 0.384, y: 0.384),
            CGPoint(x: 0.384, y: 0.426),
            CGPoint(x: 0.38, y: 0.468),
            CGPoint(x: 0.384, y: 0.508),
            CGPoint(x: 0.384, y: 0.55),
            CGPoint(x: 0.38, y: 0.598),
            CGPoint(x: 0.376, y: 0.64),
            CGPoint(x: 0.372, y: 0.68),
            CGPoint(x: 0.372, y: 0.718),
            CGPoint(x: 0.368, y: 0.762),
            CGPoint(x: 0.344, y: 0.8),
            CGPoint(x: 0.332, y: 0.844),
            CGPoint(x: 0.316, y: 0.888),
            CGPoint(x: 0.288, y: 0.928),
            CGPoint(x: 0.256, y: 0.966),
            CGPoint(x: 0.472, y: 0.56),
            CGPoint(x: 0.504, y: 0.606),
            CGPoint(x: 0.512, y: 0.648),
            CGPoint(x: 0.52, y: 0.688),
            CGPoint(x: 0.528, y: 0.726),
            CGPoint(x: 0.536, y: 0.764),
            CGPoint(x: 0.564, y: 0.806),
            CGPoint(x: 0.592, y: 0.844),
            CGPoint(x: 0.62, y: 0.78),
            CGPoint(x: 0.64, y: 0.742),
            CGPoint(x: 0.66, y: 0.704),
            CGPoint(x: 0.684, y: 0.672),
            CGPoint(x: 0.716, y: 0.642),
            CGPoint(x: 0.448, y: 0.508),
            CGPoint(x: 0.504, y: 0.48),
            CGPoint(x: 0.528, y: 0.442),
            CGPoint(x: 0.54, y: 0.406),
            CGPoint(x: 0.556, y: 0.366),
            CGPoint(x: 0.568, y: 0.33),
            CGPoint(x: 0.576, y: 0.288),
            CGPoint(x: 0.576, y: 0.248),
            CGPoint(x: 0.576, y: 0.202)
        ]
        story="Determined to convey her message and seek help from her loved ones, Pan Qiao drew inspiration from her time spent weaving lace and making shoe patterns with her sisters. A brilliant idea struck her mind. She decided to create a brand new form of writing, using symbols and patterns derived from her embroidery work to convey specific meanings."
    }
}
