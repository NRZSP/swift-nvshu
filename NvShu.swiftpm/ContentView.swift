import SwiftUI
import AVFoundation
class UserData: ObservableObject {
    @Published var appStage:Int = 0
    @Published var progress:Int = 0
}


struct ContentView: View {
    @State private var audioPlayer: AVAudioPlayer?
    var body: some View {
        VStack {
            MainView()
        }.environmentObject(UserData())
    }
}

extension ContentView{
    func playBackgroundMusic() {
            guard let audioURL = Bundle.main.url(forResource: "background_music", withExtension: "mp3") else {
                return
            }
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
                audioPlayer?.numberOfLoops = -1 // 设置为-1表示无限循环播放
                audioPlayer?.play()
            } catch {
                print("Error playing background music: \(error.localizedDescription)")
            }
        }
}

struct MainView: View{
    @EnvironmentObject var userData:UserData
    let transition: AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    var body: some View{
        switch(userData.appStage){
        case 1:
            StoryView()
                .transition(transition)
        case 2:
            CopyView()
                .transition(transition)
        case 3:
            FinalView()
                .transition(transition)
        default:
            HomePage()
                .transition(transition)
        }
    }
}
