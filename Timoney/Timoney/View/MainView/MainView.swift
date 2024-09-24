import SwiftUI

struct MainView: View {
    @State private var amount: Double = 0
    @State private var progress: Double = 0
    @State private var timer: Timer?
    @State private var imageName: String = "3dicons-1" // 초기 이미지
    @State private var itemText: String = "가방" // 초기 텍스트
    
    let totalAmount: Double = 3000000 // 목표 금액 (3,000,000원)
    let updateInterval: TimeInterval = 1.0 // 1초마다 금액 증가
    let totalTime: TimeInterval = 60.0 // 60초 동안 진행
    let progressThreshold: Double = 1.0 // 게이지 최대치
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                HStack {
                    Spacer()
                    Image("AppIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                    Spacer()
                    
                    Button(action: {
                    }) {
                        Image(systemName: "gearshape.fill")
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.horizontal)
                
                // 날짜 범위
                Text("2024.09.20 ~ 2024.09.24")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                // 돈 표시
                Text("\(Int(amount))원")
                    .contentTransition(.numericText())
                    .transaction { t in
                        t.animation = .default
                    }
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .shadow(color: Color.black.opacity(0.3), radius: 3, x: 0, y: 5)
                // 가운데 이미지
                Image(imageName)
                    .resizable()
                    .frame(width: 250, height: 250)
                    .scaledToFit()
                
                // 캡슐 형태의 게이지 표시 및 세로 선 추가
                HStack {
                    Text("9/23")
                    ZStack(alignment: .leading) {
                        Capsule()
                            .frame(height: 20) // 세로 크기 20
                            .foregroundColor(.gray.opacity(0.3)) // 배경색
                        Capsule()
                            .frame(width: progressWidth(), height: 20) // 세로 크기 20, 진행도에 따른 너비
                            .foregroundColor(.accentColor) // 진행 색상
                        
                        // 가방, 텀블러, 마이크 기준선 추가
                        HStack {
                            verticalLine(at: 0.55) // 가방
                            verticalLine(at: 0.65) // 텀블러
                            verticalLine(at: 0.89) // 마이크
                        }
                        
                        HStack {
                            Text("가방")
                                .offset(x: 120, y: -20)
                                .font(.footnote)
                            Text("텀블러")
                                .offset(x: 120, y: -20)
                                .font(.footnote)
                            Text("마이크")
                                .offset(x: 145, y: -20)
                                .font(.footnote)
                        }
                    }
                    Text("10/22")
                }
                .padding()
                
                // 남은 시간 표시
                Text("\(itemText)까지 \(calculateRemainingTime())분 남았습니다!")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .contentTransition(.numericText())
                    .transaction { t in
                        t.animation = .default
                    }
                
                Spacer()
                
                HStack {
                    Button(action: {
                    }) {
                        Circle()
                            .fill(Color.accentColor.opacity(0.7))
                            .frame(width: 30, height: 30)
                    }
                    Button(action: {
                    }) {
                        Circle()
                            .fill(Color.gray)
                            .frame(width: 30, height: 30)
                    }
                }
                
                Spacer()
                
                NavigationLink(destination: InventoryView()) {
                    HStack {
                            Image(systemName: "bag")
                                .font(.title2)
                                .foregroundColor(.white)
                            Text("나의 위시리스트")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .font(.title2)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, minHeight: 40)
                        .background(Color.accentColor.opacity(0.9))
                        .cornerRadius(15)
                    }
            }
            .padding()
            .onAppear {
                startTimer()
            }
        }
    }
    
    func startTimer() {
        if timer != nil {
                    timer?.invalidate()
                }
        timer = Timer.scheduledTimer(withTimeInterval: updateInterval, repeats: true) { _ in
            if amount < totalAmount {
                amount += 50000 // 1초마다 50,000원씩 증가
                progress += 1 / (totalTime / updateInterval)
                
                if progress >= 0.75 {
                    imageName = "3dicons-2"
                    itemText = "마이크"
                } else if progress >= 0.6 {
                    imageName = "3dicons-6"
                    itemText = "텀블러"
                } else {
                    imageName = "3dicons-1"
                }
            } else {
                timer?.invalidate() // 목표 금액 달성 시 타이머 중지
            }
        }
    }
    
    func calculateRemainingTime() -> Int {
        let remainingProgress: Double
        if progress < 0.6 {
            remainingProgress = 0.6 - progress
        } else if progress < 0.75 {
            remainingProgress = 0.75 - progress
        } else {
            remainingProgress = 1.0 - progress
        }
        
        let remainingTime = Int(remainingProgress * totalTime)
        return max(remainingTime, 0) // 음수가 되지 않도록 보장
    }
    
    func progressWidth() -> CGFloat {
        let maxWidth: CGFloat = 240.0 // 원하는 너비 설정
        return maxWidth * CGFloat(progress)
    }
    
    func verticalLine(at progress: Double) -> some View {
        let maxWidth: CGFloat = 240.0 // 게이지 전체 너비
        return Rectangle()
            .frame(width: 2, height: 20) // 세로 선 크기 설정
            .foregroundColor(.accentColor)
            .offset(x: maxWidth * CGFloat(progress), y: 0) // 진행도에 따른 위치 설정
    }
}

#Preview {
    MainView()
}
