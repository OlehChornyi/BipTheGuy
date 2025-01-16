//
//  ContentView.swift
//  BipTheGuy
//
//  Created by Oleh on 16.01.2025.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var audioPlayer: AVAudioPlayer!
//    @State private var scale = 1.0
        @State private var animateImage = true
    var body: some View {
        VStack {
            Spacer()
            
            Image("clown")
                .resizable()
                .scaledToFit()
//                .scaleEffect(scale)
                .scaleEffect(animateImage ? 1.0 : 0.9)
                .onTapGesture {
                    playSound(soundName: "punchSound")
//                    scale = scale + 0.1
                    animateImage = false
                    withAnimation (.spring(duration: 0.3, bounce: 0.3)) {
                        animateImage = true
                    }
                }
//                .animation(.spring(response: 0.3, dampingFraction: 0.3), value: scale)
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                Label("Photo Library", systemImage: "photo.fill.on.rectangle.fill")
            })
        }
        .padding()
    }
    
    func playSound(soundName: String) {
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("🤬 Could not read file named \(soundName)")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("🤬 ERROR: \(error.localizedDescription)")
        }
    }
    
}

#Preview {
    ContentView()
}
