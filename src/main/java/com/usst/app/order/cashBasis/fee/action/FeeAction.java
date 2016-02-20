/*   1:    */ package com.usst.app.order.cashBasis.fee.action;
/*  13:    */ import java.util.ArrayList;
/*  14:    */ import java.util.HashMap;
/*  15:    */ import java.util.List;
/*  16:    */ import java.util.Map;
/*  17:    */ import org.apache.commons.lang.StringUtils;
/*  18:    */ import org.apache.log4j.Logger;

import com.usst.app.baseInfo.bankAccount.model.BankAccount;
import com.usst.app.baseInfo.bankAccount.service.BankAccountService;
import com.usst.app.component.serialNumber.service.SerialNumberService;
import com.usst.app.order.cashBasis.fee.model.Fee;
import com.usst.app.order.cashBasis.fee.model.FeeItem;
import com.usst.app.order.cashBasis.fee.service.FeeItemService;
import com.usst.app.order.cashBasis.fee.service.FeeService;
import com.usst.app.system.user.model.SysUser;
import com.usst.code.struct.BaseAction;
import com.usst.code.util.PageInfo;
/*  19:    */ 
/*  20:    */ public class FeeAction
/*  21:    */   extends BaseAction
/*  22:    */ {
/*  23:    */   private static final long serialVersionUID = 1L;
/*  24: 29 */   private static final Logger logger = Logger.getLogger(FeeAction.class);
/*  25:    */   private Fee fee;
/*  26:    */   private FeeService feeService;
/*  27:    */   private FeeItem feeItem;
/*  28:    */   private FeeItemService feeItemService;
/*  29:    */   private SerialNumberService serialNumberService;
/*  30:    */   private BankAccountService bankAccountService;
/*  31:    */   private List<BankAccount> bankAccountList;
/*  32:    */   private double[] moneyArr;
/*  33:    */   private String[] nameArr;
/*  34:    */   private String[] codeArr;
/*  35:    */   private String[] remarkArr;
/*  36:    */   
/*  37:    */   public String list()
/*  38:    */   {
/*  39: 52 */     return "list_fee";
/*  40:    */   }
/*  41:    */   
/*  42:    */   public String listJosn()
/*  43:    */   {
/*  44: 62 */     logger.info("start list fee");
/*  45:    */     
/*  46: 64 */     List<Fee> resultList = null;
/*  47:    */     
/*  48: 66 */     int totalRows = 0;
/*  49:    */     try
/*  50:    */     {
/*  51: 69 */       PageInfo pageInfo = createPageInfo();
/*  52: 70 */       if (this.fee == null) {
/*  53: 71 */         this.fee = new Fee();
/*  54:    */       }
/*  55: 74 */       resultList = this.feeService.pageList(pageInfo, this.fee, true);
/*  56: 75 */       totalRows = pageInfo.getCount();
/*  57:    */     }
/*  58:    */     catch (Exception e)
/*  59:    */     {
/*  60: 77 */       logger.error("error occur when list fee", e);
/*  61:    */     }
/*  62: 80 */     if (resultList == null) {
/*  63: 81 */       resultList = new ArrayList();
/*  64:    */     }
/*  65: 83 */     this.jsonMap = new HashMap();
/*  66: 84 */     this.jsonMap.put("total", Integer.valueOf(totalRows));
/*  67: 85 */     this.jsonMap.put("rows", resultList);
/*  68: 86 */     logger.info("finish list all fee");
/*  69: 87 */     return "success";
/*  70:    */   }
/*  71:    */   
/*  72:    */   public String edit()
/*  73:    */   {
/*  74: 98 */     SysUser loginMan = getSessionUserInfo();
/*  75: 99 */     if (this.fee == null) {
/*  76:100 */       this.fee = new Fee();
/*  77:    */     }
/*  78:    */     try
/*  79:    */     {
/*  80:104 */       if (StringUtils.isBlank(this.fee.getId()))
/*  81:    */       {
/*  82:105 */         this.fee.setState("c");
/*  83:106 */         initModel(true, this.fee, loginMan);
/*  84:107 */         this.fee.setHandlerId(loginMan.getId());
/*  85:108 */         this.fee.setHandlerName(loginMan.getName());
/*  86:109 */         this.fee.setDeptId(loginMan.getDeptId());
/*  87:110 */         this.fee.setDeptName(loginMan.getDeptName());
/*  88:    */         try
/*  89:    */         {
/*  90:113 */           String code = this.serialNumberService.getSerialNumberByDate("FYD", "fee");
/*  91:114 */           this.fee.setCode(code);
/*  92:    */         }
/*  93:    */         catch (Exception e)
/*  94:    */         {
/*  95:116 */           logger.error("error occur when get code", e);
/*  96:    */         }
/*  97:    */       }
/*  98:    */       else
/*  99:    */       {
/* 100:119 */         this.fee = ((Fee)this.feeService.getModel(this.fee.getId()));
/* 101:120 */         initModel(false, this.fee, loginMan);
/* 102:    */       }
/* 103:    */     }
/* 104:    */     catch (Exception e)
/* 105:    */     {
/* 106:123 */       logger.error("error occur when list warehouseInto", e);
/* 107:    */     }
/* 108:125 */     this.bankAccountList = this.bankAccountService.select(new BankAccount());
/* 109:126 */     return "edit_fee";
/* 110:    */   }
/* 111:    */   
/* 112:    */   public void save()
/* 113:    */   {
/* 114:135 */     logger.info("start to update fee information");
/* 115:    */     try
/* 116:    */     {
/* 117:137 */       if (this.fee == null) {
/* 118:138 */         this.fee = new Fee();
/* 119:    */       }
/* 120:141 */       BankAccount bankAccount = (BankAccount)this.bankAccountService.getModel(this.fee.getBankAccountId());
/* 121:142 */       if (bankAccount != null)
/* 122:    */       {
/* 123:143 */         this.fee.setBankAccountId(bankAccount.getId());
/* 124:144 */         this.fee.setBankAccountName(bankAccount.getName());
/* 125:    */       }
/* 126:146 */       if (StringUtils.isBlank(this.fee.getId()))
/* 127:    */       {
/* 128:148 */         String id = this.feeService.makeId();
/* 129:149 */         this.fee.setId(id);
/* 130:150 */         this.feeService.insert(this.fee);
/* 131:    */       }
/* 132:    */       else
/* 133:    */       {
/* 134:152 */         this.feeService.update(this.fee);
/* 135:    */       }
/* 136:154 */       responseFlag(true);
/* 137:    */     }
/* 138:    */     catch (Exception e)
/* 139:    */     {
/* 140:156 */       logger.info("error occur when save fee information");
/* 141:157 */       e.printStackTrace();
/* 142:158 */       responseFlag(false);
/* 143:    */     }
/* 144:    */     try
/* 145:    */     {
/* 146:162 */       this.feeItemService.deleteByIntoId(this.fee.getId());
/* 147:    */     }
/* 148:    */     catch (Exception e)
/* 149:    */     {
/* 150:164 */       responseFlag(false);
/* 151:165 */       logger.error("error occur when delete  documentItem", e);
/* 152:    */     }
/* 153:168 */     if ("s".equals(this.fee.getState())) {
/* 154:    */       try
/* 155:    */       {
/* 156:171 */         this.bankAccountService.updateMoney(this.fee.getBankAccountId(), Double.valueOf(0.0D - this.fee.getMoneyAccount().doubleValue()));
/* 157:    */       }
/* 158:    */       catch (Exception e)
/* 159:    */       {
/* 160:173 */         logger.error("error occur when update bankAccount money", e);
/* 161:    */       }
/* 162:    */     }
/* 163:177 */     String orderId = this.fee.getId();
/* 164:178 */     if ((this.codeArr != null) && (this.codeArr.length != 0)) {
/* 165:179 */       for (int i = 0; i < this.codeArr.length; i++)
/* 166:    */       {
/* 167:180 */         FeeItem feeItem = new FeeItem();
/* 168:181 */         feeItem.setOrderId(orderId);
/* 169:182 */         feeItem.setMoney(Double.valueOf(this.moneyArr[i]));
/* 170:183 */         feeItem.setName(this.nameArr[i]);
/* 171:184 */         feeItem.setCode(this.codeArr[i]);
/* 172:185 */         feeItem.setRemark(this.remarkArr[i]);
/* 173:186 */         feeItem.setSort(Integer.valueOf(i));
/* 174:    */         try
/* 175:    */         {
/* 176:188 */           this.feeItemService.insert(feeItem);
/* 177:    */         }
/* 178:    */         catch (Exception e)
/* 179:    */         {
/* 180:190 */           responseFlag(false);
/* 181:191 */           logger.error("error occur when insert a warehouseMoveWare", e);
/* 182:    */         }
/* 183:    */       }
/* 184:    */     }
/* 185:    */   }
/* 186:    */   
/* 187:    */   public void delete()
/* 188:    */   {
/* 189:203 */     SysUser loginMan = getSessionUserInfo();
/* 190:    */     try
/* 191:    */     {
/* 192:205 */       if (this.fee == null) {
/* 193:206 */         this.fee = new Fee();
/* 194:    */       }
/* 195:208 */       this.feeItemService.deleteByIntoId(this.fee.getId());
/* 196:209 */       this.feeService.delete(this.fee.getId());
/* 197:210 */       logger.info(loginMan.getCode() + " delete fee,id:" + this.fee.getId());
/* 198:211 */       responseFlag(true);
/* 199:    */     }
/* 200:    */     catch (Exception e)
/* 201:    */     {
/* 202:213 */       responseFlag(false);
/* 203:214 */       logger.error("error occur when delete a sale order", e);
/* 204:    */     }
/* 205:    */   }
/* 206:    */   
/* 207:    */   public Fee getFee()
/* 208:    */   {
/* 209:218 */     return this.fee;
/* 210:    */   }
/* 211:    */   
/* 212:    */   public void setFee(Fee fee)
/* 213:    */   {
/* 214:222 */     this.fee = fee;
/* 215:    */   }
/* 216:    */   
/* 217:    */   public void setFeeService(FeeService feeService)
/* 218:    */   {
/* 219:227 */     this.feeService = feeService;
/* 220:    */   }
/* 221:    */   
/* 222:    */   public void setSerialNumberService(SerialNumberService serialNumberService)
/* 223:    */   {
/* 224:231 */     this.serialNumberService = serialNumberService;
/* 225:    */   }
/* 226:    */   
/* 227:    */   public double[] getMoneyArr()
/* 228:    */   {
/* 229:235 */     return this.moneyArr;
/* 230:    */   }
/* 231:    */   
/* 232:    */   public void setMoneyArr(double[] moneyArr)
/* 233:    */   {
/* 234:239 */     this.moneyArr = moneyArr;
/* 235:    */   }
/* 236:    */   
/* 237:    */   public String[] getNameArr()
/* 238:    */   {
/* 239:243 */     return this.nameArr;
/* 240:    */   }
/* 241:    */   
/* 242:    */   public void setNameArr(String[] nameArr)
/* 243:    */   {
/* 244:247 */     this.nameArr = nameArr;
/* 245:    */   }
/* 246:    */   
/* 247:    */   public void setBankAccountService(BankAccountService bankAccountService)
/* 248:    */   {
/* 249:251 */     this.bankAccountService = bankAccountService;
/* 250:    */   }
/* 251:    */   
/* 252:    */   public List<BankAccount> getBankAccountList()
/* 253:    */   {
/* 254:255 */     return this.bankAccountList;
/* 255:    */   }
/* 256:    */   
/* 257:    */   public void setBankAccountList(List<BankAccount> bankAccountList)
/* 258:    */   {
/* 259:259 */     this.bankAccountList = bankAccountList;
/* 260:    */   }
/* 261:    */   
/* 262:    */   public String[] getCodeArr()
/* 263:    */   {
/* 264:263 */     return this.codeArr;
/* 265:    */   }
/* 266:    */   
/* 267:    */   public void setCodeArr(String[] codeArr)
/* 268:    */   {
/* 269:267 */     this.codeArr = codeArr;
/* 270:    */   }
/* 271:    */   
/* 272:    */   public String[] getRemarkArr()
/* 273:    */   {
/* 274:271 */     return this.remarkArr;
/* 275:    */   }
/* 276:    */   
/* 277:    */   public void setRemarkArr(String[] remarkArr)
/* 278:    */   {
/* 279:275 */     this.remarkArr = remarkArr;
/* 280:    */   }
/* 281:    */   
/* 282:    */   public FeeItem getFeeItem()
/* 283:    */   {
/* 284:279 */     return this.feeItem;
/* 285:    */   }
/* 286:    */   
/* 287:    */   public void setFeeItem(FeeItem feeItem)
/* 288:    */   {
/* 289:283 */     this.feeItem = feeItem;
/* 290:    */   }
/* 291:    */   
/* 292:    */   public void setFeeItemService(FeeItemService feeItemService)
/* 293:    */   {
/* 294:287 */     this.feeItemService = feeItemService;
/* 295:    */   }
/* 296:    */ }


/* Location:           D:\Program Files\apache-tomcat-8.0.20\webapps\demo2\WEB-INF\classes\
 * Qualified Name:     com.usst.app.order.cashBasis.fee.action.FeeAction
 * JD-Core Version:    0.7.0.1
 */