//

//   Major.swift
//   StudentCenter
//
//  Created by: Shuran Zhang on 12/2/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//

import Foundation
class Major:NSObject{
    private let myCS = [[NSLocalizedString("str_Pawlicki", comment: ""),"⭐️⭐️"],
                        [NSLocalizedString("str_Ferguson", comment: ""),"⭐️⭐️⭐️⭐️"],
                        [NSLocalizedString("str_Scott", comment: ""), "⭐️⭐️⭐️⭐️⭐️"],
                        [NSLocalizedString("str_Luo", comment: ""), "⭐️⭐️⭐️⭐️"],
                        [NSLocalizedString("str_Ding", comment: ""), "⭐️⭐️"]]
    
    private let myMath = [[NSLocalizedString("str_Paki", comment: ""),"⭐️⭐️⭐️⭐️"],
                          [NSLocalizedString("str_Nicolas", comment: ""), "⭐️⭐️⭐️"],
                          [NSLocalizedString("str_Douglass", comment: ""),"⭐️⭐️⭐️⭐️⭐️"],
                          [NSLocalizedString("str_Saul", comment: ""),"⭐️⭐️"],
                          [NSLocalizedString("str_Mark", comment: ""),"⭐️⭐️⭐️⭐️"]]
    
    
    private let myPhysics = [[NSLocalizedString("str_Frank", comment: ""),"⭐️⭐️⭐️⭐️"],
                             [NSLocalizedString("str_Andrew", comment: ""),"⭐️⭐️"],
                             [NSLocalizedString("str_John", comment: ""),"⭐️⭐️⭐️"],
                             [NSLocalizedString("str_Joseph", comment: ""),"⭐️⭐️⭐️⭐️"],
                             [NSLocalizedString("str_A", comment: ""),"⭐️⭐️"]]
    var CSs: [CS] = []
    var Maths: [Math] = []
    var Physicss: [Physics] = []
    override init() {
        super.init()
        for i in 0...4 {
            self.addCS(initCS(index:i))
            self.addMath(initMath(index:i))
            self.addPhysics(initPhysics(index:i))
        }
    }

    @discardableResult
    func addCS(_ cs: CS) -> Int {
        CSs.append(cs)
        return CSs.index(of: cs)!
    }
    func removeCS(_ cs: CS) {
        if let index = CSs.index(of: cs) {
            CSs.remove(at: index)
        }
    }
    func moveCS(fromIndex: Int, toIndex: Int) {
        if fromIndex != toIndex {
            let cs = CSs[fromIndex]
            CSs.remove(at: fromIndex)
            CSs.insert(cs, at: toIndex)
        }
    }
    func initCS(index: Int) -> CS {
        return CS(prof: myCS[index][0], rate: myCS[index][1])
    }
    @discardableResult
    func addMath(_ math: Math) -> Int {
        Maths.append(math)
        return Maths.index(of: math)!
    }
    func removeMath(_ math: Math) {
        if let index = Maths.index(of: math) {
            Maths.remove(at: index)
        }
    }
    func moveMath(fromIndex: Int, toIndex: Int) {
        if fromIndex != toIndex {
            let math = Maths[fromIndex]
            Maths.remove(at: fromIndex)
            Maths.insert(math, at: toIndex)
        }
    }
    func initMath(index: Int) -> Math {
        return Math(prof: myMath[index][0], rate: myMath[index][1])
    }
    
    @discardableResult
    func addPhysics(_ phy: Physics) -> Int {
        Physicss.append(phy)
        return Physicss.index(of: phy)!
    }
    func removePhysics(_ phy: Physics) {
        if let index = Physicss.index(of: phy) {
            Physicss.remove(at: index)
        }
    }
    func movePhysics(fromIndex: Int, toIndex: Int) {
        if fromIndex != toIndex {
            let phy = Physicss[fromIndex]
            Physicss.remove(at: fromIndex)
            Physicss.insert(phy, at: toIndex)
        }
    }
    func initPhysics(index: Int) -> Physics {
        return Physics(prof: myPhysics[index][0], rate: myPhysics[index][1])
    }
}
