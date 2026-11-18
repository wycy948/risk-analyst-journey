# 逻辑运算符 ---> and  or   not

# 案例1：键盘输入一个整数，判断是否在10-20之间，是：返回True，否：返回False
num = int(input('请输入一个整数：'))
# 两个意思是一样的，上面这个是简化版
print(f'{num}是否在10-20之间：', 10 <= num <= 20)
print(f'{num}是否在10-20之间：', num >= 10 and num <= 20)

# 案例2：键盘输入一个整数，判断是否不在10-20之间，是：返回True，否：返回False
num = int(input('请输入一个整数：'))
print(f'{num}是否不在10-20之间：', num < 10 or num > 20)
