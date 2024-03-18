//
//  CopyView.swift
//  NvShu
//
//  Created by m1e on 2024/2/25.
//
import SwiftUI
import AVFoundation

struct CanvasView: View {
    
    var lines: [[CGPoint]]
    var body: some View {
        Path { path in
                        for line in lines {
                            if let firstPoint = line.first {
                                path.move(to: firstPoint)
                            }
                            
                            if line.count >= 3 {
                                for i in 1..<line.count-1 {
                                    let controlPoint = CGPoint(x: (line[i].x + line[i+1].x)/2, y: (line[i].y + line[i+1].y)/2)
                                    path.addQuadCurve(to: controlPoint, control: line[i])
                                }
                            }
                            
                            if let lastPoint = line.last {
                                path.addLine(to: lastPoint)
                            }
                        }
                    }
        .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round))
    }
}

struct CopyView: View {
    @State private var audioPlayer: AVAudioPlayer?
    @EnvironmentObject var userData:UserData
    @State var nvShuChars = [ NvShuNi(),NvShuHao(),NvShuNv(), NvShuShu()]
    @State private var lines: [[CGPoint]] = [[]]
    @State var same:Bool = false
    @State var points:[CGPoint] = []
    @State var progress = 0
    @State var showSideBar:Bool = false
    @AppStorage("max_progress") var maxProgress = 0
    @State var pop = false
    var body: some View {
        ZStack(alignment:.leading){
            
            VStack {
                navigateBar
                    .padding()
                Text("Feel the process of its creation in the copy")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .frame(maxWidth: 200)
                    .multilineTextAlignment(.center)
                    
                Text(nvShuChars[getProgress()].name)
                    .font(.largeTitle)
                    .padding(.top)
                paintSection
                    .padding(.bottom)
                    .background(Color.white)
                bottomBar
                
            }
            if showSideBar{
                sideBar
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
            }
            
            if pop{
                popWindow
            }
            
        }.navigationBarBackButtonHidden(true)
            .onAppear{
                maxProgress = userData.progress
                progress = userData.progress
            }
    }
}

