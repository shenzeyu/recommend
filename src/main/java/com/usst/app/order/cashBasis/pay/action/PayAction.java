/*   1:    */ package com.usst.app.order.cashBasis.pay.action;
/*  15:    */ import java.util.ArrayList;
/*  16:    */ import java.util.HashMap;
/*  17:    */ import java.util.List;
/*  18:    */ import java.util.Map;
/*  19:    */ import org.apache.commons.lang.StringUtils;
/*  20:    */ import org.apache.log4j.Logger;

import com.usst.app.baseInfo.bankAccount.service.BankAccountService;
import com.usst.app.baseInfo.supplier.model.Supplier;
import com.usst.app.baseInfo.supplier.service.SupplierService;
import com.usst.app.component.serialNumber.service.SerialNumberService;
import com.usst.app.customer.model.Customer;
import com.usst.app.order.cashBasis.pay.model.CashItem;
import com.usst.app.order.cashBasis.pay.model.Pay;
import com.usst.app.order.cashBasis.pay.service.CashItemService;
import com.usst.app.order.cashBasis.pay.service.PayService;
import com.usst.app.system.user.model.SysUser;
import com.usst.code.struct.BaseAction;
import com.usst.code.util.PageInfo;
/*  21:    */ 
/*  22:    */ public class PayAction
/*  23:    */   extends BaseAction
/*  24:    */ {
/*  25:    */   private static final long serialVersionUID = 1L;
/*  26: 31 */   private static final Logger logger = Logger.getLogger(PayAction.class);
/*  27:    */   private Pay pay;
/*  28:    */   private PayService payService;
/*  29:    */   private CashItem cashItem;
/*  30:    */   private CashItemService cashItemService;
/*  31:    */   private SerialNumberService serialNumberService;
/*  32:    */   private BankAccountService bankAccountService;
/*  33:    */   private Customer customer;
/*  34:    */   private Supplier supplier;
/*  35:    */   private SupplierService supplierService;
/*  36:    */   private double[] moneyArr;
/*  37:    */   private String[] bankAccountCodeArr;
/*  38:    */   private String[] bankAccountIdArr;
/*  39:    */   private String[] accountArr;
/*  40:    */   private String[] bankAccountNameArr;
/*  41:    */   private String[] accountHolderArr;
/*  42:    */   private String[] bankArr;
/*  43:    */   private String[] remarkArr;
/*  44:    */   
/*  45:    */   public String list()
/*  46:    */   {
/*  47: 55 */     return "list_pay";
/*  48:    */   }
/*  49:    */   
/*  50:    */   public String listJosn()
/*  51:    */   {
/*  52: 65 */     logger.info("start list pay");
/*  53: 66 */     List<Pay> resultList = null;
/*  54: 67 */     int totalRows = 0;
/*  55:    */     try
/*  56:    */     {
/*  57: 70 */       PageInfo pageInfo = createPageInfo();
/*  58: 71 */       if (this.pay == null) {
/*  59: 72 */         this.pay = new Pay();
/*  60:    */       }
/*  61: 74 */       resultList = this.payService.pageList(pageInfo, this.pay, true);
/*  62: 75 */       totalRows = pageInfo.getCount();
/*  63:    */     }
/*  64:    */     catch (Exception e)
/*  65:    */     {
/*  66: 77 */       logger.error("error occur when list pay", e);
/*  67:    */     }
/*  68: 80 */     if (resultList == null) {
/*  69: 81 */       resultList = new ArrayList();
/*  70:    */     }
/*  71: 83 */     this.jsonMap = new HashMap();
/*  72: 84 */     this.jsonMap.put("total", Integer.valueOf(totalRows));
/*  73: 85 */     this.jsonMap.put("rows", resultList);
/*  74: 86 */     return "success";
/*  75:    */   }
/*  76:    */   
/*  77:    */   public String edit()
/*  78:    */   {
/*  79: 97 */     SysUser loginMan = getSessionUserInfo();
/*  80: 98 */     if (this.pay == null) {
/*  81: 99 */       this.pay = new Pay();
/*  82:    */     }
/*  83:    */     try
/*  84:    */     {
/*  85:103 */       if (StringUtils.isBlank(this.pay.getId()))
/*  86:    */       {
/*  87:104 */         this.pay.setState("c");
/*  88:105 */         initModel(true, this.pay, loginMan);
/*  89:106 */         this.pay.setHandlerId(loginMan.getId());
/*  90:107 */         this.pay.setHandlerName(loginMan.getName());
/*  91:108 */         this.pay.setDeptId(loginMan.getDeptId());
/*  92:109 */         this.pay.setDeptName(loginMan.getDeptName());
/*  93:    */         try
/*  94:    */         {
/*  95:111 */           this.pay.setCode(this.serialNumberService.getSerialNumberByDate("FKD", "pay"));
/*  96:    */         }
/*  97:    */         catch (Exception e)
/*  98:    */         {
/*  99:113 */           logger.error("error occur when get code", e);
/* 100:    */         }
/* 101:    */       }
/* 102:    */       else
/* 103:    */       {
/* 104:116 */         this.pay = ((Pay)this.payService.getModel(this.pay.getId()));
/* 105:117 */         initModel(false, this.pay, loginMan);
/* 106:    */       }
/* 107:    */     }
/* 108:    */     catch (Exception e)
/* 109:    */     {
/* 110:120 */       logger.error("error occur when list pay", e);
/* 111:121 */       responseFlag(false);
/* 112:    */     }
/* 113:123 */     return "edit_pay";
/* 114:    */   }
/* 115:    */   
/* 116:    */   public void save()
/* 117:    */   {
/* 118:133 */     logger.info("start to update pay information");
/* 119:134 */     if (this.pay == null) {
/* 120:135 */       this.pay = new Pay();
/* 121:    */     }
/* 122:    */     try
/* 123:    */     {
/* 124:138 */       if (StringUtils.isBlank(this.pay.getId()))
/* 125:    */       {
/* 126:139 */         this.pay.setId(this.payService.makeId());
/* 127:140 */         this.payService.insert(this.pay);
/* 128:    */       }
/* 129:    */       else
/* 130:    */       {
/* 131:142 */         this.payService.update(this.pay);
/* 132:    */       }
/* 133:144 */       responseFlag(true);
/* 134:    */     }
/* 135:    */     catch (Exception e)
/* 136:    */     {
/* 137:146 */       logger.info("error occur when save pay information");
/* 138:147 */       e.printStackTrace();
/* 139:148 */       responseFlag(false);
/* 140:    */     }
/* 141:    */     try
/* 142:    */     {
/* 143:151 */       this.cashItemService.deleteByIntoId(this.pay.getId());
/* 144:    */     }
/* 145:    */     catch (Exception e)
/* 146:    */     {
/* 147:153 */       responseFlag(false);
/* 148:154 */       logger.error("error occur when delete pay", e);
/* 149:    */     }
/* 150:157 */     String orderId = this.pay.getId();
/* 151:158 */     if ((this.bankAccountIdArr != null) && (this.bankAccountIdArr.length != 0)) {
/* 152:159 */       for (int i = 0; i < this.bankAccountIdArr.length; i++)
/* 153:    */       {
/* 154:160 */         CashItem cashItem = new CashItem();
/* 155:161 */         cashItem.setOrderId(orderId);
/* 156:162 */         cashItem.setMoney(Double.valueOf(this.moneyArr[i]));
/* 157:163 */         cashItem.setRemark(this.remarkArr[i]);
/* 158:164 */         cashItem.setAccount(this.accountArr[i]);
/* 159:165 */         cashItem.setAccountHolder(this.accountHolderArr[i]);
/* 160:166 */         cashItem.setBank(this.bankArr[i]);
/* 161:167 */         cashItem.setBankAccountId(this.bankAccountIdArr[i]);
/* 162:168 */         cashItem.setBankAccountCode(this.bankAccountCodeArr[i]);
/* 163:169 */         cashItem.setBankAccountName(this.bankAccountNameArr[i]);
/* 164:170 */         cashItem.setSort(Integer.valueOf(i));
/* 165:    */         try
/* 166:    */         {
/* 167:172 */           this.cashItemService.insert(cashItem);
/* 168:    */         }
/* 169:    */         catch (Exception e)
/* 170:    */         {
/* 171:174 */           responseFlag(false);
/* 172:175 */           logger.error("error occur when insert a cashItem", e);
/* 173:    */         }
/* 174:177 */         if ("s".equals(this.pay.getState())) {
/* 175:    */           try
/* 176:    */           {
/* 177:179 */             this.bankAccountService.updateMoney(this.bankAccountIdArr[i], Double.valueOf(0.0D - this.moneyArr[i]));
/* 178:    */           }
/* 179:    */           catch (Exception e)
/* 180:    */           {
/* 181:181 */             responseFlag(false);
/* 182:182 */             logger.error("error occur when insert a cashItem", e);
/* 183:    */           }
/* 184:    */         }
/* 185:    */       }
/* 186:    */     }
/* 187:187 */     if ("s".equals(this.pay.getState()))
/* 188:    */     {
/* 189:189 */       String customerId = this.pay.getCustomerId();
/* 190:190 */       Supplier supplier = (Supplier)this.supplierService.getModel(customerId);
/* 191:191 */       if (supplier != null) {
/* 192:    */         try
/* 193:    */         {
/* 194:193 */           this.supplierService.updateReceivables(customerId, Double.valueOf(0.0D + this.pay.getMoneyPayment().doubleValue()));
/* 195:    */         }
/* 196:    */         catch (Exception e)
/* 197:    */         {
/* 198:195 */           logger.error("error occur when update supplier money", e);
/* 199:196 */           responseFlag(false);
/* 200:    */         }
/* 201:    */       }
/* 202:    */     }
/* 203:    */   }
/* 204:    */   
/* 205:    */   public void delete()
/* 206:    */   {
/* 207:218 */     SysUser loginMan = getSessionUserInfo();
/* 208:    */     try
/* 209:    */     {
/* 210:220 */       if (this.pay == null) {
/* 211:221 */         this.pay = new Pay();
/* 212:    */       }
/* 213:223 */       this.cashItemService.deleteByIntoId(this.pay.getId());
/* 214:224 */       this.payService.delete(this.pay.getId());
/* 215:225 */       logger.info(loginMan.getCode() + " delete pay,id:" + this.pay.getId());
/* 216:226 */       responseFlag(true);
/* 217:    */     }
/* 218:    */     catch (Exception e)
/* 219:    */     {
/* 220:228 */       responseFlag(false);
/* 221:229 */       logger.error("error occur when delete a  pay", e);
/* 222:    */     }
/* 223:    */   }
/* 224:    */   
/* 225:    */   public Pay getPay()
/* 226:    */   {
/* 227:234 */     return this.pay;
/* 228:    */   }
/* 229:    */   
/* 230:    */   public void setPay(Pay pay)
/* 231:    */   {
/* 232:237 */     this.pay = pay;
/* 233:    */   }
/* 234:    */   
/* 235:    */   public PayService getPayService()
/* 236:    */   {
/* 237:240 */     return this.payService;
/* 238:    */   }
/* 239:    */   
/* 240:    */   public void setPayService(PayService payService)
/* 241:    */   {
/* 242:243 */     this.payService = payService;
/* 243:    */   }
/* 244:    */   
/* 245:    */   public SerialNumberService getSerialNumberService()
/* 246:    */   {
/* 247:246 */     return this.serialNumberService;
/* 248:    */   }
/* 249:    */   
/* 250:    */   public void setSerialNumberService(SerialNumberService serialNumberService)
/* 251:    */   {
/* 252:249 */     this.serialNumberService = serialNumberService;
/* 253:    */   }
/* 254:    */   
/* 255:    */   public double[] getMoneyArr()
/* 256:    */   {
/* 257:252 */     return this.moneyArr;
/* 258:    */   }
/* 259:    */   
/* 260:    */   public void setMoneyArr(double[] moneyArr)
/* 261:    */   {
/* 262:255 */     this.moneyArr = moneyArr;
/* 263:    */   }
/* 264:    */   
/* 265:    */   public String[] getRemarkArr()
/* 266:    */   {
/* 267:258 */     return this.remarkArr;
/* 268:    */   }
/* 269:    */   
/* 270:    */   public void setRemarkArr(String[] remarkArr)
/* 271:    */   {
/* 272:261 */     this.remarkArr = remarkArr;
/* 273:    */   }
/* 274:    */   
/* 275:    */   public CashItem getCashItem()
/* 276:    */   {
/* 277:265 */     return this.cashItem;
/* 278:    */   }
/* 279:    */   
/* 280:    */   public void setCashItem(CashItem cashItem)
/* 281:    */   {
/* 282:269 */     this.cashItem = cashItem;
/* 283:    */   }
/* 284:    */   
/* 285:    */   public void setCashItemService(CashItemService cashItemService)
/* 286:    */   {
/* 287:273 */     this.cashItemService = cashItemService;
/* 288:    */   }
/* 289:    */   
/* 290:    */   public String[] getBankAccountCodeArr()
/* 291:    */   {
/* 292:277 */     return this.bankAccountCodeArr;
/* 293:    */   }
/* 294:    */   
/* 295:    */   public void setBankAccountCodeArr(String[] bankAccountCodeArr)
/* 296:    */   {
/* 297:281 */     this.bankAccountCodeArr = bankAccountCodeArr;
/* 298:    */   }
/* 299:    */   
/* 300:    */   public String[] getBankAccountIdArr()
/* 301:    */   {
/* 302:285 */     return this.bankAccountIdArr;
/* 303:    */   }
/* 304:    */   
/* 305:    */   public void setBankAccountIdArr(String[] bankAccountIdArr)
/* 306:    */   {
/* 307:289 */     this.bankAccountIdArr = bankAccountIdArr;
/* 308:    */   }
/* 309:    */   
/* 310:    */   public String[] getAccountArr()
/* 311:    */   {
/* 312:293 */     return this.accountArr;
/* 313:    */   }
/* 314:    */   
/* 315:    */   public void setAccountArr(String[] accountArr)
/* 316:    */   {
/* 317:297 */     this.accountArr = accountArr;
/* 318:    */   }
/* 319:    */   
/* 320:    */   public String[] getBankAccountNameArr()
/* 321:    */   {
/* 322:301 */     return this.bankAccountNameArr;
/* 323:    */   }
/* 324:    */   
/* 325:    */   public void setBankAccountNameArr(String[] bankAccountNameArr)
/* 326:    */   {
/* 327:305 */     this.bankAccountNameArr = bankAccountNameArr;
/* 328:    */   }
/* 329:    */   
/* 330:    */   public String[] getAccountHolderArr()
/* 331:    */   {
/* 332:309 */     return this.accountHolderArr;
/* 333:    */   }
/* 334:    */   
/* 335:    */   public void setAccountHolderArr(String[] accountHolderArr)
/* 336:    */   {
/* 337:313 */     this.accountHolderArr = accountHolderArr;
/* 338:    */   }
/* 339:    */   
/* 340:    */   public String[] getBankArr()
/* 341:    */   {
/* 342:317 */     return this.bankArr;
/* 343:    */   }
/* 344:    */   
/* 345:    */   public void setBankArr(String[] bankArr)
/* 346:    */   {
/* 347:321 */     this.bankArr = bankArr;
/* 348:    */   }
/* 349:    */   
/* 350:    */   public void setBankAccountService(BankAccountService bankAccountService)
/* 351:    */   {
/* 352:325 */     this.bankAccountService = bankAccountService;
/* 353:    */   }
/* 354:    */   
/* 355:    */   public void setSupplierService(SupplierService supplierService)
/* 356:    */   {
/* 357:329 */     this.supplierService = supplierService;
/* 358:    */   }
/* 359:    */   
/* 360:    */   public Customer getCustomer()
/* 361:    */   {
/* 362:333 */     return this.customer;
/* 363:    */   }
/* 364:    */   
/* 365:    */   public void setCustomer(Customer customer)
/* 366:    */   {
/* 367:337 */     this.customer = customer;
/* 368:    */   }
/* 369:    */   
/* 370:    */   public Supplier getSupplier()
/* 371:    */   {
/* 372:341 */     return this.supplier;
/* 373:    */   }
/* 374:    */   
/* 375:    */   public void setSupplier(Supplier supplier)
/* 376:    */   {
/* 377:345 */     this.supplier = supplier;
/* 378:    */   }
/* 379:    */ }


/* Location:           D:\Program Files\apache-tomcat-8.0.20\webapps\demo2\WEB-INF\classes\
 * Qualified Name:     com.usst.app.order.cashBasis.pay.action.PayAction
 * JD-Core Version:    0.7.0.1
 */