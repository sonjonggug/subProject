package car.service;
import java.io.File;
public class CarFileDupliTest {

	public String FileDupliTest(String cFile) throws Exception {
		
	String data_Directory ="C:\\mycar\\mycar\\WebContent\\image";
	String comFileName ="";
	File dir = new File(data_Directory);
	File[] fileNames = dir.listFiles();
	for(File fileName : fileNames) {
	System.out.println(fileName);
		//해당 경로 폴더에 있는 파일이름을 for문으로 fileName에 담음(DataType = File[])
	if(fileName.isFile()) {
	comFileName = fileName.getName();
	System.out.print("image 폴더내에 있는 파일명:");
	System.out.println(comFileName);
	System.out.println("cFile 파일명:" + cFile);
	//파일이름이 다를 때
	if (comFileName.equals(cFile)) {
		int pos = cFile.lastIndexOf(".");
		String cFileName = cFile.substring(0,pos);
		String cFileExtension = cFile.substring(pos+1,cFile.length());
		cFile = cFileName + "A." + cFileExtension;
		System.out.print("파일명과 확장자 사이에 A을 추가한 뒤 파일명: ");
		System.out.println(cFile);
		}
	// 파일 이름이 동일 할때, cFile에서 확장자명 앞에 1추가 후 리턴		
	else {
		System.out.println("파일이름이 다름");
		
	}
	}else {
	 System.out.println("해당 폴더내에 파일이 없습니다.");
	}
}
	return cFile;
}
	}
