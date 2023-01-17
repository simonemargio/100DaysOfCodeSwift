//  Created by Simone Margio
//  wwww.simonemargio.im

protocol AdvancedLifeSupport {
    func poerformCPR()
}


class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport?
    
    func assessSituation() {
        print("Can you tell me what happened?")
    }
    
    func medicalEmergency() {
        delegate?.poerformCPR()
    }
}


struct Paramedic: AdvancedLifeSupport {
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func poerformCPR() {
        print("The paramedic does chest compressions, 30 per second.")
    }
}

class Doctor: AdvancedLifeSupport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func poerformCPR() {
        print("The doctor does chest compressions, 30 per second.")
    }
    
    func useStethescope() {
        print("Listening for heart sounds")
    }
}

class Surgeon: Doctor {
    override func poerformCPR() {
        super.poerformCPR()
        print("Sing staying alive by the Bee Gees 🕺💃")
    }
    
    func useEletricDrill() {
        print("Whirr...")
    }
}

let simone = EmergencyCallHandler()
let eleonora = Paramedic(handler: simone)


simone.assessSituation()
simone.medicalEmergency()

let dwight = Surgeon(handler: simone)

simone.assessSituation()
simone.medicalEmergency()