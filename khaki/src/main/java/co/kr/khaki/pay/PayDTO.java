package co.kr.khaki.pay;

public class PayDTO {
	private int buy_num; // 구매개수를 확인 할 번호
	private String buy_id; // 구매자 id
	private String buy_carIns; // 선택한 보험
	private String buy_startTime; // 출발시간
	private String buy_endTime; // 도착시간(도착시간은 시간연장을 하는 경우가 있기 때문에 반납시 변경 됨.
							// 연장등으로 인한 도착시간 변경시 변경전 도착시간과 변경 후 도착시간의 차이만큼
							// 추가금액 발생
	private String buy_real_endTime;
	private String buy_driveDistance; // 주행거리(반납시 대여시간 * 랜덤숫자로 대략적인 주행거리 계산하여 입력)
	private String buy_startLocation; // 대여장소
	private String buy_returnLocation; // 반납장소
	private String buy_real_returnLocation; // 반납장소
	private String buy_carNum; // 구매차량번호
	private String buy_carModel; // 구매차량모델
	private String buy_expectedPoint; // 최초 구매금액(최초 결제시 부름서비스 신청, 존이 아닌곳에서 반납하는 등에 대한
	private String buy_amount; // 최초 구매금액(최초 결제시 부름서비스 신청, 존이 아닌곳에서 반납하는 등에 대한
								// 추가금액이 포함되는 총 금액)
	private String buy_addAmount; // 추가금액(이용시간 연장, 반납장소 변경 등으로 인한 추가금액 발생시 추가금액)
	private String buy_totalAmount; // 총 이용금액(최초금액과 추가금액의 합산금액)
	private String buy_accident; // 고객 이용 중 사고 접수내용
	private String buy_impUid; // 아임포트 거래고유번호(주문번호)
	
	
	public int getBuy_num() {
		return buy_num;
	}
	public void setBuy_num(int buy_num) {
		this.buy_num = buy_num;
	}
	public String getBuy_id() {
		return buy_id;
	}
	public void setBuy_id(String buy_id) {
		this.buy_id = buy_id;
	}
	public String getBuy_carIns() {
		return buy_carIns;
	}
	public void setBuy_carIns(String buy_carIns) {
		this.buy_carIns = buy_carIns;
	}
	public String getBuy_startTime() {
		return buy_startTime;
	}
	public void setBuy_startTime(String buy_startTime) {
		this.buy_startTime = buy_startTime;
	}
	public String getBuy_endTime() {
		return buy_endTime;
	}
	public void setBuy_endTime(String buy_endTime) {
		this.buy_endTime = buy_endTime;
	}
	public String getBuy_real_endTime() {
		return buy_real_endTime;
	}
	public void setBuy_real_endTime(String buy_real_endTime) {
		this.buy_real_endTime = buy_real_endTime;
	}
	public String getBuy_driveDistance() {
		return buy_driveDistance;
	}
	public void setBuy_driveDistance(String buy_driveDistance) {
		this.buy_driveDistance = buy_driveDistance;
	}
	public String getBuy_startLocation() {
		return buy_startLocation;
	}
	public void setBuy_startLocation(String buy_startLocation) {
		this.buy_startLocation = buy_startLocation;
	}
	public String getBuy_returnLocation() {
		return buy_returnLocation;
	}
	public void setBuy_returnLocation(String buy_returnLocation) {
		this.buy_returnLocation = buy_returnLocation;
	}
	public String getBuy_real_returnLocation() {
		return buy_real_returnLocation;
	}
	public void setBuy_real_returnLocation(String buy_real_returnLocation) {
		this.buy_real_returnLocation = buy_real_returnLocation;
	}
	public String getBuy_carNum() {
		return buy_carNum;
	}
	public void setBuy_carNum(String buy_carNum) {
		this.buy_carNum = buy_carNum;
	}
	public String getBuy_carModel() {
		return buy_carModel;
	}
	public void setBuy_carModel(String buy_carModel) {
		this.buy_carModel = buy_carModel;
	}
	public String getBuy_expectedPoint() {
		return buy_expectedPoint;
	}
	public void setBuy_expectedPoint(String buy_expectedPoint) {
		this.buy_expectedPoint = buy_expectedPoint;
	}
	public String getBuy_amount() {
		return buy_amount;
	}
	public void setBuy_amount(String buy_amount) {
		this.buy_amount = buy_amount;
	}
	public String getBuy_addAmount() {
		return buy_addAmount;
	}
	public void setBuy_addAmount(String buy_addAmount) {
		this.buy_addAmount = buy_addAmount;
	}
	public String getBuy_totalAmount() {
		return buy_totalAmount;
	}
	public void setBuy_totalAmount(String buy_totalAmount) {
		this.buy_totalAmount = buy_totalAmount;
	}
	public String getBuy_accident() {
		return buy_accident;
	}
	public void setBuy_accident(String buy_accident) {
		this.buy_accident = buy_accident;
	}
	public String getBuy_impUid() {
		return buy_impUid;
	}
	public void setBuy_impUid(String buy_impUid) {
		this.buy_impUid = buy_impUid;
	}

	
	
}
