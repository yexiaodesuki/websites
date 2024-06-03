import sys
from PyQt5.QtWidgets import (
    QApplication, QWidget, QVBoxLayout, QLabel, QLineEdit, QPushButton, QStackedWidget, QMessageBox, QDialog, QInputDialog,QComboBox,QDateTimeEdit
)
import mysql.connector
import pymysql

# 创建数据库连接
def create_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="Cmy007110119",
        database="arknights"
    )

class MainWindow(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("罗德岛医院管理系统")
        
        self.stack = QStackedWidget(self)
        self.setLayout(QVBoxLayout())
        self.layout().addWidget(self.stack)
        
        self.login_page = LoginPage(self)
        self.patient_page = PatientPage(self)
        self.admin_page = AdminPage(self)
        
        self.stack.addWidget(self.login_page)
        self.stack.addWidget(self.patient_page)
        self.stack.addWidget(self.admin_page)
        self.show_login_page()
        self.current_user_id = None

    def show_login_page(self):
        self.stack.setCurrentWidget(self.login_page)
        
    def show_patient_page(self):
        self.stack.setCurrentWidget(self.patient_page)
    
    def show_admin_page(self):
        self.stack.setCurrentWidget(self.admin_page)

class LoginPage(QWidget):
    def __init__(self, main_window):
        super().__init__()
        self.main_window = main_window
        self.setWindowTitle("登录")
        
        self.layout = QVBoxLayout()
        self.setLayout(self.layout)
        
        self.role_label = QLabel("选择登录模式：")
        self.layout.addWidget(self.role_label)
        
        self.patient_button = QPushButton("患者登录")
        self.patient_button.clicked.connect(self.show_patient_login)
        self.layout.addWidget(self.patient_button)
        
        self.admin_button = QPushButton("管理员登录")
        self.admin_button.clicked.connect(self.show_admin_login)
        self.layout.addWidget(self.admin_button)
        
        self.register_button = QPushButton("注册新用户")
        self.register_button.clicked.connect(self.register_user)
        self.layout.addWidget(self.register_button)
        
        self.account_label = QLabel("账号:")
        self.layout.addWidget(self.account_label)
        
        self.account_input = QLineEdit()
        self.layout.addWidget(self.account_input)
        
        self.password_label = QLabel("密码:")
        self.layout.addWidget(self.password_label)
        
        self.password_input = QLineEdit()
        self.password_input.setEchoMode(QLineEdit.Password)
        self.layout.addWidget(self.password_input)
        
        self.login_button = QPushButton("登录")
        self.login_button.clicked.connect(self.login)
        self.layout.addWidget(self.login_button)
        
        self.current_role = None
    
    def register_user(self):
        dialog = QDialog()
        dialog.setWindowTitle("注册新用户")
        layout = QVBoxLayout(dialog)

        id_label = QLabel("身份证号:")
        layout.addWidget(id_label)

        id_input = QLineEdit()
        layout.addWidget(id_input)
        
        account_label = QLabel("账号:")
        layout.addWidget(account_label)

        account_input = QLineEdit()
        layout.addWidget(account_input)

        password_label = QLabel("密码:")
        layout.addWidget(password_label)

        password_input = QLineEdit()
        password_input.setEchoMode(QLineEdit.Password)
        layout.addWidget(password_input)

        name_label = QLabel("姓名:")
        layout.addWidget(name_label)

        name_input = QLineEdit()
        layout.addWidget(name_input)

        gender_label = QLabel("性别:")  
        layout.addWidget(gender_label)  
# 性别是一个下拉选择框  
        gender_choices = ['男', '女']  
        gender_input = QComboBox()  
        gender_input.addItems(gender_choices)  
        layout.addWidget(gender_input)

        age_label = QLabel("年龄:")
        layout.addWidget(age_label)

        age_input = QLineEdit()
        layout.addWidget(age_input)

        history_label = QLabel("病史:")
        layout.addWidget(history_label)

        history_input = QLineEdit()
        layout.addWidget(history_input)

        email_label = QLabel("邮箱:")
        layout.addWidget(email_label)

        email_input = QLineEdit()
        layout.addWidget(email_input)

        phone_label = QLabel("联系电话:")
        layout.addWidget(phone_label)

        phone_input = QLineEdit()
        layout.addWidget(phone_input)

        ok_button = QPushButton("确认")
        layout.addWidget(ok_button)

        def _handle_register_user():
            id = id_input.text()
            account = account_input.text()
            password = password_input.text()
            name = name_input.text()
            gender=gender_input.currentText()
            age = age_input.text()
            history = history_input.text()
            email = email_input.text()
            phone = phone_input.text()
            if not id or not account or not password or not name or not gender or not age or not phone:
                QMessageBox.warning(dialog, "警告", "请输入所有必要的信息")
                return
            try:
                illage = int(age)
                if len(id) != 5:
                    QMessageBox.warning(dialog, "警告", "身份证号必须是五位")
                    return
                if illage < 0 or illage > 130:
                    QMessageBox.warning(dialog, "警告", "年龄必须在0~130之间")
                    return
                conn = create_connection()
                cursor = conn.cursor()

                # 调用存储过程
                cursor.callproc('RegisterUser', (id, account, password, name, gender, age, history, email, phone))
                conn.commit()

                QMessageBox.information(dialog, "成功", "用户注册成功")
                cursor.close()
                conn.close()
                dialog.accept()
            except pymysql.Error as e:
                QMessageBox.critical(dialog, "错误", f"用户注册失败：{str(e)}")
        
        ok_button.clicked.connect(_handle_register_user)
        dialog.exec_()
    
    def login(self):
        account = self.account_input.text()
        password = self.password_input.text()

        if self.current_role == 'patient':
            patient_id = self.get_patient_id(account)
            if patient_id and self.patient_login(account, password):
                self.main_window.current_user_id = patient_id  # 保存当前用户的身份证号
                self.main_window.show_patient_page()
            else:
                QMessageBox.warning(self, "错误", "账号或密码错误！")
        elif self.current_role == 'admin':
            if self.admin_login(account, password):
                self.main_window.show_admin_page()
            else:
                QMessageBox.warning(self, "错误", "账号或密码错误！")
    
    def get_patient_id(self, account):
        conn = create_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT 身份证号 FROM 患者用户 WHERE 账号 = %s", (account,))
        result = cursor.fetchone()
        cursor.close()
        conn.close()
        return result[0] if result else None
    def patient_login(self, account, password):
        conn = create_connection()
        cursor = conn.cursor()
        cursor.callproc('PatientLogin', (account, password, None))
        result = cursor.fetchall()
        cursor.close()
        conn.close()
        return result is not None
    

    def admin_login(self, account, password):
        conn = create_connection()
        cursor = conn.cursor()
        cursor.callproc('AdminLogin', (account, password, None))
        result = cursor.fetchall()
        cursor.close()
        conn.close()
        return result is not None
        

    def show_patient_login(self):
        self.current_role = 'patient'
    
    def show_admin_login(self):
        self.current_role = 'admin'
    
    
    
class PatientPage(QWidget):
    def __init__(self, main_window):
        super().__init__()
        self.main_window = main_window
        self.setWindowTitle("患者页面")
        
        self.layout = QVBoxLayout()
        self.setLayout(self.layout)
        
        self.info_button = QPushButton("查询个人信息")
        self.layout.addWidget(self.info_button)
        self.info_button.clicked.connect(self.search_patient_info)
        

        self.update_info_button = QPushButton("更改个人信息")
        self.layout.addWidget(self.update_info_button)
        self.update_info_button.clicked.connect(self.update_info)
        
        self.appointment_button = QPushButton("预约挂号")
        self.layout.addWidget(self.appointment_button)
        self.appointment_button.clicked.connect(self.make_appointment)
        
        self.delete_appointment_button = QPushButton("删除当前挂号")
        self.layout.addWidget(self.delete_appointment_button)
        self.delete_appointment_button.clicked.connect(self.delete_appointment)
        
        self.visit_button = QPushButton("就诊")
        self.layout.addWidget(self.visit_button)
        self.visit_button.clicked.connect(self.visit)
        
        self.query_bill_button = QPushButton("查询或支付账单")
        self.layout.addWidget(self.query_bill_button)
        self.query_bill_button.clicked.connect(self.query_bill)
        
        self.delete_user_button = QPushButton("注销用户")
        self.layout.addWidget(self.delete_user_button)
        self.delete_user_button.clicked.connect(self.delete_user)
        
        self.back_button = QPushButton("返回")
        self.back_button.clicked.connect(self.main_window.show_login_page)
        self.layout.addWidget(self.back_button)
        
        self.exit_button = QPushButton("退出")
        self.exit_button.clicked.connect(sys.exit)
        self.layout.addWidget(self.exit_button)
    
    def visit(self):
        patient_id = self.main_window.current_user_id
        dialog = QDialog()
        dialog.setWindowTitle("就诊")
        layout = QVBoxLayout(dialog)
        ok_button = QPushButton("确认")
        layout.addWidget(ok_button)

        def handle_visit():
            try:
                conn = create_connection()
                cursor = conn.cursor()
                cursor.callproc('UpdateAppointmentStatus', (patient_id,))
                conn.commit()
                cursor.close()
                conn.close()
                QMessageBox.information(dialog, "成功", "成功就诊，已更新状态为'已就诊'")
                dialog.accept()
            except pymysql.Error as e:
                QMessageBox.critical(dialog, "错误", f"数据库错误：{str(e)}")

        ok_button.clicked.connect(handle_visit)
        dialog.exec_()
    def search_patient_info(self):
        patient_id = self.main_window.current_user_id

        try:
            conn = create_connection()
            cursor = conn.cursor()
            result = cursor.callproc('GetPatientInfo', (patient_id, ''))
            patient_info = result[-1]  
            cursor.close()
            conn.close()

            print(patient_info)  # 打印查询结果

            dialog = QDialog()
            dialog.setWindowTitle("查询个人信息")
            layout = QVBoxLayout(dialog)
            
            result_label = QLabel(patient_info)
            layout.addWidget(result_label)
            
            dialog.exec_()
        except pymysql.Error as e:
            QMessageBox.critical(self, "错误", f"查询患者信息失败：{str(e)}")


    
    def update_info(self):
        options = ["邮箱", "联系电话"]
        option, ok = QInputDialog.getItem(self, "选择更改项", "请选择要更改的信息:", options, 0, False)
        
        if ok and option:
            if option == "邮箱":
                self.update_email()
            elif option == "联系电话":
                self.update_phone()
    def update_phone(self):
        dialog = QDialog()
        dialog.setWindowTitle("更新联系电话")
        layout = QVBoxLayout(dialog)

        phone_label = QLabel("新联系电话:")
        layout.addWidget(phone_label)

        phone_input = QLineEdit()
        layout.addWidget(phone_input)

        ok_button = QPushButton("确认")
        layout.addWidget(ok_button)

        def _handle_update_phone():
            patient_id = self.main_window.current_user_id
            phone = phone_input.text()
            if not patient_id or not phone:
                QMessageBox.warning(dialog, "警告", "请输入所有必要的信息")
                return
            
            try:
                conn = create_connection()
                cursor = conn.cursor()
                cursor.callproc('UpdatePatientPhone', (patient_id, phone))
                conn.commit()
                QMessageBox.information(dialog, "成功", "联系电话更新成功")
                cursor.close()
                conn.close()
                dialog.accept()
            except pymysql.Error as e:
                QMessageBox.critical(dialog, "错误", f"更新联系电话失败：{str(e)}")

        ok_button.clicked.connect(_handle_update_phone)
        dialog.exec_()
    
    def update_email(self):
        dialog = QDialog()
        dialog.setWindowTitle("更新邮箱")
        layout = QVBoxLayout(dialog)

        email_label = QLabel("新邮箱:")
        layout.addWidget(email_label)

        email_input = QLineEdit()
        layout.addWidget(email_input)
        ok_button = QPushButton("确认")
        layout.addWidget(ok_button)

        def _handle_update_email():
            patient_id = self.main_window.current_user_id
            email = email_input.text()
            if not patient_id or not email:
                QMessageBox.warning(dialog, "警告", "请输入所有必要的信息")
                return
            
            try:
                conn = create_connection()
                cursor = conn.cursor()
                cursor.callproc('UpdatePatientEmail', (patient_id, email))
                conn.commit()
                QMessageBox.information(dialog, "成功", "邮箱更新成功")
                cursor.close()
                conn.close()
                dialog.accept()
            except pymysql.Error as e:
                QMessageBox.critical(dialog, "错误", f"更新联系电话失败：{str(e)}")
        
        ok_button.clicked.connect(_handle_update_email)
        dialog.exec_()
    def make_appointment(self):
        conn = create_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT 职工号, 科目 FROM 医生")
        doctors = cursor.fetchall()
        cursor.close()
        conn.close()

        dialog = QDialog()
        dialog.setWindowTitle("选择医生并预约挂号")
        layout = QVBoxLayout(dialog)

        doctor_label = QLabel("选择医生:")
        layout.addWidget(doctor_label)

        doctor_combo = QComboBox()
        for doctor in doctors:
            doctor_combo.addItem(f"{doctor[0]} - {doctor[1]}", doctor[0])
        layout.addWidget(doctor_combo)

        time_label = QLabel("预约时间:")
        layout.addWidget(time_label)

        time_input = QLineEdit()
        layout.addWidget(time_input)
        
        priority_label = QLabel("优先级:")
        layout.addWidget(priority_label)

        priority_input = QLineEdit()
        layout.addWidget(priority_input)


        ok_button = QPushButton("确定")
        layout.addWidget(ok_button)

        def _handle_make_appointment():
            doctor_id = doctor_combo.currentData()
            time = time_input.text()
            patient_id = self.main_window.current_user_id
            priority=priority_input.text()
            if not doctor_id or not time or not patient_id:
                QMessageBox.warning(dialog, "警告", "请输入所有必要的信息")
                return

            try:
                priority = int(priority)
                if priority < 1 or priority > 5:
                    QMessageBox.warning(dialog, "警告", "优先级必须在1到5之间")
                    return
                conn = create_connection()
                cursor = conn.cursor()
                cursor.callproc('InsertAppointment', (doctor_id, time, patient_id,priority))
                conn.commit()
                QMessageBox.information(dialog, "成功", "预约挂号成功")
                cursor.close()
                conn.close()
                dialog.accept()
            except pymysql.Error as e:
                QMessageBox.critical(dialog, "错误", f"预约挂号失败：{str(e)}")

        ok_button.clicked.connect(_handle_make_appointment)

        dialog.exec_()
    def delete_appointment(self):
        patient_id = self.main_window.current_user_id
        if not patient_id:
            QMessageBox.warning(self, "警告", "未找到当前用户信息")
            return

        conn = create_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT*from 预约 where 患者身份证号 = %s", (patient_id,))
        appointments= cursor.fetchall()
        cursor.close()
        conn.close()

        if not appointments:
            QMessageBox.information(self, "信息", "未找到预约信息")
            return

        dialog = QDialog()
        dialog.setWindowTitle("删除预约")
        layout = QVBoxLayout(dialog)

        appointment_label = QLabel("选择要删除的预约:")
        layout.addWidget(appointment_label)

        appointment_combo = QComboBox()
        for appointment in appointments:
            appointment_combo.addItem(f"{appointment[0]} - {appointment[2]} - {appointment[3]} - {appointment[4]}", appointment[0])
        layout.addWidget(appointment_combo)

        ok_button = QPushButton("确定")
        layout.addWidget(ok_button)

        def _handle_delete_appointment():
            appointment_id = appointment_combo.currentData()
            if not appointment_id:
                QMessageBox.warning(dialog, "警告", "请选择要删除的预约")
                return

            try:
                conn = create_connection()
                cursor = conn.cursor()
                cursor.callproc('CancelAppointment', (appointment_id,))
                conn.commit()
                QMessageBox.information(dialog, "成功", "预约删除成功")
                cursor.close()
                conn.close()
                dialog.accept()
            except pymysql.Error as e:
                QMessageBox.critical(dialog, "错误", f"删除预约失败：{str(e)}")

        ok_button.clicked.connect(_handle_delete_appointment)

        dialog.exec_()
    def delete_user(self):
        patient_id = self.main_window.current_user_id
        if not patient_id:
            QMessageBox.warning(self, "警告", "未找到当前用户信息")
            return

        reply = QMessageBox.question(self, "确认", "您确定要注销用户吗？这将删除您在系统中的所有信息。",
                                     QMessageBox.Yes | QMessageBox.No)
        if reply == QMessageBox.Yes:
            try:
                conn = create_connection()
                cursor = conn.cursor()
                cursor.callproc('DeletePatientUser', (patient_id,))
                conn.commit()
                QMessageBox.information(self, "成功", "用户注销成功")
                cursor.close()
                conn.close()
                # 注销成功后返回登录页面
                self.main_window.show_login_page()
            except pymysql.Error as e:
                QMessageBox.critical(self, "错误", f"用户注销失败：{str(e)}")
    
    def query_bill(self):
        bill_id = self.main_window.current_user_id
        dialog = QDialog()
        dialog.setWindowTitle("查看账单")
        layout = QVBoxLayout(dialog)

        payment_time_label = QLabel("支付时间:")
        layout.addWidget(payment_time_label)

        self.payment_time_input = QDateTimeEdit()
        self.payment_time_input.setDisplayFormat("yyyy-MM-dd HH:mm:ss")
        layout.addWidget(self.payment_time_input)
 
        ok_button = QPushButton("确认")
        layout.addWidget(ok_button)

        def _handle_query_bill_info():
            payment_time = self.payment_time_input.dateTime().toString("yyyy-MM-dd HH:mm:ss")
            try:
                conn = create_connection()
                cursor = conn.cursor()
                cursor.execute("SELECT * FROM 账单 WHERE 患者身份证号 = %s AND 状态 = '未支付'", (bill_id,))
                result = cursor.fetchone()
                if result:
                    cursor.callproc('UpdateBillStatus', (bill_id, payment_time))
                    conn.commit()
                    QMessageBox.information(dialog, "成功", "更新账单状态成功")
                else:
                    QMessageBox.information(dialog, "信息", "未找到该患者的未支付账单")
                cursor.close()
                conn.close()
                dialog.accept()
            except pymysql.Error as e:
                QMessageBox.critical(dialog, "错误", f"更新账单状态失败：{str(e)}")

        ok_button.clicked.connect(_handle_query_bill_info)
        dialog.exec_()

class AdminPage(QWidget):
    def __init__(self, main_window):
        super().__init__()
        self.main_window = main_window
        self.setWindowTitle("管理员页面")
        
        self.layout = QVBoxLayout()
        self.setLayout(self.layout)
        
        self.delete_patientuser_button = QPushButton("删除患者")
        self.layout.addWidget(self.delete_patientuser_button)
        self.delete_patientuser_button.clicked.connect(self.delete_patientuser)

        self.check_patientuser_info_button = QPushButton("查看患者信息")
        self.layout.addWidget(self.check_patientuser_info_button)
        self.check_patientuser_info_button.clicked.connect(self.search_patientuser_info)
        
        self.create_user_button = QPushButton("创建新的内部用户")
        self.layout.addWidget(self.create_user_button)
        self.create_user_button.clicked.connect(self.create_user)
        
        self.delete_user_button = QPushButton("删除内部用户")
        self.layout.addWidget(self.delete_user_button)
        self.delete_user_button.clicked.connect(self.delete_user)
        
        self.check_user_info_button = QPushButton("查看内部用户信息")
        self.layout.addWidget(self.check_user_info_button)
        self.check_user_info_button.clicked.connect(self.check_user_info)
        
        self.create_doctor_button = QPushButton("添加新的医生")
        self.layout.addWidget(self.create_doctor_button)
        self.create_doctor_button.clicked.connect(self.create_doctor)
        
        self.update_doctor_info_button = QPushButton("修改医生信息")
        self.layout.addWidget(self.update_doctor_info_button)
        self.update_doctor_info_button.clicked.connect(self.update_doctor_info)
        
        self.check_doctor_info_button = QPushButton("查看医生信息")
        self.layout.addWidget(self.check_doctor_info_button)
        self.check_doctor_info_button.clicked.connect(self.check_doctor_info)
        
        self.delete_doctor_button = QPushButton("删除医生")
        self.layout.addWidget(self.delete_doctor_button)
        self.delete_doctor_button.clicked.connect(self.delete_doctor)
        
        self.check_appointment_info_button = QPushButton("查看预约")
        self.layout.addWidget(self.check_appointment_info_button)
        self.check_appointment_info_button.clicked.connect(self.check_appointment_info)
        
        self.add_bill_info_button = QPushButton("生成账单")
        self.layout.addWidget(self.add_bill_info_button)
        self.add_bill_info_button.clicked.connect(self.add_bill_info)
        
        self.check_bill_info_button = QPushButton("查看账单")
        self.layout.addWidget(self.check_bill_info_button)
        self.check_bill_info_button.clicked.connect(self.check_bill_info)
        
        self.back_button = QPushButton("返回")
        self.back_button.clicked.connect(self.main_window.show_login_page)
        self.layout.addWidget(self.back_button)
        
        self.exit_button = QPushButton("退出")
        self.exit_button.clicked.connect(sys.exit)
        self.layout.addWidget(self.exit_button)
    
    def add_bill_info(self):
        dialog = QDialog()
        dialog.setWindowTitle("生成账单")
        layout = QVBoxLayout(dialog)

        id_label = QLabel("患者身份证号:")
        layout.addWidget(id_label)

        id_input = QLineEdit()
        layout.addWidget(id_input)

        amount_label = QLabel("支付金额:")
        layout.addWidget(amount_label)

        amount_input = QLineEdit()
        layout.addWidget(amount_input)

        ok_button = QPushButton("确认")
        layout.addWidget(ok_button)

        def _handle_add_bill_info():
            patient_id = id_input.text()
            amount = amount_input.text()
            if not patient_id or not amount:
                QMessageBox.warning(dialog, "警告", "请输入患者身份证号和支付金额")
                return
            try:
                conn = create_connection()
                cursor = conn.cursor()
                cursor.execute("SELECT * FROM 预约 WHERE 患者身份证号 = %s AND 状态 = '已就诊'", (patient_id,))
                result = cursor.fetchone()
                if result:
                    cursor.execute("SELECT MAX(账单号) FROM 账单")
                    last_bill_id = cursor.fetchone()[0]
                    new_bill_id = 1 if last_bill_id is None else last_bill_id + 1
                    cursor.callproc('InsertBill', (new_bill_id, patient_id, amount))
                    conn.commit()
                    QMessageBox.information(dialog, "成功", "生成账单成功")
                else:
                    QMessageBox.information(dialog, "信息", "未找到该患者的已就诊预约")
                cursor.close()
                conn.close()
                dialog.accept()
            except pymysql.Error as e:
                QMessageBox.critical(dialog, "错误", f"生成账单失败：{str(e)}")

        ok_button.clicked.connect(_handle_add_bill_info)
        dialog.exec_()

    
    def check_appointment_info(self):
        conn = create_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM 预约")
        results = cursor.fetchall()
        if results:
            info_text = ""
            for result in results:
                info_text += f"预约编号：{result[0]}\n患者身份证号：{result[1]}\n医生职工号：{result[2]}\n预约时间 ：{result[3]}\n状态：{result[4]}\npriority：{result[5]}\n"
            QMessageBox.information(self, "内部用户信息", info_text)
        else:
            QMessageBox.information(self, "信息", "未找到内部用户信息")
        cursor.close()
        conn.close()
        dialog = QDialog()
        dialog.setWindowTitle("查看预约")
        layout = QVBoxLayout(dialog)

        id_label = QLabel("患者身份证号:")
        layout.addWidget(id_label)

        id_input = QLineEdit()
        layout.addWidget(id_input)

        ok_button = QPushButton("确认")
        layout.addWidget(ok_button)
        def _handle_check_appointment_info():
            appointment_id = id_input.text()
            if not appointment_id:
                QMessageBox.warning(dialog, "警告", "请输入患者身份证号")
                return
            try:
                conn = create_connection()
                cursor = conn.cursor()
                cursor.execute("SELECT * FROM 预约 WHERE 患者身份证号 = %s", (appointment_id,))
                result = cursor.fetchone()
                if result:
                    info_text = f"预约编号：{result[0]}\n患者身份证号：{result[1]}\n医生职工号：{result[2]}\n预约时间：{result[3]}\n状态：{result[4]}\npriority：{result[5]}\n"
                    QMessageBox.information(dialog, "预约信息", info_text)
                else:
                    QMessageBox.information(dialog, "信息", "未找到该患者的预约")
                cursor.close()
                conn.close()
                dialog.accept()
            except pymysql.Error as e:
                QMessageBox.critical(dialog, "错误", f"查询预约信息失败：{str(e)}")
        
        ok_button.clicked.connect(_handle_check_appointment_info)
        dialog.exec_()
    def check_bill_info(self):
        dialog = QDialog()
        dialog.setWindowTitle("查看账单")
        layout = QVBoxLayout(dialog)

        id_label = QLabel("患者身份证号:")
        layout.addWidget(id_label)

        id_input = QLineEdit()
        layout.addWidget(id_input)

        ok_button = QPushButton("确认")
        layout.addWidget(ok_button)
        def _handle_check_bill_info():
            bill_id = id_input.text()
            if not bill_id:
                QMessageBox.warning(dialog, "警告", "请输入患者身份证号")
                return
            try:
                conn = create_connection()
                cursor = conn.cursor()
                result = cursor.callproc('GetBillInfo', (bill_id,''))
                if result:
                    for bill_info in result:  
                        dialog = QDialog()
                        dialog.setWindowTitle("查询账单信息")
                        layout = QVBoxLayout(dialog)
                        result_label = QLabel(bill_info)
                        layout.addWidget(result_label)
                        dialog.exec_()
                else:
                    QMessageBox.information(dialog, "信息", "未找到该患者的账单")
                cursor.close()
                conn.close()
                dialog.accept()
            except pymysql.Error as e:
                QMessageBox.critical(dialog, "错误", f"查询账单信息失败：{str(e)}")
        
        ok_button.clicked.connect(_handle_check_bill_info)
        dialog.exec_()
    def create_doctor(self):
        dialog = QDialog()
        dialog.setWindowTitle("添加新医生")
        layout = QVBoxLayout(dialog)

        doctor_id_label = QLabel("职工号:")
        layout.addWidget(doctor_id_label)

        doctor_id_input = QLineEdit()
        layout.addWidget(doctor_id_input)

        room_no_label = QLabel("房间号:")  
        layout.addWidget(room_no_label)  
        room_no_input = QLineEdit()  
        layout.addWidget(room_no_input)  
  
# 学历  
        education_label = QLabel("学历:")  
        layout.addWidget(education_label)  
# 假设学历是一个下拉选择框  
        education_choices = ['初中', '高中', '本科', '硕士', '博士', '博士后']  
        education_input = QComboBox()  
        education_input.addItems(education_choices)  
        layout.addWidget(education_input)  
  
# 职称  
        title_label = QLabel("职称:")  
        layout.addWidget(title_label)  
        title_input = QLineEdit()  
        layout.addWidget(title_input)  
  
# 科目  
        subject_label = QLabel("科目:")  
        layout.addWidget(subject_label)  
        subject_input = QLineEdit()  
        layout.addWidget(subject_input)  
  
# 排班信息  
        schedule_label = QLabel("排班信息:")  
        layout.addWidget(schedule_label)  
  
        schedule_input = QLineEdit()   
        layout.addWidget(schedule_input)  
  
# 姓名  
        name_label = QLabel("姓名:")  
        layout.addWidget(name_label)  
        name_input = QLineEdit()  
        layout.addWidget(name_input)  
  
# 性别  
        gender_label = QLabel("性别:")  
        layout.addWidget(gender_label)  
# 性别是一个下拉选择框  
        gender_choices = ['男', '女']  
        gender_input = QComboBox()  
        gender_input.addItems(gender_choices)  
        layout.addWidget(gender_input)  
  
# 年龄  
        age_label = QLabel("年龄:")  
        layout.addWidget(age_label)  
        age_input = QLineEdit()  # 年龄也可以是QSpinBox来限制输入范围  
        layout.addWidget(age_input)  
  
# 工资  
        salary_label = QLabel("工资:")  
        layout.addWidget(salary_label)  
        salary_input = QLineEdit()    
        layout.addWidget(salary_input)

        ok_button = QPushButton("确认")
        layout.addWidget(ok_button)

        def _handle_create_doctor():
            doctor_id = doctor_id_input.text()
            room_no=room_no_input.text()
            education=education_input.currentText()
            title=title_input.text()
            subject=subject_input.text()
            schedule=schedule_input.text()
            name=name_input.text()
            gender=gender_input.currentText()
            age=age_input.text()
            salary=salary_input.text()
            if not doctor_id_input or not name_input :
                QMessageBox.warning(dialog, "警告", "请输入必要的信息")
                return
            try:
                if len(doctor_id) != 5:
                    QMessageBox.warning(dialog, "警告", "职工号必须是五位")
                    return
                conn = create_connection()
                cursor = conn.cursor()
                cursor.execute("SELECT * FROM 医生 WHERE 职工号 = %s", (doctor_id,))
                if cursor.fetchone():
                    QMessageBox.warning(dialog, "警告", "该用户已存在")
                    return
                cursor.callproc('InsertDoctor', (doctor_id, room_no, education, title, subject, schedule, name, gender, age, salary))
                conn.commit()
                QMessageBox.information(dialog, "成功", "添加新医生成功")
                cursor.close()
                conn.close()
                dialog.accept()
            except pymysql.Error as e:
                QMessageBox.critical(dialog, "错误", f"添加新医生失败：{str(e)}")
        
        ok_button.clicked.connect(_handle_create_doctor)
        dialog.exec_()
    
    def check_doctor_info(self):
        dialog = QDialog()
        dialog.setWindowTitle("查看医生信息")
        layout = QVBoxLayout(dialog)
        id_label = QLabel("职工号:")
        layout.addWidget(id_label)

        id_input = QLineEdit()
        layout.addWidget(id_input)

        ok_button = QPushButton("确认")
        layout.addWidget(ok_button)
        def _handle_check_doctor_info():
            doctor_id = id_input.text()
            if not doctor_id:
                QMessageBox.warning(dialog, "警告", "请输入职工号")
                return
            try:
                conn = create_connection()
                cursor = conn.cursor()
                doctor_info = ""
                result=cursor.callproc('GetDoctorInfo', (doctor_id, doctor_info))
                doctor_info = result[-1]
                dialog = QDialog()
                dialog.setWindowTitle("查询医生信息")
                layout = QVBoxLayout(dialog)
                
                result_label = QLabel(doctor_info)
                layout.addWidget(result_label)
            
                dialog.exec_()
            except pymysql.Error as e:
                print(f"查询医生信息失败：{str(e)}")
            finally:
                cursor.close()
                conn.close()
        
        ok_button.clicked.connect(_handle_check_doctor_info)
        dialog.exec_()
    
    def update_doctor_info(self):
        dialog = QDialog()
        dialog.setWindowTitle("更新医生信息")
        layout = QVBoxLayout(dialog)

        doctor_id_label = QLabel("职工号:")
        layout.addWidget(doctor_id_label)

        doctor_id_input = QLineEdit()
        layout.addWidget(doctor_id_input)

        ok_button = QPushButton("确认")
        layout.addWidget(ok_button)

        def update_title(dialog, doctor_id):
            title_label = QLabel("新职称:")
            dialog.layout().addWidget(title_label)
            title_input = QLineEdit()
            dialog.layout().addWidget(title_input)
            ok_button = QPushButton("确认")
            dialog.layout().addWidget(ok_button)

            def _handle_update_title():
                title = title_input.text()
                if not title:
                    QMessageBox.warning(dialog, "警告", "请输入新职称")
                    return
                try:
                    conn = create_connection()
                    cursor = conn.cursor()
                    cursor.callproc('UpdateDoctorTitle', (doctor_id, title))
                    conn.commit()
                    QMessageBox.information(dialog, "成功", "职称更新成功")
                    cursor.close()
                    conn.close()
                    dialog.accept()
                except pymysql.Error as e:
                    QMessageBox.critical(dialog, "错误", f"更新职称失败：{str(e)}")

            ok_button.clicked.connect(_handle_update_title)

        def update_salary(dialog, doctor_id):
            salary_label = QLabel("新工资:")
            dialog.layout().addWidget(salary_label)
            salary_input = QLineEdit()
            dialog.layout().addWidget(salary_input)
            ok_button = QPushButton("确认")
            dialog.layout().addWidget(ok_button)

            def _handle_update_salary():
                salary = salary_input.text()
                if not salary:
                    QMessageBox.warning(dialog, "警告", "请输入新工资")
                    return
                try:
                    conn = create_connection()
                    cursor = conn.cursor()
                    cursor.callproc('UpdateDoctorSalary', (doctor_id, salary))
                    conn.commit()
                    QMessageBox.information(dialog, "成功", "工资更新成功")
                    cursor.close()
                    conn.close()
                    dialog.accept()
                except pymysql.Error as e:
                    QMessageBox.critical(dialog, "错误", f"更新工资失败：{str(e)}")

            ok_button.clicked.connect(_handle_update_salary)

        def handle_update():
            doctor_id = doctor_id_input.text()
            if not doctor_id:
                QMessageBox.warning(dialog, "警告", "请输入职工号")
                return
            options = ["职称", "工资"]
            option, ok = QInputDialog.getItem(dialog, "选择更改项", "请选择要更改的信息:", options, 0, False)
            if ok and option:
                if option == "职称":
                    update_title(dialog, doctor_id)
                elif option == "工资":
                    update_salary(dialog, doctor_id)

        ok_button.clicked.connect(handle_update)
        dialog.exec_()
    def delete_doctor(self):
        dialog = QDialog()
        dialog.setWindowTitle("删除医生")
        layout = QVBoxLayout(dialog)

        id_label = QLabel("职工号:")
        layout.addWidget(id_label)

        id_input = QLineEdit()
        layout.addWidget(id_input)

        ok_button = QPushButton("确认")
        layout.addWidget(ok_button)

        def _handle_delete_doctor():
            doctor_id = id_input.text()
            if not doctor_id:
                QMessageBox.warning(dialog, "警告", "请输入职工号")
                return
            try:
                conn = create_connection()
                cursor = conn.cursor()
                cursor.callproc('DeleteDoctor', (doctor_id,))
                conn.commit()
                QMessageBox.information(dialog, "成功", "医生删除成功")
                cursor.close()
                conn.close()
                dialog.accept()
            except pymysql.Error as e:
                QMessageBox.critical(dialog, "错误", f"删除医生失败：{str(e)}")
        ok_button.clicked.connect(_handle_delete_doctor)
        dialog.exec_()
    def delete_patientuser(self):
        dialog = QDialog()
        dialog.setWindowTitle("删除患者用户")
        layout = QVBoxLayout(dialog)

        id_label = QLabel("身份证号:")
        layout.addWidget(id_label)

        id_input = QLineEdit()
        layout.addWidget(id_input)

        ok_button = QPushButton("确认")
        layout.addWidget(ok_button)

        def _handle_delete_patientuser():
            patient_id = id_input.text()
            if not patient_id:
                QMessageBox.warning(dialog, "警告", "请输入身份证号")
                return
            try:
                conn = create_connection()
                cursor = conn.cursor()
                cursor.callproc('DeletePatientData', (patient_id,))
                conn.commit()
                QMessageBox.information(dialog, "成功", "患者用户删除成功")
                cursor.close()
                conn.close()
                dialog.accept()
            except pymysql.Error as e:
                QMessageBox.critical(dialog, "错误", f"删除患者用户失败：{str(e)}")
        
        ok_button.clicked.connect(_handle_delete_patientuser)
        dialog.exec_()
        
    def search_patientuser_info(self):
        dialog = QDialog()
        dialog.setWindowTitle("查询患者信息")
        layout = QVBoxLayout(dialog)

        id_label = QLabel("身份证号:")
        layout.addWidget(id_label)

        id_input = QLineEdit()
        layout.addWidget(id_input)

        ok_button = QPushButton("确认")
        layout.addWidget(ok_button)

        def _handle_search_patientuser_info():
            patient_id = id_input.text()
            if not patient_id:
                QMessageBox.warning(dialog, "警告", "请输入身份证号")
                return
            try:
                conn = create_connection()
                cursor = conn.cursor()
                result = cursor.callproc('GetPatientInfo', (patient_id, ''))
                patient_info = result[-1]  
                cursor.close()
                conn.close()

                print(patient_info)  # 打印查询结果

                dialog = QDialog()
                dialog.setWindowTitle("查询患者信息")
                layout = QVBoxLayout(dialog)
                
                result_label = QLabel(patient_info)
                layout.addWidget(result_label)
                
                dialog.exec_()
            except pymysql.Error as e:
                QMessageBox.critical(dialog, "错误", f"查询患者信息失败：{str(e)}")
        
        ok_button.clicked.connect(_handle_search_patientuser_info)
        dialog.exec_()
    
    def create_user(self):
        dialog = QDialog()
        dialog.setWindowTitle("创建新用户")
        layout = QVBoxLayout(dialog)

        account_label = QLabel("账号:")
        layout.addWidget(account_label)

        account_input = QLineEdit()
        layout.addWidget(account_input)

        password_label = QLabel("密码:")
        layout.addWidget(password_label)

        password_input = QLineEdit()
        password_input.setEchoMode(QLineEdit.Password)
        layout.addWidget(password_input)

        name_label = QLabel("姓名:")
        layout.addWidget(name_label)

        name_input = QLineEdit()
        layout.addWidget(name_input)

        ok_button = QPushButton("确认")
        layout.addWidget(ok_button)

        def _handle_create_user():
            account = account_input.text()
            password = password_input.text()
            name = name_input.text()
            if not account or not password or not name :
                QMessageBox.warning(dialog, "警告", "请输入所有必要的信息")
                return
            try:
                conn = create_connection()
                cursor = conn.cursor()
                cursor.execute("SELECT * FROM 用户 WHERE 账号 = %s", (account,))
                if cursor.fetchone():
                    QMessageBox.warning(dialog, "警告", "该用户已存在")
                    return
                cursor.callproc('InsertUser', (account, password))
                conn.commit()
                QMessageBox.information(dialog, "成功", "用户创建成功")
                cursor.close()
                conn.close()
                dialog.accept()
            except pymysql.Error as e:
                QMessageBox.critical(dialog, "错误", f"创建用户失败：{str(e)}")
        
        ok_button.clicked.connect(_handle_create_user)
        dialog.exec_()
    
    def delete_user(self):
        dialog = QDialog()
        dialog.setWindowTitle("删除内部用户")
        layout = QVBoxLayout(dialog)

        account_label = QLabel("账号:")
        layout.addWidget(account_label)

        account_input = QLineEdit()
        layout.addWidget(account_input)

        ok_button = QPushButton("确认")
        layout.addWidget(ok_button)

        def _handle_delete_user():
            account = account_input.text()
            if not account:
                QMessageBox.warning(dialog, "警告", "请输入账号")
                return
            try:
                conn = create_connection()
                cursor = conn.cursor()
                cursor.callproc('DeleteUser', (account,))
                QMessageBox.information(dialog, "成功", "内部用户删除成功")
                cursor.close()
                conn.close()
                dialog.accept()
            except pymysql.Error as e:
                QMessageBox.critical(dialog, "错误", f"删除内部用户失败：{str(e)}")
        
        ok_button.clicked.connect(_handle_delete_user)
        dialog.exec_()
    
    def check_user_info(self):
        try:
            conn = create_connection()
            cursor = conn.cursor()
            cursor.execute("SELECT * FROM 用户")
            results = cursor.fetchall()
            if results:
               info_text = ""
               for result in results:
                   info_text += f"账号：{result[0]}\n"
               QMessageBox.information(self, "内部用户信息", info_text)
            else:
               QMessageBox.information(self, "信息", "未找到内部用户信息")
            cursor.close()
            conn.close()
        except pymysql.Error as e:
            QMessageBox.critical(self, "错误", f"查询内部用户信息失败：{str(e)}")

if __name__ == "__main__":
    app = QApplication(sys.argv)
    main_window = MainWindow()
    main_window.show()
    sys.exit(app.exec_())