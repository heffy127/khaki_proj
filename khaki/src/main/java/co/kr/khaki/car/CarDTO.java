package co.kr.khaki.car;

public class CarDTO {

	private String car_name; // 차종 > 소나타,아반떼..
	private String car_num; // 차번호 > 30가1234 , 프라이머리키
	private int driven; // 주행거리
	private String fuel_type; // 연료타입 디젤,가솔린,하이브리드,전기
	private int fuel_gage; // 연료충전량
	private String loc_pre; // 현재위치 (위도,경도)
	private int zone_num; // 해당 차량이 소속된 존의 위치 (위도,경도)
	private int fee_hour; // 1시간당 대여료 (처음 예약시 결제)
	private int fee_km; // km당 요금 (반납 후 결제)
	private String car_image; //이미지 경로
	
	public String getCar_name() {
		return car_name;
	}
	public void setCar_name(String car_name) {
		this.car_name = car_name;
	}
	public String getCar_num() {
		return car_num;
	}
	public void setCar_num(String car_num) {
		this.car_num = car_num;
	}
	public int getDriven() {
		return driven;
	}
	public void setDriven(int driven) {
		this.driven = driven;
	}
	public String getFuel_type() {
		return fuel_type;
	}
	public void setFuel_type(String fuel_type) {
		this.fuel_type = fuel_type;
	}
	public int getFuel_gage() {
		return fuel_gage;
	}
	public void setFuel_gage(int fuel_gage) {
		this.fuel_gage = fuel_gage;
	}
	public String getLoc_pre() {
		return loc_pre;
	}
	public void setLoc_pre(String loc_pre) {
		this.loc_pre = loc_pre;
	}
	public int getZone_num() {
		return zone_num;
	}
	public void setZone_num(int zone_num) {
		this.zone_num = zone_num;
	}
	public int getFee_hour() {
		return fee_hour;
	}
	public void setFee_hour(int fee_hour) {
		this.fee_hour = fee_hour;
	}
	public int getFee_km() {
		return fee_km;
	}
	public void setFee_km(int fee_km) {
		this.fee_km = fee_km;
	}
	public String getCar_image() {
		return car_image;
	}
	public void setCar_image(String car_image) {
		this.car_image = car_image;
	}
	
	
	
}
