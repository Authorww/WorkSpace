import com.baizhi.PSVM;
import com.baizhi.entity.Annotation;
import com.baizhi.entity.Student;
import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.List;

@SpringBootTest(classes = PSVM.class)
@RunWith(value = SpringRunner.class)
public class Test3 {
    @Autowired
    UserService service;
    @Test
    public void test1() throws IOException {
        //导出首先自定义注解
        Student student = new Student();
        student.setId("110110");
        student.setName("刘德华");
        student.setPassword("123456");
        //创建excell
        HSSFWorkbook workbook = new HSSFWorkbook();
        //创建表
        HSSFSheet sheet = workbook.createSheet("sheetStu.xls");
        //创建行
        HSSFRow row = sheet.createRow(0);
        Cell cell = row.createCell(0);
        cell.setCellValue("编号");
        Cell cell1 = row.createCell(1);
        cell1.setCellValue("姓名");
        Cell cell2 = row.createCell(2);
        cell2.setCellValue("密码");
        workbook.write(new File("E:/workbook/sheetStu.xls"));

    }
    @Test
    public void test2(){
        //创建excle
        HSSFWorkbook workbook = new HSSFWorkbook();
        //创建单元表格
        HSSFSheet sheet = workbook.createSheet("user1.xls");
        HSSFRow row = sheet.createRow(0);
        //反射获取所有属性
        Class<User> userClass = User.class;
        Field[] declaredFields = userClass.getDeclaredFields();
        for (int i = 0; i < declaredFields.length; i++) {
            //获取每个属性的注解
            Field declaredField = declaredFields[i];
            Annotation annotation = declaredField.getAnnotation(Annotation.class);
            String name = annotation.name();
            Cell cell = row.createCell(i);
            cell.setCellValue(name);
        }
        List<User> users = service.queryAll();
        for (int i = 0; i < declaredFields.length; i++) {
            Field declaredField = declaredFields[i];
            
        }

    }
}
