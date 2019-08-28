package co.kr.khaki.carmanage;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CarConsumableDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public void insert(CarConsumableDTO carConsumableDTO) {
		System.out.println("CarConsumableDAO Insert!");
		
		// date 객체를 이용해서 today 현재 시간을 가져와서 simpledateformat으로 형식을 변경하여 set을 통해 저장
		Date today = new Date();
		SimpleDateFormat sp = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss a");
		
		
		
	}	// insert End
	
}
