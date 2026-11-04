# 常见数据类型------>用type()获取指定的字面量或变量的类型

print(type('hello')) # str
print(type(10)) # int
print(type(11.24)) #float
print(type(True)) # bool
print(type(False)) # bool
print(type(None)) # NoneType

num = 10
print(type(num)) # int

# 常见数据类型------> isinstance(数据,类型)--->bool值--->判定是否为指定的数据类型--->如果是，输出True;如果不是，输出False
num = 10
print(isinstance(num,int))# True
print(isinstance(num,float)) # False
print(isinstance(num,bool)) # False

#字符串
#定义字符串的三种方式
s1 = "hello" #双引号定义
s2 = 'hello' #单引号定义
s3 = """
    数据分析师
    风险控制岗
""" #三引号定义
print(s1)
print(s2)
print(s3)

#转义字符------> \' , \" , \n(换行) , \t(缩进)

#字符串拼接
print('hello' ' ,' 'python')

s1 = '数据分析'
s2 = '风险控制'
print('我要学'+s1+s2)

#案例
name = '小刘'
age = 22
profession = 'python'
hobby = '围棋'
print('大家好,我是'+ name +','+'今年'+str(age)+','+'学习的专业是'+profession+','+'兴趣爱好是'+hobby)

#字符串格式化---> 方式一：%s(占位符)
name = '小刘'
age = 22
profession = '通信工程'
hobby = '围棋'
print('大家好,我是%s,我今年%s岁,我的专业是%s,我的兴趣爱好是%s' %(name,age,profession,hobby))

#字符串格式化---> 方式二：f'...{变量名/表达式}...'---->企业推荐方式
name = '小刘'
age = 22
profession = '通信工程'
hobby = '围棋'
print(f'大家好,我是{name},我今年{age}岁,我的专业是{profession},我的兴趣爱好是{hobby}' )