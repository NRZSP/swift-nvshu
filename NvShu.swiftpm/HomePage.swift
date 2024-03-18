import SwiftUI

struct HomePage: View {
    @EnvironmentObject var userData:UserData
    let transition: AnyTransition = .asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing))
    @State private var isStart = false
//    @AppStorage("home_stage") private var stage = 0
//    @AppStorage("first_in") private var first = true
    @State private var stage = 0
    @State private var first = true
    var body: some View {
        ZStack{
            Image("Background")
                .resizable()
            VStack {
                
                Spacer()
                if first == false || stage == 0{
                    HStack{
                        Image("女black")
                        Image("书black")
                    }.padding()
                }
                
                VStack(spacing: 10) {
                    Text("N\u{00FC}Shu").font(.title).bold()
                    if first{
                        switch(stage){
                        case 1:
                            VStack{
                                Text("Nüshu, originating from Jiangyong, China, is a precious cultural heritage and a historical gem of humanity. ").font(.headline).multilineTextAlignment(.center).padding()
                            }
                            .transition(transition)
                        case 2:
                            VStack{
                                Text("There are various theories regarding the origin of Nüshu, all shows the intelligence and creativity of women in ancient China ").font(.headline).multilineTextAlignment(.center).padding()
                                
                            }
                            .transition(transition)
                        case 3:
                            VStack{
                                Text("Let's gather fragments of Nüshu stories and piece them together, to recreate a legendary tale that unveils the creation of Nüshu. ").font(.headline).multilineTextAlignment(.center).padding()
                                
                            }
                            .transition(transition)
                        case 4:
                            VStack{
                                Text("Following in the footsteps of those who came before us and immerse ourselves in the art of copying Nüshu ").font(.headline).multilineTextAlignment(.center).padding()
                                
                            }
                            .transition(transition)
                        default:
                            VStack{
                                Text("China's secret female-only language")
                                Text("the only writing system in the world").foregroundColor(.gray)
                                Text("created and used exclusively by women.").foregroundColor(.gray)
                            }.transition(transition)
                        }
                    }
                    else {
                        VStack{
                            Text("China's secret female-only language")
                            Text("the only writing system in the world").foregroundColor(.gray)
                            Text("created and used exclusively by women.").foregroundColor(.gray)
                        }.transition(transition)
                    }
                }
                
                Spacer()
                Button(action:{
                    if stage<4 && first{
                        withAnimation(.spring()){
                            stage += 1
                        }
                    }else{
//                        stage = 0
//                        first = true
                        withAnimation(.spring()){
                            userData.appStage = 1
                        }
                        first = false
                    }
                }){
                    Rectangle()
                        .foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9))
                        .frame(width: 240, height: 60)
                        .cornerRadius(10)
                        .overlay(
                            HStack{
                                Image(systemName:stage == 4 ? "checkmark" : "arrow.right")
                                    .imageScale(.large)
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .padding(.leading)
                                Text(stage == 4 ? "let's start" : "Next")
                                    .foregroundColor(.black)
                                    .font(.title2)
                            }
                            
                        )
                }
            }
        }
    }
}

#Preview {
    HomePage()
}
