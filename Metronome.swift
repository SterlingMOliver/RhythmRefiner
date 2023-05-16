import Combine
import WatchKit

class Metronome: ObservableObject {
    var tempo: Float // in beats per minute
    var timer: Timer // our timer
    let objectWillChange = PassthroughSubject<Void, Never>()

    init(tempo: Float) {
        self.tempo = tempo
    }
    
    func start() {
        // calculate the interval in seconds
        let interval = 60.0 / Double(tempo)
        
        // invalidate any existing timer
        self.timer?.invalidate()
        
        // create and start a new timer
        self.timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { timer in
            print("Beat!")
            // play a haptic feedback
            WKInterfaceDevice.current().play(.click)
            self.objectWillChange.send() // notifies the UI to update
        }
    }
    
    func stop() {
        self.timer?.invalidate()
        self.timer = nil
    }
}
