/*  1:   */ package com.usst.app.baseInfo.area.service;
/*  6:   */ import java.util.HashMap;
/*  7:   */ import java.util.List;
/*  8:   */ import java.util.Map;
/*  9:   */ import org.apache.commons.lang.StringUtils;

import com.usst.app.baseInfo.area.model.Area;
import com.usst.code.ibatis.impl.PublicDAO;
import com.usst.code.service.BaseService;
/* 10:   */ 
/* 11:   */ public class AreaService
/* 12:   */   extends BaseService<Area>
/* 13:   */ {
/* 14:   */   public Integer count()
/* 15:   */   {
/* 16:26 */     Integer num = (Integer)this.publicDAO.selectOne("Area.Area_count_query", null);
/* 17:27 */     if ((num == null) || (num.intValue() < 0)) {
/* 18:28 */       num = Integer.valueOf(0);
/* 19:   */     }
/* 20:30 */     return num;
/* 21:   */   }
/* 22:   */   
/* 23:   */   public Area checkUniqueArea(Area area)
/* 24:   */   {
/* 25:40 */     Area result = null;
/* 26:41 */     Object obj = this.publicDAO.selectOne("Area.Area", area);
/* 27:42 */     if (obj != null) {
/* 28:43 */       result = (Area)obj;
/* 29:   */     }
/* 30:45 */     return result;
/* 31:   */   }
/* 32:   */   
/* 33:   */   public Area checkUniqueAreaByName(String name)
/* 34:   */   {
/* 35:53 */     return (Area)this.publicDAO.selectOne("Area.Area_selByName", name);
/* 36:   */   }
/* 37:   */   
/* 38:   */   public void delete(Area area)
/* 39:   */     throws Exception
/* 40:   */   {
/* 41:65 */     if ((area == null) || (StringUtils.isBlank(area.getId()))) {
/* 42:66 */       throw new Exception("the primary key is null, can not delete area information");
/* 43:   */     }
/* 44:68 */     if (area.getLevel() == 1)
/* 45:   */     {
/* 46:70 */       Map map = new HashMap();
/* 47:71 */       map.put("parentId", area.getId());
/* 48:72 */       List<Area> list = super.select(map);
/* 49:73 */       for (int i = 0; i < list.size(); i++)
/* 50:   */       {
/* 51:75 */         map.clear();
/* 52:76 */         map.put("parentId", ((Area)list.get(i)).getId());
/* 53:77 */         this.publicDAO.delete("Area.Area", map);
/* 54:   */       }
/* 55:80 */       for (int i = 0; i < list.size(); i++)
/* 56:   */       {
/* 57:81 */         map.clear();
/* 58:82 */         map.put("id", ((Area)list.get(i)).getId());
/* 59:83 */         this.publicDAO.delete("Area.Area", map);
/* 60:   */       }
/* 61:   */     }
/* 62:85 */     else if (area.getLevel() == 2)
/* 63:   */     {
/* 64:86 */       Map map = new HashMap();
/* 65:87 */       map.put("parentId", area.getId());
/* 66:   */       
/* 67:89 */       this.publicDAO.delete("Area.Area", map);
/* 68:   */     }
/* 69:91 */     this.publicDAO.delete("Area.Area", area);
/* 70:   */   }
/* 71:   */ }


/* Location:           D:\Program Files\apache-tomcat-8.0.20\webapps\demo2\WEB-INF\classes\
 * Qualified Name:     com.usst.app.baseInfo.area.service.AreaService
 * JD-Core Version:    0.7.0.1
 */