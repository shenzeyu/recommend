/*  1:   */ package com.usst.app.order.cashBasis.fee.model;
/*  4:   */ import java.util.Date;

import com.usst.code.bean.Base;
/*  5:   */ 
/*  6:   */ public class FeeItem
/*  7:   */   extends Base
/*  8:   */ {
/*  9:   */   private static final long serialVersionUID = 1L;
/* 10:   */   private String name;
/* 11:   */   private Double money;
/* 12:   */   private String orderId;
/* 13:   */   private String remark;
/* 14:   */   private Double amount;
/* 15:   */   private Double totlemoney;
/* 16:   */   private Date beginTime;
/* 17:   */   private Date endTime;
/* 18:   */   private String customerName;
/* 19:   */   
/* 20:   */   public String getName()
/* 21:   */   {
/* 22:26 */     return this.name;
/* 23:   */   }
/* 24:   */   
/* 25:   */   public void setName(String name)
/* 26:   */   {
/* 27:29 */     this.name = name;
/* 28:   */   }
/* 29:   */   
/* 30:   */   public Double getMoney()
/* 31:   */   {
/* 32:32 */     return this.money;
/* 33:   */   }
/* 34:   */   
/* 35:   */   public void setMoney(Double money)
/* 36:   */   {
/* 37:35 */     this.money = money;
/* 38:   */   }
/* 39:   */   
/* 40:   */   public String getOrderId()
/* 41:   */   {
/* 42:38 */     return this.orderId;
/* 43:   */   }
/* 44:   */   
/* 45:   */   public void setOrderId(String orderId)
/* 46:   */   {
/* 47:41 */     this.orderId = orderId;
/* 48:   */   }
/* 49:   */   
/* 50:   */   public String getRemark()
/* 51:   */   {
/* 52:45 */     return this.remark;
/* 53:   */   }
/* 54:   */   
/* 55:   */   public void setRemark(String remark)
/* 56:   */   {
/* 57:48 */     this.remark = remark;
/* 58:   */   }
/* 59:   */   
/* 60:   */   public Double getAmount()
/* 61:   */   {
/* 62:51 */     return this.amount;
/* 63:   */   }
/* 64:   */   
/* 65:   */   public void setAmount(Double amount)
/* 66:   */   {
/* 67:54 */     this.amount = amount;
/* 68:   */   }
/* 69:   */   
/* 70:   */   public Double getTotlemoney()
/* 71:   */   {
/* 72:57 */     return this.totlemoney;
/* 73:   */   }
/* 74:   */   
/* 75:   */   public void setTotlemoney(Double totlemoney)
/* 76:   */   {
/* 77:60 */     this.totlemoney = totlemoney;
/* 78:   */   }
/* 79:   */   
/* 80:   */   public Date getBeginTime()
/* 81:   */   {
/* 82:63 */     return this.beginTime;
/* 83:   */   }
/* 84:   */   
/* 85:   */   public void setBeginTime(Date beginTime)
/* 86:   */   {
/* 87:66 */     this.beginTime = beginTime;
/* 88:   */   }
/* 89:   */   
/* 90:   */   public Date getEndTime()
/* 91:   */   {
/* 92:69 */     return this.endTime;
/* 93:   */   }
/* 94:   */   
/* 95:   */   public void setEndTime(Date endTime)
/* 96:   */   {
/* 97:72 */     this.endTime = endTime;
/* 98:   */   }
/* 99:   */   
/* :0:   */   public String getCustomerName()
/* :1:   */   {
/* :2:75 */     return this.customerName;
/* :3:   */   }
/* :4:   */   
/* :5:   */   public void setCustomerName(String customerName)
/* :6:   */   {
/* :7:78 */     this.customerName = customerName;
/* :8:   */   }
/* :9:   */ }


/* Location:           D:\Program Files\apache-tomcat-8.0.20\webapps\demo2\WEB-INF\classes\
 * Qualified Name:     com.usst.app.order.cashBasis.fee.model.FeeItem
 * JD-Core Version:    0.7.0.1
 */