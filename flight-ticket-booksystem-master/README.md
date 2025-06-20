# airline-ticket-management-system
# 航班票务管理系统

## 一、开发环境
- 操作系统：Windows  
- 编程语言及版本：Python  
- Web框架：Django 3.2.13  
- 数据库：MySQL  
- 前端：HTML  

## 二、数据库初始化流程
mysql:
命令行启动mysql服务器，进入mysql环境：
net start mysql
## 三、测试数据导入方法
1. 运行flight.sql导入测试数据
2. 额外数据导入方式：
   - 管理员后台手动录入（默认初始账号：admin，密码：admin123）
   - 使用MySQL语句直接插入
注意：已有航班数据时间均为2025.6.20

## 四、项目运行步骤与使用方法
# 安装框架
pip install Django==3.2.13
# 数据库配置
1. 修改FlightTicket/settings.py中的"DATABASES"配置，需要填写数据库用户名和密码
# 数据库迁移
python manage.py makemigrations
python manage.py migrate
# 启动服务
python manage.py runserver 8000

## 五、小组成员分工说明
# 李哲伟：
  - 项目总体架构设计
  - 后端核心逻辑开发
  - 购退票和订单记录功能实现

# 任俊铭：
  - 航班查询与联程逻辑实现
  - 测试数据准备与导入
  - 部分后端接口开发

# 章一诺：
  - 数据库模型设计与实现
  - 前端页面设计与实现
  - 功能体验优化
