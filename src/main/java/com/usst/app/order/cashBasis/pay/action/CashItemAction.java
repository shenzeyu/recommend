/*  1:   */ package com.usst.app.order.cashBasis.pay.action;
/*  7:   */ import java.util.ArrayList;
/*  8:   */ import java.util.HashMap;
/*  9:   */ import java.util.List;
/* 10:   */ import java.util.Map;
/* 11:   */ import org.apache.log4j.Logger;

import com.usst.app.order.cashBasis.pay.model.CashItem;
import com.usst.app.order.cashBasis.pay.service.CashItemService;
import com.usst.code.struct.BaseAction;
import com.usst.code.util.PageInfo;
/* 12:   */ 
/* 13:   */ public class CashItemAction
/* 14:   */   extends BaseAction
/* 15:   */ {
/* 16:   */   private static final long serialVersionUID = 1L;
/* 17:21 */   private static final Logger logger = Logger.getLogger(CashItemAction.class);
/* 18:   */   private CashItem cashItem;
/* 19:   */   private CashItemService cashItemService;
/* 20:   */   
/* 21:   */   public CashItem getCashItem()
/* 22:   */   {
/* 23:27 */     return this.cashItem;
/* 24:   */   }
/* 25:   */   
/* 26:   */   public void setCashItem(CashItem cashItem)
/* 27:   */   {
/* 28:31 */     this.cashItem = cashItem;
/* 29:   */   }
/* 30:   */   
/* 31:   */   public void setCashItemService(CashItemService cashItemService)
/* 32:   */   {
/* 33:35 */     this.cashItemService = cashItemService;
/* 34:   */   }
/* 35:   */   
/* 36:   */   public String listJson()
/* 37:   */   {
/* 38:46 */     logger.info("start list CashItem");
/* 39:47 */     List<CashItem> resultList = null;
/* 40:48 */     int totalRows = 0;
/* 41:   */     try
/* 42:   */     {
/* 43:50 */       PageInfo pageInfo = createPageInfo();
/* 44:51 */       if (this.cashItem == null) {
/* 45:52 */         this.cashItem = new CashItem();
/* 46:   */       }
/* 47:54 */       resultList = this.cashItemService.pageList(pageInfo, this.cashItem, true);
/* 48:55 */       totalRows = pageInfo.getCount();
/* 49:   */     }
/* 50:   */     catch (Exception e)
/* 51:   */     {
/* 52:57 */       logger.error("error occur when list CashItem", e);
/* 53:   */     }
/* 54:59 */     if (resultList == null) {
/* 55:60 */       resultList = new ArrayList();
/* 56:   */     }
/* 57:62 */     this.jsonMap = new HashMap();
/* 58:63 */     this.jsonMap.put("total", Integer.valueOf(totalRows));
/* 59:64 */     this.jsonMap.put("rows", resultList);
/* 60:65 */     logger.info("finish list CashItem");
/* 61:66 */     return "success";
/* 62:   */   }
/* 63:   */ }


/* Location:           D:\Program Files\apache-tomcat-8.0.20\webapps\demo2\WEB-INF\classes\
 * Qualified Name:     com.usst.app.order.cashBasis.pay.action.CashItemAction
 * JD-Core Version:    0.7.0.1
 */