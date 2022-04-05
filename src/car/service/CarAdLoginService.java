package car.service;

import member.bean.MemberBean;
import static db.JdbcUtil.*;
import java.sql.Connection;
import car.dao.CarDAO;

public class CarAdLoginService {

	public boolean login(MemberBean member) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		CarDAO memberDAO = CarDAO.getInstance();
		memberDAO.setConnection(conn);
		boolean loginResult = false;
		String loginId = memberDAO.selectLoginId(member);
		if(loginId != null){
			loginResult = true;
		}
		close(conn);
		return loginResult;
	}

}
