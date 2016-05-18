### 数据库语句性能分析
    CDbConnection::getStats();

whereIn['wherein'] = "pid in ('". implode("','", $ids) ."')";

//@file zealer.mall/comman/components/rest/RESTful.php
/*
demo    调用例子：
 *          $list = RESTful::index('plusthread', $where, $field, ['user_id' => 1]);
 *          
 *          $list = RESTful::view('plusthread', $id);
 *          $list = RESTful::create('plusthread', ['title' => 'Tony测试1', 'content' => 'test1', 'user_id' => 1]);
 *          $list = RESTful::update('plusthread', $id, ['title' => 'Tony测试2', 'content' => 'test2']);
 *          $list = RESTful::delete('plusthread', $id);
 *
 * @return  ['code' => 200, 'message' => ''];
 *
 * @code    返回code值说明：
 *          200 ok  - 成功返回状态，对应，GET,PUT,PATCH,DELETE.
 *          201 created  - 成功创建。
 *          304 not modified   - HTTP缓存有效。
 *          400 bad request   - 请求格式错误。
 *          401 unauthorized   - 未授权。
 *          403 forbidden   - 鉴权成功，但是该用户没有权限。
 *          404 not found - 请求的资源不存在
 *          405 method not allowed - 该http方法不被允许。
 *          410 gone - 这个url对应的资源现在不可用。
 *          415 unsupported media type - 请求类型错误。
 *          422 unprocessable entity - 校验错误时用。
 *          429 too many request - 请求过多。

    * @Title    获取普通数据列表
    * @Params   $model      需要调用的model类
    * @Params   $where      条件字段 array(
                                        '字段'              =>'值',
                                        'wherein'           => 'in 语句',
                                        'between字段名称'   => array('初值','终值')
                                        'like'              => array('key','value')
                                        'special'           => '特殊语句如 id => 1类，无法识别，直接写sql就好'
                                    )
    * @Params   $fields     操作字段 array(
                                        'sort' => '字段', 'order' => 顺序',
                                        'page' => '当前页码', 'limit' => 显示数,   //默认值20
                                        'group'=> '分组字段'
                                    )
    * @Params   $return     其他条件字段array('sum' => 求和字段, 'count' => 统计数字段, 'return' => '返回字段')
    * @Params   $return     $extra  (为真即可)保留字段，暂时做开启数据库操作记录
    * @Author   quanjunw
    * @Date     2015-10-13 21:23:19
    */

* 如何对当前项目debug
    - debug 变量 LibBase::
    
    - 通过日志  LibBase::()
        /*
         @Title    记录log
         @Params   $data 需要记录的数据
         @Params   $type 要记录的类型
                       0  默认。根据在 php.ini 文件中的 error_log 配置，错误被发送到服务器日志系统或文件。
                       1  错误被发送到 destination 参数中的地址。只有该类型使用 headers 参数。
                       2  通过 PHP debugging 连接来发送错误。该选项只在 PHP 3 中可用。
                       3  错误发送到文件目标字符串。
                       4  自定义参数，可查看系统变量
         @Params   $path log存放的地址
         @Author   quanjunw
        */
        public static function log($data = '', $type = 3, $path = '')

