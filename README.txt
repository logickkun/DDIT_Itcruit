commons 패키지는 각 액터들의 공통된 기능을 구현하기 위한 패키지입니다
	예를 들면 회원가입, 로그인, 아이디/비밀번호 찾기 등  기능을 하기 위한 패키지입니다
	
	또한 공통코드를 불러오기 위한 VO를 저장하기 위한 패키지 구조 이기도 합니다

board: 게시판
	각각의 게시판들을 관리하기 위한 패키지
	
	FAQBoardController		: 일반-FAQ 게시판
	FreeBoardController		: 일반-자유게시판
	InquiryBoardController	: 일반-질문
	NoticeBoardController	: 일반-공지
	
	EnterpriseFreeBoardController : 기업-자유
	EnterpriseNoticeBoardController : 기업-공지
	

메서드명 예시

	private IMemberAccountService memAccountService;

	//회원가입
	@RequestMapping(value="/signup.do", method = RequestMethod.POST)
	public String memberSignup(){
		return "";
	}
	
	//로그인
	@RequestMapping(value="/signin.do", method = RequestMethod.POST)
	public String memberSignin(){
		return "";
	}
	
	//아이디찾기
	@RequestMapping(value="/searchId.do", method = RequestMethod.POST)
	public String memberSearchIdByMail(){
		return "";
	}
	
	
	//비밀번호 찾기
	@RequestMapping(value="/searchPw.do", method = RequestMethod.POST)
	public String memberSearchPwByMail(){
		return "";
	}
	
	
	

	memAccountService.selectIdByEmail()
	memAccountService.selectPwByEmailAndId()
	

