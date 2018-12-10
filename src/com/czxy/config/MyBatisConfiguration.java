package com.czxy.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.context.annotation.Bean;

import com.github.pagehelper.PageHelper;

import tk.mybatis.spring.mapper.MapperScannerConfigurer;

public class MyBatisConfiguration {
	/**
	 * 获得SqlSessionFactory
	 * @param dataSource
	 * @return
	 * @throws Exception
	 */
	@Bean
	public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception{
		//1 创建 FactoryBean
		SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
		
		//2.1 配置数据源
		factoryBean.setDataSource(dataSource);
		
		//2.2 配置驼峰命名
		Configuration configuration = new Configuration();
		configuration.setMapUnderscoreToCamelCase(true);
		factoryBean.setConfiguration(configuration);
		
		//2.3 配置分页插件
		// 1) 创建分页助手
		PageHelper pageHelper = new PageHelper();
		// 2) 设置参数
		Properties props = new Properties();
		props.setProperty("dialect", "mysql");
		props.setProperty("rowBoundsWithCount", "true");
		pageHelper.setProperties(props);
		// 3) 设置插件--以数组方式
		Interceptor[] plugins = {pageHelper};
		factoryBean.setPlugins(plugins);
		
		//3 获得需要对象
		return factoryBean.getObject();
	}
	/**
	 * mapper扫描
	 * @return
	 */
	@Bean
	public MapperScannerConfigurer mapperScannerConfigurer(){
		MapperScannerConfigurer mapperScanner = new MapperScannerConfigurer();
		//扫描指定的包
		mapperScanner.setBasePackage("com.czxy.dao");
		return mapperScanner;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
