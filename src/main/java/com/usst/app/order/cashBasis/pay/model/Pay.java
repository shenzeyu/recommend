/*  1:   */ package com.usst.app.order.cashBasis.pay.model;
import com.usst.code.bean.Base;
/*  4:   */ 
/*  5:   */ public class Pay
/*  6:   */   extends Base
/*  7:   */ {
/*  8:   */   private static final long serialVersionUID = 1L;
/*  9:   */   private Double moneyAccount;
/* 10:   */   private Double moneyPayment;
/* 11:   */   private String remark;
/* 12:   */   private String handlerId;
/* 13:   */   private String handlerName;
/* 14:   */   private String deptId;
/* 15:   */   private String deptName;
/* 16:   */   private String customerId;
/* 17:   */   private String customerName;
/* 18:   */   
/* 19:   */   public Double getMoneyAccount()
/* 20:   */   {
/* 21:23 */     return this.moneyAccount;
/* 22:   */   }
/* 23:   */   
/* 24:   */   public void setMoneyAccount(Double moneyAccount)
/* 25:   */   {
/* 26:26 */     this.moneyAccount = moneyAccount;
/* 27:   */   }
/* 28:   */   
/* 29:   */   public Double getMoneyPayment()
/* 30:   */   {
/* 31:29 */     return this.moneyPayment;
/* 32:   */   }
/* 33:   */   
/* 34:   */   public void setMoneyPayment(Double moneyPayment)
/* 35:   */   {
/* 36:32 */     this.moneyPayment = moneyPayment;
/* 37:   */   }
/* 38:   */   
/* 39:   */   public String getRemark()
/* 40:   */   {
/* 41:35 */     return this.remark;
/* 42:   */   }
/* 43:   */   
/* 44:   */   public void setRemark(String remark)
/* 45:   */   {
/* 46:38 */     this.remark = remark;
/* 47:   */   }
/* 48:   */   
/* 49:   */   public String getHandlerId()
/* 50:   */   {
/* 51:41 */     return this.handlerId;
/* 52:   */   }
/* 53:   */   
/* 54:   */   public void setHandlerId(String handlerId)
/* 55:   */   {
/* 56:44 */     this.handlerId = handlerId;
/* 57:   */   }
/* 58:   */   
/* 59:   */   public String getHandlerName()
/* 60:   */   {
/* 61:47 */     return this.handlerName;
/* 62:   */   }
/* 63:   */   
/* 64:   */   public void setHandlerName(String handlerName)
/* 65:   */   {
/* 66:50 */     this.handlerName = handlerName;
/* 67:   */   }
/* 68:   */   
/* 69:   */   public String getDeptId()
/* 70:   */   {
/* 71:53 */     return this.deptId;
/* 72:   */   }
/* 73:   */   
/* 74:   */   public void setDeptId(String deptId)
/* 75:   */   {
/* 76:56 */     this.deptId = deptId;
/* 77:   */   }
/* 78:   */   
/* 79:   */   public String getDeptName()
/* 80:   */   {
/* 81:59 */     return this.deptName;
/* 82:   */   }
/* 83:   */   
/* 84:   */   public void setDeptName(String deptName)
/* 85:   */   {
/* 86:62 */     this.deptName = deptName;
/* 87:   */   }
/* 88:   */   
/* 89:   */   public String getCustomerId()
/* 90:   */   {
/* 91:65 */     return this.customerId;
/* 92:   */   }
/* 93:   */   
/* 94:   */   public void setCustomerId(String customerId)
/* 95:   */   {
/* 96:68 */     this.customerId = customerId;
/* 97:   */   }
/* 98:   */   
/* 99:   */   public String getCustomerName()
/* :0:   */   {
/* :1:71 */     return this.customerName;
/* :2:   */   }
/* :3:   */   
/* :4:   */   public void setCustomerName(String customerName)
/* :5:   */   {
/* :6:74 */     this.customerName = customerName;
/* :7:   */   }
/* :8:   */ }


/* Location:           D:\Program Files\apache-tomcat-8.0.20\webapps\demo2\WEB-INF\classes\
 * Qualified Name:     com.usst.app.order.cashBasis.pay.model.Pay
 * JD-Core Version:    0.7.0.1
 */