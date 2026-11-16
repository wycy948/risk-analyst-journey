# 获取键盘上输入的数据------>input（）
# name = input('请输入你的姓名：')
# age = input('请输入你的年龄：')
# print(f'你的名字是 {name}, 你的年龄是 {age}岁')

#案例 银行卡ATM取款

#银行卡总额
total = 10000

# 1.输入密码
password = input('请输入银行卡密码：')
print(f'密码输入正确，密码是{password}')

# 2.取款金额
num = input('请输入取款金额：')

# 3.计算余额------>num转换为int类型------>int()/float()/str()/bool()
print(f'您的余额是： {total - float(num)}')
