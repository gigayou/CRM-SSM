# CRM-SSM

使用SSM+Maven做的一个客户管理系统demo

## 开发环境

IDEA 2018.3 / Bootstrap 3 / Spring 4.2.4.RELEASE / Mybatis 3.2.7 / Maven 3

## 搭建过程

1.前往 [https://maven.apache.org/](Maven官网) 下载maven 3 
2.打开IDEA，配置好已有的Maven 3(IDEA有集成的Maven，也可以使用)，导入pom文件(仓库用国内的 [http://maven.aliyun.com/nexus/content/groups/public/](阿里云镜像) ，下载速度会快许多)
3.新建数据库和表，并配置好与之对应的jdbc.properties内容；表中的数据可以通过python创建，详情可以看[]
4.添加一个本地的tomcat运行环境，完成之后点击运行即可
