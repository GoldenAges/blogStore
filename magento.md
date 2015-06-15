##Magento的学习笔记
通过需求或是 Tutorial 来一步步学习magento
###基于控制面板的操作
####添加一件商品并给其划分不同的种类
* 如何把一件商品显示到首页
    - [先按照这个步骤添加商品](https://www.siteground.com/tutorials/magento/magento_product.htm), **注意inventory里的quality，is stock一定要准确填写**
    - 再按照这个在Homepage页面添加这一段代码
    
         {{block type="catalog/product_list" category_id="category_id_to_show" column_count="number_of_columns" template="catalog/product/list.phtml"}}

    - [解释如下](http://stackoverflow.com/questions/3043030/how-to-show-products-at-magento-homepage)
* 如何根据商品的分类来显示
    - 先添加商品的分类，在catlogo下面有分类信息，
    - 然后的添加商品，在lauchpad是的catalog manage catories
    - 
    

*********
###自定义模块实现

###原理方面的东西
####路由规则
####配置文件
####模块之间的耦合
