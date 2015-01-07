options(stringsAsFactors = FALSE)#设置全局环境##########
#配出自己常用颜色#########################
#http://www.biostatistic.net/thread-5065-1-1.html颜色对照表
#rainbow(n, s = 1, v = 1, start = 0, end = max(1,n - 1)/n,gamma = 1, alpha = 1);
##heat.colors(n, alpha = 1);
###terrain.colors(n, alpha = 1);
####topo.colors(n, alpha = 1);
#####cm.colors(n, alpha = 1);
#常用包
library(ggplot2)
library(dplyr)
library(tidyr)
traindata <- read.csv('~/Documents//work//Ali//大作业-data/cs-training.csv',header = TRUE)####读取训练样本####
head(traindata)  ##看看数据#############################
str(traindata)###
summary(traindata)##查看下全局情况

######缺失值处理###################################################
##（1）识别缺失数据；
Ifna <- complete.cases(traindata)
table(Ifna)
##（2）检查导致数据缺失的原因；
  #1）表呈现
library(mice)
md.pattern(traindata)
  #2)图呈现
library(VIM)
aggr(traindata,prop=T,numbers=T,col=c('blue','grey'))###名字太长可能导致无法显示完全
  #3)相关性分析
  tempna <- abs(is.na(traindata))##
  cor(na.omit(traindata))


##（3）删除包含缺失值的实例或用合理的数值代替（插补）缺失值

