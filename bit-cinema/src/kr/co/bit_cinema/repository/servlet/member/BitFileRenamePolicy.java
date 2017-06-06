package kr.co.bit_cinema.repository.servlet.member;

import java.io.File;
import java.util.UUID;

import com.oreilly.servlet.multipart.FileRenamePolicy;

// 얘는 프로젝트에서 전체가 같이 쓰기 때문에 밖으로 나와있어야된다 -> 어디로빼냐
public class BitFileRenamePolicy implements FileRenamePolicy {
	
	@Override
	public File rename(File f) {
		String path = f.getParent();
		
		String name = f.getName();
		
		String ext = "";
		int index = name.lastIndexOf(".");
		if (index != -1)
			ext = name.substring(index);

		String fName = UUID.randomUUID().toString();

		return new File(path, fName + ext);
	}
	
}
