//
//  ContentView.swift
//  FirstDemoApp
//
//  Created by Olanrewaju Afolayan on 2/18/24.
//

import SwiftUI
import FirebaseFirestore


// Custom View Modifier to Style our Questions

struct RoundedBoxStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.blue.opacity(0.2))
            .foregroundColor(Color.black)
            .font(.title)
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.blue, lineWidth: 2)
            )
            .padding([.horizontal, .bottom])
    }
}


struct ContentView: View {
    
    let db = Firestore.firestore()
    @State var txtFirstName: String = ""
    @State var txtLastName: String = ""
    @State var txtPrefName: String = ""
    @State var txtAnswer: String = ""
    @State var txtQuestion: String = ""
    @State private var submissionMessage: String = ""
    @State var questions = [Question]()
    @State private var showAnswerField = false

    
    var body: some View {
            ZStack {
                // Linear gradient background
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                // Main content
                ScrollView {
                    VStack(spacing: 20) {
                        VStack {
                            Text("Intrigue Inquire")
                                .font(.system(size: 40))
                                .bold()

                            Text("Built by Michael FLourish")
                        }

                        // Separate VStack for form inputs
                        VStack(spacing: 15) {
                            TextField("First name", text: $txtFirstName)
                            TextField("Last Name", text: $txtLastName)
                            TextField("Preferred Name", text: $txtPrefName)
                            Button(action: {
                                setRandomQuestion()
                                showAnswerField = true
                            }) {
                                Text("Get a New Random Question")
                                    .font(.system(size: 20))
                                    .padding()
                                    .background(Color.orange)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }

                            if !txtQuestion.isEmpty {
                                Text(txtQuestion)
                                    .modifier(RoundedBoxStyle())
                            }
                            
                            if showAnswerField {
                                    TextField("Answer", text: $txtAnswer)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                }
                            
                        }
                        .padding(.horizontal)

                        Button(action: {
                            if !txtAnswer.isEmpty {
                                writeToFirebase()
                                submissionMessage = "Information Submitted"
                            }
                        }) {
                            Text("Submit")
                                .font(.system(size: 20))
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }

                        if !submissionMessage.isEmpty {
                            Text(submissionMessage)
                                .foregroundColor(.white)
                                .transition(.slide)
                                .onAppear {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                        resetTextFields()
                                        submissionMessage = ""
                                    }
                                }
                        }
                    }
                    .padding()
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(10)
                }
            }
            .onAppear {
                getQuestionsFromFirebase()
            }
        }

    func setRandomQuestion(){
        print(txtLastName)
        var newQuestion = questions.randomElement()?.text
        if(newQuestion != nil){
            self.txtQuestion = newQuestion!
        }
        
        
    }
    
    //Get data from Firebase
    
    func getQuestionsFromFirebase(){
        db.collection("questions")
            .getDocuments() { (querySnapshot,err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID)")
                        
                        if let question = Question(id:
                            document.documentID, data: document.data()){
                            print("Question ID = \(question.id), text = \(question.text)")
                            self.questions.append(question)
                        }
                    }
                }
                
            }
        
    }
    
    
    
    func resetTextFields(){
        txtFirstName = ""
        txtLastName = ""
        txtPrefName = ""
        txtAnswer = ""
        txtQuestion = ""
    }
    
    func writeToFirebase(){
        print("Written to Firebase")
        print("Answer: \(txtAnswer)")
        print("Questiomn: \(txtQuestion)")
        print("Class: IOS  Dev Cladd")
        
        let data = ["first_name" : txtFirstName,
                    "last_name" : txtLastName,
                    "pref_name" : txtPrefName,
                    "question" : txtQuestion,
                    "answer" : txtAnswer,
                    "class" : "IOS Dev Class 2023" ] as [String: Any]
        
        var ref: DocumentReference? = nil
        ref = db.collection("newStudents")
            .addDocument(data: data){ err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                }
                
            }
    }
    
    
}

#Preview {
    ContentView()
}
