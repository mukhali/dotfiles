import os
import re
 
#path为批量文件的文件夹的路径
# path = '/Users/mgwp/Downloads/065单田芳 少林将军许世友 全100回'
# path = '/Users/mgwp/Downloads/003单田芳 三侠五义 全180回'
# path = '/Users/mgwp/Downloads/133单田芳 栾蒲包和丰泽园 全200回'
path = '/Users/mgwp/Downloads//单田芳 隋唐演义高音质版 全216回'
 
#文件夹中所有文件的文件名
file_names = os.listdir(path)
 
#外循环遍历所有文件名，内循环遍历每个文件名的每个字符
for name in file_names:
    # re.sub("\D", "", name) 
    # print(re.findall('\d+', name)[0])
    print(name)
    newname = re.findall('\d+', name)[0] + '.mp3'
    print(newname)
    os.rename(os.path.join(path,name),os.path.join(path,newname))
    # print(name)
#  for s in name:
#   if s == ')':
#    index_num=name.index(s)  #index_num为要删除的位置索引
#    #采用字符串的切片方式删除编号
#    os.renames(os.path.join(path,name),os.path.join(path,name[index_num+1:])) 
#    break  #重命名成功，跳出内循环