/***********************************************************************
 * Module:  Canyin.java
 * Author:  Administrator
 * Purpose: Defines the Class Canyin
 ***********************************************************************/
package com.fenghuang.entiey;
import java.util.*;

/** 餐饮供应商
 * 
 * @pdOid 3179af3f-64b0-4036-8de6-34af0857c568 */
public class Canyin {
   /** 编号
    * 
    * @pdOid 4a5ae55b-f5fb-49d1-a2d0-5a3bbb41d084 */
   public long id;
   /** 城市
    * 
    * @pdOid 57cf4d4e-0b5e-470d-ad38-9bab4ba38c10 */
   public int chengshiId;
   /** 名称
    * 
    * @pdOid 7615b361-6e54-49e1-90e4-2cd716d5d461 */
   public java.lang.String name;
   /** 地址
    * 
    * @pdOid 7ff0fb81-6796-4310-962c-100dd836ae97 */
   public java.lang.String dizhi;
   /** 联系人
    * 
    * @pdOid 92b978f2-e03a-4668-8701-935de6dc6f36 */
   public java.lang.String lianxiren;
   /** 电话
    * 
    * @pdOid 00a20ef5-8bef-4ffb-9954-cfe12eb6f809 */
   public java.lang.String dianhua;
   /** 手机
    * 
    * @pdOid 2c6967cb-8a78-48a4-af4b-c94eef9c4674 */
   public java.lang.String shouji;
   /** 传真
    * 
    * @pdOid 562a80cb-3504-4826-b09a-a2b2b191ebee */
   public java.lang.String chuanzhen;
   /** 邮箱
    * 
    * @pdOid 75f7b976-b7aa-4222-a76a-d05777e283ad */
   public java.lang.String email;
   /** 付款方式
    * 
    * @pdOid 3b52f21b-bf31-4d90-acf1-a56d66405d0d */
   public int fkfsId;
   /** 合作级别
    * 
    * @pdOid d98b3689-9279-4254-b8c7-18425f960b8e */
   public int hzjbId;
   /** 餐标五菜一汤
    * 
    * @pdOid eff785cf-11b8-4cf1-bdd2-47f9284bc5ee */
   public int cbwu;
   /** 餐标六菜一汤
    * 
    * @pdOid 456b730e-5f34-4af6-b580-e5c776212904 */
   public int cbliu;
   /** 餐标七菜一汤
    * 
    * @pdOid b9bbd8b1-d33b-43ae-9394-4929453a1b94 */
   public int cbqi;
   /** 餐标八菜一汤
    * 
    * @pdOid f7045948-665c-42c6-930f-f215f5b6bf63 */
   public int cbba;
   /** 幼儿餐费
    * 
    * @pdOid 4d09a01c-33d4-4c12-a07d-8d0a171c817b */
   public int yecf;
   /** 幼儿年龄说明
    * 
    * @pdOid d560209b-4b95-4457-9702-6a9bc14b9631 */
   public java.lang.String yenlsm;
   /** 儿童餐费
    * 
    * @pdOid d8ea3065-e78f-4176-91bf-9444064cdd53 */
   public int etcf;
   /** 儿童餐费说明
    * 
    * @pdOid a47b9c3d-996d-4943-b02c-2bc903aa9eec */
   public java.lang.String etcfsm;
   /** 餐馆餐桌数
    * 
    * @pdOid a88d744a-040a-4507-8c47-6407906a3d5d */
   public int cgczs;
   /** 容纳人数
    * 
    * @pdOid 16421636-cca8-436a-8478-75302ef0d0eb */
   public int rnrs;
   /** 免费制度说明
    * 
    * @pdOid 195b05f1-6b77-4cbb-8378-90ff429f50bd */
   public java.lang.String mfzdsm;
   /** 是否协议单位
    * 
    * @pdOid d571b42a-984c-40e2-8df8-5270fe96421d */
   public int sfxydw;
   /** 是否付现单位
    * 
    * @pdOid 52605208-43c5-4f52-9191-9818960da77a */
   public int sffxdw;
   /** 备注
    * 
    * @pdOid 8ced5e9a-c723-4413-9b0d-c10fe62e2f99 */
   public java.lang.String beizhu;

}