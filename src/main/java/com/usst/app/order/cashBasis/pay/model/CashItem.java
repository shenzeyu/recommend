/*  1:   */ package com.usst.app.order.cashBasis.pay.model;
import com.usst.code.bean.Base;
/*  4:   */ 
/*  5:   */ public class CashItem
/*  6:   */   extends Base
/*  7:   */ {
/*  8:   */   private static final long serialVersionUID = 1L;
/*  9:   */   private Double money;
/* 10:   */   private String orderId;
/* 11:   */   private String remark;
/* 12:   */   private String bankAccountCode;
/* 13:   */   private String bankAccountId;
/* 14:   */   private String account;
/* 15:   */   private String bankAccountName;
/* 16:   */   private String accountHolder;
/* 17:   */   private String bank;
/* 18:   */   
/* 19:   */   public Double getMoney()
/* 20:   */   {
/* 21:23 */     return this.money;
/* 22:   */   }
/* 23:   */   
/* 24:   */   public void setMoney(Double money)
/* 25:   */   {
/* 26:26 */     this.money = money;
/* 27:   */   }
/* 28:   */   
/* 29:   */   public String getOrderId()
/* 30:   */   {
/* 31:29 */     return this.orderId;
/* 32:   */   }
/* 33:   */   
/* 34:   */   public void setOrderId(String orderId)
/* 35:   */   {
/* 36:32 */     this.orderId = orderId;
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
/* 49:   */   public String getBankAccountCode()
/* 50:   */   {
/* 51:41 */     return this.bankAccountCode;
/* 52:   */   }
/* 53:   */   
/* 54:   */   public void setBankAccountCode(String bankAccountCode)
/* 55:   */   {
/* 56:44 */     this.bankAccountCode = bankAccountCode;
/* 57:   */   }
/* 58:   */   
/* 59:   */   public String getBankAccountId()
/* 60:   */   {
/* 61:47 */     return this.bankAccountId;
/* 62:   */   }
/* 63:   */   
/* 64:   */   public void setBankAccountId(String bankAccountId)
/* 65:   */   {
/* 66:50 */     this.bankAccountId = bankAccountId;
/* 67:   */   }
/* 68:   */   
/* 69:   */   public String getAccount()
/* 70:   */   {
/* 71:53 */     return this.account;
/* 72:   */   }
/* 73:   */   
/* 74:   */   public void setAccount(String account)
/* 75:   */   {
/* 76:56 */     this.account = account;
/* 77:   */   }
/* 78:   */   
/* 79:   */   public String getBankAccountName()
/* 80:   */   {
/* 81:59 */     return this.bankAccountName;
/* 82:   */   }
/* 83:   */   
/* 84:   */   public void setBankAccountName(String bankAccountName)
/* 85:   */   {
/* 86:62 */     this.bankAccountName = bankAccountName;
/* 87:   */   }
/* 88:   */   
/* 89:   */   public String getAccountHolder()
/* 90:   */   {
/* 91:65 */     return this.accountHolder;
/* 92:   */   }
/* 93:   */   
/* 94:   */   public void setAccountHolder(String accountHolder)
/* 95:   */   {
/* 96:68 */     this.accountHolder = accountHolder;
/* 97:   */   }
/* 98:   */   
/* 99:   */   public String getBank()
/* :0:   */   {
/* :1:71 */     return this.bank;
/* :2:   */   }
/* :3:   */   
/* :4:   */   public void setBank(String bank)
/* :5:   */   {
/* :6:74 */     this.bank = bank;
/* :7:   */   }
/* :8:   */ }


/* Location:           D:\Program Files\apache-tomcat-8.0.20\webapps\demo2\WEB-INF\classes\
 * Qualified Name:     com.usst.app.order.cashBasis.pay.model.CashItem
 * JD-Core Version:    0.7.0.1
 */