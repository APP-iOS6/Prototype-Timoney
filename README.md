# 타이머니
**사용자의 월급을 실시간으로 환산하고 내가 현재까지 얼마 벌었는지 보여주어 [동기부여를 해주는 무엇을 할 수 있는지 보여주는..] 앱**

# 구동화면
![Simulator Screen Recording - iPhone 15 Pro - 2024-09-24 at 17 22 27](https://github.com/user-attachments/assets/d30924ce-dbf2-4adc-affd-7fbd54d6d869)

# 페르소나 👥
- 내 한달 월급이 채워지는 것을 실시간으로 확인하고 싶다
- 내가 한 활동으로 인해 아낀 돈을 알고싶다.(걸음 수를 통해 아낀 돈)
- 위시리스트가 있어서 그 제품에 해당하는 돈이 모였으면 알림을 받으면 좋겠다
- 내가 생산한 물건의 가격을 정해두고 이걸 얼마나 만들었을 때 번 돈에 대해 보여주는 계산기가 있으면 좋겠다.
- 낭비하는 시간을 가치있게 써서 돈을 더 벌고싶다

# 주요기능 💡
1. 월급, 웝급 받는 날 입력
2. 메인 페이지 - 내가 지금까지 번 돈을 보여줌(돈이 쌓이고있는 이미지가 있으면 좋을거같음)
    1) 큰 글씨로 이달에 번 돈, 작은 글씨로 앱을 설치하고 지금까지 번 돈
3. 위시리스트 설정 - 내가 사고싶은 물건과 가격을 등록
    1) 위시리스트가 없다면 카뱅 저금통처럼 지금까지 모은 돈으로 살 수 있는 물건을 보여줌
    2) 위시리스트는 여러개 넣을 수 있고 우선순위 등록 가능
4. 메인 페이지 - 나의 위시리스트에 있는 물건까지의 프로그레스바와 앞으로 남은 돈을 보여줌

# 시나리오
![티머니 시나리오 _최종](https://github.com/user-attachments/assets/5f2a1007-8c28-49e6-8d23-9b19ec568d00)


### 개발 초기 메인페이지
|1안|
|---|
|![메인화면1-1](https://github.com/user-attachments/assets/4d51462b-4ccc-46b6-a4e1-66b35ca5d577) ![메인화면1-2](https://github.com/user-attachments/assets/529b316a-621a-4505-9d27-27dd998de810)|
|2안|
|![메인화면2](https://github.com/user-attachments/assets/ca7cd991-6efe-473c-bc4c-fb47c7fc1a35)|

상호 방문 테스트를 통해 피드백 받은 결과 2안이 좋다는 의견이 많아 2안으로 결정하였습니다


## 구성 화면
|초기 설정 화면|메인 화면|위시리스트|
|----------|-------|--------|
|![초기 설정 화면](https://github.com/user-attachments/assets/4062a074-cc0c-4845-bcdb-a354aeca1c44)|![메인화면](https://github.com/user-attachments/assets/918b67b9-f99d-41d3-acbe-56fc1d9b8965)|![위시리스트](https://github.com/user-attachments/assets/c61f73a6-f7de-45ae-a0c0-46eb8f891bd9)|



# 작동환경 🛠️
- Xcode : 15.4
- iOS : 17.0

# 개발자 💻
- 박준영
- 강승우
- 구영진
- 권희철
- 김수민

# 라이선스 🧭
Licensed under the [MIT](LICENSE) license.
