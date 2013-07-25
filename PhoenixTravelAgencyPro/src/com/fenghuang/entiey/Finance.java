package com.fenghuang.entiey;

/***********************************************************************
 * Module:  Finance.java
 * Author:  Administrator
 * Purpose: Defines the Class Finance
 ***********************************************************************/

import java.util.*;

/** @pdOid 2f8b9f14-c2a8-4938-bb46-cc749c21a580 */
public class Finance {
   /** @pdOid f2f10ea0-ef31-4b40-9533-9b291c910dd3 */
   public long id;
   /** 审批状态
    * 
    * @pdOid dd5c4f8b-3208-4aa1-ab62-7512443a6ffa */
   public int status;
   /** 财务审核
    * 
    * @pdOid 83561815-3ba8-48a0-83af-8900b19c0cd0 */
   public int review;
   /** 财务确认
    * 
    * @pdOid 30da0686-d8ac-4184-a905-4d079f371a04 */
   public int confirmed;
   /** 出纳确认
    * 
    * @pdOid e331cd55-a371-4006-b621-fa3c00a65a80 */
   public int cashier;

}