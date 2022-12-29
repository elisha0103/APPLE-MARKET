//
//  MyProfileView.swift
//  AppleMarket
//
//  Created by Jero on 2022/12/27.
//

import SwiftUI

struct MyProfileView: View {
    let listTitle: [String] = ["내 기기 추가", "주소지 등록"]
    @Binding var isShowingSheet: Bool
    @State private var showingAlertProfile = false
    @State private var isEditName: Bool = false
    @StateObject var userInfoStore: UserInfoStore
    @State private var action: Int = 0
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 0) {

                    List {
                        Section {
                            HStack {
                                AsyncImage(url: URL(string: "https://mblogthumb-phinf.pstatic.net/MjAxNzEyMTFfMjA3/MDAxNTEyOTg0MTU3MzMz.wOvG_aS8a9vm44iNUmgby2-oG2u4aPAZ9lkOgyFqT7Ag.8qIDSv7H3yMjgKynzob12maeIvqeE1IrEtscN8MV0Uog.JPEG.jung02140214/IMG_2189.jpg?type=w800")) { image in
                                    image
                                        .resizable()
                                        .frame(width: 45, height: 45)
                                        .aspectRatio(contentMode: .fit)
                                        .cornerRadius(22)
                                } placeholder: {
                                    ProgressView()
                                }
                                
                                VStack(alignment:. leading, spacing: 3) {
                                    HStack(alignment: .center) {
                                        Text("파베에서 이름 불러오기")
                                            .font(.title3)
                                    }
                                    
                                    Text("파베에서 불러온 이메일")
                                        .font(.subheadline)
                                }
                            }
                        }
                        .frame(height: 55)
                        ForEach(listTitle, id: \.self) { title in
                            if title == "내 기기 추가" {
                                NavigationLink {
                                    MyDeviceListView()
                                } label: {
                                    Text(title)
                                }
                            } else {
                                NavigationLink {
                                    MyAddressListView()
                                } label: {
                                    Text(title)
                                }
                            }
                        }
                        Section {
                            Button {
                              showingAlertProfile = true
                            } label: {
                                Text("로그아웃")
                                    .alert(" ", isPresented: $showingAlertProfile) {
                                        Button("Cancel", role: .cancel) {
                                            
                                        }
                                        
                                        Button("Yes", role: .destructive) {
                                            userInfoStore.emailAuthSignOut()
                                            isShowingSheet.toggle()
                                        }
                                    } message: {
                                        Text("로그아웃 하시겠습니까?")
                                    }
                        }
                        }
                    }
                    .navigationBarTitle("계정")
                    .navigationBarTitleDisplayMode(.inline)
                    
            }
        }
    }
}

struct MyProfileView_Previews: PreviewProvider {
    @State static var isShowingSheet: Bool = false
    static var previews: some View {

        NavigationStack {
            MyProfileView(isShowingSheet: $isShowingSheet, userInfoStore: UserInfoStore())
        }

    }
}
