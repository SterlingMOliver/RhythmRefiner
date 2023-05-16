import SwiftUI

struct MainView: View {
    @StateObject private var metronome = Metronome()
    @StateObject private var toneGenerator = ToneGenerator()
    
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
            
            Divider()  // To separate the metronome and tone generator controls
            
            Text("Tone Generator")
            
            Button(action: {
                self.toneGenerator.start()
            }) {
                Text("Start Tone")
            }

            Button(action: {
                self.toneGenerator.stop()
            }) {
                Text("Stop Tone")
            }
        }
    }
}