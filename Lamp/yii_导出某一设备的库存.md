库存设备导出详情
1. getdata?type=GOOD&sku=CA01BC06FA01FC03 /vhost/fixadmin/stockController
2. WraeHouseInterface(), showList, array($type,$sku,'PUSH','','',$page)
3. /home/fjy/zealer.mall/vhost/fix/models/Warehouse.php showList方法




1. export/export-order-info?type=GOODS&SKU=

http://fix.inner.zealer.com:1452/test/run?c=Warehouse&a=getGoodsList&type=GOOD&sku=CA01BC06FA01FC03&status=&goodsIDs=1624,1625

http://fix.admin.inner.zealer.com:1452/export/export-stocke-goods-info?type=GOODS&sku=CA01BC06FA01FC03&status=&goodsIDs=

select * from zfix_warehouse where type="GOOD" and sku="CA01BC06FA01FC03" and id in (1624,1625);


kupTranslate = 'UPDATE zfix_warehouse SET '.$field.' = '.$stockTranslate['list'][$field] - 1.' WHERE id = '.$id;



Array
(
    [code] => 200
    [list] => Array
        (
            [1624] => Array
                (
                    [id] => 1624
                    [sku] => CA01BC06FA01FC03
                    [newSku] => CA01BC06FA01FC99
                    [id_code] => 162
                    [cdkey] => CA01_BC06_162
                    [imei] => CA01_BC06_162
                )

            [1625] => Array
                (
                    [id] => 1625
                    [sku] => CA01BC06FA01FC03
                    [newSku] => CA01BC06FA01FC99
                    [id_code] => 163
                    [cdkey] => CA01_BC06_163
                    [imei] => CA01_BC06_163
                )

        )

)