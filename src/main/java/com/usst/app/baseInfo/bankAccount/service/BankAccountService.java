package com.usst.app.baseInfo.bankAccount.service;

import java.util.HashMap;
import java.util.Map;
import org.apache.commons.lang.StringUtils;

import com.usst.app.baseInfo.bankAccount.model.BankAccount;
import com.usst.code.ibatis.impl.PublicDAO;
import com.usst.code.service.BaseService;

public class BankAccountService
  extends BaseService<BankAccount>
{
  public void updateMoney(String bankAccountId, Double changeMoney)
    throws Exception
  {
    if (StringUtils.isBlank(bankAccountId)) {
      throw new Exception("bankAccountId is null");
    }
    Map<String, String> param = new HashMap();
    param.put("id", bankAccountId);
    BankAccount bankAccount = (BankAccount)this.publicDAO.selectOne("BankAccount.BankAccount", param);
    if (bankAccount != null)
    {
      Double money = bankAccount.getMoney();
      money = Double.valueOf(money.doubleValue() + changeMoney.doubleValue());
      bankAccount.setMoney(money);
      this.publicDAO.update("BankAccount.BankAccount", bankAccount);
    }
  }
}
