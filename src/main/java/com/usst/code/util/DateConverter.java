package com.usst.code.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;
import org.apache.struts2.util.StrutsTypeConverter;

public class DateConverter extends StrutsTypeConverter {
	private static final Logger logger = Logger.getLogger(DateConverter.class);
	private static SimpleDateFormat df = new SimpleDateFormat();
	private static final String FMT_A = "yyyy-MM-dd HH:mm:ss";
	private static final String FMT_C = "yyyy-MM-dd HH:mm";
	private static final String FMT_B = "yyyy-MM-dd";
	private static final String FMT_D = "yyyy/MM/dd HH:mm:ss";
	private static List<String> patterns = new ArrayList();

	static {
		patterns.add("yyyy-MM-dd HH:mm:ss");
		patterns.add("yyyy-MM-dd");
		patterns.add("yyyy-MM-dd HH:mm");
		patterns.add("yyyy/MM/dd HH:mm:ss");
	}

	public Object convertFromString(Map context, String[] values, Class toClass) {
		Date date = null;
		if ((values != null) && (values.length > 0)) {
			String dateString = values[0];
			if (dateString != null) {
				for (String pattern : patterns) {
					try {
						df.applyPattern(pattern);
						date = df.parse(dateString);
					} catch (ParseException ex) {
						logger.debug("string 2 Date error,pattern:" + pattern, ex);
					}
				}
			}
		}
		return date;
	}

	public String convertToString(Map context, Object o) {
		String dateString = null;

		Date date = (Date) o;
		df.applyPattern("yyyy-MM-dd HH:mm:ss");
		dateString = df.format(date);

		return dateString;
	}
}
