import SwiftUI

struct MetronomeView: View {
    @ObservedObject var metronome: Metronome
    
    var body: some View {
        VStack {
            Text("Metronome")
            
            Button(action: {
                if self.metronome.timer == nil {
                    self.metronome.start()
                } else {
                    self.metronome.stop()
                }
            }) {
                Text(self.metronome.timer == nil ? "Start" : "Stop")
            }
        }
    }
}
