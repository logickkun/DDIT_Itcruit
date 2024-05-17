package kr.co.itcruit.codingtest.utils;


import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.lang.reflect.Method;
import java.nio.file.Files;
import java.util.Scanner;

import kr.co.itcruit.vo.CodingtestVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 입력받은 코드를 컴파일할 유틸
 * @author KHT
 */
@Slf4j
public class CompileUtils {

	
    public String doCompile(CodingtestVO codingtestVO) throws Exception {
    	
    	log.info("doCompileUtils>>>>>>"  + codingtestVO.toString());
    	
    	String ret = "";
    	 
    	ret = "runtime error";
//    	String ret = "runtime error";
    	
        String className = "Main";
        String className2 = "Solution";
        
        String mainCode = codingtestVO.getQstnMcode();
        String inputCode = codingtestVO.getCode();
        
        log.info(mainCode);
        log.info(inputCode);
        
        
        String error2 = compile(className2, inputCode);
        if (!error2.trim().equals("")) {
        	ret ="컴파일에러\n" + error2;
        	return ret;
        }
        
        String error = compile(className, mainCode);
        if (!error.trim().equals("")) {
        	ret ="컴파일에러\n" + error2;
        	return ret;
        }
        
        String folder = System.getProperty("user.dir") + "\\dynamic";
        
        
        File file1 = new File(folder, className + ".class");
        File file2 = new File(folder, "Solution.class");
       
        byte[] classByte1 = classByte1 = Files.readAllBytes(file1.toPath());
        byte[] classByte2 = classByte2 = Files.readAllBytes(file2.toPath());
        
        file1.delete();
        file2.delete();
        
        //클래스를 로딩후 실행하는 곳
        FileClassLoader fc = new FileClassLoader();
    	Class<?> dynamic = fc.findClass(classByte1, "dynamic." + className);
    	Class<?> dynamic2 = fc.findClass(classByte2, "dynamic.Solution");
    	
    	Object obj =  dynamic.newInstance();
    	Object obj2 =  dynamic2.newInstance();
    	
        Method main = dynamic.getMethod("main", String[].class);
        
        String[] params = null;
        ret = (String) main.invoke(obj, (Object) params);
              
       
        return ret;
    }
    
  
    public String compile(String clsName, String clsStr) {
       
    	// 클래스 이름과, 자바 파일 내용 포함.
        // 자바 파일 생성.
        File file = writeClass(clsName, clsStr);
        //자바 파일 컴파일 명령어 
        String command = "javac -encoding UTF-8 dynamic/" + clsName + ".java";
//        String command = "javac -encoding UTF-8 " + clsName + ".java";
        //실제 컴파일 수행메서드
        String result = execute(command);
        // 임시 생성된 자바 파일 삭제.
//        file.delete();
        return result;
    }

    // 클래스 이름과, 자바 파일 내용을 입력받아 자바 클래스 파일을 생성
    public File writeClass(String clsName, String stringClass) {
        String folder = System.getProperty("user.dir") + "\\dynamic";
        // 임의의 패키지명 부여
        return write(folder, clsName + ".java", "package dynamic; " + stringClass);
    }

    // 파일 작성 메서드
    private File write(String folderName, String fileName, String result) {
        File folder = new File(folderName);
        if (!folder.exists()) folder.mkdirs();
        FileWriter fw;
        try {
            File file = new File(folderName, fileName);
            fw = new FileWriter(file);
            BufferedWriter bw = new BufferedWriter(fw);
            bw.write(result);
            bw.close();
            //정상적으로 작성됐으면 file을 return
            return file;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public String execute(String command) {
        StringBuffer output = new StringBuffer();
        Process process = null;
        BufferedReader bufferReader = null;
        Runtime runtime = Runtime.getRuntime();
        String osName = System.getProperty("os.name");

        // 윈도우일 경우
        if (osName.indexOf("Windows") > -1) {
            command = "cmd /c " + command;
        }

        try {
            process = runtime.exec(command);
            Scanner s = new Scanner(process.getInputStream(), "euc-kr");
            while (s.hasNextLine() == true) {
                //표준출력으로 출력
                output.append(s.nextLine() + System.getProperty("line.separator"));
            }
            s = new Scanner(process.getErrorStream(), "euc-kr");
            while (s.hasNextLine() == true) {
                // 에러 출력
                output.append(s.nextLine() + System.getProperty("line.separator"));
            }
        } catch (IOException e) {
            output.append("IOException : " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                process.destroy();
                if (bufferReader != null) bufferReader.close();
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
        return output.toString();
    }

    
    public class FileClassLoader extends ClassLoader
    {
        public Class<?> findClass(byte[] classByte, String name) throws ClassNotFoundException
        {
            return defineClass(name, classByte, 0, classByte.length);
        }
    }
    
}

