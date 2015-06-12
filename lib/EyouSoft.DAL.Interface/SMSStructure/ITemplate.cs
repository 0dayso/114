﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EyouSoft.IDAL.SMSStructure
{
    /// <summary>
    /// 短信中心-常用短语及常用短语类型数据访问类接口
    /// </summary>
    /// Author:汪奇志 2010-03-26
    public interface ITemplate
    {
        /// <summary>
        /// 插入常用短语类型信息,返回0插入失败,>0时为插入的类型编号
        /// </summary>
        /// <param name="categoryInfo">常用短语类型业务实体</param>
        /// <returns></returns>
        int InsertCategory(EyouSoft.Model.SMSStructure.TemplateCategoryInfo categoryInfo);

        /// <summary>
        /// 删除常用短语类型信息
        /// <param name="CategoryId">类型编号</param>
        /// </summary>
        /// <returns></returns>
        bool DeleteCategory(int CategoryId);

        /// <summary>
        /// 根据指定的公司编号获取公司的所有常用短语类型信息
        /// </summary>
        /// <param name="companyId">公司编号</param>
        /// <returns></returns>
        IList<EyouSoft.Model.SMSStructure.TemplateCategoryInfo> GetCategorys(string companyId);

        /// <summary>
        /// 插入常用短语
        /// </summary>
        /// <param name="templateInfo">常用短语业务实体</param>
        /// <returns></returns>
        bool InsertTemplate(EyouSoft.Model.SMSStructure.TemplateInfo templateInfo);

        /// <summary>
        /// 根据指定条件获取常用短语信息
        /// </summary>
        /// <param name="pageSize">每页记录数</param>
        /// <param name="pageIndex">当前页索引</param>
        /// <param name="recordCount">总记录数</param>
        /// <param name="companyId">公司编号</param>
        /// <param name="keyword">关键字 为空时不做为查询条件</param>
        /// <param name="categoryId">类型编号 -1时不做为查询条件</param>
        /// <returns></returns>
        IList<EyouSoft.Model.SMSStructure.TemplateInfo> GetTemplates(int pageSize, int pageIndex, ref int recordCount, string companyId, string keyword, int categoryId);

        /// <summary>
        /// 删除常用短语
        /// </summary>
        /// <param name="templateId">常用短语编号</param>
        /// <returns></returns>
        bool DeleteTemplate(string templateId);

        /// <summary>
        /// 获取常用短语信息
        /// </summary>
        /// <param name="templateId">常用短语编号</param>
        /// <returns></returns>
        EyouSoft.Model.SMSStructure.TemplateInfo GetTemplateInfo(string templateId);

        /// <summary>
        /// 更新常用短语
        /// </summary>
        /// <param name="templateInfo">常用短语业务实体</param>
        /// <returns></returns>
        bool UpdateTemplate(EyouSoft.Model.SMSStructure.TemplateInfo templateInfo);
    }
}