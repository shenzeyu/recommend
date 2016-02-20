package com.usst.app.front.service;

import java.io.PrintStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;

import com.usst.app.baseInfo.delivery.model.Delivery;
import com.usst.app.baseInfo.delivery.service.DeliveryService;
import com.usst.app.baseInfo.payment.model.Payment;
import com.usst.app.baseInfo.payment.service.PaymentService;
import com.usst.app.component.serialNumber.service.SerialNumberService;
import com.usst.app.customer.model.Customer;
import com.usst.app.customer.model.CustomerAddress;
import com.usst.app.customer.service.CustomerAddressService;
import com.usst.app.front.action.FrontGoodAction;
import com.usst.app.front.model.GoodsInCar;
import com.usst.app.good.good.model.Good;
import com.usst.app.good.good.service.GoodService;
import com.usst.app.order.sale.saleOrder.model.SaleOrder;
import com.usst.app.order.sale.saleOrder.service.SaleOrderService;
import com.usst.app.order.sale.saleWare.model.SaleWare;
import com.usst.app.order.sale.saleWare.service.SaleWareService;
import com.usst.app.vip.coupon.model.VipCoupon;
import com.usst.app.vip.coupon.service.VipCouponService;
import com.usst.code.bean.Base;
import com.usst.code.ibatis.impl.PublicDAO;
import com.usst.code.service.BaseService;
import com.usst.code.util.PageInfo;

public class FrontGoodService extends BaseService<Good> {
	private static final Logger logger = Logger.getLogger(FrontGoodAction.class);
	private SaleWareService saleWareService;
	private CustomerAddressService customerAddressService;
	private VipCouponService vipCouponService;
	private PaymentService paymentService;
	private DeliveryService deliveryService;
	private SaleOrderService saleOrderService;
	private SerialNumberService serialNumberService;
	private GoodService goodService;

	public void setSerialNumberService(SerialNumberService serialNumberService) {
		this.serialNumberService = serialNumberService;
	}

	public void setSaleWareService(SaleWareService saleWareService) {
		this.saleWareService = saleWareService;
	}

	public void setCustomerAddressService(CustomerAddressService customerAddressService) {
		this.customerAddressService = customerAddressService;
	}

	public void setVipCouponService(VipCouponService vipCouponService) {
		this.vipCouponService = vipCouponService;
	}

	public void setPaymentService(PaymentService paymentService) {
		this.paymentService = paymentService;
	}

	public void setDeliveryService(DeliveryService deliveryService) {
		this.deliveryService = deliveryService;
	}

	public void setSaleOrderService(SaleOrderService saleOrderService) {
		this.saleOrderService = saleOrderService;
	}

	public List<Good> frontGetGoods(PageInfo pageInfo) {
		Map param = new HashMap();
		List<Good> list = this.publicDAO.queryByCache("Good.Good", param, pageInfo);
		return list;
	}

