package com.fenghuang.entiey;

/***********************************************************************
 * Module:  Receivables.java
 * Author:  Administrator
 * Purpose: Defines the Class Receivables
 ***********************************************************************/

import java.util.*;

/** @pdOid 31b19321-1216-4f22-8756-6bd657d44fe5 */
public class Receivables {
   /** @pdOid dbe0e0f4-0fb0-490c-9dc5-48bf4471ab0d */
   public long id;
   /** 单号
    * 
    * @pdOid 53142182-2969-4f44-9966-5183592f02c4 */
   public java.lang.String number;
   /** 款项说明
    * 
    * @pdOid 72a41d50-3b97-4139-80fa-d0067e692ef1 */
   public java.lang.String kuanxiang;
   /** 客户
    * 
    * @pdOid 35e9266c-2dcd-4eb1-b099-3f09ea4f7753 */
   public int kehu;
   /** 供应商
    * 
    * @pdOid 6190e2d0-6cbf-48dd-b6e4-8a46db40f765 */
   public int gongyingshang;
   /** 付款日期
    * 
    * @pdOid 811ffd12-651e-417b-926c-d62dc578ec82 */
   public java.util.Date fukuanriqi;
   /** 预收日期
    * 
    * @pdOid 7b475996-aca2-4458-aeec-07b9da2a35f1 */
   public java.util.Date yushouriqi;
   /** 汇率
    * 
    * @pdOid 9e5e3a09-0346-45d6-aec1-506ea256eaa9 */
   public int huilv;
   /** 币种
    * 
    * @pdOid f75043fe-866b-49fa-9fdf-38c540f27d23 */
   public int bizhong;
   /** 应收
    * 
    * 
    * @pdOid 07995829-a07e-451a-8875-990e51ec2cdb */
   public int yingshou;
   /** 已收
    * 
    * @pdOid d38126dc-981f-4e75-9bfb-9c6e77bcba6c */
   public int yishou;
   /** 未收
    * 
    * @pdOid b237caca-7224-4e39-880d-5680e1e1ef36 */
   public int weishou;
   /** 已开发票
    * 
    * @pdOid 15ee4c58-bd95-426e-9831-c032fbe27d57 */
   public int yikaifapiao;
   /** 发票许可
    * 
    * @pdOid bfae0da7-bdc7-4f60-8c9e-c3690b903bef */
   public java.lang.String fapiaoxuke;
   /** 财务
    * 
    * @pdOid bd361b11-11af-4e80-b537-d1ee7d25d123 */
   public int caiwuid;
   /** 状态
    * 
    * @pdOid 24fb7220-70ed-4573-b6d1-53717a8663c0 */
   public int zhuangtai;
   /** 责任人
    * 
    * @pdOid 3e0faedf-45fd-4e4b-92fc-091b09b7d09d */
   public java.lang.String zerenren;
   /** 应收款确认 应收款统计
    * 
    * @pdOid 1a8e9c5c-d44f-441b-8cfe-43a604a4da09 */
   public int yingshouyingfu;
   /** 销售人员
    * 
    * @pdOid b79349c2-60be-4de6-acba-ad4c490516fe */
   public int xiaoshouqueren;

}