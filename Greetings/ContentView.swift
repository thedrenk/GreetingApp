//
//  ContentView.swift
//  Greetings
//
//  Created by Kingthed💛💙 💂🏾‍♀️ on 7/12/23.
//

import SwiftUI




struct ContentView: View {

    var body: some View {
        ZStack {
            BackGroundColor()
            VStack(alignment:.leading) {
                TitleView()
                
                Spacer()
                
                MessagesView()
                Spacer()
                Spacer()
            }
        }
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
           
    }
}

struct DataItemModel: Identifiable {
    let id = UUID()
    let text : String
    let color: Color
}


struct TitleView: View {
    @State var isRotated:Bool = false
    @State var captionIndex:Int = 0
    var caption: [String] = [
    "Exploring IOS 16 programming",
    "Learning how to bake",
    "Programming recipes",
    "A quest for knowlege",
    
    ]
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Greetings")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    
                
                Text(caption[captionIndex])
                    .font(.headline)
                    .fontWeight(.thin)
                    .padding(.top,-15)
                 
            }.padding()
            .onTapGesture {
                captionIndex = Int.random(in: 0..<caption.count)
            }
           
            Spacer()
            Circle()
                .strokeBorder(AngularGradient(gradient:
                        Gradient(colors: [.red, .green, .blue , .yellow,.purple]),
                                center: .center,
                                angle: .zero),
                              lineWidth: 8)
                .frame(maxWidth: 70, maxHeight: 70)
                .rotationEffect(isRotated ? .zero: Angle(degrees: 360))
                .onTapGesture {
                    withAnimation(.easeIn){
                        isRotated.toggle()
                    }
                }
               
        }
        .padding()
    }
}


struct TextView: View {
    let text:String
   @State var color:Color
    let colors: [Color] = [
        .red, .green, .blue , .yellow, .brown, .cyan, .black, .mint, .orange, .gray, .purple,.clear,
        Color(red: 255/255, green: 215/255, blue: 0/255),
        Color(red: 252/255, green: 186/255, blue: 3/255),
        Color(red: 252/255, green: 3/255, blue: 169/255),
        Color(red: 252/255, green: 3/255, blue: 169/255),
        Color(red: 133/255, green: 15/255, blue: 168/255),
        

    ]
    //133, 15, 168
    var body: some View {
        Text(text)
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundColor(Color.white)
            .padding()
            .background(color)
            .cornerRadius(20)
            .shadow(color: color.opacity(0.4), radius: 5, x: 10, y: 10)
            .onTapGesture {
                let length = colors.count
                let randomIndex = Int.random(in: 0..<length)
                color = colors[randomIndex]
            }
    }
}

struct MessagesView: View {
    let messages: Array = [
        DataItemModel(text: "Hello There", color: .black),
        DataItemModel(text: "WELCOME TO SWIFT PROGRAMMING", color: .mint),
        DataItemModel(text: "Ready?", color: .orange),
        DataItemModel(text: "Start exploring", color: .yellow),
        DataItemModel(text: "Boom", color: .purple)
    ]
    var body: some View {
        VStack(alignment:.leading) {
            ForEach(messages, content: { dataItem in
                TextView(text: dataItem.text, color: dataItem.color)
            })
        }.padding()
    }
}


struct BackGroundColor: View {
    var body: some View {
        LinearGradient(colors: [.red,.yellow,.blue,.teal], startPoint: .topLeading, endPoint: .bottomTrailing)
            .opacity(0.5)
            .ignoresSafeArea()
    }
}