	public boolean createSaleOrder(SaleOrder saleOrder, List<GoodsInCar> goodsInCarList, Customer customer,
			VipCoupon vipCoupon) throws Exception {
		saleOrder.setCode(this.serialNumberService.getSerialNumberByDate("DH", "saleOrder"));
		saleOrder.setId(this.saleOrderService.makeId());

		System.out.println("----------------oId------------------" + saleOrder.getId());

		Double orderMoney = Double.valueOf(0.0D);
		if (goodsInCarList.size() > 0) {
			String saleId = saleOrder.getId();
			for (int i = 0; i < goodsInCarList.size(); i++) {
				SaleWare saleWare = new SaleWare();

				saleWare.setSaleId(saleId);

				saleWare.setWareId(((GoodsInCar) goodsInCarList.get(i)).getId());
				saleWare.setOrderNumber(Double.valueOf(((GoodsInCar) goodsInCarList.get(i)).getCount().intValue()));
				saleWare.setGoodPrice(((GoodsInCar) goodsInCarList.get(i)).getPrice());
				saleWare.setMoney(((GoodsInCar) goodsInCarList.get(i)).getTotalMoney());
				saleWare.setPriceDiscount(Double.valueOf(0.0D));
				saleWare.setWareSpecification(((GoodsInCar) goodsInCarList.get(i)).getSpecificationVal());
				saleWare.setType("0");
				saleWare.setSort(Integer.valueOf(i));

				this.saleWareService.insert(saleWare);
				orderMoney = Double.valueOf(orderMoney.doubleValue() + saleWare.getMoney().doubleValue());
			}
		} else {
			throw new Exception("saleWare can not be null!");
		}
		CustomerAddress address = new CustomerAddress();
		address.setCustomerId(customer.getId());
		address.setWhetherordrer("0");
		List<CustomerAddress> list = this.customerAddressService.select(address);
		if ((list != null) && (list.size() > 0)) {
			for (int i = 0; i < list.size(); i++) {
				((CustomerAddress) list.get(i)).setWhetherordrer("1");
				this.customerAddressService.update((Base) list.get(i));
			}
		}
		address = new CustomerAddress();
		address.setId(saleOrder.getAddress());
		address = (CustomerAddress) this.customerAddressService.selectOne(address);
		if (address != null) {
			address.setWhetherordrer("0");
			this.customerAddressService.update(address);
		}
		CustomerAddress customerAddress = address;
		if (saleOrder == null) {
			saleOrder = new SaleOrder();
		}
		if (customerAddress != null) {
			saleOrder.setLinkman(customerAddress.getName());
			saleOrder.setAddress(customerAddress.getAddress() + customerAddress.getStreet());
			saleOrder.setMobile(customerAddress.getMobile());
			saleOrder.setZipCode(customerAddress.getZipCode());
			saleOrder.setTelephone(customerAddress.getPhone());
			saleOrder.setEmail(customer.getEmail());
		}
		if (vipCoupon != null) {
			if ((vipCoupon.getCode() != null) && (!vipCoupon.getCode().equals(""))) {
				vipCoupon = (VipCoupon) this.vipCouponService.selectOne(vipCoupon);

				saleOrder.setPriceDiscount(vipCoupon.getMoney());
				vipCoupon.setState("d");
				vipCoupon.setSaleOrderId(saleOrder.getId());
				this.vipCouponService.update(vipCoupon);
			} else {
				saleOrder.setPriceDiscount(Double.valueOf(0.0D));
			}
		} else {
			saleOrder.setPriceDiscount(Double.valueOf(0.0D));
		}
		if (orderMoney.doubleValue() - saleOrder.getPriceDiscount().doubleValue() > 0.0D) {
			saleOrder.setOrderMoney(
					Double.valueOf(orderMoney.doubleValue() - saleOrder.getPriceDiscount().doubleValue()));
		} else {
			saleOrder.setOrderMoney(Double.valueOf(0.0D));
		}
		saleOrder.setCreateTime(new Date());
		saleOrder.setCreatorId(customer.getId());
		saleOrder.setCreatorName(customer.getName());
		saleOrder.setCustomerId(customer.getId());
		saleOrder.setCustomerName(customer.getName());
		saleOrder.setWarehouseId(customer.getWarehouseId());
		saleOrder.setWarehouseName(customer.getWarehouseName());
		saleOrder.setHandlerId("1");
		saleOrder.setHandlerName("admin");
		if (saleOrder.getPaymentId() != null) {
			Payment pay = (Payment) this.paymentService.getModel(saleOrder.getPaymentId());
			saleOrder.setPaymentCode(pay.getCode());
			saleOrder.setPaymentId(pay.getId());
			saleOrder.setPaymentName(pay.getName());
		}
		Delivery delivery = (Delivery) this.deliveryService.getModel(saleOrder.getDeliveryId());
		if (delivery != null) {
			saleOrder.setDeliveryId(delivery.getId());
			saleOrder.setDeliveryName(delivery.getName());
			saleOrder.setDeliveryCode(delivery.getCode());
			saleOrder.setDeliveryCost(delivery.getDeliveryFee());
			saleOrder.setOrderMoney(
					Double.valueOf(saleOrder.getOrderMoney().doubleValue() + delivery.getDeliveryFee().doubleValue()));
		}
		saleOrder.setOrderState("0");
		saleOrder.setPaymentState("0");
		saleOrder.setDeliveryState("0");
		saleOrder.setType("0");
		saleOrder.setState("s");
		saleOrder.setIscancel("0");

		this.saleOrderService.insert(saleOrder);

		return true;
	}

	public void setGoodService(GoodService goodService) {
		this.goodService = goodService;
	}
}
