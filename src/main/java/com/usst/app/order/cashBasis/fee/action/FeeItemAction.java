/*  1:   */ package com.usst.app.order.cashBasis.fee.action;
/*  7:   */ import java.util.ArrayList;
/*  8:   */ import java.util.HashMap;
/*  9:   */ import java.util.List;
/* 10:   */ import java.util.Map;
/* 11:   */ import org.apache.log4j.Logger;

import com.usst.app.order.cashBasis.fee.model.FeeItem;
import com.usst.app.order.cashBasis.fee.service.FeeItemService;
import com.usst.code.struct.BaseAction;
import com.usst.code.util.PageInfo;
/* 12:   */ 
/* 13:   */ public class FeeItemAction
/* 14:   */   extends BaseAction
/* 15:   */ {
/* 16:   */   private static final long serialVersionUID = 1L;
/* 17:22 */   private static final Logger logger = Logger.getLogger(FeeItemAction.class);
/* 18:   */   private FeeItem feeItem;
/* 19:   */   private FeeItemService feeItemService;
/* 20:   */   
/* 21:   */   public void setFeeItemService(FeeItemService feeItemService)
/* 22:   */   {
/* 23:27 */     this.feeItemService = feeItemService;
/* 24:   */   }
/* 25:   */   
/* 26:   */   public String listJson()
/* 27:   */   {
/* 28:37 */     logger.info("start list documentItem");
/* 29:38 */     List<FeeItem> resultList = null;
/* 30:39 */     int totalRows = 0;
/* 31:   */     try
/* 32:   */     {
/* 33:41 */       PageInfo pageInfo = createPageInfo();
/* 34:42 */       if (this.feeItem == null) {
/* 35:43 */         this.feeItem = new FeeItem();
/* 36:   */       }
/* 37:45 */       resultList = this.feeItemService.pageList(pageInfo, this.feeItem, true);
/* 38:46 */       totalRows = pageInfo.getCount();
/* 39:   */     }
/* 40:   */     catch (Exception e)
/* 41:   */     {
/* 42:48 */       logger.error("error occur when list warehouseIntoWare", e);
/* 43:   */     }
/* 44:50 */     if (resultList == null) {
/* 45:51 */       resultList = new ArrayList();
/* 46:   */     }
/* 47:53 */     this.jsonMap = new HashMap();
/* 48:54 */     this.jsonMap.put("total", Integer.valueOf(totalRows));
/* 49:55 */     this.jsonMap.put("rows", resultList);
/* 50:56 */     logger.info("finish list documentItem");
/* 51:57 */     return "success";
/* 52:   */   }
/* 53:   */   
/* 54:   */   public FeeItem getFeeItem()
/* 55:   */   {
/* 56:61 */     return this.feeItem;
/* 57:   */   }
/* 58:   */   
/* 59:   */   public void setFeeItem(FeeItem feeItem)
/* 60:   */   {
/* 61:65 */     this.feeItem = feeItem;
/* 62:   */   }
/* 63:   */ }


/* Location:           D:\Program Files\apache-tomcat-8.0.20\webapps\demo2\WEB-INF\classes\
 * Qualified Name:     com.usst.app.order.cashBasis.fee.action.FeeItemAction
 * JD-Core Version:    0.7.0.1
 */