import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import com.baizhi.PSVM;
import com.baizhi.dao.UserDao;
import com.baizhi.entity.Annotation;
import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Workbook;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.List;

@SpringBootTest(classes = PSVM.class)
    @RunWith(value = SpringRunner.class)
    public class test2 {
    @Autowired
    UserDao userDao;
    @Autowired
    UserService service;
    @Test
    public void testPoi() throws IOException {



       //创建excell表格
        HSSFWorkbook workbook = new HSSFWorkbook();
        //创建sheet
        File file = new File("E/workbook/");
        //判断该文件是不是存在，如果不存在则进行创建
        if(!file.exists()){
            file.mkdir();
        }
        HSSFSheet sheet = workbook.createSheet("sheep1.xls");
        //创建第行
        HSSFRow row = sheet.createRow(0);
        //创建第一个单元格
        HSSFCell cell = row.createCell(0);
        cell.setCellValue("编号");
        workbook.write(new FileOutputStream("E:/workbook/sheep1.xls"));
    }

    @Test
    public void testBetter(){
        //自定义注解,查询所有
        List<User> users = userDao.selectAll();
        //导入,创建excel文件
        HSSFWorkbook workbook = new HSSFWorkbook();
        //创建表格
        HSSFSheet sheet = workbook.createSheet("sheep3.xls");
        //创建行
        HSSFRow row = sheet.createRow(0);
        //获取文件的所有属性
        Class<User> userClass = User.class;
        Field[] fields = userClass.getDeclaredFields();
        //遍历属性将属性的注解获取到的值填入excel表中
        for (int i = 0; i < fields.length; i++) {
            Field field = fields[i];
            Annotation annotation = field.getAnnotation(Annotation.class);
            String name = annotation.name();
            Cell cell = row.createCell(i);
            cell.setCellValue(name);
        }
        //创建第二行
        for (int i = 0; i < users.size(); i++) {
            //获取list集合中元素
            User user = users.get(i);
            HSSFRow row1 = sheet.createRow(i + 1);
            Cell cell = row1.createCell(0);
            cell.setCellValue(user.getId());
            Cell cell1 = row1.createCell(1);
           // cell1.setCellValue();

        }
    }
    @Test
    public void test3() throws IOException {
        System.out.println("121212");
        List<User> users = service.queryAll();
        String realPath = "";
        for (User user : users) {
            String profile = user.getProfile();
            user.setProfile("D:\\������Ŀ\\WorkSpace\\cmfz_ww\\src\\main\\webapp\\userImg\\"+profile+"");
            System.out.println(user.getProfile());

        }

        Workbook workbook = ExcelExportUtil.exportExcel(new ExportParams("普通用户","用户表"),
                User .class, users);
        workbook.write(new FileOutputStream("E:/workbook/sheet4.xls"));
        workbook.close();
    }


}