// MARK: COMPONENTS
extension CopyView{
    private var popWindow: some View{
        ZStack{
            Color.black
                .opacity(0.5)
                .edgesIgnoringSafeArea(.all)
            
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(.white)
                .frame(maxWidth: .infinity)
                .padding()
            VStack{
                Text("Congratulations!")
                    .font(.title)
                HStack(spacing:10){
                    Image(nvShuChars[getProgress()].image+"black")
                    VStack(spacing:10){
                        Text(nvShuChars[getProgress()].name).font(.largeTitle)
                        Text(nvShuChars[getProgress()].english).font(.headline)
                    }
                }.padding()
                Text("Unlock Story Clip")
                    .font(.headline)
                Text(truncateString(nvShuChars[getProgress()].story,maxLength:50))
                    .padding()
                
                Button(action: {
                    withAnimation(.spring()){
                        pop = false
                    }
                    
                    if progress < nvShuChars.count{
                        progress += 1
                        if progress>maxProgress{
                            maxProgress = progress
                            userData.progress = progress
                            
                        }
                        if progress==nvShuChars.count{
                            withAnimation(.spring()){
                                userData.appStage = 3
                            }
                        }
                    }
                }) {
                    RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 2)
                                .overlay{
                                    HStack(spacing:0){
                                        Image(systemName:"chevron.right.circle.fill")
                                            .imageScale(.large)
                                            .font(.headline)
                                            .foregroundColor(.black)
                                            .padding(.leading)
                                        if progress==nvShuChars.count-1{
                                            Text("Finish!")
                                                .font(.title2)
                                                .foregroundColor(.black)
                                                .padding()
                                        }else{
                                            Text("Next!")
                                                .font(.title2)
                                                .foregroundColor(.black)
                                                .padding()
                                        }
                                        
                                        
                                    }
                                    .background(Color.white)
                                }
                                .frame(width:140,height: 60)
                    
                }
            }.padding()
            
        }
        
    }
    
    private var sideBar: some View{
        VStack{
            Spacer()
                .frame(height: 80)
            ForEach(nvShuChars.indices,id:\.self){index in
                Text("")
                    .frame(height: 90)
                    .overlay{
                        Button(action: {
                            if index<=maxProgress && !(index==progress) {
                                resetLines()
                                progress = index
                            }
                        }) {
                            Text(nvShuChars[index].name)
                                .font(.title2)
                                .foregroundColor(index>maxProgress ? .gray : .black)
                                .frame(width: 80,height: 90)
                                .background(Color(red: (index>maxProgress) ? 0.8 : 0.9,
                                                  green: (index>maxProgress) ? 0.8 : 0.9,
                                                  blue: (index>maxProgress) ? 0.8 : 0.9))
                                .cornerRadius(10)
                                .offset(x:30)
                        }
                        .disabled(index>maxProgress)
                    }
            }
            Text("")
                .frame(height: 90)
                .overlay{
                    Button(action: {
                        playAudio(name: nvShuChars[getProgress()].name)
                    }) {
                        Image(systemName:"speaker.wave.3.fill")
                            .font(.title2)
                            .foregroundColor(.black)
                            .frame(width: 80,height: 90)
                            .background(Color(red: 0.9, green: 0.9, blue: 0.9))
                            .cornerRadius(10)
                            .offset(x:30)
                        
                        
                    }
                }
            Text("")
                .frame(height: 90)
                .overlay{
                    Button(action: {
                        withAnimation(.spring()){
                            userData.appStage = 1
                        }
                    }) {
                        Image(systemName:"chevron.left")
                            .font(.title2)
                            .foregroundColor(.black)
                            .frame(width: 80,height: 90)
                            .background(Color(red: 0.9, green: 0.9, blue: 0.9))
                            .cornerRadius(10)
                            .offset(x:30)
                        
                        
                    }
                }
            Spacer()
        }
    }
    
    private var bottomBar: some View{
        HStack{
            Spacer()
            Button(action: {
                resetLines()
            }) {
                RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 2)
                            .overlay{
                                HStack(spacing:0){
                                    Image(systemName:"arrow.counterclockwise")
                                        .imageScale(.large)
                                        .font(.headline)
                                        .foregroundColor(.black)
                                        .padding(.leading)
                                        
                                    Text("Reset")
                                        .font(.title2)
                                        .foregroundColor(.black)
                                        .padding()
                                    
                                }
                                .background(Color.white)
                            }
                            .frame(width:140,height: 60)
                
            }
            Spacer()
            Button(action: {
                if same {
                    resetLines()
                    withAnimation(.spring()){
                        pop = true
                    }
                }
            }) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(red: 0.9, green: 0.9, blue: 0.9))
                    .overlay{
                        HStack(spacing:0){
                            Image(systemName:"checkmark")
                                .imageScale(.large)
                                .font(.headline)
                                .foregroundColor(.black)
                                .padding(.leading)
                                
                            Text("Check")
                                .font(.title2)
                                .foregroundColor(.black)
                                .padding()
                            
                        }
                    }
                    .frame(width:140,height: 60)
            }
            Spacer()
        }
    }
    
    
    private var navigateBar:some View{
        HStack{
            Button(action: {
                withAnimation(.spring()){
                    showSideBar.toggle()
                }
            }) {
                Image(systemName: "list.bullet")
                    .resizable()
                    .foregroundColor(.black)
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color(red: showSideBar ? 0.9:1,
                                        green:showSideBar ? 0.9:1,
                                        blue: showSideBar ? 0.9:1))
                            .frame(width: 50,height: 50)
                    )
                    .frame(width:28,height:20)
                    
            }
            ZStack{
                ZStack(alignment:.leading){
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .fill(Color.gray)
                        .frame(width:280,height: 20)
                        .padding(.horizontal)
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(Color(
                            red: Double(0xBF) / 255.0,
                            green: Double(0xF8) / 255.0,
                            blue: Double(0x86) / 255.0
                        ))
                        .frame(width:70*Double(maxProgress),height:20)
                        .padding(.horizontal)
                }
            }
        }
    }
    
    private var paintSection:some View{
        GeometryReader{ geometry in
            CanvasView(lines: lines)
                .background(Image(nvShuChars[getProgress()].image)
                    .resizable()
                    .aspectRatio(0.5, contentMode: .fit)
                    .frame(width: geometry.size.width,
                           height: geometry.size.height)
                    .clipped())
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { value in
                            let currentPoint = value.location
                            if geometry.frame(in: .local).contains(currentPoint){
                                lines[lines.count-1].append(currentPoint)
                                points.append(currentPoint)
                            }else{
                                return
                            }
                            same = nvShuChars[getProgress()].check(drawPoints: points, height: geometry.size.height,width: geometry.size.width)
                        }
                        .onEnded { value in
                            lines.append([])
                        }
                )
        }
    }
}

// MARK: FUNCTIONS
extension CopyView{
    func resetLines(){
        points = []
        lines = [[]]
        same = false
    }
    
    func getProgress()->Int{
        if progress >= nvShuChars.count{
            return nvShuChars.count-1
        }else{
            return progress
        }
    }
    
    func truncateString(_ input: String, maxLength: Int) -> String {
        if input.count <= maxLength {
            return input
        } else {
            let endIndex = input.index(input.startIndex, offsetBy: maxLength)
            let truncatedString = input[..<endIndex]
            return truncatedString + "..."
        }
    }
    
    func playAudio(name:String) {
            guard let audioURL = Bundle.main.url(forResource: name, withExtension: "mp3") else {
                return
            }
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
                audioPlayer?.play()
                print("Play")
            } catch {
                print("Error playing audio: \(error.localizedDescription)")
            }
        }
}
